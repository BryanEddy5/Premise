SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROC [Schedule].[usp_LoadGanttData]
AS

TRUNCATE TABLE dbo.[Temp (Premise Load)]

;WITH cteCustOrderSpec
AS (
SELECT COALESCE(C.[Order Qty], 0) AS Length,
           Job#,
           [Order Qty],
           C.OrderId,
           [Shipped Qty],
           IIF(C.[Units] = 'Feet', COALESCE(C.[Order Qty], 0) / 3.281, COALESCE(C.[Order Qty], 0)) AS LengthM,
           C.Customer,
           C.[Co Number],
           COALESCE(i.ScheduleDate,C.[Schedule date]) AS [Schedule date],
           C.[Mfg commit date],
           C.[Type Order],
           C.[Reel No],
           COALESCE(I.ScheduleDate,C.[Schedule date]) - S.[Date Adjustments] AS [Adj Schedule Date],
           S.[Date Adjustments],
           I.OrderProcessItemsID,
           I.JobNumber,
           S.[Buffering Factor],
           S.PlannedLotSize,
           COALESCE(q.[SumOfOTDR Length],0) AS CompLength,
           S.[Set-up time level 1],
           S.[Set-up time level 2],
           I.ItemNumber,
           C.Units,
           S.Color,
           C.[Mfg commit date] - [Date Adjustments] AS [Adj Mfg Date],
           S.[Item No],
           S.ItemNo,
           S.[Jacket Material],
           I.PromiseDate,
           S.Active,
           S.ActiveConstruction,
           S.Base
    FROM [Cust Order Specifications] C
        INNER JOIN Schedule.OrderProcessItems I
            ON I.OrderId = C.OrderId
        INNER JOIN dbo.vSchedulingCableRunSpeeds S
            ON I.ItemNumber = S.Oracle
        LEFT JOIN vJobCableTotal q
            ON COALESCE(I.JobNumber, C.Job#) = q.Job
    WHERE S.ItemNo NOT LIKE 'wb*'
	)
INSERT INTO [Temp (Premise Load)]
(
    [Order Qty],
    RequiredDays_Orig,
    [Req'd Days (#TB or RBN)],
    [Adj Schedule Date],
    [Setup Buff],
    [Setup SZ/SH],
    [Week ending],
    [Item number],
    Length,
    [Adj Mfg  Date],
    [Week ending-mfg],
    Factor,
    [Length Meters],
    Ftype,
    Design,
    Family,
    [Job#],
    [Jacket Material],
    [Jacket Color],
    [Line#],
    Sequence,
    [Early Start],
    [Setup Hrs],
    [Promise Date],
    CompLength,
    Active,
    Base,
    [Count],
    Setup,
    Customer,
    [CO#],
    [Schedule date],
    [Mfg commit date],
    [Order Source],
    [Reel number],
    MachineId,
	EngineeringAssist
)
SELECT 
    C.Length,
    ROUND((((((C.LengthM * m.Quantity) - CompLength) / [LineSpeed] / 60)) / 0.85  + 
	((([LengthM] * (m.Quantity) - CompLength) / [PlannedLotSize]) * [Set-up time level 2] + IIF(C.CompLength < 1,[Set-up time level 1] , 0))-- The setup hours for the required days calculation
	) / 24,5) AS [Req'd Days],
    IIF(LEFT([ItemNumber], 2) = 'PT' OR LEFT([ItemNumber], 3) = 'FBR' OR LEFT([ItemNumber], 3) = 'RBN', 0, NULL) AS [Req'd Days (#TB or RBN)],
    [Adj Schedule Date],
    P.[Setup Buff],
    P.[Setup SZ/SH],
    DATEADD(dd, 6 - (DATEPART(dw, [Adj Schedule Date])), [Adj Schedule Date]) AS [Week ending] ,
    C.ItemNumber,
    C.LengthM * m.Quantity AS RunLength,--+ [TotalStartUpScrap] AS RunLength,
    [Adj Mfg Date],
    DATEADD(dd, 6 - (DATEPART(dw, [Adj Mfg Date])), [Adj Mfg Date]) AS [Week ending-mfg],
    M.Quantity,
    C.LengthM * m.Quantity,
    SUBSTRING(C.[ItemNo], 6, 1) AS FiberType,
    C.ItemNo,
    LEFT([ItemNumber], 7) AS Family,
    COALESCE([JobNumber], [Job#]) AS JobNumber,
    C.[Jacket Material],
    C.Color AS [Jacket Color],
    L.MachineName,
    COALESCE([Run Order], 999) AS Sequence,
    P.[Early Star Date],
    ((([LengthM] * (m.Quantity) - CompLength) / [PlannedLotSize]) * [Set-up time level 2] + IIF(C.CompLength < 1,[Set-up time level 1] , 0)) AS SetupHrs,
    COALESCE([PromiseDate],[Promise Date], [Mfg commit date]) AS PromDate,
    C.CompLength,
    IIF(C.Active = 1, -1, 0) AS Active,
    C.Base,
    SUBSTRING(C.[ItemNo], 3, 3) AS FiberCount,
    M.Setup,
    C.Customer,
    C.[Co Number],
    C.[Schedule date],
    C.[Mfg commit date],
    C.[Type Order],
    C.[Reel No],
    M.MachineID,
	COALESCE(E.EngineeringAssist,0)
FROM cteCustOrderSpec C
    INNER JOIN [Printed Labels (Data Products)] P
        ON C.[Reel No] = P.[Reel No]
           AND C.[Order Qty] = P.[Order Qty]
    LEFT JOIN [New Orders Spreadsheet]
        ON C.[Co Number] = [New Orders Spreadsheet].[Order #]
    INNER JOIN Schedule.OrderProcessMachines M
        ON M.OrderProcessItemId = C.OrderProcessItemsID
    INNER JOIN PlanetTogether.vSetupLineSpeed L
        ON L.Setup = M.Setup
           AND L.MachineID = M.MachineID
	LEFT JOIN [NAACAB-SCH01].PlanetTogether_Data_Prod.[Scheduling].[vEngineeringAssist] E
	ON E.Setup = M.Setup AND E.MachineID = M.MachineID
WHERE P.Shipped = 0
      AND M.IsComplete = 0 

UPDATE dbo.[Temp (Premise Load)]
SET RequiredDays_Orig = 0
WHERE RequiredDays_Orig < 0
GO
