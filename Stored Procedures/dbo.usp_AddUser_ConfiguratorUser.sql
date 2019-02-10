SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		James Tyree
-- Create date:	1/22/2019
-- Description:	Adds a user to Premise.dbo.[dbo].[tblConfiguratorUser]
--
-- Execute:		exec [dbo].[usp_AddUser_ConfiguratorUser]
-- Referenced By:	
-- =============================================
CREATE PROCEDURE [dbo].[usp_AddUser_ConfiguratorUser]
(
    @User nvarchar(15)
    ,@UserType nvarchar(15)
    ,@UserTypeID int
    ,@CutSheetApprover int
    ,@UserEmail nvarchar(50)
    ,@SQL_User nvarchar(20)
    ,@CreatedBy nvarchar(20)
    ,@CreationDate datetime
    ,@ItemBuilder bit
    ,@LastLoginDate datetime 
)
AS
BEGIN
    SET NOCOUNT ON;
	

    INSERT INTO [dbo].[tblConfiguratorUser]
			([User]
			,[UserType]
			,[UserTypeID]
			,[CutSheetApprover]
			,[UserEmail]
			,[SQL_User]
			,[CreatedBy]
			,[CreationDate]
			,[ItemBuilder]
			,[LastLoginDate])
	    VALUES
			(@User
			,@UserType
			,@UserTypeID
			,@CutSheetApprover
			,@UserEmail
			,@SQL_User
			,@CreatedBy
			,@CreationDate
			,@ItemBuilder
			,@LastLoginDate)

END



GO
