CREATE TABLE [dbo].[tblBurnListing]
(
[Base] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ListingCompany] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ListingTab] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ListingSection] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ListingConstruction] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Field6] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Type] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreationDate] [datetime] NULL,
[Timestamp] [timestamp] NULL,
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBurnListing] ADD CONSTRAINT [PK_tblBurnListing] PRIMARY KEY CLUSTERED  ([Base], [ListingCompany]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblBurnListing] ON [dbo].[tblBurnListing] ([ListingConstruction], [ListingSection], [ListingTab]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBurnListing] ADD CONSTRAINT [FK_tblBurnListing_tblBurnListingConstruction] FOREIGN KEY ([ListingCompany], [ListingTab], [ListingSection], [ListingConstruction]) REFERENCES [dbo].[tblBurnListingConstruction] ([ListingCompany], [ListingDocument], [ListingSection], [ListingConstruction]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblBurnListing] ADD CONSTRAINT [FK_tblBurnListing_tblCableConstructionReferences] FOREIGN KEY ([Base]) REFERENCES [dbo].[tblCableConstructionReferences] ([Base]) ON DELETE CASCADE ON UPDATE CASCADE
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[tblBurnListing]', 'SCHEMA', N'dbo', 'TABLE', N'tblBurnListing', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[tblBurnListing].[Base]', 'SCHEMA', N'dbo', 'TABLE', N'tblBurnListing', 'COLUMN', N'Base'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[tblBurnListing].[Field6]', 'SCHEMA', N'dbo', 'TABLE', N'tblBurnListing', 'COLUMN', N'Field6'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[tblBurnListing].[ListingCompany]', 'SCHEMA', N'dbo', 'TABLE', N'tblBurnListing', 'COLUMN', N'ListingCompany'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[tblBurnListing].[ListingConstruction]', 'SCHEMA', N'dbo', 'TABLE', N'tblBurnListing', 'COLUMN', N'ListingConstruction'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[tblBurnListing].[ListingSection]', 'SCHEMA', N'dbo', 'TABLE', N'tblBurnListing', 'COLUMN', N'ListingSection'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[tblBurnListing].[ListingTab]', 'SCHEMA', N'dbo', 'TABLE', N'tblBurnListing', 'COLUMN', N'ListingTab'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[tblBurnListing].[Type]', 'SCHEMA', N'dbo', 'TABLE', N'tblBurnListing', 'COLUMN', N'Type'
GO
