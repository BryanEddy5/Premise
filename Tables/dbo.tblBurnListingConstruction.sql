CREATE TABLE [dbo].[tblBurnListingConstruction]
(
[ListingCompany] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ListingDocument] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ListingSection] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ListingConstruction] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ConstructionID] [int] NOT NULL IDENTITY(1, 1),
[SSMA_TimeStamp] [timestamp] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBurnListingConstruction] ADD CONSTRAINT [PK_tblBurnListingConstruction] PRIMARY KEY CLUSTERED  ([ListingCompany], [ListingDocument], [ListingSection], [ListingConstruction]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblBurnListingConstruction] ON [dbo].[tblBurnListingConstruction] ([ConstructionID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBurnListingConstruction] ADD CONSTRAINT [FK_tblBurnListingConstruction_tblBurnListingCompany] FOREIGN KEY ([ListingCompany]) REFERENCES [dbo].[tblBurnListingCompany] ([ListingCompany])
GO
ALTER TABLE [dbo].[tblBurnListingConstruction] ADD CONSTRAINT [FK_tblBurnListingConstruction_tblBurnListingDocument] FOREIGN KEY ([ListingDocument]) REFERENCES [dbo].[tblBurnListingDocument] ([ListingDocument]) ON DELETE CASCADE ON UPDATE CASCADE
GO
