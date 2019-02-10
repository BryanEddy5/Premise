CREATE TABLE [dbo].[tblTightBufferSetup]
(
[PSS] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TightBufferStrip] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TBDescription] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Recipe] [smallint] NOT NULL,
[Compound] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ColorChipPercentage] [decimal] (8, 6) NULL,
[WaterLine_mm] [smallint] NULL,
[ZumbachLibrarySetting] [decimal] (6, 4) NOT NULL,
[HypoTube_mm] [decimal] (6, 4) NULL,
[VacuumBlock_inch] [decimal] (6, 4) NULL,
[ScreenPacks] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TipID_inch] [decimal] (6, 4) NULL,
[DieID] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HypoTubeExtension] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PreheaterTemp_C] [int] NULL CONSTRAINT [DF_tblTightBufferSetup_PreheaterTemp_C] DEFAULT ((0)),
[CreatedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tblTightBufferSetup_CreatedBy] DEFAULT (suser_sname()),
[DateCreated] [datetime] NOT NULL CONSTRAINT [DF_tblTightBufferSetup_DateCreated] DEFAULT (getdate()),
[RevisedBY] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tblTightBufferSetup_RevisedBY] DEFAULT (suser_sname()),
[DateRevised] [datetime] NOT NULL CONSTRAINT [DF_tblTightBufferSetup_DateRevised] DEFAULT (getdate()),
[Filler] [bit] NULL CONSTRAINT [DF_tblTightBufferSetup_Filler] DEFAULT ((0)),
[TimeStamp] [timestamp] NOT NULL,
[MachineGroupID] [int] NOT NULL CONSTRAINT [DF__tblTightB__Machi__53640638] DEFAULT ((1)),
[CableType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TightBuffSetupId] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblTightBufferSetup] ADD CONSTRAINT [PK_tblTightBufferSetup] PRIMARY KEY CLUSTERED  ([TightBuffSetupId]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblTightBufferSetup] ON [dbo].[tblTightBufferSetup] ([PSS], [TightBufferStrip], [Compound], [CableType]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblTightBufferSetup] ADD CONSTRAINT [FK_tblTightBufferSetup_MachineGroupID] FOREIGN KEY ([MachineGroupID]) REFERENCES [dbo].[tblTightBufferMachineGroups] ([MachineGroupID]) ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblTightBufferSetup] ADD CONSTRAINT [FK_tblTightBufferSetup_tblTightBufferStripType] FOREIGN KEY ([TightBufferStrip]) REFERENCES [dbo].[tblTightBufferStripType] ([TightBufferStrip]) ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblTightBufferSetup] ADD CONSTRAINT [FK__tblTightB__Cable__16CFF944] FOREIGN KEY ([CableType]) REFERENCES [dbo].[tblCableType] ([CableType]) ON UPDATE CASCADE
GO
