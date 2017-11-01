CREATE TABLE [dbo].[Open Order - with Revenue]
(
[Sch Date] [datetime] NULL,
[Order#] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Item] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Customer Name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Units] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Order Qty] [float] NULL,
[Shipped Qty] [float] NULL,
[Bal Qty] [float] NULL,
[Revenue Shipped] [float] NULL,
[Revenue Due] [float] NULL,
[Eff Date] [datetime] NULL,
[SSMA_TimeStamp] [timestamp] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Open Order - with Revenue] ADD CONSTRAINT [Open Order - with Revenue$PrimaryKey] PRIMARY KEY CLUSTERED  ([Order#]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Open Order - with Revenue]', 'SCHEMA', N'dbo', 'TABLE', N'Open Order - with Revenue', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Open Order - with Revenue].[Bal Qty]', 'SCHEMA', N'dbo', 'TABLE', N'Open Order - with Revenue', 'COLUMN', N'Bal Qty'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Open Order - with Revenue].[Customer Name]', 'SCHEMA', N'dbo', 'TABLE', N'Open Order - with Revenue', 'COLUMN', N'Customer Name'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Open Order - with Revenue].[Eff Date]', 'SCHEMA', N'dbo', 'TABLE', N'Open Order - with Revenue', 'COLUMN', N'Eff Date'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Open Order - with Revenue].[Item]', 'SCHEMA', N'dbo', 'TABLE', N'Open Order - with Revenue', 'COLUMN', N'Item'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Open Order - with Revenue].[Order Qty]', 'SCHEMA', N'dbo', 'TABLE', N'Open Order - with Revenue', 'COLUMN', N'Order Qty'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Open Order - with Revenue].[Order#]', 'SCHEMA', N'dbo', 'TABLE', N'Open Order - with Revenue', 'COLUMN', N'Order#'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Open Order - with Revenue].[Revenue Due]', 'SCHEMA', N'dbo', 'TABLE', N'Open Order - with Revenue', 'COLUMN', N'Revenue Due'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Open Order - with Revenue].[Revenue Shipped]', 'SCHEMA', N'dbo', 'TABLE', N'Open Order - with Revenue', 'COLUMN', N'Revenue Shipped'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Open Order - with Revenue].[Sch Date]', 'SCHEMA', N'dbo', 'TABLE', N'Open Order - with Revenue', 'COLUMN', N'Sch Date'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Open Order - with Revenue].[Shipped Qty]', 'SCHEMA', N'dbo', 'TABLE', N'Open Order - with Revenue', 'COLUMN', N'Shipped Qty'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Open Order - with Revenue].[Units]', 'SCHEMA', N'dbo', 'TABLE', N'Open Order - with Revenue', 'COLUMN', N'Units'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Open Order - with Revenue].[PrimaryKey]', 'SCHEMA', N'dbo', 'TABLE', N'Open Order - with Revenue', 'CONSTRAINT', N'Open Order - with Revenue$PrimaryKey'
GO
