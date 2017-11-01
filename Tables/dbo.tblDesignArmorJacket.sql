CREATE TABLE [dbo].[tblDesignArmorJacket]
(
[JacketMaterial] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[WallThickness] [decimal] (4, 2) NULL,
[JacketRating] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ArmorExtension] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[JacketLetter] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ColorChip] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblDesignArmorJacket] ON [dbo].[tblDesignArmorJacket] ([JacketLetter]) ON [PRIMARY]
GO
