SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 11/17/2016
-- Description:	Add user email to tblConfiguratorUser
-- =============================================
CREATE PROCEDURE [dbo].[usp_UserEmailAddress] 
(
	-- Add the parameters for the stored procedure here
	@ConfiguratorUser as nvarchar(15),
	@UserEmail as nvarchar(50)

)
AS
BEGIN

	SET NOCOUNT ON;

	IF EXISTS (SELECT [User] FROM dbo.tblConfiguratorUser WHERE [User] = @ConfiguratorUser)

		BEGIN

		UPDATE dbo.tblConfiguratorUser
		SET UserEmail = @UserEmail
		WHERE [User] = @ConfiguratorUser

		END

	ELSE
		BEGIN
					
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
			


		END


END

GO
