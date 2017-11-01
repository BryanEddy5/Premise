CREATE TABLE [dbo].[NewOrderPremisetTransfetoSS_Archive]
(
[Order ID] [int] NOT NULL IDENTITY(1, 1),
[Customer] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Co number] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Line item] [float] NULL,
[Item number] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Reel number] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Length] [float] NULL,
[Price per unit] [money] NULL,
[Billable tolerance] [float] NULL,
[Mfg commit date] [datetime] NULL,
[Schedule date] [datetime] NULL,
[Comments] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Cust PO #] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Cust Part #] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Stock] [int] NULL,
[SSR] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Business] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Entry Date] [datetime] NULL,
[Transfer Date] [datetime] NULL,
[Do you want to transfer] [int] NULL,
[Transferred] [int] NULL,
[Request Date] [datetime] NULL,
[Oracle Part No] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Buff Line] [tinyint] NULL,
[Transferred Commit Date] [datetime] NULL,
[Units] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Intial Import Date] [datetime] NULL,
[OrderType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSMA_TimeStamp] [timestamp] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
GRANT INSERT ON  [dbo].[NewOrderPremisetTransfetoSS_Archive] TO [NAA\SPB Premise SQL RO]
GO
GRANT DELETE ON  [dbo].[NewOrderPremisetTransfetoSS_Archive] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ON  [dbo].[NewOrderPremisetTransfetoSS_Archive] TO [NAA\SPB Premise SQL RO]
GO
