CREATE TABLE [DiamondJet].[JobPrint_Archive]
(
[JobNumber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PrintString] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreationDate] [datetime] NULL,
[RevisionDate] [datetime] NULL,
[UniqueID] [uniqueidentifier] NULL,
[ItemNumber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TemplateID] [int] NULL,
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RevisedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VerificationPrint] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ArchiveRecordID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__JobPrint___Archi__5DCC8612] DEFAULT (newid()),
[DateInsertedArchiveRecord] [datetime] NULL CONSTRAINT [DF_JobPrint_Archive_DateInsertedArchiveRecord] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [DiamondJet].[JobPrint_Archive] ADD CONSTRAINT [PK_JobPrint_Archive] PRIMARY KEY CLUSTERED  ([ArchiveRecordID]) ON [PRIMARY]
GO
