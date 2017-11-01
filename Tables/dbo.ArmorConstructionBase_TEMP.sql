CREATE TABLE [dbo].[ArmorConstructionBase_TEMP]
(
[Base] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ArmorLoadedCost] [float] NULL,
[ArmorExtension] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AmorMaterialCost] [float] NULL,
[ArmorWeight] [float] NULL,
[ArmorOD] [decimal] (9, 4) NULL,
[Armor] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[JacketRating] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ArmorCostAdder] [decimal] (6, 4) NULL,
[ArmorSize] [smallint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ArmorConstructionBase_TEMP] ADD CONSTRAINT [PK_ArmorConstructionBase] PRIMARY KEY CLUSTERED  ([Base]) ON [PRIMARY]
GO
