CREATE TABLE [dbo].[tblBurnListingRatingReference]
(
[Rating] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[US] [bit] NULL,
[Canada] [bit] NULL,
[SSMA_TimeStamp] [timestamp] NOT NULL,
[ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_tblBurnListingRatingReference_ID] DEFAULT (newid()),
[Priority] [int] NULL,
[StandardID] [int] NULL,
[Standard] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBurnListingRatingReference] ADD CONSTRAINT [PK_tblBurnListingRatingReference] PRIMARY KEY CLUSTERED  ([Rating]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblBurnListingRatingReference] ON [dbo].[tblBurnListingRatingReference] ([Canada], [US]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblBurnListingRatingReference_1] ON [dbo].[tblBurnListingRatingReference] ([Priority]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBurnListingRatingReference] ADD CONSTRAINT [FK_tblBurnListingRatingReference_tblBurnListingRatingReference] FOREIGN KEY ([Rating]) REFERENCES [dbo].[tblBurnListingRatingReference] ([Rating])
GO
