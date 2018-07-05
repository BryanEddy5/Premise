CREATE TABLE [DiamondJet].[MarkingIntervals]
(
[MarkingInterval] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MarkingIntervalID] [int] NOT NULL IDENTITY(1, 1),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_MarkingUom_CreatedBy] DEFAULT (suser_sname()),
[DateCreated] [datetime] NULL CONSTRAINT [DF_MarkingUom_DateCreated] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [DiamondJet].[MarkingIntervals] ADD CONSTRAINT [PK_MarkingUom] PRIMARY KEY CLUSTERED  ([MarkingIntervalID]) ON [PRIMARY]
GO
ALTER TABLE [DiamondJet].[MarkingIntervals] ADD CONSTRAINT [IX_MarkingUom] UNIQUE NONCLUSTERED  ([MarkingInterval]) ON [PRIMARY]
GO
