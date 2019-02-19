SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:      Bryan Eddy
-- Create date: 2/18/2019
-- Description: pull Setup, machine capability, and run speeds from PlanetTogether Db
-- Version: 1
-- Update:	n/a
-- =============================================
CREATE VIEW [PlanetTogether].[vMachineNames]
as

SELECT DISTINCT i.MachineID,
                i.MachineName,
                i.MachineGroupID,
                i.Plant,
                i.Department,
                i.ShareResource,
                i.Grouping,
                i.CapacityTypeID,
                i.MachineRunEffeciency,
                i.MachineSetupEffeciency,
                i.ManualSchedule,
                i.DepartmentID
FROM [NAACAB-SCH01].PlanetTogether_Data_Prod.Setup.vMachineNames i
GO
