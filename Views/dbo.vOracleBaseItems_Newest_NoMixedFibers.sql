SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE VIEW [dbo].[vOracleBaseItems_Newest_NoMixedFibers]
as

SELECT T.Base,  max(Oracle) AS AssemblyItemNumber
--INTO #BaseOracleBOM
FROM 
(
	SELECT E.Base, Oracle
	FROM  dbo.[AFLPRD_INVSysItemCost_CAB] K INNER JOIN dbo.CableUnion E  ON k.ItemNumber = E.Oracle 
	INNER JOIN dbo.tblCableConstructionReferences G ON G.Base = E.Base
	GROUP BY E.Base,Item_Status, E.Oracle,Fiber2,Fiber3,G.Active,G.ReleasedDesign,E.Active
	HAVING E.Base Not Like '%ia%'  --AND K.Item_Status <>'OBSOLETE' AND K.ITEM_STATUS NOT LIKE 'Discontd'
	AND Oracle not like '%-??bx%' --AND (Oracle like '%-00' OR Oracle LIKE 'DNS%' OR Oracle LIKE '%test%') 
	AND Fiber2 = 'NONE' AND Fiber3 = 'NONE'-- AND G.Active =1 AND G.ReleasedDesign =1 AND E.Active = 1
)  AS T
GROUP BY T.Base
--HAVING BASE = 'CR018-4.4'





GO
