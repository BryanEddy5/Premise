CREATE TABLE [dbo].[AFLPRD_acswopattn_CAB_SNF]
(
[Runtime] [datetime] NULL,
[Item] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ItemDesc] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Subinv] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LotNumber] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Locator] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AvailQty] [int] NULL,
[ResevQty] [int] NULL,
[UOM] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FiberItem] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Wavelength] [int] NULL,
[MaxAttn] [decimal] (16, 4) NULL,
[AttnSource] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LOTCreationDate] [datetime] NULL,
[SpecItem] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TestFiberItem] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[DateInserted] [datetime] NULL CONSTRAINT [DF_AFLPRD_acswopattn_CAB_SNF_DateInserted] DEFAULT (getdate())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[AFLPRD_acswopattn_CAB_SNF] ADD CONSTRAINT [PK_AFLPRD_acswopattn_CAB_SNF] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
