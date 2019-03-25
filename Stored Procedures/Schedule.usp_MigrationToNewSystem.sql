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

/****************************************************************************************************
*****************************************************************************************************/
--Link all orders
BEGIN tran
UPDATE C
SET c.OrderId = k.[Order ID]
FROM dbo.[New Orders (Premise) to Transfer to SS] K 
INNER JOIN dbo.[Cust Order Specifications] C ON C.[Co Number] = K.[Co number] AND C.[Order Qty] = K.Length
COMMIT


/****************************************************************************************************
*****************************************************************************************************/
--Get the True Operation Codes and Items for each Order
DECLARE @OrderId INT;
DECLARE @ItemNumber NVARCHAR(50);
DECLARE @Order_Cursor CURSOR;

BEGIN

    SET @Order_Cursor = CURSOR FOR
    SELECT C.OrderId,
           [Item No]
    FROM dbo.[Cust Order Specifications] C
	left JOIN Schedule.OrderProcessItems I ON I.OrderId = C.OrderId
    WHERE C.OrderId IS NOT NULL AND I.OrderId IS NULL;
    OPEN @Order_Cursor;
    FETCH NEXT FROM @Order_Cursor
    INTO @OrderId,
         @ItemNumber;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        EXEC Schedule.usp_GetTrueOperationCodes @ItemNumber, @OrderId
        FETCH NEXT FROM @Order_Cursor
        INTO @OrderId,
             @ItemNumber;
    END;
    CLOSE @Order_Cursor;
    DEALLOCATE @Order_Cursor;
END;

/****************************************************************************************************
*****************************************************************************************************/
--Update all buffering operations
UPDATE m
SET m.MachineID = Y.MachineID,
	M.MachineName = Y.MachineName
