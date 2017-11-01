SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [PrintSafe].[vInterfacePrintView]	
AS
SELECT [New Oracle Part #] ItemNumber, [Item No] CatalogCode, COALESCE([Print Line 1],'') + ' ' + COALESCE([print line 2],'') + ' ' + CASE WHEN [Print Item No] <> 0 THEN [Item No] + ' ' ELSE ' ' END 
+ COALESCE([Print Line 3],'') + ' ' 
+ CASE WHEN [Print Reel No] <> 0 THEN 'LOT ###### ' ELSE ' ' END + COALESCE([Print Line 4],'') AS PrintLine
FROM dbo.BasicProductConstruction 
WHERE OracleStatus = 'ACTIVE'

GO
