CREATE TABLE [dbo].[AFLPRD_INVItmCatg_CAB]
(
[OrganizationCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ItemNumber] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CategorySetName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CategoryName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AllowOverride] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LimitToList] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ItemCopied] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Number] [int] NOT NULL IDENTITY(1, 1),
[DateInserted] [datetime] NULL CONSTRAINT [DF_AFLPRD_INVItmCatg_CAB_DateInserted] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AFLPRD_INVItmCatg_CAB] ADD CONSTRAINT [PK_AFLPRD_INVItmCatg_CAB] PRIMARY KEY CLUSTERED  ([Number]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AFLPRD_INVItmCatg_CAB] ON [dbo].[AFLPRD_INVItmCatg_CAB] ([CategorySetName], [ItemNumber], [CategoryName]) ON [PRIMARY]
GO
