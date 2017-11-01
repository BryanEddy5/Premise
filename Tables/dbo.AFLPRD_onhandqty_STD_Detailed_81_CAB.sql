CREATE TABLE [dbo].[AFLPRD_onhandqty_STD_Detailed_81_CAB]
(
[Org Code] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sub-inventory] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Material-Account] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Product Group] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Prod Category] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Item] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Item Description] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Locator] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Lot Number] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UOM] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QTY] [int] NULL,
[Cost Type] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Value] [int] NULL,
[Matl Value] [int] NULL,
[OH Value] [int] NULL,
[Res Value] [int] NULL,
[OSP Value] [int] NULL,
[Nettable Flag] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Owning Party] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[DateInserted] [datetime] NULL CONSTRAINT [DF_AFLPRD_onhandqty_STD_Detailed_81_CAB_DateInserted] DEFAULT (getdate())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[AFLPRD_onhandqty_STD_Detailed_81_CAB] ADD CONSTRAINT [PK__AFLPRD_o__E41286A42A164134] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
