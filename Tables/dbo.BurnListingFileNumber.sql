CREATE TABLE [dbo].[BurnListingFileNumber]
(
[FileNumberID] [int] NOT NULL IDENTITY(1, 1),
[Enumber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__BurnListi__Creat__5BAF3376] DEFAULT (suser_sname()),
[DateCreated] [datetime] NOT NULL CONSTRAINT [DF__BurnListi__DateC__5CA357AF] DEFAULT (getdate()),
[MultipleListeeID] [int] NULL,
[ListingCompanyId] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BurnListingFileNumber] ADD CONSTRAINT [PK__BurnList__6BD0D16443F5F398] PRIMARY KEY CLUSTERED  ([FileNumberID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BurnListingFileNumber] ADD CONSTRAINT [IX_BurnListingFileNumber] UNIQUE NONCLUSTERED  ([Enumber]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BurnListingFileNumber] ADD CONSTRAINT [FK__BurnListi__Multi__Customer] FOREIGN KEY ([MultipleListeeID]) REFERENCES [dbo].[Customers] ([CustomerID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BurnListingFileNumber] ADD CONSTRAINT [FK__BurnListi__Listi__01D4DC5E] FOREIGN KEY ([ListingCompanyId]) REFERENCES [dbo].[tblBurnListingCompany] ([Id])
GO
