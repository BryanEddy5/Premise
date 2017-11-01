CREATE TABLE [dbo].[tblBurnListingRating]
(
[Rating] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[US] [bit] NULL,
[Canada] [bit] NULL,
[SSMA_TimeStamp] [timestamp] NOT NULL,
[ConstructionID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBurnListingRating] ADD CONSTRAINT [PK_tblBurnListingRating] PRIMARY KEY CLUSTERED  ([Rating], [ConstructionID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBurnListingRating] ADD CONSTRAINT [FK_tblBurnListingRating_tblBurnListingConstruction] FOREIGN KEY ([ConstructionID]) REFERENCES [dbo].[tblBurnListingConstruction] ([ConstructionID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblBurnListingRating] ADD CONSTRAINT [FK_tblBurnListingRating_tblBurnListingRatingReference] FOREIGN KEY ([Rating]) REFERENCES [dbo].[tblBurnListingRatingReference] ([Rating]) ON DELETE CASCADE ON UPDATE CASCADE
GO
