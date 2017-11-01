CREATE TABLE [dbo].[New Orders Rel 11]
(
[ScheduleDate] [datetime] NULL,
[OrderDate] [datetime] NULL,
[Order] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Customer] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Item] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Bal] [float] NOT NULL,
[RequestDate] [datetime] NULL,
[PromiseDate    ] [datetime] NULL,
[Design Code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Transfer Date] [datetime] NULL,
[Transferred] [smallint] NULL CONSTRAINT [DF__New Order__Trans__44F51FF9] DEFAULT ((0)),
[Units] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OrderType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSMA_TimeStamp] [timestamp] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[New Orders Rel 11] ADD CONSTRAINT [SSMA_CC$New Orders Rel 11$Customer$disallow_zero_length] CHECK ((len([Customer])>(0)))
GO
ALTER TABLE [dbo].[New Orders Rel 11] ADD CONSTRAINT [SSMA_CC$New Orders Rel 11$Design Code$disallow_zero_length] CHECK ((len([Design Code])>(0)))
GO
ALTER TABLE [dbo].[New Orders Rel 11] ADD CONSTRAINT [SSMA_CC$New Orders Rel 11$Item$disallow_zero_length] CHECK ((len([Item])>(0)))
GO
ALTER TABLE [dbo].[New Orders Rel 11] ADD CONSTRAINT [SSMA_CC$New Orders Rel 11$Order$disallow_zero_length] CHECK ((len([Order])>(0)))
GO
ALTER TABLE [dbo].[New Orders Rel 11] ADD CONSTRAINT [SSMA_CC$New Orders Rel 11$Units$disallow_zero_length] CHECK ((len([Units])>(0)))
GO
ALTER TABLE [dbo].[New Orders Rel 11] ADD CONSTRAINT [New Orders Rel 11$PrimaryKey] PRIMARY KEY CLUSTERED  ([Order], [Bal]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [New Orders Rel 11$Design Code] ON [dbo].[New Orders Rel 11] ([Design Code]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders Rel 11]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Rel 11', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders Rel 11].[Bal]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Rel 11', 'COLUMN', N'Bal'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders Rel 11].[Customer]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Rel 11', 'COLUMN', N'Customer'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders Rel 11].[Design Code]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Rel 11', 'COLUMN', N'Design Code'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders Rel 11].[Item]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Rel 11', 'COLUMN', N'Item'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders Rel 11].[Order]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Rel 11', 'COLUMN', N'Order'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders Rel 11].[OrderDate]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Rel 11', 'COLUMN', N'OrderDate'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders Rel 11].[OrderType]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Rel 11', 'COLUMN', N'OrderType'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders Rel 11].[PromiseDate    ]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Rel 11', 'COLUMN', N'PromiseDate    '
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders Rel 11].[RequestDate]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Rel 11', 'COLUMN', N'RequestDate'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders Rel 11].[ScheduleDate]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Rel 11', 'COLUMN', N'ScheduleDate'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders Rel 11].[Transfer Date]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Rel 11', 'COLUMN', N'Transfer Date'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders Rel 11].[Transferred]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Rel 11', 'COLUMN', N'Transferred'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders Rel 11].[Units]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Rel 11', 'COLUMN', N'Units'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders Rel 11].[PrimaryKey]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Rel 11', 'CONSTRAINT', N'New Orders Rel 11$PrimaryKey'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders Rel 11].[Design Code]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Rel 11', 'INDEX', N'New Orders Rel 11$Design Code'
GO
