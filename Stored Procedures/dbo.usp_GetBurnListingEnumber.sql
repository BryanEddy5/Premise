SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/*
Author:		Bryan Eddy
Date:		10/201/2018
Desc:		Get the Burn Listing File number 
Version:	1
Update:		n/a
*/

CREATE PROCEDURE [dbo].[usp_GetBurnListingEnumber]
(

	@CustomerID as INT = 0,
	@DocumentID as INT = 0,
	@Enumber nvarchar(50) = 'ERROR' OUTPUT

)
AS

BEGIN

	DECLARE @RecordCount INT = 0
	DECLARE @ErrorNumber INT = ERROR_NUMBER();
	DECLARE @ErrorLine INT = ERROR_LINE();
	BEGIN TRY
		SET NOCOUNT ON;



		SELECT @Enumber = I.Enumber, @RecordCount = COUNT(I.Enumber) OVER (PARTITION BY I.Enumber)
		FROM dbo.BurnListingMultipleListee E
		INNER JOIN dbo.BurnListingFileNumber I ON I.FileNumberID = e.MultipleListeeID
		INNER JOIN dbo.tblBurnListingDocument B ON B.DocumentID = E.DocumentID
		INNER JOIN dbo.Customers c ON c.CustomerID = I.MultipleListeeID
		WHERE c.customerID = @CustomerID AND B.DocumentID = @DocumentID

		IF @RecordCount < 1
			BEGIN
				SELECT @Enumber = I.Enumber
				FROM dbo.BurnListingFileNumber I
				INNER JOIN dbo.tblBurnListingDocument B ON B.DefaultFileNumberID = I.FileNumberID
				WHERE B.DocumentID = @DocumentID

			END	
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
