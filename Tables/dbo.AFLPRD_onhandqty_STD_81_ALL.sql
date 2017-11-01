CREATE TABLE [dbo].[AFLPRD_onhandqty_STD_81_ALL]
(
[Org Code] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Sub-inventory] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Material-Account] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Product Group] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Prod Category] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Item] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Item Description] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UOM] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QTY] [int] NOT NULL,
[Cost Type] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Value] [int] NULL,
[Matl Value] [int] NULL,
[OH Value] [int] NOT NULL,
[Res Value] [int] NULL,
[OSP Value] [int] NULL,
[Nettable Flag] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Owning Party] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Number] [int] NOT NULL IDENTITY(1, 1),
[DateInserted] [datetime] NULL CONSTRAINT [DF_AFLPRD_onhandqty_STD_81_ALL_DateInserted] DEFAULT (getdate())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[AFLPRD_onhandqty_STD_81_ALL] ADD CONSTRAINT [pk_AFLPRD_onhandqty_STD_81_ALL] PRIMARY KEY CLUSTERED  ([Number]) ON [PRIMARY]
GO
