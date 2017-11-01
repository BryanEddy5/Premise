CREATE TABLE [dbo].[New Orders Spreadsheet]
(
[Seq No] [varbinary] (510) NULL,
[Sch Date] [datetime] NULL,
[Order #] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Promise Date] [datetime] NULL,
[Stock_UM] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Customer] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Item] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Item Description] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Balance] [float] NULL,
[Units] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Order Qty] [float] NULL,
[Org] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sch] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[User   Ho] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Credit] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[shipprior] [varbinary] (510) NULL,
[Eff Date] [datetime] NULL,
[Order Type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSMA_TimeStamp] [timestamp] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[New Orders Spreadsheet] ADD CONSTRAINT [PK__New Orde__C393DA2E068DD92C] PRIMARY KEY CLUSTERED  ([Order #]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[New Orders Spreadsheet]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Spreadsheet', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[New Orders Spreadsheet].[Balance]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Spreadsheet', 'COLUMN', N'Balance'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[New Orders Spreadsheet].[Credit]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Spreadsheet', 'COLUMN', N'Credit'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[New Orders Spreadsheet].[Customer]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Spreadsheet', 'COLUMN', N'Customer'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[New Orders Spreadsheet].[Eff Date]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Spreadsheet', 'COLUMN', N'Eff Date'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[New Orders Spreadsheet].[Item]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Spreadsheet', 'COLUMN', N'Item'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[New Orders Spreadsheet].[Item Description]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Spreadsheet', 'COLUMN', N'Item Description'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[New Orders Spreadsheet].[Order #]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Spreadsheet', 'COLUMN', N'Order #'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[New Orders Spreadsheet].[Order Qty]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Spreadsheet', 'COLUMN', N'Order Qty'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[New Orders Spreadsheet].[Order Type]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Spreadsheet', 'COLUMN', N'Order Type'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[New Orders Spreadsheet].[Org]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Spreadsheet', 'COLUMN', N'Org'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[New Orders Spreadsheet].[Promise Date]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Spreadsheet', 'COLUMN', N'Promise Date'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[New Orders Spreadsheet].[Sch]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Spreadsheet', 'COLUMN', N'Sch'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[New Orders Spreadsheet].[Sch Date]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Spreadsheet', 'COLUMN', N'Sch Date'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[New Orders Spreadsheet].[Seq No]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Spreadsheet', 'COLUMN', N'Seq No'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[New Orders Spreadsheet].[shipprior]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Spreadsheet', 'COLUMN', N'shipprior'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[New Orders Spreadsheet].[Stock_UM]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Spreadsheet', 'COLUMN', N'Stock_UM'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[New Orders Spreadsheet].[Units]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Spreadsheet', 'COLUMN', N'Units'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[New Orders Spreadsheet].[User   Ho]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders Spreadsheet', 'COLUMN', N'User   Ho'
GO
