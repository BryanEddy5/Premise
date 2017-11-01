CREATE TABLE [dbo].[RibbonSafetyStock]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[RBNItem] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[design] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TargetQty] [float] NULL,
[F3] [float] NULL,
[SSMA_TimeStamp] [timestamp] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RibbonSafetyStock] ADD CONSTRAINT [RibbonSafetyStock$PrimaryKey] PRIMARY KEY CLUSTERED  ([RBNItem]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RibbonSafetyStock$ID] ON [dbo].[RibbonSafetyStock] ([ID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[RibbonSafetyStock]', 'SCHEMA', N'dbo', 'TABLE', N'RibbonSafetyStock', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[RibbonSafetyStock].[design]', 'SCHEMA', N'dbo', 'TABLE', N'RibbonSafetyStock', 'COLUMN', N'design'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[RibbonSafetyStock].[F3]', 'SCHEMA', N'dbo', 'TABLE', N'RibbonSafetyStock', 'COLUMN', N'F3'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[RibbonSafetyStock].[ID]', 'SCHEMA', N'dbo', 'TABLE', N'RibbonSafetyStock', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[RibbonSafetyStock].[RBNItem]', 'SCHEMA', N'dbo', 'TABLE', N'RibbonSafetyStock', 'COLUMN', N'RBNItem'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[RibbonSafetyStock].[TargetQty]', 'SCHEMA', N'dbo', 'TABLE', N'RibbonSafetyStock', 'COLUMN', N'TargetQty'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[RibbonSafetyStock].[PrimaryKey]', 'SCHEMA', N'dbo', 'TABLE', N'RibbonSafetyStock', 'CONSTRAINT', N'RibbonSafetyStock$PrimaryKey'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[RibbonSafetyStock].[ID]', 'SCHEMA', N'dbo', 'TABLE', N'RibbonSafetyStock', 'INDEX', N'RibbonSafetyStock$ID'
GO
