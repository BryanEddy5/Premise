SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Bryan Eddy
-- date:		10/5/2016
-- Description:	Generate the catalog code and attributes for Sales Force Quoting
-- Version:		4
-- Update:		added loaded base cost with fiber to the stock conversion UOM from meters to feet for costing
-- =============================================
CREATE PROCEDURE [SalesForce].[usp_CatalogCode_Generator] 

AS
BEGIN
SET NOCOUNT ON;

--ALTERs table of BOM weights
--EXEC [OracleExtracts].[dbo].[usp_BOMCalculator_AllCables]
	DECLARE @ErrorNumber INT = ERROR_NUMBER();
	DECLARE @ErrorLine INT = ERROR_LINE();

TRUNCATE TABLE tblSalesForce_Catalog;

--Appends all base cables to tblSalesForce_Catalog
EXEC SalesForce.usp_CatalogCode_Cables;


--Appends all furcation cables to tblSalesForce_Catalog
EXEC SalesForce.usp_CatalogCode_Furcation;


DELETE FROM dbo.tblSalesForce_Catalog 
WHERE (FiberCount > 4 or DesignTypeDesc LIKE '%BREAKOUT%') AND TBType = 'TightBuffer' AND tbletter <>'1'

--Delete OM4+ Spdier web ribbons from catalog code table
DELETE FROM dbo.tblSalesForce_Catalog
WHERE (TBLetter ='r' or TBLetter ='s')  AND CatalogCode like '%+'

--Delete Mixed fiber option for cables with 1 fiber
DELETE  FROM dbo.tblSalesForce_Catalog
where FiberCount = 1 and Fiber_Type__c like '%MIXED%'


		BEGIN TRY
			BEGIN TRAN


			--Update Unit OD for ribbon cables 
			UPDATE       tblSalesForce_Catalog
			SET                UnitOD = tblCableRibbonUnitType.Ribbon_Description
			FROM            tblSalesForce_Catalog INNER JOIN
									 tblCableRibbonUnitType ON tblSalesForce_Catalog.FiberCount = tblCableRibbonUnitType.FiberCount AND 
									 tblSalesForce_Catalog.UnitOD = tblCableRibbonUnitType.RibbonUnitType
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
 
			PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
			PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
			THROW;
		END CATCH;

--Updates all special items in tblSalesForce_Catalog to have X and Z subunits
EXEC SalesForce.usp_CatalogCode_Special_Subunit 

--Updates costing for all non-armored cable in tblSalesForce_Catalog
EXEC SalesForce.usp_CatalogCode_NonArmored_Costing

--Calculates weights and cost for armoring of cables and appends armored versions of the cables into tblSalesForce_Catalog
EXEC SalesForce.usp_CatalogCode_Armor_Cost_Weight

--Identifies which cables can be boxed and appends those cables with the box suffix to tblSalesForce_Catalog
EXEC SalesForce.usp_CatalogCode_Boxed_Items


--Update the color of each cable based on the color indicator
		BEGIN TRY
			BEGIN TRAN
			UPDATE tblSalesForce_Catalog
			SET COLOR__c = G.ColorDescription_SalesForce
			FROM tblSalesForce_Catalog K INNER JOIN [dbo].[tblDesignCodeJacketColor] G ON  G.ColorLetter = K.FinishedCableColor

			COMMIT TRAN
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
 
			PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
			PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
			THROW;
		END CATCH;



--Add spec and image links to each row (non-boxed)
		BEGIN TRY
			BEGIN TRAN
			UPDATE tblSalesForce_Catalog
			SET [ImageURL__c] = G.[ImageURL__c], Product_Spec_link__c = g.Product_Spec_link__c
			FROM tblSalesForce_Catalog K INNER JOIN [dbo].[tblDesignCode_CableImages] G ON k.DesignTypeID = G.DesignTypeID AND K.Armor_Type__c = G.Armor_Type__c  
			WHERE K.Packaging__c = 'REEL'

			COMMIT TRAN
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
 
			PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
			PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
			THROW;
		END CATCH;


--Add spec and image links to Boxed items
		BEGIN TRY
			BEGIN TRAN
			UPDATE tblSalesForce_Catalog
			SET [ImageURL__c] = G.[ImageURL__c], Product_Spec_link__c = g.Product_Spec_link__c
			FROM tblSalesForce_Catalog K CROSS JOIN [dbo].[tblDesignCode_CableImages] G
			WHERE K.Boxed = 1 AND G.Packaging__c = 'box'

			COMMIT TRAN
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
 
			PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
			PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
			THROW;
		END CATCH;

--Update descriptions of each cable
EXEC SalesForce.usp_CatalogCode_Descriptions


--Update lead time ID's for each item
		BEGIN TRY
			BEGIN TRAN
			UPDATE dbo.tblSalesForce_Catalog
			Set Lead_Time_ID__c = 
				CASE WHEN Armor_Type__c = 'Armored' THEN K.LeadTime_ID_Armored
				ELSE K.LeadTime_ID
				END 
			FROM dbo.tblCableConstructionReferences K INNER JOIN DBO.tblSalesForce_Catalog G ON  K.base = g.base	
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
 
			PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
			PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
			THROW;
		END CATCH;
--Update the price of all cables
EXEC SalesForce.usp_CatalogCode_PricingUpdate

