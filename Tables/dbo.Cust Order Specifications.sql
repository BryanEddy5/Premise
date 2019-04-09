CREATE TABLE [dbo].[Cust Order Specifications]
(
[Reel No] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Order Qty] [int] NOT NULL CONSTRAINT [DF__Cust Orde__Order__052FA09F] DEFAULT ((0)),
[Customer] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Co Number] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Item No] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Desgin] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Customer request date] [datetime] NULL,
[Mfg commit date] [datetime] NULL,
[Schedule date] [datetime] NULL,
[Oracle Mfg commit date] [datetime] NULL,
[Oracle Schedule date] [datetime] NULL,
[Prev SS] [int] NULL CONSTRAINT [DF__Cust Orde__Prev __0623C4D8] DEFAULT ((0)),
[Units] [nvarchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Cust Orde__Units__0717E911] DEFAULT ('Meter'),
[Job#] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Line Item] [smallint] NULL,
[Marker] [int] NULL CONSTRAINT [DF__Cust Orde__Marke__080C0D4A] DEFAULT ((0)),
[Type Order] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Order Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Shipped Qty] [int] NULL,
[Freight Charge] [money] NULL CONSTRAINT [DF__Cust Orde__Freig__09003183] DEFAULT ((0)),
[Seq NO] [int] NOT NULL IDENTITY(1, 1),
[Creation Date] [datetime] NULL CONSTRAINT [DF__Cust Orde__Creat__09F455BC] DEFAULT (getdate()),
[OrderId] [int] NULL,
[Stamp] [timestamp] NULL,
[MachineName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cust Order Specifications] ADD CONSTRAINT [SSMA_CC$Cust Order Specifications$Type Order$validation_rule] CHECK (([Type Order]='New' OR [Type Order]='Sset'))
GO
ALTER TABLE [dbo].[Cust Order Specifications] ADD CONSTRAINT [SSMA_CC$Cust Order Specifications$Units$validation_rule] CHECK (([Units]='Meter' OR [Units]='Feet'))
GO
ALTER TABLE [dbo].[Cust Order Specifications] ADD CONSTRAINT [SSMA_CC$Cust Order Specifications$Co Number$disallow_zero_length] CHECK ((len([Co Number])>(0)))
GO
ALTER TABLE [dbo].[Cust Order Specifications] ADD CONSTRAINT [SSMA_CC$Cust Order Specifications$Customer$disallow_zero_length] CHECK ((len([Customer])>(0)))
GO
ALTER TABLE [dbo].[Cust Order Specifications] ADD CONSTRAINT [SSMA_CC$Cust Order Specifications$Desgin$disallow_zero_length] CHECK ((len([Desgin])>(0)))
GO
ALTER TABLE [dbo].[Cust Order Specifications] ADD CONSTRAINT [SSMA_CC$Cust Order Specifications$Item No$disallow_zero_length] CHECK ((len([Item No])>(0)))
GO
ALTER TABLE [dbo].[Cust Order Specifications] ADD CONSTRAINT [SSMA_CC$Cust Order Specifications$Job#$disallow_zero_length] CHECK ((len([Job#])>(0)))
GO
ALTER TABLE [dbo].[Cust Order Specifications] ADD CONSTRAINT [SSMA_CC$Cust Order Specifications$Order Comments$disallow_zero_length] CHECK ((len([Order Comments])>(0)))
GO
ALTER TABLE [dbo].[Cust Order Specifications] ADD CONSTRAINT [SSMA_CC$Cust Order Specifications$Reel No$disallow_zero_length] CHECK ((len([Reel No])>(0)))
GO
ALTER TABLE [dbo].[Cust Order Specifications] ADD CONSTRAINT [SSMA_CC$Cust Order Specifications$Type Order$disallow_zero_length] CHECK ((len([Type Order])>(0)))
GO
ALTER TABLE [dbo].[Cust Order Specifications] ADD CONSTRAINT [SSMA_CC$Cust Order Specifications$Units$disallow_zero_length] CHECK ((len([Units])>(0)))
GO
ALTER TABLE [dbo].[Cust Order Specifications] ADD CONSTRAINT [PK_Cust Order Specifications] PRIMARY KEY CLUSTERED  ([Reel No], [Order Qty]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Cust Order Specifications] ON [dbo].[Cust Order Specifications] ([Item No], [Reel No], [Order Qty], [Co Number], [Desgin], [Mfg commit date], [Freight Charge], [Type Order], [Units]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [CustOrderIXX] ON [dbo].[Cust Order Specifications] ([Order Qty], [Co Number]) INCLUDE ([OrderId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Cust Order Specifications_1] ON [dbo].[Cust Order Specifications] ([Type Order], [Reel No], [Order Qty], [Customer], [Co Number], [Item No], [Mfg commit date], [Units], [Desgin]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cust Order Specifications] ADD CONSTRAINT [FK__Cust Orde__Order__251E189B] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[New Orders (Premise) to Transfer to SS] ([Order ID])
GO
GRANT DELETE ON  [dbo].[Cust Order Specifications] TO [NAA\SPB Premise SQL RO]
GO
GRANT INSERT ON  [dbo].[Cust Order Specifications] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Reel No]) ON [dbo].[Cust Order Specifications] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Order Qty]) ON [dbo].[Cust Order Specifications] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Customer]) ON [dbo].[Cust Order Specifications] TO [NAA\SPB Premise SQL RO]
GO
DENY UPDATE ([Co Number]) ON [dbo].[Cust Order Specifications] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Item No]) ON [dbo].[Cust Order Specifications] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Desgin]) ON [dbo].[Cust Order Specifications] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Customer request date]) ON [dbo].[Cust Order Specifications] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Mfg commit date]) ON [dbo].[Cust Order Specifications] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Schedule date]) ON [dbo].[Cust Order Specifications] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Oracle Mfg commit date]) ON [dbo].[Cust Order Specifications] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Oracle Schedule date]) ON [dbo].[Cust Order Specifications] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Prev SS]) ON [dbo].[Cust Order Specifications] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Units]) ON [dbo].[Cust Order Specifications] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Job#]) ON [dbo].[Cust Order Specifications] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Line Item]) ON [dbo].[Cust Order Specifications] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Marker]) ON [dbo].[Cust Order Specifications] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Type Order]) ON [dbo].[Cust Order Specifications] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Order Comments]) ON [dbo].[Cust Order Specifications] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Shipped Qty]) ON [dbo].[Cust Order Specifications] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Freight Charge]) ON [dbo].[Cust Order Specifications] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Seq NO]) ON [dbo].[Cust Order Specifications] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Creation Date]) ON [dbo].[Cust Order Specifications] TO [NAA\SPB Premise SQL RO]
GO
DENY UPDATE ([Co Number]) ON [dbo].[Cust Order Specifications] TO [SPB Premise SQL RW]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Cust Order Specifications]', 'SCHEMA', N'dbo', 'TABLE', N'Cust Order Specifications', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Cust Order Specifications].[Co Number]', 'SCHEMA', N'dbo', 'TABLE', N'Cust Order Specifications', 'COLUMN', N'Co Number'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Cust Order Specifications].[Creation Date]', 'SCHEMA', N'dbo', 'TABLE', N'Cust Order Specifications', 'COLUMN', N'Creation Date'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Cust Order Specifications].[Customer]', 'SCHEMA', N'dbo', 'TABLE', N'Cust Order Specifications', 'COLUMN', N'Customer'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Cust Order Specifications].[Customer request date]', 'SCHEMA', N'dbo', 'TABLE', N'Cust Order Specifications', 'COLUMN', N'Customer request date'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Cust Order Specifications].[Desgin]', 'SCHEMA', N'dbo', 'TABLE', N'Cust Order Specifications', 'COLUMN', N'Desgin'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Cust Order Specifications].[Freight Charge]', 'SCHEMA', N'dbo', 'TABLE', N'Cust Order Specifications', 'COLUMN', N'Freight Charge'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Cust Order Specifications].[Item No]', 'SCHEMA', N'dbo', 'TABLE', N'Cust Order Specifications', 'COLUMN', N'Item No'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Cust Order Specifications].[Job#]', 'SCHEMA', N'dbo', 'TABLE', N'Cust Order Specifications', 'COLUMN', N'Job#'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Cust Order Specifications].[Line Item]', 'SCHEMA', N'dbo', 'TABLE', N'Cust Order Specifications', 'COLUMN', N'Line Item'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Cust Order Specifications].[Marker]', 'SCHEMA', N'dbo', 'TABLE', N'Cust Order Specifications', 'COLUMN', N'Marker'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Cust Order Specifications].[Mfg commit date]', 'SCHEMA', N'dbo', 'TABLE', N'Cust Order Specifications', 'COLUMN', N'Mfg commit date'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Cust Order Specifications].[Oracle Mfg commit date]', 'SCHEMA', N'dbo', 'TABLE', N'Cust Order Specifications', 'COLUMN', N'Oracle Mfg commit date'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Cust Order Specifications].[Oracle Schedule date]', 'SCHEMA', N'dbo', 'TABLE', N'Cust Order Specifications', 'COLUMN', N'Oracle Schedule date'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Cust Order Specifications].[Order Comments]', 'SCHEMA', N'dbo', 'TABLE', N'Cust Order Specifications', 'COLUMN', N'Order Comments'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Cust Order Specifications].[Order Qty]', 'SCHEMA', N'dbo', 'TABLE', N'Cust Order Specifications', 'COLUMN', N'Order Qty'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Cust Order Specifications].[Prev SS]', 'SCHEMA', N'dbo', 'TABLE', N'Cust Order Specifications', 'COLUMN', N'Prev SS'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Cust Order Specifications].[Reel No]', 'SCHEMA', N'dbo', 'TABLE', N'Cust Order Specifications', 'COLUMN', N'Reel No'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Cust Order Specifications].[Schedule date]', 'SCHEMA', N'dbo', 'TABLE', N'Cust Order Specifications', 'COLUMN', N'Schedule date'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Cust Order Specifications].[Seq NO]', 'SCHEMA', N'dbo', 'TABLE', N'Cust Order Specifications', 'COLUMN', N'Seq NO'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Cust Order Specifications].[Shipped Qty]', 'SCHEMA', N'dbo', 'TABLE', N'Cust Order Specifications', 'COLUMN', N'Shipped Qty'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Cust Order Specifications].[Type Order]', 'SCHEMA', N'dbo', 'TABLE', N'Cust Order Specifications', 'COLUMN', N'Type Order'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Cust Order Specifications].[Units]', 'SCHEMA', N'dbo', 'TABLE', N'Cust Order Specifications', 'COLUMN', N'Units'
GO
EXEC sp_addextendedproperty N'MS_Description', N'[SSMA_CC$Cust Order Specifications$Type Order$validation_rule]', 'SCHEMA', N'dbo', 'TABLE', N'Cust Order Specifications', 'CONSTRAINT', N'SSMA_CC$Cust Order Specifications$Type Order$validation_rule'
GO
