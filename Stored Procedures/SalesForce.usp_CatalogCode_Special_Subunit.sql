SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- Author:		Bryan Eddy
-- ALTER date: 10/5/2016
-- Description:	Generate the catalog code and attributes for Sales Force Quoting - Update certain items with the special subunit coloring indicator

-- =============================================
CREATE PROCEDURE [SalesForce].[usp_CatalogCode_Special_Subunit] 
AS
BEGIN


DECLARE @ErrorNumber INT = ERROR_NUMBER();
DECLARE @ErrorLine INT = ERROR_LINE();


	BEGIN TRY
		BEGIN TRAN



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
