SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE VIEW [dbo].[vItemPrintByLine]
AS
SELECT [New Oracle Part #] ItemNumber, [Item No] CatalogCode, COALESCE([Print Line 1],'') AS PrintLine1,
 COALESCE([print line 2],'') + ' ' + CASE WHEN [Print Item No] <> 0 THEN [Item No] ELSE '' END AS PrintLine2,
 COALESCE([Print Line 3],'') AS PrintLine3,  CASE WHEN [Print Reel No] <> 0 THEN 'LOT NO. ###### ' ELSE ' ' END + ' ' + COALESCE([Print Line 4],'') AS PrintLine4
, CASE WHEN [New Oracle Part #] LIKE '%-0[21%]' AND Customer = 'afl standard' AND LEN([Print Line 1]) > 0 THEN 1 ELSE 0 END AS StandardPrint
,CASE WHEN NewPrintLine4 LIKE '%METER%' THEN 'METERS'
	WHEN NewPrintLine4 LIKE '%FEET%' THEN 'FEET' END PrintUOM
FROM dbo.BasicProductConstruction k INNER JOIN dbo.AFLPRD_INVSysItemCost_CAB g ON g.ItemNumber = k.[New Oracle Part #]
INNER JOIN dbo.tblCableConstructionReferences I ON I.BASE = K.Base 
INNER JOIN DBO.tblCableType E ON E.CableType = I.CableType
--WHERE E.CableID =1 AND k.[New Oracle Part #] NOT LIKE '%test%'--g.Item_Status in ('ACTIVE','discontd')



GO
