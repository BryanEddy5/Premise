CREATE TABLE [Cable].[ItemRatings]
(
[ItemRatingId] [int] NOT NULL IDENTITY(1000, 1),
[ItemId] [int] NULL,
[RatingId] [uniqueidentifier] NULL,
[DateCreated] [datetime] NULL CONSTRAINT [DF__ItemRatin__DateC__4461B9CA] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__ItemRatin__Creat__4555DE03] DEFAULT (suser_sname()),
[DateRevised] [datetime] NULL CONSTRAINT [DF__ItemRatin__DateR__464A023C] DEFAULT (getdate()),
[RevisedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__ItemRatin__Revis__473E2675] DEFAULT (suser_sname()),
[SpecElementId] [int] NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [Cable].[trgrCable_ItemRatings] ON [Cable].[ItemRatings]
AFTER INSERT, UPDATE 
AS
	SET NOCOUNT ON
	--Capture the user and time a change occured 
	BEGIN 

	UPDATE t
	SET t.DateRevised = GETDATE() , t.RevisedBy = (SUSER_SNAME()) 
	FROM Cable.ItemRatings as t
	JOIN inserted i
	ON i.ItemRatingId = t.ItemRatingId

	END

GO
ALTER TABLE [Cable].[ItemRatings] ADD CONSTRAINT [PK_ItemRatings] PRIMARY KEY CLUSTERED  ([ItemRatingId]) ON [PRIMARY]
GO
ALTER TABLE [Cable].[ItemRatings] ADD CONSTRAINT [IX_ItemRatings] UNIQUE NONCLUSTERED  ([RatingId], [ItemId]) ON [PRIMARY]
GO
ALTER TABLE [Cable].[ItemRatings] ADD CONSTRAINT [IX_ItemRatings_1] UNIQUE NONCLUSTERED  ([SpecElementId], [ItemId]) ON [PRIMARY]
GO
ALTER TABLE [Cable].[ItemRatings] ADD CONSTRAINT [FK_ItemRatings_SpecElement] FOREIGN KEY ([SpecElementId]) REFERENCES [Oracle].[SpecElement] ([SpecElementId])
GO
ALTER TABLE [Cable].[ItemRatings] ADD CONSTRAINT [FK__ItemRatin__ItemI__42797158] FOREIGN KEY ([ItemId]) REFERENCES [dbo].[Basic Product Construction] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [Cable].[ItemRatings] ADD CONSTRAINT [FK__ItemRatin__Ratin__436D9591] FOREIGN KEY ([RatingId]) REFERENCES [dbo].[tblBurnListingRatingReference] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