--Identify stock items and set Stock__c to 1
		BEGIN TRY
			BEGIN TRAN
			UPDATE DBO.tblSalesForce_Catalog
			SET Stock__b = 1,Stock__c='Yes', Min_Order_Quantity__c = G.Min_Order_Quantity, UOM__c = 'Feet'
			, LoadedBaseCost = LoadedBaseCost /3.281, BaseCost = BaseCost /3.281--, Weight_kg_per_m = Weight_kg_per_m * 0.671969
			,price = G.Price_feet, Lead_Time_ID__c = G.LeadTime_ID, Loaded_Base_Cost_Fiber_Included__c = K.Loaded_Base_Cost_Fiber_Included__c/3.281
			FROM dbo.tblstockitems G INNER JOIN dbo.tblSalesForce_Catalog K ON G.itemno = k.CatalogCode
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
 
			PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
			PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
			THROW;
		END CATCH;

--Remove -BIF for all Tactical cable products
		BEGIN TRY
			BEGIN TRAN
			UPDATE C
			SET CatalogCode = REPLACE(CatalogCode,'-BIF','')
			FROM dbo.tblSalesForce_Catalog C INNER JOIN dbo.tblDesignTypes I ON I.DesignTypeID = C.DesignTypeID 
			INNER JOIN dbo.tblDesignTypeGroups K ON K.DesignTypeGroupID = I.DesignTypeGroupID
			WHERE I.DesignTypeGroupID = 5 
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
 
			PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
			PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
			THROW;
		END CATCH;

--Update pricing static priced list
/* eABF and Tactical don't want a calculated version.  They have supplied a list they would like the price to reflect*/
--Static price list in Feet
		BEGIN TRY
			BEGIN TRAN
			UPDATE DBO.tblSalesForce_Catalog
			SET   UOM__c = I.UnitOfMeasure
			, LoadedBaseCost = LoadedBaseCost /3.281
			, BaseCost = BaseCost /3.281
			,Loaded_Base_Cost_Fiber_Included__c =Loaded_Base_Cost_Fiber_Included__c/3.281 --, Weight_kg_per_m = Weight_kg_per_m * 0.671969
			,price = G.Price
			FROM SalesForce.ItemPriceOverride G INNER JOIN dbo.tblSalesForce_Catalog K ON G.itemno = k.CatalogCode
			INNER JOIN SalesForce.UnitOfMeasure I ON I.UnitOfMeasureID = G.UnitOfMeasureID
			WHERE G.UnitOfMeasureID = 2
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
 
			PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
			PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
			THROW;
		END CATCH;

--Static Price List in Meters
		BEGIN TRY
			BEGIN TRAN
			UPDATE DBO.tblSalesForce_Catalog
			SET   UOM__c = I.UnitOfMeasure
			, LoadedBaseCost = LoadedBaseCost 
			, BaseCost = BaseCost
			,Loaded_Base_Cost_Fiber_Included__c =Loaded_Base_Cost_Fiber_Included__c --, Weight_kg_per_m = Weight_kg_per_m * 0.671969
			,price = G.Price
			,Status__c = 'Inactive'/*Temporary change to deactivate all Tactical items until teiring is in place*/
			FROM SalesForce.ItemPriceOverride G INNER JOIN dbo.tblSalesForce_Catalog K ON G.itemno = k.CatalogCode
			INNER JOIN SalesForce.UnitOfMeasure I ON I.UnitOfMeasureID = G.UnitOfMeasureID
			WHERE G.UnitOfMeasureID = 1
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
 
			PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
			PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
			THROW;
		END CATCH;

--Remove all tactical cables that are not in the override table
		BEGIN TRY
			BEGIN TRAN
			DELETE dbo.tblSalesForce_Catalog
			FROM dbo.tblSalesForce_Catalog C LEFT JOIN SalesForce.ItemPriceOverride X ON X.ItemNo = C.CatalogCode
			INNER JOIN dbo.tblDesignTypes I ON I.DesignTypeID = C.DesignTypeID 
			INNER JOIN dbo.tblDesignTypeGroups K ON K.DesignTypeGroupID = I.DesignTypeGroupID
			WHERE I.DesignTypeGroupID = 5 --AND X.ItemNo IS NULL
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
 
			PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
			PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
			THROW;
		END CATCH;

--Updating binary fields to Salesforce defined values
		BEGIN TRY
			BEGIN TRAN
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
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
 
			PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
			PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
			THROW;
		END CATCH;

--Remove the Subunit_Color_Position__c indicator for single pass cables
		BEGIN TRY
			BEGIN TRAN
			UPDATE tblSalesForce_Catalog
			SET Subunit_Color_Position__c = NULL
			WHERE CablePasses = 1 ;
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
 
			PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
			PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
			THROW;
		END CATCH;


--Remove MultiMode SWR types
DELETE FROM tblSalesForce_Catalog
WHERE TBType LIKE '%SPIDER%' AND SUBSTRING(CatalogCode,12,1) = 'S'

--DELETE any duplicates that may be housed in the table.
EXEC SalesForce.usp_CatalogCode_RemoveDuplicates


EXEC SalesForce.usp_CatalogCode_FlateFile_Export;

--If the count of SalesForce_Catalog table is < 30k then send Bryan an email and don't run SF update

exec SalesForce.usp_CatalogCode_InvokeUrl_Update ;



END



GO
