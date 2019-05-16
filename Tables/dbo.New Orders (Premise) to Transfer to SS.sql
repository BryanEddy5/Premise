CREATE TABLE [dbo].[New Orders (Premise) to Transfer to SS]
(
[Order ID] [int] NOT NULL IDENTITY(1, 1),
[Customer] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Co number] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Line item] [float] NULL CONSTRAINT [DF__New Order__Line __6BC4D457] DEFAULT ((0)),
[Item number] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Reel number] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Length] [int] NOT NULL,
[Price per unit] [money] NULL,
[Billable tolerance] [float] NULL,
[Mfg commit date] [datetime] NULL,
[Schedule date] [datetime] NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Cust PO #] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Cust Part #] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Stock] [int] NULL CONSTRAINT [DF__New Order__Stock__6CB8F890] DEFAULT ((0)),
[SSR] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__New Orders __SSR__6DAD1CC9] DEFAULT ('X'),
[Business] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__New Order__Busin__6EA14102] DEFAULT ((15)),
[Entry Date] [datetime] NULL,
[Transfer Date] [datetime] NULL,
[Do you want to transfer] [int] NULL CONSTRAINT [DF__New Order__Do yo__6F95653B] DEFAULT ((0)),
[Transferred] [int] NULL CONSTRAINT [DF__New Order__Trans__70898974] DEFAULT ((0)),
[Request Date] [datetime] NULL,
[Oracle Part No] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Buff Line] [tinyint] NULL CONSTRAINT [DF__New Order__Buff __717DADAD] DEFAULT ((9)),
[Transferred Commit Date] [datetime] NULL,
[Units] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__New Order__Units__7271D1E6] DEFAULT ('Meter'),
[Intial Import Date] [datetime] NULL CONSTRAINT [DF__New Order__Intia__7365F61F] DEFAULT (getdate()),
[OrderType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSMA_TimeStamp] [timestamp] NOT NULL,
[Cabler] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[New Orders (Premise) to Transfer to SS] ADD CONSTRAINT [SSMA_CC$New Orders (Premise) to Transfer to SS$Units$validation_rule] CHECK (([Units]='Meter' OR [Units]='Feet'))
GO
ALTER TABLE [dbo].[New Orders (Premise) to Transfer to SS] ADD CONSTRAINT [SSMA_CC$New Orders (Premise) to Transfer to SS$Business$disallow_zero_length] CHECK ((len([Business])>(0)))
GO
ALTER TABLE [dbo].[New Orders (Premise) to Transfer to SS] ADD CONSTRAINT [SSMA_CC$New Orders (Premise) to Transfer to SS$Co number$disallow_zero_length] CHECK ((len([Co number])>(0)))
GO
ALTER TABLE [dbo].[New Orders (Premise) to Transfer to SS] ADD CONSTRAINT [SSMA_CC$New Orders (Premise) to Transfer to SS$Comments$disallow_zero_length] CHECK ((len([Comments])>(0)))
GO
ALTER TABLE [dbo].[New Orders (Premise) to Transfer to SS] ADD CONSTRAINT [SSMA_CC$New Orders (Premise) to Transfer to SS$Cust Part #$disallow_zero_length] CHECK ((len([Cust Part #])>(0)))
GO
ALTER TABLE [dbo].[New Orders (Premise) to Transfer to SS] ADD CONSTRAINT [SSMA_CC$New Orders (Premise) to Transfer to SS$Cust PO #$disallow_zero_length] CHECK ((len([Cust PO #])>(0)))
GO
ALTER TABLE [dbo].[New Orders (Premise) to Transfer to SS] ADD CONSTRAINT [SSMA_CC$New Orders (Premise) to Transfer to SS$Customer$disallow_zero_length] CHECK ((len([Customer])>(0)))
GO
ALTER TABLE [dbo].[New Orders (Premise) to Transfer to SS] ADD CONSTRAINT [SSMA_CC$New Orders (Premise) to Transfer to SS$Item number$disallow_zero_length] CHECK ((len([Item number])>(0)))
GO
ALTER TABLE [dbo].[New Orders (Premise) to Transfer to SS] ADD CONSTRAINT [SSMA_CC$New Orders (Premise) to Transfer to SS$Oracle Part No$disallow_zero_length] CHECK ((len([Oracle Part No])>(0)))
GO
ALTER TABLE [dbo].[New Orders (Premise) to Transfer to SS] ADD CONSTRAINT [SSMA_CC$New Orders (Premise) to Transfer to SS$Reel number$disallow_zero_length] CHECK ((len([Reel number])>(0)))
GO
ALTER TABLE [dbo].[New Orders (Premise) to Transfer to SS] ADD CONSTRAINT [SSMA_CC$New Orders (Premise) to Transfer to SS$SSR$disallow_zero_length] CHECK ((len([SSR])>(0)))
GO
ALTER TABLE [dbo].[New Orders (Premise) to Transfer to SS] ADD CONSTRAINT [SSMA_CC$New Orders (Premise) to Transfer to SS$Units$disallow_zero_length] CHECK ((len([Units])>(0)))
GO
ALTER TABLE [dbo].[New Orders (Premise) to Transfer to SS] ADD CONSTRAINT [PK_New Orders (Premise) to Transfer to SS] PRIMARY KEY CLUSTERED  ([Order ID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders (Premise) to Transfer to SS]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders (Premise) to Transfer to SS', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders (Premise) to Transfer to SS].[Billable tolerance]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders (Premise) to Transfer to SS', 'COLUMN', N'Billable tolerance'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders (Premise) to Transfer to SS].[Buff Line]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders (Premise) to Transfer to SS', 'COLUMN', N'Buff Line'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders (Premise) to Transfer to SS].[Business]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders (Premise) to Transfer to SS', 'COLUMN', N'Business'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders (Premise) to Transfer to SS].[Co number]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders (Premise) to Transfer to SS', 'COLUMN', N'Co number'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders (Premise) to Transfer to SS].[Comments]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders (Premise) to Transfer to SS', 'COLUMN', N'Comments'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders (Premise) to Transfer to SS].[Cust Part #]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders (Premise) to Transfer to SS', 'COLUMN', N'Cust Part #'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders (Premise) to Transfer to SS].[Cust PO #]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders (Premise) to Transfer to SS', 'COLUMN', N'Cust PO #'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders (Premise) to Transfer to SS].[Customer]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders (Premise) to Transfer to SS', 'COLUMN', N'Customer'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders (Premise) to Transfer to SS].[Do you want to transfer]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders (Premise) to Transfer to SS', 'COLUMN', N'Do you want to transfer'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders (Premise) to Transfer to SS].[Entry Date]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders (Premise) to Transfer to SS', 'COLUMN', N'Entry Date'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders (Premise) to Transfer to SS].[Intial Import Date]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders (Premise) to Transfer to SS', 'COLUMN', N'Intial Import Date'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders (Premise) to Transfer to SS].[Item number]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders (Premise) to Transfer to SS', 'COLUMN', N'Item number'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders (Premise) to Transfer to SS].[Length]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders (Premise) to Transfer to SS', 'COLUMN', N'Length'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders (Premise) to Transfer to SS].[Line item]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders (Premise) to Transfer to SS', 'COLUMN', N'Line item'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders (Premise) to Transfer to SS].[Mfg commit date]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders (Premise) to Transfer to SS', 'COLUMN', N'Mfg commit date'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders (Premise) to Transfer to SS].[Oracle Part No]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders (Premise) to Transfer to SS', 'COLUMN', N'Oracle Part No'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders (Premise) to Transfer to SS].[Order ID]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders (Premise) to Transfer to SS', 'COLUMN', N'Order ID'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders (Premise) to Transfer to SS].[OrderType]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders (Premise) to Transfer to SS', 'COLUMN', N'OrderType'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders (Premise) to Transfer to SS].[Price per unit]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders (Premise) to Transfer to SS', 'COLUMN', N'Price per unit'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders (Premise) to Transfer to SS].[Reel number]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders (Premise) to Transfer to SS', 'COLUMN', N'Reel number'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders (Premise) to Transfer to SS].[Request Date]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders (Premise) to Transfer to SS', 'COLUMN', N'Request Date'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders (Premise) to Transfer to SS].[Schedule date]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders (Premise) to Transfer to SS', 'COLUMN', N'Schedule date'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders (Premise) to Transfer to SS].[SSR]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders (Premise) to Transfer to SS', 'COLUMN', N'SSR'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders (Premise) to Transfer to SS].[Stock]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders (Premise) to Transfer to SS', 'COLUMN', N'Stock'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders (Premise) to Transfer to SS].[Transfer Date]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders (Premise) to Transfer to SS', 'COLUMN', N'Transfer Date'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders (Premise) to Transfer to SS].[Transferred]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders (Premise) to Transfer to SS', 'COLUMN', N'Transferred'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders (Premise) to Transfer to SS].[Transferred Commit Date]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders (Premise) to Transfer to SS', 'COLUMN', N'Transferred Commit Date'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[New Orders (Premise) to Transfer to SS].[Units]', 'SCHEMA', N'dbo', 'TABLE', N'New Orders (Premise) to Transfer to SS', 'COLUMN', N'Units'
GO
