CREATE TABLE [dbo].[AFLPRD_BOMOpRes_CAB]
(
[OrganizationCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AssemblyItemNumber] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AlternateRoutingDesignator] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OperationSequenceNumber] [bigint] NULL,
[ResourceSeqNumber] [bigint] NULL,
[ResourceCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EffectivityDate] [date] NULL,
[StandardRateFlag] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AssignedUnits] [bigint] NULL,
[UsageRateOrAmount] [numeric] (18, 10) NULL,
[UsageRateOrAmountInverse] [numeric] (18, 10) NULL,
[BasisType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ScheduleFlag] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AutoChargeType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProcessFlag] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TransactionType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CopyCount] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ItemCopied] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OrgOpSeq] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Number] [int] NOT NULL IDENTITY(1, 1),
[DateInserted] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AFLPRD_BOMOpRes_CAB] ADD CONSTRAINT [PK_AFLPRD_BOMOpRes_CAB] PRIMARY KEY CLUSTERED  ([Number]) ON [PRIMARY]
GO
