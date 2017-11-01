CREATE TABLE [dbo].[tblCutSheetOpticalFiberChart]
(
[OpticalID] [int] NOT NULL IDENTITY(1, 1),
[CodeFiberType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Mode] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Attn_dbkm_850nm] [decimal] (6, 4) NULL,
[Attn_dbkm_1300nm] [decimal] (6, 4) NULL,
[Attn_dbkm_1310nm] [decimal] (6, 4) NULL,
[Attn_dbkm_1550nm] [decimal] (6, 4) NULL,
[BW_MHzkm_850nm] [smallint] NULL,
[BW_MHzkm_1300nm] [smallint] NULL,
[EMBc_MHzkm] [smallint] NULL,
[1GigEthMin_LinkDist_850nm] [smallint] NULL,
[1GigEthMin_LinkDist_1300nm] [smallint] NULL,
[10GigEthMin_LinkDist_850nm] [smallint] NULL,
[10GigEthMin_LinkDist_1300nm] [smallint] NULL,
[FiberLetter] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FiberExtension] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CorningSpecific] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCutSheetOpticalFiberChart] ADD CONSTRAINT [PK_tblCutSheetOpticalChart] PRIMARY KEY CLUSTERED  ([OpticalID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblCutSheetOpticalFiberChart] ON [dbo].[tblCutSheetOpticalFiberChart] ([FiberLetter], [FiberExtension]) ON [PRIMARY]
GO
