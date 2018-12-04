CREATE TABLE [dbo].[BurnListingMultipleListee]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[DocumentID] [int] NULL,
[MultipleListeeID] [int] NULL,
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__BurnListi__Creat__662CC1E9] DEFAULT (suser_sname()),
[DateCreated] [datetime] NULL CONSTRAINT [DF__BurnListi__DateC__6720E622] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BurnListingMultipleListee] ADD CONSTRAINT [PK_BurnListingMultipleListee] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BurnListingMultipleListee] ADD CONSTRAINT [IX_BurnListingMultipleListee] UNIQUE NONCLUSTERED  ([DocumentID], [MultipleListeeID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BurnListingMultipleListee] ADD CONSTRAINT [FK__BurnListi__FileN__65389DB0] FOREIGN KEY ([MultipleListeeID]) REFERENCES [dbo].[BurnListingFileNumber] ([FileNumberID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
