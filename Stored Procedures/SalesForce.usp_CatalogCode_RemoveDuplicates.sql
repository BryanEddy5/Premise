SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:      Bryan Eddy
-- Create date: 7/20/2017
-- Description: Delete duplicate records to prevent the Quoting item creation procedure from erroring out.
-- =============================================

CREATE PROCEDURE [SalesForce].[usp_CatalogCode_RemoveDuplicates]
as
BEGIN
	DECLARE @ErrorNumber INT = ERROR_NUMBER();
	DECLARE @ErrorLine INT = ERROR_LINE();
		BEGIN TRY
			BEGIN TRAN
			;WITH cte AS (
				SELECT *, ROW_NUMBER() OVER (PARTITION BY CatalogCode ORDER BY CatalogCode,Base Desc ) AS RowNumber
				FROM 
				(
					SELECT CatalogCode, F.Base,COUNT(F.CatalogCode) OVER (PARTITION BY CatalogCode) Countof--, MAX(G.DateCreated) OVER (PARTITION BY CatalogCode) MaxDateCreated_Construction, G.DateCreated--, MAX(F.DateCreated) OVER (PARTITION BY CatalogCode) MaxDateCreated_Item, f.DateCreated DateCreated_Item
					FROM tblSalesForce_Catalog F --INNER JOIN tblCableConstructionReferences G ON G.Base = F.Base
				)X 
				WHERE Countof > 1
			)
			DELETE cte WHERE RowNumber > 1
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
