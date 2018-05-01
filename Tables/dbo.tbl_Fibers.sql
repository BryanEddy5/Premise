CREATE TABLE [dbo].[tbl_Fibers]
(
[Fiber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SM/MM] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BIF] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_Fibers_BIF] DEFAULT (N'No'),
[OM#] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SpecialNotes] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Fiber_Type] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Alt1_Fiber_Type] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_Fibers_Alt1_Fiber_Type] DEFAULT (N'NONE'),
[Alt2_Fiber_Type] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_Fibers_Alt2_Fiber_Type] DEFAULT (N'NONE'),
[Alt3_Fiber_Type] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_Fibers_Alt3_Fiber_Type] DEFAULT (N'NONE'),
[Alt4_Fiber_Type] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_Fibers_Alt4_Fiber_Type] DEFAULT (N'NONE'),
[Description_Oracle] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Active] [bit] NULL CONSTRAINT [DF__tbl_Fiber__Activ__6F7F8B4B] DEFAULT ((0)),
[OracleFiberFamily] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Mode] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vendor] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ITU] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Extension] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Cost] [decimal] (10, 6) NULL,
[TBCatalogType] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OD] [decimal] (6, 4) NULL,
[Timestamp] [timestamp] NULL,
[OpticalID] [int] NULL,
[FiberItemID] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_Fibers] ADD CONSTRAINT [DF_tbl_Fibers_BIF_YesNo] CHECK (([BIF]='No' OR [BIF]='Yes'))
GO
ALTER TABLE [dbo].[tbl_Fibers] ADD CONSTRAINT [CK__tbl_Fibers__BIF__3BF690FB] CHECK (([BIF]='Yes' OR [BIF]='No'))
GO
ALTER TABLE [dbo].[tbl_Fibers] ADD CONSTRAINT [tbl_Fibers$PrimaryKey] PRIMARY KEY CLUSTERED  ([Fiber]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tbl_Fibers] ON [dbo].[tbl_Fibers] ([Fiber], [Extension], [Fiber_Type], [TBCatalogType], [Alt1_Fiber_Type], [OM#], [Alt2_Fiber_Type], [Alt3_Fiber_Type], [Alt4_Fiber_Type], [Active], [OpticalID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_Fibers] ADD CONSTRAINT [UQ__tbl_Fibe__1DC26D2880EA2678] UNIQUE NONCLUSTERED  ([FiberItemID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tbl_Fibers_1] ON [dbo].[tbl_Fibers] ([TBCatalogType], [Fiber_Type]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_Fibers] ADD CONSTRAINT [FK_tbl_Fibers_tblCutSheetOpticalFiberChart] FOREIGN KEY ([OpticalID]) REFERENCES [dbo].[tblCutSheetOpticalFiberChart] ([OpticalID]) ON DELETE SET NULL ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tbl_Fibers] ADD CONSTRAINT [FK_tbl_Fibers_tblFiberTBCatalog] FOREIGN KEY ([TBCatalogType]) REFERENCES [dbo].[tblFiberTBCatalog] ([TBCatalogType]) ON DELETE SET NULL ON UPDATE CASCADE
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premtbls.[tbl_Fibers]', 'SCHEMA', N'dbo', 'TABLE', N'tbl_Fibers', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premtbls.[tbl_Fibers].[Active]', 'SCHEMA', N'dbo', 'TABLE', N'tbl_Fibers', 'COLUMN', N'Active'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premtbls.[tbl_Fibers].[Alt1_Fiber_Type]', 'SCHEMA', N'dbo', 'TABLE', N'tbl_Fibers', 'COLUMN', N'Alt1_Fiber_Type'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premtbls.[tbl_Fibers].[Alt2_Fiber_Type]', 'SCHEMA', N'dbo', 'TABLE', N'tbl_Fibers', 'COLUMN', N'Alt2_Fiber_Type'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premtbls.[tbl_Fibers].[Alt3_Fiber_Type]', 'SCHEMA', N'dbo', 'TABLE', N'tbl_Fibers', 'COLUMN', N'Alt3_Fiber_Type'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premtbls.[tbl_Fibers].[Alt4_Fiber_Type]', 'SCHEMA', N'dbo', 'TABLE', N'tbl_Fibers', 'COLUMN', N'Alt4_Fiber_Type'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premtbls.[tbl_Fibers].[BIF]', 'SCHEMA', N'dbo', 'TABLE', N'tbl_Fibers', 'COLUMN', N'BIF'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premtbls.[tbl_Fibers].[Cost]', 'SCHEMA', N'dbo', 'TABLE', N'tbl_Fibers', 'COLUMN', N'Cost'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premtbls.[tbl_Fibers].[Description_Oracle]', 'SCHEMA', N'dbo', 'TABLE', N'tbl_Fibers', 'COLUMN', N'Description_Oracle'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premtbls.[tbl_Fibers].[Extension]', 'SCHEMA', N'dbo', 'TABLE', N'tbl_Fibers', 'COLUMN', N'Extension'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premtbls.[tbl_Fibers].[Fiber]', 'SCHEMA', N'dbo', 'TABLE', N'tbl_Fibers', 'COLUMN', N'Fiber'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premtbls.[tbl_Fibers].[Fiber_Type]', 'SCHEMA', N'dbo', 'TABLE', N'tbl_Fibers', 'COLUMN', N'Fiber_Type'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premtbls.[tbl_Fibers].[ITU]', 'SCHEMA', N'dbo', 'TABLE', N'tbl_Fibers', 'COLUMN', N'ITU'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premtbls.[tbl_Fibers].[Mode]', 'SCHEMA', N'dbo', 'TABLE', N'tbl_Fibers', 'COLUMN', N'Mode'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premtbls.[tbl_Fibers].[OM#]', 'SCHEMA', N'dbo', 'TABLE', N'tbl_Fibers', 'COLUMN', N'OM#'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premtbls.[tbl_Fibers].[OracleFiberFamily]', 'SCHEMA', N'dbo', 'TABLE', N'tbl_Fibers', 'COLUMN', N'OracleFiberFamily'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premtbls.[tbl_Fibers].[SM/MM]', 'SCHEMA', N'dbo', 'TABLE', N'tbl_Fibers', 'COLUMN', N'SM/MM'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premtbls.[tbl_Fibers].[SpecialNotes]', 'SCHEMA', N'dbo', 'TABLE', N'tbl_Fibers', 'COLUMN', N'SpecialNotes'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premtbls.[tbl_Fibers].[Vendor]', 'SCHEMA', N'dbo', 'TABLE', N'tbl_Fibers', 'COLUMN', N'Vendor'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premtbls.[tbl_Fibers].[PrimaryKey]', 'SCHEMA', N'dbo', 'TABLE', N'tbl_Fibers', 'CONSTRAINT', N'tbl_Fibers$PrimaryKey'
GO
