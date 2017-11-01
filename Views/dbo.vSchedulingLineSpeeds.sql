SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vSchedulingLineSpeeds]
AS

SELECT DISTINCT      
		[MachineID]
      ,[LineSpeed]
      ,[ProcessID]
      ,[MachineNumber]
      ,[Setup]
      ,[SetupDesc]
      ,[PrimaryAlt]
FROM [NAASPB-PRD04\SQL2014].Premise.Setup.vSetupLineSpeed
GO
