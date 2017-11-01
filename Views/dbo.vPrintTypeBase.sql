SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vPrintTypeBase]
AS 
SELECT PrintTypeBase, PrintID, Priority, Active
FROM dbo.PrintTypeBase
GO
