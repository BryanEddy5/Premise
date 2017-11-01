CREATE TABLE [Standards].[CableConstructionStandards]
(
[BaseID] [int] NOT NULL,
[Standard] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_CableConstructionStandards_CreatedBy] DEFAULT (suser_sname()),
[CreationDate] [datetime] NULL CONSTRAINT [DF_CableConstructionStandards_CreationDate] DEFAULT (getdate()),
[Timestamp] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Standards].[CableConstructionStandards] ADD CONSTRAINT [PK_CableConstructionStandards] PRIMARY KEY CLUSTERED  ([BaseID], [Standard]) ON [PRIMARY]
GO
ALTER TABLE [Standards].[CableConstructionStandards] ADD CONSTRAINT [FK_CableConstructionStandards_IndustryStandards] FOREIGN KEY ([Standard]) REFERENCES [Standards].[IndustryStandards] ([Standard]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [Standards].[CableConstructionStandards] ADD CONSTRAINT [FK_CableConstructionStandards_tblCableConstructions] FOREIGN KEY ([BaseID]) REFERENCES [dbo].[tblCableConstructions] ([BaseID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
