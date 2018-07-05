CREATE TABLE [dbo].[Vendors]
(
[VendorGUID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__Vendors__VendorG__619D16F6] DEFAULT (newid()),
[VendorName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateCreated] [datetime] NULL CONSTRAINT [DF__Vendors__DateCre__62913B2F] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Vendors__Created__63855F68] DEFAULT (suser_sname())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Vendors] ADD CONSTRAINT [PK_Vendors] PRIMARY KEY CLUSTERED  ([VendorGUID]) ON [PRIMARY]
GO
