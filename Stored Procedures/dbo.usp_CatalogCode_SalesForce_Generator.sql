SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 10/5/2016
-- Description:	Generate the catalog code and attributes for Sales Force Quoting
-- Version:		2
-- Update:		Added logic for Tactical quoting
-- =============================================
CREATE PROCEDURE [dbo].[usp_CatalogCode_SalesForce_Generator] 

AS
BEGIN
SET NOCOUNT ON;

--ALTERs table of BOM weights
--EXEC [OracleExtracts].[dbo].[usp_BOMCalculator_AllCables]


TRUNCATE TABLE tblSalesForce_Catalog;

--Appends all base cables to tblSalesForce_Catalog
EXEC dbo.usp_CatalogCode_SalesForce_Cables;


--Appends all furcation cables to tblSalesForce_Catalog
EXEC dbo.usp_CatalogCode_SalesForce_Furcation;


DELETE FROM dbo.tblSalesForce_Catalog 
WHERE (FiberCount > 4 or DesignTypeDesc LIKE '%BREAKOUT%') AND TBType = 'TightBuffer' AND tbletter <>'1'

--Delete OM4+ Spdier web ribbons from catalog code table
DELETE FROM dbo.tblSalesForce_Catalog
WHERE (TBLetter ='r' or TBLetter ='s')  AND CatalogCode like '%+'

--Delete Mixed fiber option for cables with 1 fiber
DELETE  FROM dbo.tblSalesForce_Catalog
where FiberCount = 1 and Fiber_Type__c like '%MIXED%'


--Update Unit OD for ribbon cables 
UPDATE       tblSalesForce_Catalog
SET                UnitOD = tblCableRibbonUnitType.Ribbon_Description
FROM            tblSalesForce_Catalog INNER JOIN
                         tblCableRibbonUnitType ON tblSalesForce_Catalog.FiberCount = tblCableRibbonUnitType.FiberCount AND 
                         tblSalesForce_Catalog.UnitOD = tblCableRibbonUnitType.RibbonUnitType


--Updates all special items in tblSalesForce_Catalog to have X and Z subunits
EXEC [dbo].[usp_CatalogCode_SalesForce_Special_Subunit] 

--Updates costing for all non-armored cable in tblSalesForce_Catalog
EXEC dbo.usp_CatalogCode_SalesForce_NonArmored_Costing

--Calculates weights and cost for armoring of cables and appends armored versions of the cables into tblSalesForce_Catalog
EXEC [dbo].[usp_CatalogCode_SalesForce_Armor_Cost_Weight]

--Identifies which cables can be boxed and appends those cables with the box suffix to tblSalesForce_Catalog
EXEC dbo.usp_CatalogCode_SalesForce_Boxed_Items

UPDATE tblSalesForce_Catalog
SET COLOR__c = G.ColorDescription_SalesForce
FROM tblSalesForce_Catalog K INNER JOIN [dbo].[tblDesignCodeJacketColor] G ON  G.ColorLetter = K.FinishedCableColor

--Add spec and image links to each row (non-boxed)
UPDATE tblSalesForce_Catalog
SET [ImageURL__c] = G.[ImageURL__c], Product_Spec_link__c = g.Product_Spec_link__c
FROM tblSalesForce_Catalog K INNER JOIN [dbo].[tblDesignCode_CableImages] G ON k.DesignTypeID = G.DesignTypeID AND K.Armor_Type__c = G.Armor_Type__c  
WHERE K.Packaging__c = 'REEL'

--Add spec and image links to Boxed items
UPDATE tblSalesForce_Catalog
SET [ImageURL__c] = G.[ImageURL__c], Product_Spec_link__c = g.Product_Spec_link__c
FROM tblSalesForce_Catalog K CROSS JOIN [dbo].[tblDesignCode_CableImages] G
WHERE K.Boxed = 1 AND G.Packaging__c = 'box'

--Update descriptions of each cable
EXEC dbo.usp_CatalogCode_SalesForce_Descriptions


--Update lead time ID's for each item
UPDATE dbo.tblSalesForce_Catalog
Set Lead_Time_ID__c = 
	CASE WHEN Armor_Type__c = 'Armored' THEN K.LeadTime_ID_Armored
	ELSE K.LeadTime_ID
	END 
FROM dbo.tblCableConstructionReferences K INNER JOIN DBO.tblSalesForce_Catalog G ON  K.base = g.base	

--Update the price of all cables
EXEC usp_CatalogCode_SalesForce_PricingUpdate


