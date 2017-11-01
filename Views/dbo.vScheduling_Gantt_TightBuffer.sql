SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vScheduling_Gantt_TightBuffer]
as
SELECT G.[Mfg commit date], G.[Order Qty], G.Active, G.[Week ending], G.[Week ending-mfg], G.CO#, G.Customer, G.Length, G.[Length Meters], G.[Item number], G.Design
,G.[Promise Date],G.[Complete Buff], TB.*, K.*, RequiredDays, Job#,DATEADD(DAY, 1+1-DATEPART(WEEKDAY, [Mfg commit date]), [Mfg commit date]) AS Mon, DATEADD(DAY, 5+1-DATEPART(WEEKDAY, [Mfg commit date]), [Mfg commit date]) as Fri
,Line#, [Type Seq], Finish, [Sequence], Start
FROM dbo.TightBufferBOMExplode K INNER JOIN [Temp (Premise Load)] G ON K.AssemblyItemNumber = G.[Item number]
INNER JOIN (SELECT DISTINCT left([New Oracle Part #],7) TB, [Fiber Oracle item]  FROM dbo.[Basic Product Construction] G WHERE [New Oracle Part #] like 'pt%') TB 
ON TB.TB = K.TightBuffer 
WHERE [Order Source] = 'New' AND [Type Order] = 'Loaded' and [Complete Buff] = 0 and Start is not null
--ORDER BY Line#
--ORDER BY DATEADD(DAY, 1+1-DATEPART(WEEKDAY, [Mfg commit date]), [Mfg commit date])
GO
