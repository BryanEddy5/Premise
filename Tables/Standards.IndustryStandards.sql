CREATE TABLE [Standards].[IndustryStandards]
(
[StandardID] [int] NOT NULL IDENTITY(1, 1),
[Standard] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[StandardDescription] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_IndustryStandards_CreatedBy] DEFAULT (suser_sname()),
[CreationDate] [datetime] NULL CONSTRAINT [DF_IndustryStandards_CreationDate] DEFAULT (getdate()),
[Timestampe] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Standards].[IndustryStandards] ADD CONSTRAINT [PK_IndustryStandards] PRIMARY KEY CLUSTERED  ([Standard]) ON [PRIMARY]
GO
