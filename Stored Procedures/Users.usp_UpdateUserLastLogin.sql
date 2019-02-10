SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- Batch submitted through debugger: SQLQuery1.sql|0|0|C:\Users\eddybc\AppData\Local\Temp\~vs2F82.sql
-- =============================================
-- Author:		Bryan Eddy
-- date: 10/20/2017
-- Description:	Update the user last login datetime
-- =============================================
CREATE PROC [Users].[usp_UpdateUserLastLogin]

@UserName AS NVARCHAR(50)
AS

SET NOCOUNT ON
SET ANSI_WARNINGS OFF


	DECLARE @ErrorNumber INT = ERROR_NUMBER();
	DECLARE @ErrorLine INT = ERROR_LINE();

		BEGIN TRY
			BEGIN TRAN
				UPDATE dbo.tblConfiguratorUser 
				SET LastLoginDate = GETDATE()
				WHERE [User] = @UserName


				INSERT INTO Users.LoginHistory
				(
					UserId,
					UserName,
					LoginDate
				)
				SELECT UserID, [User], GETDATE()
				FROM dbo.tblConfiguratorUser 
				WHERE [User] = @UserName

			COMMIT TRAN
		END TRY

		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
 
			PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
			PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));

			THROW;
		END CATCH;


GO
