CREATE TABLE [dbo].[tblFiberExtensions]
(
[Fiber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FiberExtension] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DateCreated] [datetime2] NULL CONSTRAINT [DF_tblFiberExtensions_DateCreated] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblFiberExtensions_CreatedBy] DEFAULT (suser_sname())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblFiberExtensions] ADD CONSTRAINT [PK_tblFiberExtensions] PRIMARY KEY CLUSTERED  ([Fiber], [FiberExtension]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblFiberExtensions] ADD CONSTRAINT [FK_tblFiberExtensions_tbl_Fibers] FOREIGN KEY ([Fiber]) REFERENCES [dbo].[tbl_Fibers] ([Fiber]) ON DELETE CASCADE ON UPDATE CASCADE
GO
