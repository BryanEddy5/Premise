CREATE TABLE [dbo].[RibbonFgItems]
(
[Ribbon Item] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[RibbonFct] [float] NULL,
[FgItem] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[F5] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSMA_TimeStamp] [timestamp] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RibbonFgItems] ADD CONSTRAINT [RibbonFgItems$PrimaryKey] PRIMARY KEY CLUSTERED  ([Ribbon Item], [FgItem]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[RibbonFgItems]', 'SCHEMA', N'dbo', 'TABLE', N'RibbonFgItems', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[RibbonFgItems].[Description]', 'SCHEMA', N'dbo', 'TABLE', N'RibbonFgItems', 'COLUMN', N'Description'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[RibbonFgItems].[F5]', 'SCHEMA', N'dbo', 'TABLE', N'RibbonFgItems', 'COLUMN', N'F5'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[RibbonFgItems].[FgItem]', 'SCHEMA', N'dbo', 'TABLE', N'RibbonFgItems', 'COLUMN', N'FgItem'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[RibbonFgItems].[Ribbon Item]', 'SCHEMA', N'dbo', 'TABLE', N'RibbonFgItems', 'COLUMN', N'Ribbon Item'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[RibbonFgItems].[RibbonFct]', 'SCHEMA', N'dbo', 'TABLE', N'RibbonFgItems', 'COLUMN', N'RibbonFct'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[RibbonFgItems].[PrimaryKey]', 'SCHEMA', N'dbo', 'TABLE', N'RibbonFgItems', 'CONSTRAINT', N'RibbonFgItems$PrimaryKey'
GO
