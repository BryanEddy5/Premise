CREATE TABLE [Setup].[tblProcessMachines_PreactorMachines]
(
[ProcessID] [int] NULL,
[MachineID] [int] NULL,
[MachineNumber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MachineRanking] [int] NULL,
[Active] [bit] NOT NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddScheduleDates] [bit] NOT NULL,
[Uptime] [float] NULL,
[RightTheFirstTime] [float] NULL,
[MachineShiftStartTime] [datetime] NULL,
[MachineShiftEndTime] [datetime] NULL,
[MachineStartDelay] [float] NULL,
[PMDefaultTime] [float] NULL,
[DownTime] [float] NULL,
[ProcessTimeExtension] [int] NULL,
[MachineCount] [float] NULL,
[ProcessTimeDelay] [int] NULL,
[IncludeInReport] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
