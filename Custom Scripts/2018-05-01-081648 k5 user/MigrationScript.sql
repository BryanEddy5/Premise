/*
This migration script replaces uncommitted changes made to these objects:
FiberToFiberDescriptionQuoting
ItemPriceOverride
UnitOfMeasure
tblStockItems
tbl_Fibers
tbleABF_Pricing
usp_CatalogCode_SalesForce_Cables
usp_CatalogCode_SalesForce_Generator

Use this script to make necessary schema and data changes for these objects only. Schema changes to any other objects won't be deployed.

Schema changes and migration scripts are deployed in the order they're committed.

Migration scripts must not reference static data. When you deploy migration scripts alongside static data 
changes, the migration scripts will run first. This can cause the deployment to fail. 
Read more at https://documentation.red-gate.com/display/SOC6/Static+data+and+migrations.
*/

SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Dropping foreign keys from [dbo].[tbl_Fibers]'
GO
ALTER TABLE [dbo].[tbl_Fibers] DROP CONSTRAINT [FK_tbl_Fibers_tblDesignCodeFiberElementValue]
GO
PRINT N'Dropping constraints from [dbo].[tbleABF_Pricing]'
GO
ALTER TABLE [dbo].[tbleABF_Pricing] DROP CONSTRAINT [DF_tbleABF_Pricing_CreatedBy]
GO
PRINT N'Dropping constraints from [dbo].[tbleABF_Pricing]'
GO
ALTER TABLE [dbo].[tbleABF_Pricing] DROP CONSTRAINT [DF_tbleABF_Pricing_CreationDate]
GO
PRINT N'Dropping [dbo].[tbleABF_Pricing]'
GO
DROP TABLE [dbo].[tbleABF_Pricing]
GO
PRINT N'Altering [dbo].[tbl_Fibers]'
GO
ALTER TABLE [dbo].[tbl_Fibers] ADD
[FiberItemID] [int] NOT NULL IDENTITY(1, 1)
GO
ALTER TABLE [dbo].[tbl_Fibers] DROP
COLUMN [FiberID]
GO
PRINT N'Adding constraints to [dbo].[tbl_Fibers]'
GO
ALTER TABLE [dbo].[tbl_Fibers] ADD CONSTRAINT [UQ__tbl_Fibe__1DC26D2880EA2678] UNIQUE NONCLUSTERED  ([FiberItemID]) ON [PRIMARY]
GO
PRINT N'Creating [SalesForce].[FiberToFiberDescriptionQuoting]'
GO
CREATE TABLE [SalesForce].[FiberToFiberDescriptionQuoting]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[FiberID] [int] NOT NULL,
[FiberItemID] [int] NOT NULL,
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__FiberToFi__Creat__5813ACBC] DEFAULT (suser_sname()),
[DateCreated] [datetime] NULL CONSTRAINT [DF__FiberToFi__DateC__5907D0F5] DEFAULT (getdate())
) ON [PRIMARY]
GO
PRINT N'Creating primary key [pk_FiberToFiberDescriptionQuoting] on [SalesForce].[FiberToFiberDescriptionQuoting]'
GO
ALTER TABLE [SalesForce].[FiberToFiberDescriptionQuoting] ADD CONSTRAINT [pk_FiberToFiberDescriptionQuoting] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
PRINT N'Adding constraints to [SalesForce].[FiberToFiberDescriptionQuoting]'
GO
ALTER TABLE [SalesForce].[FiberToFiberDescriptionQuoting] ADD CONSTRAINT [ix_FiberToFiberDescriptionQuoting] UNIQUE NONCLUSTERED  ([FiberID], [FiberItemID]) ON [PRIMARY]
GO
PRINT N'Altering [dbo].[usp_CatalogCode_SalesForce_Cables]'
GO


