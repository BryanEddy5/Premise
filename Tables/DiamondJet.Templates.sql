CREATE TABLE [DiamondJet].[Templates]
(
[Template] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TemplateID] [int] NOT NULL IDENTITY(1, 1),
[DateCreated] [datetime] NULL CONSTRAINT [DF_Templates_DateCreated] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_Templates_CreatedBy] DEFAULT (suser_sname()),
[TemplateDescription] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MinOD] [decimal] (10, 5) NULL,
[MarkingIntervalID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [DiamondJet].[Templates] ADD CONSTRAINT [PK_Templates] PRIMARY KEY CLUSTERED  ([TemplateID]) ON [PRIMARY]
GO
ALTER TABLE [DiamondJet].[Templates] ADD CONSTRAINT [FK_Templates_MarkingUom] FOREIGN KEY ([MarkingIntervalID]) REFERENCES [DiamondJet].[MarkingIntervals] ([MarkingIntervalID]) ON UPDATE CASCADE
GO
