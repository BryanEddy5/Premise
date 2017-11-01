CREATE TABLE [dbo].[tblItemBuildDescrepancyLogARCHIVE]
(
[ID] [int] NULL,
[DateCreated] [datetime2] NULL CONSTRAINT [DF_tblItemBuildDescrepancyLogARCHIVE_DateCreated] DEFAULT (getdate()),
[Item] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CriticalErrors] [bit] NULL,
[NonCriticalErrors] [bit] NULL,
[DescOfError] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Timestamp] [timestamp] NULL,
[NumberRevisions] [int] NOT NULL CONSTRAINT [DF_tblItemBuildDescrepancyLogARCHIVE_NumberRevisions] DEFAULT ((0)),
[RecordID] [int] NOT NULL IDENTITY(1, 1),
[RecordCreationDate] [datetime] NULL CONSTRAINT [DF_tblItemBuildDescrepancyLogARCHIVE_RecordCreationDate] DEFAULT (getdate()),
[RecordCreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblItemBuildDescrepancyLogARCHIVE_RecoredCreatedBy] DEFAULT (suser_sname()),
[CheckListVersion] [int] NOT NULL CONSTRAINT [DF_tblItemBuildDescrepancyLogARCHIVE_CheckListVersion] DEFAULT ((1)),
[ItemRequest] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblItemBuildDescrepancyLogARCHIVE] ADD CONSTRAINT [PK_tblItemBuildDescrepancyLogARCHIVE] PRIMARY KEY CLUSTERED  ([RecordID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblItemBuildDescrepancyLogARCHIVE] ON [dbo].[tblItemBuildDescrepancyLogARCHIVE] ([ID], [RecordCreatedBy], [Item]) ON [PRIMARY]
GO
