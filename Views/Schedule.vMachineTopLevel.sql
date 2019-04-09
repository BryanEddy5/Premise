SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [Schedule].[vMachineTopLevel]
as
WITH cteLastOperation
AS(
	SELECT P.MachineName, M.MachineID, ROW_NUMBER() OVER (PARTITION BY I.OrderId ORDER BY I.OrderId,i.BomLevel, M.TrueOperationSequence DESC) RowNumber, I.OrderId
	,m.OrderProcessMachineId
	FROM Schedule.OrderProcessItems I
	INNER JOIN Schedule.OrderProcessMachines M ON M.OrderProcessItemId = I.OrderProcessItemsID
	INNER JOIN PlanetTogether.vMachineNames P ON P.MachineID = M.MachineID
	WHERE I.ParentItemNumber IS NULL
)
SELECT o.MachineName,
       o.MachineID,
       o.RowNumber,
       o.OrderId,
	   o.OrderProcessMachineId
FROM cteLastOperation o
WHERE o.RowNumber = 1
GO