-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 10/5/2016
-- Description:	Generate the catalog code and attributes for Sales Force Quoting - Appends All base cables to the table
-- Update:		Added table SalesForce.FiberToFiberDescriptionQuoting to allow for fibers to have multiple Sales Force Descriptions
-- Version:		2
-- =============================================
ALTER PROCEDURE [dbo].[usp_CatalogCode_SalesForce_Cables] 

AS
BEGIN



	--EXEC [OracleExtracts].[dbo].[usp_BOMCalculator_AllCables]


DELETE FROM tblSalesForce_Catalog

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	--IF OBJECT_ID (N'dbo.tblSalesForce_Catalog_Generator', N'U') IS NOT NULL
	--DROP TABLE dbo.tblSalesForce_Catalog_Generator;


	--Code appends all non-furcation cables to tblSalesForce_Catalog

INSERT  INTO tblSalesForce_Catalog
                         (CatalogCode, Base,Weight_kg_per_m, 
                         DesignTypeDesc, Jacket, TBType, TBDescription, NominalOD, NumSubFillers, NumSubPositions
						 ,CablePasses,FiberCount,UnitOD, BaseID,DesignTypeId, Armored,Boxed, Fiber_Type__c,Print_Type__c, Min_Order_Quantity__c,FiberID,FinishedCableColor,TBLetter,SetupID
						 , Active,Non_Standard, ProdLevel3)
SELECT DISTINCT 
                         LEFT(tblCableConstructionReferences.DesignCode, 5) + tblDesignCodeFiberElementValue.FiberLetter + SUBSTRING(tblCableConstructionReferences.DesignCode, 6, 2) 
						 + tblDesignCodeFiberElementValue.CablePrintType
                         + COALESCE(tblDesignTypeS.DefaultFamilyColor,tblDesignCodeFiberElementValue.PreferedCableColor)
						 --+ FinishedColor.ColorLetter
						 + CASE WHEN tblCableConstructions.CablePasses = 1 AND tblCableConstructionReferences.TBType <> 'Ribbon' THEN '0' 
								WHEN tblCableTightBufferReference.TBTypeID = 20 THEN 'X'
							    WHEN tblCableConstructionReferences.TBType = 'Ribbon' THEN '1'
							    ELSE 
									--FinishedColor.ColorLetter
									COALESCE(tblDesignTypeS.DefaultFamilyColor,tblDesignCodeFiberElementValue.PreferedCableColor )
							END
                          + tblCableTBType.TBLetter + CASE WHEN [DesignExtension] IS NULL 
                         THEN '' ELSE [DesignExtension] END + + COALESCE(tblDesignCodeFiberElementValue.FiberExt,'') AS CatalogCode, tblCableConstructionReferences.Base, 
                          tblBOM_Base_Weight.Weight AS Weight_kg_per_m, tblDesignTypes.SalesForceDescription, 
                         JacketDescription_SalesForce, tblCableConstructionReferences.TBType, tblCableTBType.TightBufferDescription_SalesForce, 
                         tblCableConstructions.NominalOD, tblCableConstructionReferences.NumSubFillers, tblCableConstructionReferences.NumSubPositions,
                         tblCableConstructions.CablePasses, FiberCount--cast(substring(tblCableConstructionReferences.DesignCode, 3,3) as int) FiberCount
						 ,CASE WHEN tblCableConstructionReferences.TBType = 'Ribbon' THEN SUBSTRING(tblCableConstructionReferences.DesignCode, 6,2) 
						 ELSE (SUBSTRING(tblCableConstructionReferences.DesignCode, 6,1) + '.' + SUBSTRING(tblCableConstructionReferences.DesignCode, 7,1))+' mm'  END UnitOD
						 , tblCableConstructionReferences.BaseID, dbo.tblCableConstructionReferences.DesignTypeID
						 ,0 AS Armored
						 ,0 AS Boxed
						 ,Fiber_Type__c
						 ,CASE WHEN tblDesignCodeFiberElementValue.CablePrintType = 1 THEN 'AFL Standard'
							WHEN tblDesignCodeFiberElementValue.CablePrintType = 2 THEN 'Generic'
							END  AS Print_Type__c
						,tblDesignTypes.Min_Order_Quantity__c
						,tblDesignCodeFiberElementValue.FiberID
						,CASE WHEN tblDesignTypeS.DefaultFamilyColor IS NOT NULL THEN tblDesignTypeS.DefaultFamilyColor ELSE tblDesignCodeFiberElementValue.PreferedCableColor END
						,tblCableTBType.TBLetter
						,tblCableConstructionReferences.SetupID
						, tblCableConstructionReferences.ReleasedDesign
						, tblCableTBType.Non_Standard_Product
						, tblDesignTypeGroups.DesignTypeGroupDesc
