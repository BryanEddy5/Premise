SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 10/19/2016
-- Description:	Sales Force catalog code procedure to update eligigle items to have box indicators
-- =============================================
CREATE PROCEDURE [SalesForce].[usp_CatalogCode_Boxed_Items]

AS
BEGIN

DECLARE @ErrorNumber INT = ERROR_NUMBER();
DECLARE @ErrorLine INT = ERROR_LINE();


	BEGIN TRY
		BEGIN TRAN

		INSERT INTO tblSalesForce_Catalog
								 (CatalogCode, Base, Weight_kg_per_m, 
								 DesignTypeDesc, Jacket, TBType, TBDescription, NominalOD, NumSubFillers, NumSubPositions,FinishedCableColor,TBLetter
								 ,CablePasses,FiberCount,UnitOD, BaseID,DesignTypeId, Armored,Boxed, 
								 BoxedLength_FT,LoadedBaseCost,BaseCost,OracleItem,Fiber_Type__c,Packaging__c,UOM__c,Print_Type__c,Min_Order_Quantity__c,FiberID
								 ,FurcationTube,SetupID, Non_Standard, Active,ProdLevel3,Minimum_Order_Multiple__c)

		SELECT				CatalogCode+BoxExtension, Base, Weight_kg_per_m, 
								 DesignTypeDesc, Jacket, TBType, TBDescription, NominalOD, NumSubFillers, NumSubPositions,FinishedCableColor,TBLetter
								 ,CablePasses,FiberCount,UnitOD, BaseID,A.DesignTypeId, 0,1, 
								 FeetCablePerBox,LoadedBaseCost, BaseCost ,OracleItem,Fiber_Type__c,'Box' as Packaging__c, 'Each' as UOM__c,Print_Type__c,Minimum_Order_Multiple,FiberID
								 ,FurcationTube, SetupID, Non_Standard, Active,ProdLevel3,Minimum_Order_Multiple
		  FROM [Premise].[dbo].[tblDesignCode_BoxedFiber] A INNER JOIN tblSalesForce_Catalog K ON k.DesignTypeID = A.DesignTypeID
		WHERE NominalOD <= MaxOD AND K.Armored <> 1 and tbtype <>'furcation' --AND Base LIKE 'C%'

		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;


END


GO
