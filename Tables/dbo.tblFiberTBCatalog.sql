CREATE TABLE [dbo].[tblFiberTBCatalog]
(
[TBCatalogType] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreationDate] [datetime] NULL CONSTRAINT [DF_tblFiberTBCatalog_CreationDate] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblFiberTBCatalog_CreatedBy] DEFAULT (suser_sname()),
[TimeStamp] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblFiberTBCatalog] ADD CONSTRAINT [PK_tblFiberTBCatalog] PRIMARY KEY CLUSTERED  ([TBCatalogType]) ON [PRIMARY]
GO
