SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:      Bryan Eddy
-- Create date: 2/18/2019
-- Description: pull Setup, machine capability, and run speeds from PlanetTogether Db
-- Version: 2
-- Update:	Changed the source of the run speed data as to not include item and routing information
-- =============================================
CREATE VIEW [PlanetTogether].[vSetupLineSpeed]
as

SELECT DISTINCT Setup, SetupDesc, MachineID, MachineName, LineSpeed, RunTypeID
FROM [NAACAB-SCH01].PlanetTogether_Data_Prod.Setup.vLineSpeedSetupOnly i
GO