--Identify stock items and set Stock__c to 1
UPDATE DBO.tblSalesForce_Catalog
SET Stock__b = 1,Stock__c='Yes', Min_Order_Quantity__c = G.Min_Order_Quantity, UOM__c = 'Feet'
, LoadedBaseCost = LoadedBaseCost /3.281, BaseCost = BaseCost /3.281--, Weight_kg_per_m = Weight_kg_per_m * 0.671969
,price = G.Price_feet, Lead_Time_ID__c = G.LeadTime_ID
FROM dbo.tblstockitems G INNER JOIN dbo.tblSalesForce_Catalog K ON G.itemno = k.CatalogCode

--Remove -BIF for all Tactical cable products
UPDATE dbo.tblSalesForce_Catalog
SET CatalogCode = REPLACE(CatalogCode,'-BIF','')
WHERE DesignTypeID IN (19,18)

--Update pricing static priced list
/* eABF and Tactical don't want a calculated version.  They have supplied a list they would like the price to reflect*/
--Static price list in Feet
UPDATE DBO.tblSalesForce_Catalog
SET   UOM__c = I.UnitOfMeasure
, LoadedBaseCost = LoadedBaseCost /3.281
, BaseCost = BaseCost /3.281
,Loaded_Base_Cost_Fiber_Included__c =Loaded_Base_Cost_Fiber_Included__c/3.281 --, Weight_kg_per_m = Weight_kg_per_m * 0.671969
,price = G.Price
FROM SalesForce.ItemPriceOverride G INNER JOIN dbo.tblSalesForce_Catalog K ON G.itemno = k.CatalogCode
INNER JOIN SalesForce.UnitOfMeasure I ON I.UnitOfMeasureID = G.UnitOfMeasureID
WHERE G.UnitOfMeasureID = 2

--Static Price List in Meters
UPDATE DBO.tblSalesForce_Catalog
SET   UOM__c = I.UnitOfMeasure
, LoadedBaseCost = LoadedBaseCost 
, BaseCost = BaseCost
,Loaded_Base_Cost_Fiber_Included__c =Loaded_Base_Cost_Fiber_Included__c --, Weight_kg_per_m = Weight_kg_per_m * 0.671969
,price = G.Price
FROM SalesForce.ItemPriceOverride G INNER JOIN dbo.tblSalesForce_Catalog K ON G.itemno = k.CatalogCode
INNER JOIN SalesForce.UnitOfMeasure I ON I.UnitOfMeasureID = G.UnitOfMeasureID
WHERE G.UnitOfMeasureID = 1

--Remove all tactical cables that are not in the override table
DELETE dbo.tblSalesForce_Catalog 
FROM dbo.tblSalesForce_Catalog C LEFT JOIN SalesForce.ItemPriceOverride X ON X.ItemNo = C.CatalogCode
WHERE DesignTypeID IN (19,18) AND X.ItemNo IS NULL


UPDATE dbo.tblSalesForce_Catalog
  SET Non_Standard_Design__c = (CASE WHEN Non_Standard = 1 THEN 'TRUE' ELSE 'FALSE' END),
   Distributor_Price_List__c = (CASE WHEN Stock__b = 1 THEN 'Yes' ELSE 'No' END),
   Override__c = (CASE WHEN Stock__b = 1 THEN 'TRUE' ELSE 'FALSE' END),
   Fiber_Count_Config__c = FiberCount,
   Fiber_Type_Config__c = Fiber_Type__c,
   Status__c = (CASE WHEN Active = 1 THEN 'Active' ELSE 'Inactive' END ),
   Premise_Design_Program_Synch_ID = CatalogCode, 
   Subunit_Color__c = (CASE WHEN CablePasses = 2 THEN COLOR__c ELSE Subunit_Color__c END),
   Jacket_Print__c = Print_Type__c;


--Remove the Subunit_Color_Position__c indicator for single pass cables
UPDATE tblSalesForce_Catalog
SET Subunit_Color_Position__c = NULL
WHERE CablePasses = 1 ;

DELETE FROM tblSalesForce_Catalog
WHERE TBType LIKE '%SPIDER%' AND SUBSTRING(CatalogCode,12,1) = 'S'

--DELETE any duplicates that may be housed in the table.
EXEC dbo.usp_CatalogCode_SalesForce_RemoveDuplicates


EXEC usp_CatalogCode_SalesForce_FlateFile_Export;

--If the count of SalesForce_Catalog table is < 30k then send Bryan an email and don't run SF update

exec usp_CatalogCode_SalesForce_InvokeURL_SalesForce_Update ;



END



GO
