CREATE TABLE [Listing].[ListingBody]
(
[ListingBody] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ListingBodyId] [int] NOT NULL IDENTITY(1000, 1),
[DateCreated] [datetime] NULL CONSTRAINT [DF__ListingBo__DateC__1E3C10E2] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__ListingBo__Creat__1F30351B] DEFAULT (suser_sname()),
[DateRevised] [datetime] NULL CONSTRAINT [DF__ListingBo__DateR__20245954] DEFAULT (getdate()),
[RevisedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__ListingBo__Revis__21187D8D] DEFAULT (suser_sname())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [Listing].[trgrListing_ListingBody] ON [Listing].[ListingBody]
AFTER INSERT, UPDATE 
AS
	SET NOCOUNT ON
	--Capture the user and time a change occured 
	BEGIN 

	UPDATE t
	SET t.DateRevised = GETDATE() , t.RevisedBy = (SUSER_SNAME()) 
	FROM Listing.ListingBody as t
	JOIN inserted i
	ON i.ListingBodyId = t.ListingBodyId

	END
GO
ALTER TABLE [Listing].[ListingBody] ADD CONSTRAINT [PK__ListingB__3642F389C521485C] PRIMARY KEY CLUSTERED  ([ListingBodyId]) ON [PRIMARY]
GO
ALTER TABLE [Listing].[ListingBody] ADD CONSTRAINT [UQ__ListingB__DE3ACF52577C2A51] UNIQUE NONCLUSTERED  ([ListingBody]) ON [PRIMARY]
GO
