CREATE TABLE [dbo].[tblCorningPrint]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[CorningPrint] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FiberLetter] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FiberExtensions] [nvarchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblCorningPrint_FiberExtensions] DEFAULT (N'NONE'),
[VendorGUID] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCorningPrint] ADD CONSTRAINT [PK_tblCorningPrint] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCorningPrint] ADD CONSTRAINT [FK__tblCornin__Vendo__6661CC13] FOREIGN KEY ([VendorGUID]) REFERENCES [dbo].[Vendors] ([VendorGUID])
GO
