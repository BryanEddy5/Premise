SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[qryTotalProduced2]
AS

SELECT qrytotalproduced2_SubQry.FirstReel AS [FirstOfReel No], CASE WHEN [PrintMark] Is Null THEN [OTDRSum] ELSE [PrintMark] END AS [SumOfOTDR Length], qrytotalproduced2_SubQry.Job
FROM (
	SELECT Min([Production and Process Data].[Reel No]) AS FirstReel
	, CASE WHEN CHARINDEX('-',[Reel No])<>0 THEN Left([Reel No],CHARINDEX('-', [Reel No])-1) ELSE [Reel No] END AS Job
	, Sum([Production and Process Data].[OTDR Length]) AS OTDRSum
	, Sum([OSE Mark]-[ISE Mark]) AS RawPrintMark
	, CASE WHEN [Unit]='Feet' THEN Sum([OSE Mark]-[ISE Mark])/3.281 ELSE Sum([OSE Mark]-[ISE Mark]) END AS PrintMark
	, [Production and Process Data].Unit
	FROM [Production and Process Data]
	GROUP BY CASE WHEN CHARINDEX('-',[Reel No])<>0 THEN Left([Reel No],CHARINDEX('-', [Reel No])-1) ELSE [Reel No] END , [Production and Process Data].Unit, [Production and Process Data].[Buffer Line]
	HAVING ((([Production and Process Data].[Buffer Line]) Not Like 'CB%' And ([Production and Process Data].[Buffer Line]) Not Like 'SH%'))

) qrytotalproduced2_SubQry
GROUP BY qrytotalproduced2_SubQry.FirstReel, CASE WHEN [PrintMark] IS  Null THEN [OTDRSum] ELSE [PrintMark] END,[OTDRSum],[PrintMark], qrytotalproduced2_SubQry.Job




GO
