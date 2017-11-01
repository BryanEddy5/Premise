CREATE TABLE [dbo].[tblArmor_Costing_Weight]
(
[AmorMaterialCost] [float] NULL,
[ArmorWeight] [float] NULL,
[MaxArmorOD] [decimal] (6, 4) NULL,
[ArmorExtension] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[JacketLetter] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Armor] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MaxCoreOD] [decimal] (6, 4) NULL,
[NominalOD] [decimal] (9, 4) NULL,
[Compound] [nchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ArmorSize] [smallint] NULL,
[JacketRating] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ArmorLoadedCost] [float] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblArmor_Costing_Weight] ADD CONSTRAINT [PK_tblArmor_Costing_Weight] PRIMARY KEY CLUSTERED  ([JacketLetter], [Armor]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblArmor_Costing_Weight] ON [dbo].[tblArmor_Costing_Weight] ([AmorMaterialCost]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblArmor_Costing_Weight] ADD CONSTRAINT [FK_tblArmor_Costing_Weight_tblDesignArmor] FOREIGN KEY ([Armor]) REFERENCES [dbo].[tblDesignArmor] ([Armor]) ON DELETE CASCADE ON UPDATE CASCADE
GO
