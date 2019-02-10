SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vOracleBaseItems]
as
WITH cteOracleBaseItems(Base, AssemblyItemNumber, SetupID, ItemRank)
as(
--SELECT T.Base,  max(Oracle) AS AssemblyItemNumber, SetupID
----INTO #BaseOracleBOM
--FROM 
--(
	SELECT E.Base, [New Oracle Part #] AS Oracle, SetupID, ROW_NUMBER() OVER (PARTITION BY E.BASE ORDER BY [New Oracle Part #] DESC) as ItemRank
	FROM  dbo.[AFLPRD_INVSysItemCost_CAB] K INNER JOIN DBO.BasicProductConstruction E  ON k.ItemNumber = E.[New Oracle Part #] 
	INNER JOIN dbo.tblCableConstructionReferences G ON E.Base = G.Base
	GROUP BY E.Base,Item_Status, E.[New Oracle Part #], SetupID
	HAVING E.Base Not Like 'ia%'  --AND E.Oracle Not Like '%test%' 
	AND [New Oracle Part #] not like '%-__bx%' AND ([New Oracle Part #] like '%-00' OR left([New Oracle Part #],3) IN ('DNS','DNT') OR [New Oracle Part #] LIKE '%test%')
	AND K.Item_Status <> 'obsolete'
--)  AS T
--GROUP BY T.Base, SetupID
)
SELECT *
FROM cteOracleBaseItems
WHERE ItemRank = 1





GO
