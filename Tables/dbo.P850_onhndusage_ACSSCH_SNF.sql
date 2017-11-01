CREATE TABLE [dbo].[P850_onhndusage_ACSSCH_SNF]
(
[Runtime] [datetime] NULL,
[Org] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Item] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Product Class] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Make or Buy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Subinventory] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Frozen Cost] [float] NULL,
[Onhand Qty] [float] NOT NULL,
[SSMA_TimeStamp] [timestamp] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[P850_onhndusage_ACSSCH_SNF] ADD CONSTRAINT [P850_onhndusage_ACSSCH_SNF$PrimaryKey] PRIMARY KEY CLUSTERED  ([Item], [Subinventory], [Onhand Qty]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[P850_onhndusage_ACSSCH_SNF]', 'SCHEMA', N'dbo', 'TABLE', N'P850_onhndusage_ACSSCH_SNF', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[P850_onhndusage_ACSSCH_SNF].[Description]', 'SCHEMA', N'dbo', 'TABLE', N'P850_onhndusage_ACSSCH_SNF', 'COLUMN', N'Description'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[P850_onhndusage_ACSSCH_SNF].[Frozen Cost]', 'SCHEMA', N'dbo', 'TABLE', N'P850_onhndusage_ACSSCH_SNF', 'COLUMN', N'Frozen Cost'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[P850_onhndusage_ACSSCH_SNF].[Item]', 'SCHEMA', N'dbo', 'TABLE', N'P850_onhndusage_ACSSCH_SNF', 'COLUMN', N'Item'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[P850_onhndusage_ACSSCH_SNF].[Make or Buy]', 'SCHEMA', N'dbo', 'TABLE', N'P850_onhndusage_ACSSCH_SNF', 'COLUMN', N'Make or Buy'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[P850_onhndusage_ACSSCH_SNF].[Onhand Qty]', 'SCHEMA', N'dbo', 'TABLE', N'P850_onhndusage_ACSSCH_SNF', 'COLUMN', N'Onhand Qty'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[P850_onhndusage_ACSSCH_SNF].[Org]', 'SCHEMA', N'dbo', 'TABLE', N'P850_onhndusage_ACSSCH_SNF', 'COLUMN', N'Org'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[P850_onhndusage_ACSSCH_SNF].[Product Class]', 'SCHEMA', N'dbo', 'TABLE', N'P850_onhndusage_ACSSCH_SNF', 'COLUMN', N'Product Class'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[P850_onhndusage_ACSSCH_SNF].[Runtime]', 'SCHEMA', N'dbo', 'TABLE', N'P850_onhndusage_ACSSCH_SNF', 'COLUMN', N'Runtime'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[P850_onhndusage_ACSSCH_SNF].[Subinventory]', 'SCHEMA', N'dbo', 'TABLE', N'P850_onhndusage_ACSSCH_SNF', 'COLUMN', N'Subinventory'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[P850_onhndusage_ACSSCH_SNF].[PrimaryKey]', 'SCHEMA', N'dbo', 'TABLE', N'P850_onhndusage_ACSSCH_SNF', 'CONSTRAINT', N'P850_onhndusage_ACSSCH_SNF$PrimaryKey'
GO
