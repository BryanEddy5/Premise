SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Bryan Eddy
-- date: 10/20/2017
-- Description:	Update the user last login datetime
-- =============================================
CREATE PROCEDURE [Users].[usp_UpdateUserLastLogin]

@UserName AS NVARCHAR(50)
AS


SET ANSI_NULLS OFF;
SET NOCOUNT ON;

UPDATE dbo.tblConfiguratorUser 
SET LastLoginDate = GETDATE()
WHERE [User] = @UserName





GO
