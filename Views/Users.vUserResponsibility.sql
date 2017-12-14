SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [Users].[vUserResponsibility]
AS 
SELECT G.UserID, G.ResponsibilityID, k.ResponsibilityName, k.ResponsibilityDescription, I.[User], I.UserEmail, I.SQL_User, k.StartUpForm
FROM users.UserResponsibility G INNER JOIN users.Responsibility k ON k.ResponsebilityID = g.ResponsibilityID 
INNER JOIN dbo.tblConfiguratorUser I ON I.UserID = G.UserID
GO
