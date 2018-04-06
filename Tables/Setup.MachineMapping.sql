CREATE TABLE [Setup].[MachineMapping]
(
[PreactorMachineID] [int] NULL,
[PreactorProcessID] [int] NULL,
[PreactorMachineNumber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PlanetTogetherMachineNumber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProcessID] [int] NOT NULL,
[MachineID] [int] NOT NULL,
[PlanetTogetherMachineID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Setup].[MachineMapping] ADD CONSTRAINT [pk_MachineMapping] PRIMARY KEY CLUSTERED  ([ProcessID], [MachineID]) ON [PRIMARY]
GO
