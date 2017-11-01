CREATE TABLE [dbo].[AFLPRD_BOMRoutSub_CAB]
(
[OrganizationCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AssemblyItemNumber] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CompletionSubinventory] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CommonItemNumber] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AlternateRoutingDesignator] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ItemCopied] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LocationName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Number] [int] NOT NULL IDENTITY(1, 1),
[DateInserted] [datetime] NULL CONSTRAINT [DF_AFLPRD_BOMRoutSub_CAB_DateInserted] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AFLPRD_BOMRoutSub_CAB] ADD CONSTRAINT [PK_AFLPRD_BOMRoutSub_CAB] PRIMARY KEY CLUSTERED  ([Number]) ON [PRIMARY]
GO
