CREATE TABLE [dbo].[tblBurnListingDocument]
(
[ListingDocument] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ListingCompany] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateRecordCreated] [datetime] NULL CONSTRAINT [DF_tblBurnListingDocuments_DateRecordCreated] DEFAULT (getdate()),
[RecordCreatedby] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblBurnListingDocuments_RecordCreatedby] DEFAULT (suser_sname()),
[RevisionDate] [datetime] NULL CONSTRAINT [DF_tblBurnListingDocument_RevisionDate] DEFAULT (getdate()),
[RevisedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblBurnListingDocument_RevisedBy] DEFAULT (suser_sname()),
[Timestamp] [timestamp] NULL,
[DefaultFileNumberID] [int] NULL,
[DocumentID] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






CREATE TRIGGER [dbo].[BurnListingDocumentUpdateTrg] ON [dbo].[tblBurnListingDocument]
AFTER INSERT, UPDATE 
AS
	BEGIN 
		IF NOT (UPDATE(RevisionDate))
		--IF NOT (SELECT convert(date,[DateRecordCreated]) FROM DELETED) = convert(date,getdate())
			BEGIN
			  UPDATE t
			  SET t.RevisionDate = GETDATE(),
			  t.RevisedBy = (SUSER_SNAME())
			  FROM dbo.tblBurnListingDocument as t
			  JOIN inserted i
			  ON i.ListingDocument = t.ListingDocument
			



	END
			
END


GO
ALTER TABLE [dbo].[tblBurnListingDocument] ADD CONSTRAINT [PK_tblBurnListingDocuments] PRIMARY KEY CLUSTERED  ([ListingDocument]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBurnListingDocument] ADD CONSTRAINT [UQ__tblBurnL__1ABEEF6EF2DAF720] UNIQUE NONCLUSTERED  ([DocumentID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBurnListingDocument] ADD CONSTRAINT [FK_tblBurnListingDocument_BurnListingFileNumber] FOREIGN KEY ([DefaultFileNumberID]) REFERENCES [dbo].[BurnListingFileNumber] ([FileNumberID]) ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblBurnListingDocument] ADD CONSTRAINT [FK_tblBurnListingDocuments_tblBurnListingCompany] FOREIGN KEY ([ListingCompany]) REFERENCES [dbo].[tblBurnListingCompany] ([ListingCompany]) ON DELETE SET NULL ON UPDATE CASCADE
GO
