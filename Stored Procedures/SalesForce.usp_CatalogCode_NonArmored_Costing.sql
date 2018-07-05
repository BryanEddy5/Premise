SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 10/19/2016
-- Description:	Costing Update for Sales Force Catalogs
-- =============================================
CREATE PROCEDURE [SalesForce].[usp_CatalogCode_NonArmored_Costing]
AS
BEGIN
DECLARE @ErrorNumber INT = ERROR_NUMBER();
DECLARE @ErrorLine INT = ERROR_LINE();
	BEGIN TRY
		BEGIN TRAN
-- Updates Base item's material cost (minus the fiber)

		UPDATE dbo.tblSalesForce_Catalog
		SET BaseCost = BaseSkeletalCost, OracleItem = AssemblyItemNumber, LoadedBaseCost = x.LoadedBaseCost
		FROM dbo.tblBase_Skeletal_Cost X INNER JOIN dbo.tblSalesForce_Catalog G ON G.SetupID = X.SetupID
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
