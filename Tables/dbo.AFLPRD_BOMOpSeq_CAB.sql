CREATE TABLE [dbo].[AFLPRD_BOMOpSeq_CAB]
(
[OrganizationCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AssemblyItemNumber] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OperationSeqNum] [int] NULL,
[AlternateRoutingDesignator] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OperationCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DepartmentCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EffectivityDate] [date] NULL,
[OperationDescription] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StartupScrap] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShortText] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CopyCount] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ItemCopied] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OrgOpSeq] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Number] [int] NOT NULL IDENTITY(1, 1),
[DateInserted] [datetime] NULL CONSTRAINT [DF_AFLPRD_BOMOpSeq_CAB_DateInserted] DEFAULT (getdate()),
[SendtoAps] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TrueOperationCode] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DummySeq] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[AFLPRD_BOMOpSeq_CAB] ADD CONSTRAINT [PK_AFLPRD_BOMOpSeq_CAB] PRIMARY KEY CLUSTERED  ([Number]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AFLPRD_BOMOpSeq_CAB] ON [dbo].[AFLPRD_BOMOpSeq_CAB] ([AssemblyItemNumber]) ON [PRIMARY]
GO
