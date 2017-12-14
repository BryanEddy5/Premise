SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:			Bryan Eddy
-- Creation Date:	11/17/2016
-- Alter Date:		12/13/2017
-- Description:		Add user email to tblConfiguratorUser
-- Update:			Added user default responsibility
-- =============================================
CREATE PROCEDURE [dbo].[usp_UserEmailAddress] 
(
	-- Add the parameters for the stored procedure here
	@ConfiguratorUser as nvarchar(15),
	@UserEmail as nvarchar(50)

)
AS
BEGIN

	DECLARE @UserID INT;
	DECLARE @ErrorNumber INT = ERROR_NUMBER();
	DECLARE @ErrorLine INT = ERROR_LINE();


		SET NOCOUNT ON;

	IF EXISTS (SELECT [User] FROM dbo.tblConfiguratorUser WHERE [User] = @ConfiguratorUser)
		

		BEGIN

			BEGIN TRY
				BEGIN tran

					UPDATE dbo.tblConfiguratorUser
					SET UserEmail = @UserEmail
					WHERE [User] = @ConfiguratorUser
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


	ELSE
		BEGIN
			BEGIN TRY
				BEGIN tran
					
					INSERT INTO dbo.tblConfiguratorUser 
					(
						[User]
						,SQL_User
						,CutSheetApprover
						,UserType
						,UserEmail
						,UserTypeID
					)
					VALUES 
					(
						 @ConfiguratorUser
						 ,suser_sName()
						 ,0
						 ,'user'
						 ,@UserEmail
						 ,2  
					 )
				COMMIT TRAN
			END TRY
			BEGIN CATCH
				IF @@TRANCOUNT > 0
				ROLLBACK TRANSACTION;
 
				PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
				PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
				THROW;
			END CATCH;

			--Insert the default responsibility for all new users
			SET @UserID = (SELECT TOP 1 UserID FROM tblConfiguratorUser WHERE SQL_User = suser_sName() ORDER BY UserID)

		BEGIN TRY
			BEGIN tran
				INSERT INTO users.UserResponsibility
				(
					UserID,
					ResponsibilityID
				)
				VALUES
				(   @UserID,        -- UserID - int
					7        -- ResponsibilityID - int
					)
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




END

GO
