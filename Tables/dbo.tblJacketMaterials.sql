CREATE TABLE [dbo].[tblJacketMaterials]
(
[JacketMaterial] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Jacket_Description] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Jacket_Type] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color_Chip_Catalog] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TimeStamp] [timestamp] NULL,
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblJacketMaterials_CreatedBy] DEFAULT (suser_sname()),
[DateCreated] [datetime] NULL CONSTRAINT [DF_tblJacketMaterials_DateCreated] DEFAULT (getdate()),
[ID] [int] NOT NULL IDENTITY(1, 1),
[SpecificGravity] [decimal] (6, 4) NULL,
[PrinterNote] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblJacketMaterials] ADD CONSTRAINT [PK_tblJacketMaterials] PRIMARY KEY CLUSTERED  ([JacketMaterial]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblJacketMaterials] ADD CONSTRAINT [FK_tblJacketMaterials_tblColor_Jacket_Catalog] FOREIGN KEY ([Color_Chip_Catalog]) REFERENCES [dbo].[tblColor_Jacket_Catalog] ([Color_Chip_Catalog]) ON DELETE SET NULL ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblJacketMaterials] ADD CONSTRAINT [FK_tblJacketMaterials_tblMaterialDensity] FOREIGN KEY ([JacketMaterial]) REFERENCES [dbo].[tblMaterialDensity] ([Compound]) ON UPDATE CASCADE
GO
