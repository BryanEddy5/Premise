SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/*
Author:		Bryan Eddy
Date:		3/24/2019
Des:		Script to get preferred lines from existing table
*/
CREATE PROC [Schedule].[usp_GetAllPreferredMachines]
as

/* Insert Preferred primary BUFFERING line*/
;WITH ctePrefer
AS(
SELECT DISTINCT l.Setup, m.MachineID, ROW_NUMBER() OVER (PARTITION BY L.Setup ORDER BY L.Setup) AS ROWNUMER
FROM PlanetTogether.vMachineNames M
INNER JOIN dbo.CableRunSpeeds R ON CAST(RIGHT(M.MachineName,2) AS INT) = r.PrimaryBufferingLine
INNER JOIN dbo.tblCableConstructionReferences C ON C.PrefixID = R.PrefixID
INNER JOIN dbo.tblCableConstructions I ON I.BaseID = C.BaseID
CROSS APPLY dbo.SDF_SplitString(I.StandardOperation,'-') E
INNER JOIN PlanetTogether.vSetupLineSpeed L ON L.Setup = E.part AND L.MachineID = M.MachineID
LEFT JOIN Schedule.SetupPreferredMachine t ON t.Setup = L.Setup
WHERE Plant = 'PREMISE' AND M.DepartmentID IN (29,10) AND t.Setup IS null
)
INSERT INTO Schedule.SetupPreferredMachine
(
    Setup,
    PreferredMachineId
)

SELECT ctePrefer.Setup, ctePrefer.MachineID
FROM ctePrefer
WHERE ctePrefer.ROWNUMER = 1

/* Insert Preferred primary SHEATHING line*/
;WITH ctePrefer
AS(
SELECT DISTINCT l.Setup, m.MachineID, ROW_NUMBER() OVER (PARTITION BY L.Setup ORDER BY L.Setup) AS ROWNUMER
FROM PlanetTogether.vMachineNames M
INNER JOIN dbo.CableRunSpeeds R ON CAST(RIGHT(M.MachineName,2) AS INT) = r.[Sheathing Line]
INNER JOIN dbo.tblCableConstructionReferences C ON C.PrefixID = R.PrefixID
INNER JOIN dbo.tblCableConstructions I ON I.BaseID = C.BaseID
CROSS APPLY dbo.SDF_SplitString(I.StandardOperation,'-') E
INNER JOIN PlanetTogether.vSetupLineSpeed L ON L.Setup = E.part AND L.MachineID = M.MachineID
LEFT JOIN Schedule.SetupPreferredMachine t ON t.Setup = L.Setup
WHERE Plant = 'PREMISE' AND M.DepartmentID IN (29,10) AND t.Setup IS null
)
INSERT INTO Schedule.SetupPreferredMachine
(
    Setup,
    PreferredMachineId
)

SELECT ctePrefer.Setup, ctePrefer.MachineID
FROM ctePrefer
WHERE ctePrefer.ROWNUMER = 1

/* Insert Preferred primary ARMORING line*/

INSERT INTO Schedule.SetupPreferredMachine
(
    Setup,
    PreferredMachineId
)
SELECT DISTINCT M.Setup, m.MachineID
FROM PlanetTogether.vSetupLineSpeed M
left JOIN Schedule.SetupPreferredMachine i ON i.Setup = M.Setup
WHERE M.MachineName = 'AR01'AND i.Setup IS null

/* Insert Preferred primary CABLING line*/

INSERT INTO Schedule.SetupPreferredMachine
(
    Setup,
    PreferredMachineId
)
SELECT DISTINCT M.Setup, m.MachineID
FROM PlanetTogether.vSetupLineSpeed M
left JOIN Schedule.SetupPreferredMachine i ON i.Setup = M.Setup
WHERE M.MachineName = 'CL08'AND i.Setup IS null
GO
