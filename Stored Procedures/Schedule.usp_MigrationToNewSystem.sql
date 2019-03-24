SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
Author:		Bryan Eddy
Date:		3/12/2019
Des:		Migration script for new system data structuring.  This script will be ran once
			when migrating to the new Premise Scheduling system logic
*/
CREATE PROC [Schedule].[usp_MigrationToNewSystem]
AS

--Link all orders
BEGIN tran
UPDATE C
SET c.OrderId = k.[Order ID]
FROM dbo.[New Orders (Premise) to Transfer to SS] K 
INNER JOIN dbo.[Cust Order Specifications] C ON C.[Co Number] = K.[Co number] AND C.[Order Qty] = K.Length
COMMIT


--Update buffering lines 
UPDATE m
SET m.MachineID = Y.MachineID,
	M.MachineName = Y.MachineName

	--SELECT 
 --      [Buff Line #],
	--   Y.MachineID,
	--   Y.MachineName,
	--   m.MachineID AS OrderMachineId,
	--   m.MachineName AS OrderMachineName

FROM dbo.[Printed Labels (Data Products)] p 
INNER JOIN dbo.[Cust Order Specifications] c ON c.[Order Qty] = p.[Order Qty] AND c.[Reel No] = p.[Reel No]
INNER JOIN Schedule.OrderProcessItems i ON i.OrderId = c.OrderId
INNER JOIN Schedule.OrderProcessMachines m ON m.OrderProcessItemId = i.OrderProcessItemsID
INNER JOIN PlanetTogether.vMachineNames Y ON RIGHT(Y.MachineName,2) = RIGHT('00'+CAST([Buff Line #] AS VARCHAR(2)),2)
INNER JOIN PlanetTogether.vSetupLineSpeed s ON s.Setup = m.Setup AND s.MachineID = y.MachineID
WHERE Y.Plant = 'PREMISE' AND ISNUMERIC(p.[Buff Line #]) = 1 AND LEFT(Y.MACHINENAME,2) = 'BL'

--Update all all cabling operations to CL08	
UPDATE s
SET s.MachineID = L.MachineID, s.MachineName = L.MachineName
FROM Schedule.OrderProcessMachines S 
INNER JOIN PlanetTogether.vSetupLineSpeed L ON L.Setup = S.Setup
WHERE L.MachineID = 45


--Update Sheathing Lines
UPDATE m
SET m.MachineID = Y.MachineID,
	M.MachineName = Y.MachineName

	--SELECT 
 --      [Sheathing Line #],
	--   Y.MachineID,
	--   Y.MachineName,
	--   m.MachineID AS OrderMachineId,
	--   m.MachineName AS OrderMachineName

FROM dbo.[Printed Labels (Data Products)] p 
INNER JOIN dbo.[Cust Order Specifications] c ON c.[Order Qty] = p.[Order Qty] AND c.[Reel No] = p.[Reel No]
INNER JOIN Schedule.OrderProcessItems i ON i.OrderId = c.OrderId
INNER JOIN Schedule.OrderProcessMachines m ON m.OrderProcessItemId = i.OrderProcessItemsID
INNER JOIN PlanetTogether.vMachineNames Y ON RIGHT(Y.MachineName,2) = RIGHT('00'+CAST(p.[Sheathing Line #] AS VARCHAR(2)),2)
INNER JOIN PlanetTogether.vSetupLineSpeed s ON s.Setup = m.Setup AND s.MachineID = y.MachineID
WHERE Y.Plant = 'PREMISE' AND ISNUMERIC(p.[Buff Line #]) = 1 AND LEFT(Y.MACHINENAME,2) IN ('BL','SL')

--Delete anything that has more than 2 Bom levels
DELETE FROM Schedule.OrderProcessItems
WHERE BomLevel > 2

--Delete core items for armor, box, and ss
DELETE  S
FROM Schedule.OrderProcessItems S 
INNER JOIN dbo.[Cust Order Specifications] C ON C.OrderId = S.OrderId
WHERE (C.[Item No] LIKE '%-__IA' OR C.[Item No] LIKE '%-__BX%' OR C.[Item No] LIKE '%-__SS%')
AND S.BomLevel > 1
GO
