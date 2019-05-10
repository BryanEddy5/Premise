CREATE TABLE [dbo].[tblBurnListingRatingReference]
(
[Rating] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[US] [bit] NULL,
[Canada] [bit] NULL,
[SSMA_TimeStamp] [timestamp] NOT NULL,
[ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_tblBurnListingRatingReference_ID] DEFAULT (newid()),
[Priority] [int] NULL,
[StandardID] [int] NULL,
[Standard] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ListingBodyID] [int] NULL,
[SpecElementId] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBurnListingRatingReference] ADD CONSTRAINT [PK_tblBurnListingRatingReference] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblBurnListingRatingReference] ON [dbo].[tblBurnListingRatingReference] ([Canada], [US]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblBurnListingRatingReference_2] ON [dbo].[tblBurnListingRatingReference] ([ListingBodyID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblBurnListingRatingReference_1] ON [dbo].[tblBurnListingRatingReference] ([Priority]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBurnListingRatingReference] ADD CONSTRAINT [IX_tblBurnListingRatingReference_3] UNIQUE NONCLUSTERED  ([Rating]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBurnListingRatingReference] ADD CONSTRAINT [FK_tblBurnListingRatingReference_ListingBody] FOREIGN KEY ([ListingBodyID]) REFERENCES [Listing].[ListingBody] ([ListingBodyId]) ON DELETE SET NULL ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblBurnListingRatingReference] ADD CONSTRAINT [FK__tblBurnLi__SpecE__49266EE7] FOREIGN KEY ([SpecElementId]) REFERENCES [Oracle].[SpecElement] ([SpecElementId]) ON DELETE SET NULL ON UPDATE CASCADE
GO
