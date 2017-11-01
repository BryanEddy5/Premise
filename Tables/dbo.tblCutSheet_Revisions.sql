CREATE TABLE [dbo].[tblCutSheet_Revisions]
(
[Version] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[RevisionReason] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblCutSheet_Revisions_CreatedBy] DEFAULT (suser_sname()),
[CreationDate] [datetime] NULL CONSTRAINT [DF_tblCutSheet_Revisions_CreationDate] DEFAULT (getdate()),
[Timestampe] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCutSheet_Revisions] ADD CONSTRAINT [PK_tblCutSheet_Revisions] PRIMARY KEY CLUSTERED  ([Version]) ON [PRIMARY]
GO