FROM            tbl_Fibers INNER JOIN SalesForce.FiberToFiberDescriptionQuoting FiberLink ON FiberLink.FiberItemID = tbl_Fibers.FiberItemID
                         INNER JOIN tblDesignCodeFiberElementValue ON tblDesignCodeFiberElementValue.FiberID = FiberLink.FiberID
                         INNER JOIN tblFiberTBCatalog ON tbl_Fibers.TBCatalogType = tblFiberTBCatalog.TBCatalogType INNER JOIN
                         tblFiberTBIndicators ON tblFiberTBCatalog.TBCatalogType = tblFiberTBIndicators.TBCatalogType INNER JOIN
                         tblBOM_Base_Weight INNER JOIN
                         tblCableTBType INNER JOIN
                         tblCableConstructionReferences INNER JOIN
                         tblCableTightBufferReference ON tblCableConstructionReferences.TBType = tblCableTightBufferReference.TBType INNER JOIN
                         tblCableConstructions ON tblCableConstructionReferences.BaseID = tblCableConstructions.BaseID ON 
                         tblCableTBType.TBIndicatorID = tblCableTightBufferReference.TBTypeID ON tblBOM_Base_Weight.BASE = tblCableConstructionReferences.Base INNER JOIN
                         tblDesignTypes ON tblCableConstructionReferences.DesignTypeID = tblDesignTypes.DesignTypeID INNER JOIN
                         tblDesignTypeGroups ON tblDesignTypes.DesignTypeGroupID = tblDesignTypeGroups.DesignTypeGroupID INNER JOIN
                         tblDesignCodeJacket ON tblCableConstructionReferences.CableFamily = tblDesignCodeJacket.CableLetter AND 
                         tblCableConstructionReferences.CableLevel1 = tblDesignCodeJacket.JacketLetter ON tblFiberTBIndicators.TBLetter = tblCableTBType.TBLetter 
						 --INNER JOIN
						 --tblDesignCodeJacketColor FinishedColor ON FinishedColor.CablePasses = tblCableConstructions.CablePasses --
						 --INNER JOIN tblDesignCodeJacketColor SubColor ON SubColor.CablePasses = tblCableConstructions.CablePasses
WHERE          (tblDesignCodeFiberElementValue.Active = 1) AND tblCableConstructionReferences.ApprovedForQuoting = 1 AND
                         (tblDesignCodeFiberElementValue.FiberLetter NOT LIKE '%@%') AND (tblCableConstructionReferences.DesignTypeID IS NOT NULL) AND (tblDesignTypes.Active = 1) 
                        AND (tblDesignTypeGroups.Active = 1) 
						 AND (tblCableConstructionReferences.TBType <> 'Furcation' ) AND (tblCableConstructionReferences.ApprovedForQuoting = 1) 
                         AND (tbl_Fibers.Active = 1) AND dbo.tblCableTBType.Active = 1
						 --and tblCableConstructionReferences.Base like 'GQ144-2.0%'





END




