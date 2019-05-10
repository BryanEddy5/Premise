CREATE TABLE [dbo].[tblBurnListingCompany]
(
[ListingCompany] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DateRecordCreated] [datetime] NULL CONSTRAINT [DF_tblBurnListingCompany_DateRecordCreated] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblBurnListingCompany_CreatedBy] DEFAULT (suser_sname()),
[Timestamp] [timestamp] NULL,
[Id] [int] NOT NULL IDENTITY(1, 1),
[StandardPrintFormat] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Display] [bit] NULL CONSTRAINT [DF_tblBurnListingCompany_Display] DEFAULT ((1))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBurnListingCompany] ADD CONSTRAINT [PK_tblBurnListingCompany] PRIMARY KEY CLUSTERED  ([ListingCompany]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBurnListingCompany] ADD CONSTRAINT [UQ__tblBurnL__3214EC06DD2975EE] UNIQUE NONCLUSTERED  ([Id]) ON [PRIMARY]
GO
