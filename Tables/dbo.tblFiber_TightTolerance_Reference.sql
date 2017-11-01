CREATE TABLE [dbo].[tblFiber_TightTolerance_Reference]
(
[TightToleranceFiber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FiberCandidate] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblFiber_TightTolerance_Reference_CreatedBy] DEFAULT (suser_sname()),
[CreationDate] [datetime] NULL CONSTRAINT [DF_tblFiber_TightTolerance_Reference_CreationDate] DEFAULT (getdate()),
[timestamp] [timestamp] NULL,
[ViewName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblFiber_TightTolerance_Reference] ADD CONSTRAINT [PK_tblFiber_TightTolerance_Reference_1] PRIMARY KEY CLUSTERED  ([TightToleranceFiber]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblFiber_TightTolerance_Reference] ADD CONSTRAINT [FK_tblFiber_TightTolerance_Reference_tbl_Fibers] FOREIGN KEY ([TightToleranceFiber]) REFERENCES [dbo].[tbl_Fibers] ([Fiber]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblFiber_TightTolerance_Reference] ADD CONSTRAINT [FK_tblFiber_TightTolerance_Reference_tbl_Fibers1] FOREIGN KEY ([FiberCandidate]) REFERENCES [dbo].[tbl_Fibers] ([Fiber])
GO
