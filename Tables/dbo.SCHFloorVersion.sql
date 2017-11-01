CREATE TABLE [dbo].[SCHFloorVersion]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Field1] [float] NULL CONSTRAINT [DF__SCHFloorV__Field__47D18CA4] DEFAULT ((0)),
[SSMA_TimeStamp] [timestamp] NOT NULL,
[Application] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SCHFloorVersion] ADD CONSTRAINT [SCHFloorVersion$PrimaryKey] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[SCHFloorVersion]', 'SCHEMA', N'dbo', 'TABLE', N'SCHFloorVersion', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[SCHFloorVersion].[Field1]', 'SCHEMA', N'dbo', 'TABLE', N'SCHFloorVersion', 'COLUMN', N'Field1'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[SCHFloorVersion].[ID]', 'SCHEMA', N'dbo', 'TABLE', N'SCHFloorVersion', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[SCHFloorVersion].[PrimaryKey]', 'SCHEMA', N'dbo', 'TABLE', N'SCHFloorVersion', 'CONSTRAINT', N'SCHFloorVersion$PrimaryKey'
GO
