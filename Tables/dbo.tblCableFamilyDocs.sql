CREATE TABLE [dbo].[tblCableFamilyDocs]
(
[FamilyID] [int] NOT NULL,
[Document] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DateCreated] [datetime2] NULL CONSTRAINT [DF_tblCableFamilyDocs_DateCreated] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblCableFamilyDocs_CreatedBy] DEFAULT (suser_sname()),
[CableFamilyDocID] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCableFamilyDocs] ADD CONSTRAINT [PK_tblCableFamilyDocs] PRIMARY KEY CLUSTERED  ([FamilyID], [Document]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCableFamilyDocs] ADD CONSTRAINT [FK_tblCableFamilyDocs_tblCableFamily] FOREIGN KEY ([FamilyID]) REFERENCES [dbo].[tblCableFamily] ([FamilyID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
