CREATE TABLE [dbo].[CustomerOrdersSpecifications_Archive]
(
[Reel No] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Order Qty] [int] NOT NULL,
[Customer] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Co Number] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Item No] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Desgin] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Customer request date] [datetime] NULL,
[Mfg commit date] [datetime] NULL,
[Schedule date] [datetime] NULL,
[Oracle Mfg commit date] [datetime] NULL,
[Oracle Schedule date] [datetime] NULL,
[Prev SS] [int] NULL,
[Units] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Job#] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Line Item] [smallint] NULL,
[Marker] [int] NULL,
[Type Order] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Order Comments] [nvarchar] (225) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Shipped Qty] [int] NULL,
[Freight Charge] [money] NULL,
[Seq NO] [int] NOT NULL IDENTITY(1, 1),
[Creation Date] [datetime] NULL
) ON [PRIMARY]
GO
