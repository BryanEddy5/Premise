CREATE TABLE [dbo].[tblBurnListingJacketLetterReference]
(
[JacketLetter] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Rating] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_tblBurnListingJacketLetterReference_ID] DEFAULT (newid()),
[TimeStamp] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBurnListingJacketLetterReference] ADD CONSTRAINT [PK_tblBurnListingJacketLetterReference] PRIMARY KEY CLUSTERED  ([JacketLetter], [Rating]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBurnListingJacketLetterReference] ADD CONSTRAINT [FK_tblBurnListingJacketLetterReference_tblBurnListingRatingReference] FOREIGN KEY ([Rating]) REFERENCES [dbo].[tblBurnListingRatingReference] ([Rating]) ON DELETE CASCADE ON UPDATE CASCADE
GO
