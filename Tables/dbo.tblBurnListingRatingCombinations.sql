CREATE TABLE [dbo].[tblBurnListingRatingCombinations]
(
[RatingUS] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[RatingCanada] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TimeStamp] [timestamp] NULL,
[ID] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBurnListingRatingCombinations] ADD CONSTRAINT [PK_tblBurnListingRatingCombinations] PRIMARY KEY CLUSTERED  ([RatingUS], [RatingCanada]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBurnListingRatingCombinations] ADD CONSTRAINT [FK_tblBurnListingRatingCombinations_tblBurnListingRatingReference] FOREIGN KEY ([RatingUS]) REFERENCES [dbo].[tblBurnListingRatingReference] ([Rating]) ON DELETE CASCADE ON UPDATE CASCADE
GO
