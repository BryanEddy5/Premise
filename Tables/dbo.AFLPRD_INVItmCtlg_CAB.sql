CREATE TABLE [dbo].[AFLPRD_INVItmCtlg_CAB]
(
[Item] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ElementName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ElementValue] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AllowOverride] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ItemCopied] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateInserted] [datetime] NULL CONSTRAINT [DF_AFLPRD_INVItmCtlg_CAB_DateInserted] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AFLPRD_INVItmCtlg_CAB] ADD CONSTRAINT [PK__AFLPRD_I__0A29360CD5091F1E] PRIMARY KEY CLUSTERED  ([Item], [ElementName]) ON [PRIMARY]
GO
