SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/

CREATE PROCEDURE [dbo].[usp_CatalogCode_SalesForce_UpdateStage]
as
DELETE 
FROM tblSalesForce_Catalog_Stage

INSERT INTO tblSalesForce_Catalog_Stage
                         (CatalogCode, Base, Weight_kg_per_m, DesignTypeDesc, Jacket, TBType, TBDescription, NominalOD, NumSubFillers, NumSubPositions, CablePasses, BaseID, 
                         BaseCost, FiberCount, UnitOD, OracleItem, COLOR__c, LoadedBaseCost, Armored, Boxed, BoxedLength_FT, DesignTypeID, DateCreated, Fiber_Type__c, 
                         Armor_Type__c, Packaging__c, UOM__c, Stock__c, Lead_Time_ID__c, ImageURL__c, Product_Spec_Link__c, Min_Order_Quantity__c, Print_Type__c, 
                         Product_Quote_Description__c, ArmorJacket, FiberID, TBLetter, FinishedCableColor, FurcationTube, SetupID,Non_Standard, Active, Price, ProdLevel1, ProdLevel2, ProdLevel3, ID)
SELECT        CatalogCode, Base, Weight_kg_per_m, DesignTypeDesc, Jacket, TBType, TBDescription, NominalOD, NumSubFillers, NumSubPositions, CablePasses, BaseID, 
                         BaseCost, FiberCount, UnitOD, OracleItem, COLOR__c, LoadedBaseCost, Armored, Boxed, BoxedLength_FT, DesignTypeID, DateCreated, Fiber_Type__c, 
                         Armor_Type__c, Packaging__c, UOM__c, Stock__c, Lead_Time_ID__c, ImageURL__c, Product_Spec_Link__c, Min_Order_Quantity__c, Print_Type__c, 
                         Product_Quote_Description__c, ArmorJacket, FiberID, TBLetter, FinishedCableColor, FurcationTube, SetupID, Non_Standard, Active, Price, ProdLevel1, ProdLevel2, 
                         ProdLevel3, ID
FROM            tblSalesForce_Catalog



GO