FROM dbo.[Printed Labels (Data Products)] p 
INNER JOIN dbo.[Cust Order Specifications] c ON c.[Order Qty] = p.[Order Qty] AND c.[Reel No] = p.[Reel No]
INNER JOIN Schedule.OrderProcessItems i ON i.OrderId = c.OrderId
INNER JOIN Schedule.OrderProcessMachines m ON m.OrderProcessItemId = i.OrderProcessItemsID
INNER JOIN PlanetTogether.vMachineNames Y ON RIGHT(Y.MachineName,2) = RIGHT('00'+CAST([Buff Line #] AS VARCHAR(2)),2)
INNER JOIN PlanetTogether.vSetupLineSpeed s ON s.Setup = m.Setup AND s.MachineID = y.MachineID
WHERE Y.Plant = 'PREMISE' AND ISNUMERIC(p.[Buff Line #]) = 1 AND LEFT(Y.MACHINENAME,2) = 'BL'


/****************************************************************************************************
*****************************************************************************************************/
--Update all all cabling operations to CL08	
UPDATE s
SET s.MachineID = L.MachineID, s.MachineName = L.MachineName
FROM Schedule.OrderProcessMachines S 
INNER JOIN PlanetTogether.vSetupLineSpeed L ON L.Setup = S.Setup
WHERE L.MachineID = 45



/****************************************************************************************************
*****************************************************************************************************/
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


/****************************************************************************************************
*****************************************************************************************************/
--Delete anything that has more than 2 Bom levels
DELETE FROM Schedule.OrderProcessItems
WHERE BomLevel > 2


/****************************************************************************************************
*****************************************************************************************************/
--Delete core items for armor, box, and ss
DELETE  S
FROM Schedule.OrderProcessItems S 
INNER JOIN dbo.[Cust Order Specifications] C ON C.OrderId = S.OrderId
WHERE (C.[Item No] LIKE '%-__IA' OR C.[Item No] LIKE '%-__BX%' OR C.[Item No] LIKE '%-__SS%')
AND S.BomLevel > 1


/****************************************************************************************************
*****************************************************************************************************/
--Marking as completed

--Buffering
;WITH cteRecordCount
AS(
	SELECT DISTINCT COUNT(*)  OVER (PARTITION BY I.OrderId) AS RecordCount, OrderId
	FROM SCHEDULE.OrderProcessMachines M 
	INNER JOIN Schedule.OrderProcessItems I ON I.OrderProcessItemsID = M.OrderProcessItemId
)
UPDATE M
SET M.IsComplete = 1
--SELECT M.IsComplete,[Completed Buffering] , M.Setup, M.MachineName, I.BomLevel, k.RecordCount, c.OrderId
FROM dbo.[Cust Order Specifications] c 
INNER JOIN dbo.[Printed Labels (Data Products)] P ON P.[Order Qty] = c.[Order Qty] AND P.[Reel No] = c.[Reel No]
INNER JOIN Schedule.OrderProcessItems I ON I.OrderId = c.OrderId
INNER JOIN SCHEDULE.OrderProcessMachines M ON M.OrderProcessItemId = I.OrderProcessItemsID
INNER JOIN cteRecordCount k ON k.OrderId = I.OrderId
WHERE P.[Completed Buffering] <> 0 AND (I.BomLevel = 2  OR (RecordCount < 2 AND I.BomLevel = 1))
AND M.Setup NOT LIKE 'c%'

--Cabling
UPDATE M
SET M.IsComplete = 1
--SELECT M.IsComplete,[Completed Buffering] , M.Setup, M.MachineName, I.BomLevel
FROM dbo.[Cust Order Specifications] c 
INNER JOIN dbo.[Printed Labels (Data Products)] P ON P.[Order Qty] = c.[Order Qty] AND P.[Reel No] = c.[Reel No]
INNER JOIN Schedule.OrderProcessItems I ON I.OrderId = c.OrderId
INNER JOIN SCHEDULE.OrderProcessMachines M ON M.OrderProcessItemId = I.OrderProcessItemsID
WHERE P.[Setup SZ/SH] <> 0 AND M.Setup  LIKE 'c%'

--Sheathing
;WITH cteRecordCount
AS(
	SELECT DISTINCT COUNT(*)  OVER (PARTITION BY I.OrderId) AS RecordCount, OrderId
	FROM SCHEDULE.OrderProcessMachines M 
	INNER JOIN Schedule.OrderProcessItems I ON I.OrderProcessItemsID = M.OrderProcessItemId
)
UPDATE M
SET M.IsComplete = 1
--SELECT M.IsComplete,[Completed Buffering] , M.Setup, M.MachineName, I.BomLevel, k.RecordCount
FROM dbo.[Cust Order Specifications] c 
INNER JOIN dbo.[Printed Labels (Data Products)] P ON P.[Order Qty] = c.[Order Qty] AND P.[Reel No] = c.[Reel No]
INNER JOIN Schedule.OrderProcessItems I ON I.OrderId = c.OrderId
INNER JOIN SCHEDULE.OrderProcessMachines M ON M.OrderProcessItemId = I.OrderProcessItemsID
INNER JOIN cteRecordCount k ON k.OrderId = C.OrderId
-- Complete Cabling is the correct field for Sheathing completion.
-- It makes no sense but that is how it is set up in the system
WHERE P.[Completed Cabling] <> 0 AND (I.BomLevel = 1  AND k.RecordCount > 1)
AND M.Setup NOT LIKE 'c%'

--Armoring
UPDATE M
SET M.IsComplete = 1
--SELECT M.IsComplete,[Setup Buff] , M.Setup, M.MachineName, I.BomLevel, c.OrderId, I.JobNumber, c.Job#
FROM dbo.[Cust Order Specifications] c 
INNER JOIN dbo.[Printed Labels (Data Products)] P ON P.[Order Qty] = c.[Order Qty] AND P.[Reel No] = c.[Reel No]
INNER JOIN Schedule.OrderProcessItems I ON I.OrderId = c.OrderId
INNER JOIN SCHEDULE.OrderProcessMachines M ON M.OrderProcessItemId = I.OrderProcessItemsID
WHERE P.[Setup Buff] <> 0 AND M.Setup  LIKE 'IA%'


GO
