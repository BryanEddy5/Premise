CREATE TABLE [dbo].[MTD Shipments - Temp]
(
[Name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Number] [float] NULL,
[Item] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Date] [datetime] NULL,
[Carrier] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Number1] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Shipped] [int] NULL CONSTRAINT [DF__MTD Shipm__Shipp__3B6BB5BF] DEFAULT ((0)),
[UOM] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Price] [float] NULL,
[Value] [float] NULL,
[FCT] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[F_Meters] [int] NULL,
[F_Type] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Design] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Product Cat] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSMA_TimeStamp] [timestamp] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MTD Shipments - Temp] ADD CONSTRAINT [SSMA_CC$MTD Shipments - Temp$Carrier$disallow_zero_length] CHECK ((len([Carrier])>(0)))
GO
ALTER TABLE [dbo].[MTD Shipments - Temp] ADD CONSTRAINT [SSMA_CC$MTD Shipments - Temp$Design$disallow_zero_length] CHECK ((len([Design])>(0)))
GO
ALTER TABLE [dbo].[MTD Shipments - Temp] ADD CONSTRAINT [SSMA_CC$MTD Shipments - Temp$F_Type$disallow_zero_length] CHECK ((len([F_Type])>(0)))
GO
ALTER TABLE [dbo].[MTD Shipments - Temp] ADD CONSTRAINT [SSMA_CC$MTD Shipments - Temp$FCT$disallow_zero_length] CHECK ((len([FCT])>(0)))
GO
ALTER TABLE [dbo].[MTD Shipments - Temp] ADD CONSTRAINT [SSMA_CC$MTD Shipments - Temp$Item$disallow_zero_length] CHECK ((len([Item])>(0)))
GO
ALTER TABLE [dbo].[MTD Shipments - Temp] ADD CONSTRAINT [SSMA_CC$MTD Shipments - Temp$Name$disallow_zero_length] CHECK ((len([Name])>(0)))
GO
ALTER TABLE [dbo].[MTD Shipments - Temp] ADD CONSTRAINT [SSMA_CC$MTD Shipments - Temp$Number1$disallow_zero_length] CHECK ((len([Number1])>(0)))
GO
ALTER TABLE [dbo].[MTD Shipments - Temp] ADD CONSTRAINT [SSMA_CC$MTD Shipments - Temp$Product Cat$disallow_zero_length] CHECK ((len([Product Cat])>(0)))
GO
ALTER TABLE [dbo].[MTD Shipments - Temp] ADD CONSTRAINT [SSMA_CC$MTD Shipments - Temp$UOM$disallow_zero_length] CHECK ((len([UOM])>(0)))
GO
CREATE NONCLUSTERED INDEX [MTD Shipments - Temp$Number] ON [dbo].[MTD Shipments - Temp] ([Number]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [MTD Shipments - Temp$Number1] ON [dbo].[MTD Shipments - Temp] ([Number1]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[MTD Shipments - Temp]', 'SCHEMA', N'dbo', 'TABLE', N'MTD Shipments - Temp', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[MTD Shipments - Temp].[Carrier]', 'SCHEMA', N'dbo', 'TABLE', N'MTD Shipments - Temp', 'COLUMN', N'Carrier'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[MTD Shipments - Temp].[Date]', 'SCHEMA', N'dbo', 'TABLE', N'MTD Shipments - Temp', 'COLUMN', N'Date'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[MTD Shipments - Temp].[Design]', 'SCHEMA', N'dbo', 'TABLE', N'MTD Shipments - Temp', 'COLUMN', N'Design'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[MTD Shipments - Temp].[F_Meters]', 'SCHEMA', N'dbo', 'TABLE', N'MTD Shipments - Temp', 'COLUMN', N'F_Meters'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[MTD Shipments - Temp].[F_Type]', 'SCHEMA', N'dbo', 'TABLE', N'MTD Shipments - Temp', 'COLUMN', N'F_Type'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[MTD Shipments - Temp].[FCT]', 'SCHEMA', N'dbo', 'TABLE', N'MTD Shipments - Temp', 'COLUMN', N'FCT'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[MTD Shipments - Temp].[Item]', 'SCHEMA', N'dbo', 'TABLE', N'MTD Shipments - Temp', 'COLUMN', N'Item'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[MTD Shipments - Temp].[Name]', 'SCHEMA', N'dbo', 'TABLE', N'MTD Shipments - Temp', 'COLUMN', N'Name'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[MTD Shipments - Temp].[Number]', 'SCHEMA', N'dbo', 'TABLE', N'MTD Shipments - Temp', 'COLUMN', N'Number'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[MTD Shipments - Temp].[Number1]', 'SCHEMA', N'dbo', 'TABLE', N'MTD Shipments - Temp', 'COLUMN', N'Number1'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[MTD Shipments - Temp].[Price]', 'SCHEMA', N'dbo', 'TABLE', N'MTD Shipments - Temp', 'COLUMN', N'Price'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[MTD Shipments - Temp].[Product Cat]', 'SCHEMA', N'dbo', 'TABLE', N'MTD Shipments - Temp', 'COLUMN', N'Product Cat'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[MTD Shipments - Temp].[Shipped]', 'SCHEMA', N'dbo', 'TABLE', N'MTD Shipments - Temp', 'COLUMN', N'Shipped'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[MTD Shipments - Temp].[UOM]', 'SCHEMA', N'dbo', 'TABLE', N'MTD Shipments - Temp', 'COLUMN', N'UOM'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[MTD Shipments - Temp].[Value]', 'SCHEMA', N'dbo', 'TABLE', N'MTD Shipments - Temp', 'COLUMN', N'Value'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[MTD Shipments - Temp].[Number]', 'SCHEMA', N'dbo', 'TABLE', N'MTD Shipments - Temp', 'INDEX', N'MTD Shipments - Temp$Number'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[MTD Shipments - Temp].[Number1]', 'SCHEMA', N'dbo', 'TABLE', N'MTD Shipments - Temp', 'INDEX', N'MTD Shipments - Temp$Number1'
GO
