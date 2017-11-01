CREATE TABLE [dbo].[AFLPRD_BOMRoutAtc_CAB]
(
[OrganizationCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AssemblyItemNumber] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OperationSeqNumber] [bigint] NULL,
[SeqNumber] [bigint] NULL,
[ShortText] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CopyCount] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ItemCopied] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OrgOpSeq] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Number] [int] NOT NULL IDENTITY(1, 1),
[DateInserted] [datetime] NULL CONSTRAINT [DF_AFLPRD_BOMRoutAtc_CAB_DateInserted] DEFAULT (getdate())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[AFLPRD_BOMRoutAtc_CAB] ADD CONSTRAINT [PK_AFLPRD_BOMRoutAtc_CAB] PRIMARY KEY CLUSTERED  ([Number]) ON [PRIMARY]
GO
