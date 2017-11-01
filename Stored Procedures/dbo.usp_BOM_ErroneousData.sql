SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Bryan Eddy>
-- ALTER date: <8/4/2016>
-- Description:	<Procedure designed to find Items with erroneous information contained in BOMs>
-- =============================================
CREATE PROCEDURE  [dbo].[usp_BOM_ErroneousData]
AS
	-- Add the parameters for the stored procedure here

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF OBJECT_ID(N'tempdb..#BaseOracleBOM', N'U') IS NOT NULL
DROP TABLE #BaseOracleBOM;


SELECT T.Base, T.ComponentItemNumber, T.NumEnds, Count(T.ComponentItemNumber) AS CountofOccurence
INTO #BaseOracleBOM
FROM 
(
	SELECT dbo.CableUnion.Base, ComponentItemNumber, 
	Case WHEN CountPerUOM  IS NULL THEN '1'
	    WHEN CountPerUOM ='' THEN '1'
		ELSE CountPerUOM	END as NumEnds
		, Count(ComponentItemNumber) AS CountOfComponentItemNumber, AssemblyItemStatus, Oracle
	FROM  [OracleExtracts].dbo.[AFLPRD_BOMInvComp_CAB]INNER JOIN dbo.CableUnion ON AssemblyItemNumber = dbo.CableUnion.Oracle
	GROUP BY dbo.CableUnion.Base, ComponentItemNumber, CountPerUOM, AssemblyItemStatus, dbo.CableUnion.Oracle
	HAVING dbo.CableUnion.Base Not Like '%ia%' AND ComponentItemNumber Not Like 'pe%' and ComponentItemNumber not like 'wscr%'
	And ComponentItemNumber Not Like 'pt%' And ComponentItemNumber Not Like '%fbr%' And ComponentItemNumber Not Like 'rbn%' 
	And ComponentItemNumber Not Like 'ccp%' AND AssemblyItemStatus='active' AND dbo.CableUnion.Oracle Not Like '%test%'
	AND Oracle not like '%-??bx%' AND Oracle like '%-00' AND ComponentItemNumber not like 'FRC%' --AND Base = 'Ap012-3.5a'
)  AS T
GROUP BY T.Base, T.ComponentItemNumber, T.NumEnds



IF OBJECT_ID(N'tempdb..#NumBases', N'U') IS NOT NULL
DROP TABLE #NumBases;

SELECT T.Base, T.Oracle, c.AssemblyItemStatus
INTO #NumBases
FROM  
(
	SELECT DISTINCT AssemblyItemNumber, AssemblyItemStatus
	FROM [OracleExtracts].dbo.[AFLPRD_BOMInvComp_CAB] 

)C INNER JOIN dbo.CableUnion T ON c.AssemblyItemNumber = T.Oracle
WHERE T.Base Not Like '%ia%'  AND AssemblyItemStatus ='active' AND T.Oracle Not Like '%test%'
AND Oracle not like '%-??bx%' AND Oracle like '%-00' --AND BASE = 'SF000-2.0A'
ORDER BY Oracle


IF OBJECT_ID(N'tempdb..#BaseMax', N'U') IS NOT NULL
DROP TABLE #BaseMax;

SELECT T.BASE, COUNT(T.BASE) as MaxOccurence
INTO #BaseMax
FROM #NumBases T
GROUP BY T.BASE
ORDER BY T.Base

--SELECT Base, MAX(CountofOccurence) as MaxOccurence 
--INTO #BaseMax
--FROM #BaseOracleBOM
--GROUP BY Base



IF OBJECT_ID(N'tempdb..#BaseOracleErrors', N'U') IS NOT NULL
DROP TABLE #BaseOracleErrors;


SELECT C.Base, ComponentItemNumber, NumEnds, c.CountofOccurence, a.MaxOccurence
INTO #BaseOracleErrors
FROM #BaseOracleBOM C INNER JOIN #BaseMax A ON C.BASE = A.BASE
WHERE c.CountofOccurence <> A.MaxOccurence



--DROP TABLE #BaseOracleCorrect

--SELECT C.Base, ComponentItemNumber, NumEnds, c.CountofOccurence, a.MaxOccurence
--INTO #BaseOracleCorrect
--FROM #Base C INNER JOIN #BaseMax A ON C.BASE = A.BASE
--WHERE c.CountofOccurence = A.MaxOccurence



IF OBJECT_ID(N'tempdb..#FinalBOMErrors', N'U') IS NOT NULL
DROP TABLE #FinalBOMErrors;


SELECT Oracle, B.Base, B.ComponentItemNumber, NumEnds, b.MaxOccurence,b.CountofOccurence,
			Case WHEN CountPerUOM  IS NULL THEN '1'
				WHEN CountPerUOM ='' THEN '1'
				ELSE CountPerUOM
				 END as OracleNumEnds
INTO #FinalBOMErrors
FROM dbo.CableUnion C INNER JOIN dbo.AFLPRD_BOMInvComp_CAB O ON c.Oracle = O.AssemblyItemNumber
INNER JOIN #BaseOracleErrors B ON O.ComponentItemNumber = B.ComponentItemNumber AND c.base = B.Base
WHERE Numends = (Case WHEN CountPerUOM  IS NULL THEN '1'
				WHEN CountPerUOM ='' THEN '1'
				ELSE CountPerUOM
				END)
	  AND Oracle  like '%-00%' and O.AssemblyItemStatus = 'ACTIVE'
ORDER BY b.base,  CountofOccurence,ComponentItemNumber , OracleNumEnds,Oracle

--Missing Items from the FinalBOMErrors table.
SELECT DISTINCT K.Base, K.ORACLE, k.AssemblyItemStatus
FROM #FinalBOMErrors E RIGHT JOIN #NumBases K ON k.Oracle = e.Oracle INNER JOIN #FinalBOMErrors B ON B.Base = K.Base
WHERE E.ORACLE IS NULL
--GROUP BY Base, ComponentItemNumber, NumEnds, MaxOccurence, CountofOccurence, OracleNumEnds
ORDER BY base



SELECT Oracle, B.Base, B.ComponentItemNumber, NumEnds, b.MaxOccurence,b.CountofOccurence, F.BaseID
FROM #FinalBOMErrors b INNER JOIN dbo.tblCableConstructionReferences F ON B.BASE = F.BASE  
ORDER BY b.base, b.ComponentItemNumber,NumEnds
END


GO
