CREATE TABLE [dbo].[tblConfiguratorVersion]
(
[ConfiguratorVersion] [decimal] (18, 4) NOT NULL,
[RevisionReason] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblConfiguratorVersion_CreatedBy] DEFAULT (suser_sname()),
[RevisionDate] [datetime] NULL CONSTRAINT [DF_tblConfiguratorVersion_RevisionDate] DEFAULT (getdate()),
[ID] [int] NOT NULL IDENTITY(1, 1),
[timestamp] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblConfiguratorVersion] ADD CONSTRAINT [PK_tblConfiguratorVersion] PRIMARY KEY CLUSTERED  ([ConfiguratorVersion]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premtbls.[tblConfiguratorVersion]', 'SCHEMA', N'dbo', 'TABLE', N'tblConfiguratorVersion', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premtbls.[tblConfiguratorVersion].[ConfiguratorVersion]', 'SCHEMA', N'dbo', 'TABLE', N'tblConfiguratorVersion', 'COLUMN', N'ConfiguratorVersion'
GO
