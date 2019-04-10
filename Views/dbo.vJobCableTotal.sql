SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vJobCableTotal]
AS

SELECT COALESCE([PrintMark],[OTDRSum],0) AS [SumOfOTDR Length], q.Job
FROM (
	SELECT [Reel No]  AS Job
	, Sum(COALESCE(P.[OTDR Length],0)) AS OTDRSum
	, Sum(COALESCE([OSE Mark],0)-COALESCE([ISE Mark],0)) AS RawPrintMark
	, CASE WHEN [Unit]='Feet' THEN Sum(COALESCE([OSE Mark],0)-COALESCE([ISE Mark],0))/3.281 ELSE Sum(COALESCE([OSE Mark],0)-COALESCE([ISE Mark],0)) END AS PrintMark
	, P.Unit
	FROM [Production and Process Data] P
	GROUP BY [Reel No] , P.Unit
	--HAVING ((([Production and Process Data].[Buffer Line]) Not Like 'CB%' And ([Production and Process Data].[Buffer Line]) Not Like 'SH%'))

) q
GROUP BY  CASE WHEN [PrintMark] IS  Null THEN [OTDRSum] ELSE [PrintMark] END,[OTDRSum],[PrintMark], q.Job






GO