GO
PRINT N'Altering [dbo].[tblStockItems]'
GO
ALTER TABLE [dbo].[tblStockItems] ADD
[LeadTime_ID] [int] NULL
GO
PRINT N'Creating [SalesForce].[UnitOfMeasure]'
GO
CREATE TABLE [SalesForce].[UnitOfMeasure]
(
[UnitOfMeasureID] [int] NOT NULL IDENTITY(1, 1),
[UnitOfMeasure] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DateCreated] [datetime] NULL CONSTRAINT [DF__UnitOfMea__DateC__5AF01967] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__UnitOfMea__Creat__5BE43DA0] DEFAULT (suser_sname())
) ON [PRIMARY]
GO
PRINT N'Creating primary key [PK_UnitOfMeasure] on [SalesForce].[UnitOfMeasure]'
GO
ALTER TABLE [SalesForce].[UnitOfMeasure] ADD CONSTRAINT [PK_UnitOfMeasure] PRIMARY KEY CLUSTERED  ([UnitOfMeasureID]) ON [PRIMARY]
GO
PRINT N'Adding constraints to [SalesForce].[UnitOfMeasure]'
GO
ALTER TABLE [SalesForce].[UnitOfMeasure] ADD CONSTRAINT [IX_UnitOfMeasure] UNIQUE NONCLUSTERED  ([UnitOfMeasure]) ON [PRIMARY]
GO
PRINT N'Creating [SalesForce].[ItemPriceOverride]'
GO
CREATE TABLE [SalesForce].[ItemPriceOverride]
(
[ItemNo] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Price] [decimal] (18, 6) NULL,
[CreatedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbleABF_Pricing_CreatedBy] DEFAULT (suser_sname()),
[CreationDate] [datetime] NULL CONSTRAINT [DF_tbleABF_Pricing_CreationDate] DEFAULT (getdate()),
[timestamp] [timestamp] NULL,
[UnitOfMeasureID] [int] NULL CONSTRAINT [DF_ItemPriceOverride_UnitOfMeasureID] DEFAULT ((1)),
[ItemID] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY]
GO
PRINT N'Creating primary key [PK_ItemPriceOverride] on [SalesForce].[ItemPriceOverride]'
GO
ALTER TABLE [SalesForce].[ItemPriceOverride] ADD CONSTRAINT [PK_ItemPriceOverride] PRIMARY KEY CLUSTERED  ([ItemNo]) ON [PRIMARY]
GO
PRINT N'Altering [dbo].[usp_CatalogCode_SalesForce_Generator]'
GO

-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 10/5/2016
-- Description:	Generate the catalog code and attributes for Sales Force Quoting
-- Version:		2
-- Update:		Added logic for Tactical quoting
-- =============================================
ALTER PROCEDURE [dbo].[usp_CatalogCode_SalesForce_Generator] 

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
PRINT N'Adding foreign keys to [SalesForce].[FiberToFiberDescriptionQuoting]'
GO
ALTER TABLE [SalesForce].[FiberToFiberDescriptionQuoting] ADD CONSTRAINT [FK__FiberToFi__Fiber__562B644A] FOREIGN KEY ([FiberID]) REFERENCES [dbo].[tblDesignCodeFiberElementValue] ([FiberID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [SalesForce].[FiberToFiberDescriptionQuoting] ADD CONSTRAINT [FK__FiberToFi__Fiber__571F8883] FOREIGN KEY ([FiberItemID]) REFERENCES [dbo].[tbl_Fibers] ([FiberItemID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
PRINT N'Adding foreign keys to [SalesForce].[ItemPriceOverride]'
GO
ALTER TABLE [SalesForce].[ItemPriceOverride] ADD CONSTRAINT [FK_ItemPriceOverride_UnitOfMeasure] FOREIGN KEY ([UnitOfMeasureID]) REFERENCES [SalesForce].[UnitOfMeasure] ([UnitOfMeasureID]) ON DELETE SET NULL ON UPDATE CASCADE
GO

