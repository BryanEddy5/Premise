SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- Author:		Bryan Eddy
-- ALTER date: 10/5/2016
-- Description:	Generate the catalog code and attributes for Sales Force Quoting - Update certain items with the special subunit coloring indicator
-- =============================================
CREATE PROCEDURE [dbo].[usp_CatalogCode_SalesForce_Special_Subunit] 
AS
BEGIN

--UPDATE tblSalesForce_Catalog
--SET Non_Standard = 1 
--FROM tblSalesForce_Catalog
--WHERE ProdLevel3 = 'Tactical' and tbtype = 'microtactical'



INSERT INTO tblSalesForce_Catalog
                         (CatalogCode, Base, Weight_kg_per_m, 
                         K.DesignTypeDesc, Jacket, TBType, TBDescription, NominalOD, NumSubFillers, NumSubPositions,FinishedCableColor,TBLetter,
						 CablePasses,FiberCount,UnitOD, BaseID,K.DesignTypeId, Armored,Boxed, Print_Type__c, Min_Order_Quantity__c, Fiber_Type__c,FiberID,SetupID
						 ,Non_Standard,Active,ProdLevel3)

SELECT LEFT(CatalogCode,10) + Special_Subunit_Indicator + SUBSTRING(CatalogCode,12,LEN(CatalogCode)-11), Base, Weight_kg_per_m, 
                         K.DesignTypeDesc, Jacket, TBType, TBDescription, NominalOD, NumSubFillers, NumSubPositions,FinishedCableColor,TBLetter,
						 CablePasses,FiberCount,UnitOD, BaseID,K.DesignTypeId, Armored,Boxed,Print_Type__c,k.Min_Order_Quantity__c,Fiber_Type__c,FiberID,SetupID
						 ,1,k.Active,ProdLevel3
FROM [dbo].[tblDesignSpecialSubunitColor] CROSS JOIN dbo.tblDesignTypes A  INNER JOIN dbo.tblSalesForce_Catalog K ON A.DesignTypeID = K.DesignTypeID
WHERE Special_Subunit_Color_X = 1 and CablePasses = 2


--UPDATE tblSalesForce_Catalog
--SET Non_Standard = 0
--FROM tblSalesForce_Catalog
--WHERE ProdLevel3 = 'Tactical' and tbtype = 'microtactical' AND substring(catalogcode,11,1) = 'x'


END

GO
