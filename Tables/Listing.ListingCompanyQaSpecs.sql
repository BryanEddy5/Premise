CREATE TABLE [Listing].[ListingCompanyQaSpecs]
(
[QaSpecId] [int] NOT NULL,
[ListingCoId] [int] NOT NULL,
[QaLstCoId] [int] NOT NULL IDENTITY(1000, 1),
[DateCreated] [datetime] NULL CONSTRAINT [DF__ListingCo__DateC__689F1A40] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__ListingCo__Creat__69933E79] DEFAULT (suser_sname()),
[DateRevised] [datetime] NULL CONSTRAINT [DF__ListingCo__DateR__6A8762B2] DEFAULT (getdate()),
[RevisedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__ListingCo__Revis__6B7B86EB] DEFAULT (suser_sname())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE TRIGGER [Listing].[trgrListing_BurnRatingQaSpecs] ON [Listing].[ListingCompanyQaSpecs]
AFTER INSERT, UPDATE 
AS
	SET NOCOUNT ON
	--Capture the user and time a change occured 
	BEGIN 

	UPDATE t
	SET t.DateRevised = GETDATE() , t.RevisedBy = (SUSER_SNAME()) 
	FROM Listing.ListingCompanyQaSpecs as t
	JOIN inserted i
	ON i.QaLstCoId = t.QaLstCoId

	END


GO
ALTER TABLE [Listing].[ListingCompanyQaSpecs] ADD CONSTRAINT [PK__ListingC__09C4A0D1835D29DC] PRIMARY KEY CLUSTERED  ([QaLstCoId]) ON [PRIMARY]
GO
ALTER TABLE [Listing].[ListingCompanyQaSpecs] ADD CONSTRAINT [UQ__ListingC__163E4B7891BFBAAB] UNIQUE NONCLUSTERED  ([QaSpecId], [ListingCoId]) ON [PRIMARY]
GO
ALTER TABLE [Listing].[ListingCompanyQaSpecs] ADD CONSTRAINT [FK__ListingCo__Listi__67AAF607] FOREIGN KEY ([ListingCoId]) REFERENCES [dbo].[tblBurnListingCompany] ([Id]) ON DELETE CASCADE
GO
ALTER TABLE [Listing].[ListingCompanyQaSpecs] ADD CONSTRAINT [FK__ListingCo__QaSpe__66B6D1CE] FOREIGN KEY ([QaSpecId]) REFERENCES [dbo].[tblQASpecsFiberDefaults] ([QaSpecId]) ON DELETE CASCADE
GO
