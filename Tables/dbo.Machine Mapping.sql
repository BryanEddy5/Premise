CREATE TABLE [dbo].[Machine Mapping]
(
[Existing Macine] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Machine] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Machine Mapping] ADD CONSTRAINT [Machine Mapping$PrimaryKey] PRIMARY KEY CLUSTERED  ([Existing Macine]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Machine Mapping]', 'SCHEMA', N'dbo', 'TABLE', N'Machine Mapping', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Machine Mapping].[Existing Macine]', 'SCHEMA', N'dbo', 'TABLE', N'Machine Mapping', 'COLUMN', N'Existing Macine'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Machine Mapping].[Machine]', 'SCHEMA', N'dbo', 'TABLE', N'Machine Mapping', 'COLUMN', N'Machine'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Machine Mapping].[PrimaryKey]', 'SCHEMA', N'dbo', 'TABLE', N'Machine Mapping', 'CONSTRAINT', N'Machine Mapping$PrimaryKey'
GO
