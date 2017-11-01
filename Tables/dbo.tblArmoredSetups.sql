CREATE TABLE [dbo].[tblArmoredSetups]
(
[OracleBase] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StdOp] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ArmorOD] [float] NULL,
[ArmorID] [float] NULL,
[NomOD] [float] NULL,
[MaxCoreOD] [float] NULL,
[ArmorUsage] [float] NULL,
[JacketMaterial] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[JacketDensity] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[JackThickness] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MaxJacketOD] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MinJacketOD] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NomJacketOD] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[JacketUsage] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[JacketType] [int] NULL CONSTRAINT [DF__tblArmore__Jacke__28ED12D1] DEFAULT ((0)),
[CoreWrap] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ArmorNo] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblArmoredSetups] ADD CONSTRAINT [PK_tblArmoredSetups] PRIMARY KEY CLUSTERED  ([ArmorNo]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tblArmoredSetups$ArmorID] ON [dbo].[tblArmoredSetups] ([ArmorID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblArmoredSetups] ON [dbo].[tblArmoredSetups] ([OracleBase]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'test.[tblArmoredSetups]', 'SCHEMA', N'dbo', 'TABLE', N'tblArmoredSetups', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'test.[tblArmoredSetups].[ArmorID]', 'SCHEMA', N'dbo', 'TABLE', N'tblArmoredSetups', 'COLUMN', N'ArmorID'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'test.[tblArmoredSetups].[ArmorNo]', 'SCHEMA', N'dbo', 'TABLE', N'tblArmoredSetups', 'COLUMN', N'ArmorNo'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'test.[tblArmoredSetups].[ArmorOD]', 'SCHEMA', N'dbo', 'TABLE', N'tblArmoredSetups', 'COLUMN', N'ArmorOD'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'test.[tblArmoredSetups].[ArmorUsage]', 'SCHEMA', N'dbo', 'TABLE', N'tblArmoredSetups', 'COLUMN', N'ArmorUsage'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'test.[tblArmoredSetups].[CoreWrap]', 'SCHEMA', N'dbo', 'TABLE', N'tblArmoredSetups', 'COLUMN', N'CoreWrap'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'test.[tblArmoredSetups].[JacketDensity]', 'SCHEMA', N'dbo', 'TABLE', N'tblArmoredSetups', 'COLUMN', N'JacketDensity'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'test.[tblArmoredSetups].[JacketMaterial]', 'SCHEMA', N'dbo', 'TABLE', N'tblArmoredSetups', 'COLUMN', N'JacketMaterial'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'test.[tblArmoredSetups].[JacketType]', 'SCHEMA', N'dbo', 'TABLE', N'tblArmoredSetups', 'COLUMN', N'JacketType'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'test.[tblArmoredSetups].[JacketUsage]', 'SCHEMA', N'dbo', 'TABLE', N'tblArmoredSetups', 'COLUMN', N'JacketUsage'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'test.[tblArmoredSetups].[JackThickness]', 'SCHEMA', N'dbo', 'TABLE', N'tblArmoredSetups', 'COLUMN', N'JackThickness'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'test.[tblArmoredSetups].[MaxCoreOD]', 'SCHEMA', N'dbo', 'TABLE', N'tblArmoredSetups', 'COLUMN', N'MaxCoreOD'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'test.[tblArmoredSetups].[MaxJacketOD]', 'SCHEMA', N'dbo', 'TABLE', N'tblArmoredSetups', 'COLUMN', N'MaxJacketOD'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'test.[tblArmoredSetups].[MinJacketOD]', 'SCHEMA', N'dbo', 'TABLE', N'tblArmoredSetups', 'COLUMN', N'MinJacketOD'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'test.[tblArmoredSetups].[NomJacketOD]', 'SCHEMA', N'dbo', 'TABLE', N'tblArmoredSetups', 'COLUMN', N'NomJacketOD'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'test.[tblArmoredSetups].[NomOD]', 'SCHEMA', N'dbo', 'TABLE', N'tblArmoredSetups', 'COLUMN', N'NomOD'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'test.[tblArmoredSetups].[OracleBase]', 'SCHEMA', N'dbo', 'TABLE', N'tblArmoredSetups', 'COLUMN', N'OracleBase'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'test.[tblArmoredSetups].[StdOp]', 'SCHEMA', N'dbo', 'TABLE', N'tblArmoredSetups', 'COLUMN', N'StdOp'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'test.[tblArmoredSetups].[ArmorID]', 'SCHEMA', N'dbo', 'TABLE', N'tblArmoredSetups', 'INDEX', N'tblArmoredSetups$ArmorID'
GO
