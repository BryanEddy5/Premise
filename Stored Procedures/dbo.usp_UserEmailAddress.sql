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
	@ConfiguratorUser AS NVARCHAR(15),
	@UserEmail AS NVARCHAR(50)

)
AS
BEGIN

    DECLARE @UserID INT;
    DECLARE @ErrorNumber INT = ERROR_NUMBER();
    DECLARE @ErrorLine INT = ERROR_LINE();


    SET NOCOUNT ON;

    IF EXISTS
    (
        SELECT [User]
        FROM dbo.tblConfiguratorUser
        WHERE [User] = @ConfiguratorUser
    )
    BEGIN

        BEGIN TRY
            BEGIN TRAN;

            UPDATE dbo.tblConfiguratorUser
            SET UserEmail = @UserEmail
            WHERE [User] = @ConfiguratorUser;
            COMMIT TRAN;
        END TRY
        BEGIN CATCH
            IF @@TRANCOUNT > 0
                ROLLBACK TRANSACTION;

            PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
            PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));

            THROW;
        END CATCH;

    END;


    ELSE IF @UserEmail IS NOT NULL
    BEGIN
        BEGIN TRY
            BEGIN TRAN;

            INSERT INTO dbo.tblConfiguratorUser
            (
                [User],
                SQL_User,
                CutSheetApprover,
                UserType,
                UserEmail,
                UserTypeID
            )
            VALUES
            (@ConfiguratorUser, SUSER_SNAME(), 0, 'user', @UserEmail, 2);
            COMMIT TRAN;
        END TRY
        BEGIN CATCH
            IF @@TRANCOUNT > 0
                ROLLBACK TRANSACTION;

            PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
            PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));

            THROW;
        END CATCH;
    END;
    EXEC Users.usp_ResponsibilityAddDefault
END;


GO
