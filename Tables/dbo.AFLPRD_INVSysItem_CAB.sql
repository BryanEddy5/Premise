CREATE TABLE [dbo].[AFLPRD_INVSysItem_CAB]
(
[OrganizationCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ItemNumber] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DESCRIPTION] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PrimaryUOMCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TemplateName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CatalogGroupName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LOT_SIZE] [bigint] NULL,
[ItemCopied] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateInserted] [datetime] NULL CONSTRAINT [DF_AFLPRD_INVSysItem_CAB_DateInserted] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AFLPRD_INVSysItem_CAB] ADD CONSTRAINT [PK__AFLPRD_I__C28ACDB66ABEDFA7] PRIMARY KEY CLUSTERED  ([ItemNumber]) ON [PRIMARY]
GO
