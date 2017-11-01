CREATE TABLE [dbo].[tblStandardsSafetyListing]
(
[Standard] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SafetyListing] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblStandardsSafetyListing_CreatedBy] DEFAULT (suser_sname()),
[CreationDate] [datetime] NULL CONSTRAINT [DF_tblStandardsSafetyListing_CreationDate] DEFAULT (getdate()),
[Timestampe] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblStandardsSafetyListing] ADD CONSTRAINT [PK_tblStandardsSafetyListing] PRIMARY KEY CLUSTERED  ([Standard], [SafetyListing]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblStandardsSafetyListing] ADD CONSTRAINT [FK_tblStandardsSafetyListing_tblBurnListingRatingReference] FOREIGN KEY ([SafetyListing]) REFERENCES [dbo].[tblBurnListingRatingReference] ([Rating])
GO
ALTER TABLE [dbo].[tblStandardsSafetyListing] ADD CONSTRAINT [FK_tblStandardsSafetyListing_tblStandards] FOREIGN KEY ([Standard]) REFERENCES [Standards].[IndustryStandards] ([Standard]) ON DELETE CASCADE ON UPDATE CASCADE
GO
