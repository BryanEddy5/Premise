SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vOracleBaseItems_Newest]
as

SELECT T.Base,  max(Oracle) AS AssemblyItemNumber
--INTO #BaseOracleBOM
FROM 
(
	SELECT E.Base, Oracle
	FROM  dbo.[AFLPRD_INVSysItemCost_CAB] K INNER JOIN dbo.CableUnion E  ON k.ItemNumber = E.Oracle
	GROUP BY E.Base,Item_Status, E.Oracle
	HAVING E.Base Not Like '%ia%'  --AND E.Oracle Not Like '%test%' 
	AND Oracle not like '%-??bx%' AND (Oracle like '%-00' OR Oracle LIKE 'DNS%' OR Oracle LIKE '%test%')
)  AS T
GROUP BY T.Base

GO
