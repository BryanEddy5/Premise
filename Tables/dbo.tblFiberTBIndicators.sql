CREATE TABLE [dbo].[tblFiberTBIndicators]
(
[TBLetter] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TBCatalogType] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreationDate] [datetime] NULL CONSTRAINT [DF_tblFiberTBIndicators_CreationDate] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblFiberTBIndicators_CreatedBy] DEFAULT (suser_sname()),
[TimeStamp] [timestamp] NULL,
[TBCatalogID] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblFiberTBIndicators] ADD CONSTRAINT [PK_tblFiberTBIndicators] PRIMARY KEY CLUSTERED  ([TBLetter], [TBCatalogType]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblFiberTBIndicators] ADD CONSTRAINT [FK_tblFiberTBIndicators_tblFiberTBIndicators] FOREIGN KEY ([TBCatalogType]) REFERENCES [dbo].[tblFiberTBCatalog] ([TBCatalogType]) ON DELETE CASCADE ON UPDATE CASCADE
GO
