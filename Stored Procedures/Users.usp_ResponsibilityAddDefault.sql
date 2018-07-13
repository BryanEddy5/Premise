SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/*
Author:		Bryan Eddy
Date:		1/15/2017
Desc:		Add the default responsibility for a user that has no existing responsibilities
Version:	2
Update:		Changed default user responsiblity to 23 so all new users default to the main configurator.

*/

CREATE PROCEDURE [Users].[usp_ResponsibilityAddDefault]
AS

DECLARE @Sql AS NVARCHAR(1000),
@rowcnt INT,
@UserID INT,
@ErrorNumber INT,
@ErrorLine INT

SET @Sql = 'SELECT TOP 1
            UserID
			FROM Users.vUserResponsibility 
			WHERE SQL_User = SUSER_SNAME() 
			ORDER BY UserID DESC'
EXEC Sp_executesql @Sql

SELECT @rowcnt = @@ROWCOUNT
IF @rowcnt = 0
    BEGIN
        --Insert the default responsibility for all new users
        SET @UserID =
        (
            SELECT TOP 1
                UserID
            FROM tblConfiguratorUser
            WHERE SQL_User = SUSER_SNAME()
            ORDER BY UserID DESC
        );

        BEGIN TRY
            BEGIN TRAN;
            INSERT INTO Users.UserResponsibility
            (
                UserID,
                ResponsibilityID
            )
            VALUES
            (   @UserID, -- UserID - int
                23        -- ResponsibilityID - int
                );
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


GO
