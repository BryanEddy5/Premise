CREATE TABLE [dbo].[tblUnitSeriesTemplate]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[UnitID] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PrintSpacing] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PrintType] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UnitIDType] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UnitNumber] [int] NOT NULL,
[UnitIDTypeNumber] [int] NOT NULL,
[PrintTemplateId] [int] NULL,
[PrintUomMarking] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblUnitSeriesTemplate] ADD CONSTRAINT [chk_UnitType] CHECK (([UnitIDType]='Unit' OR [UnitIDType]='Color' OR [UnitIDType]='Filler'))
GO
ALTER TABLE [dbo].[tblUnitSeriesTemplate] ADD CONSTRAINT [PK_tblUnitSeriesTemplate] PRIMARY KEY CLUSTERED  ([UnitNumber], [UnitIDTypeNumber]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblUnitSeriesTemplate] ON [dbo].[tblUnitSeriesTemplate] ([UnitID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblUnitSeriesTemplate_1] ON [dbo].[tblUnitSeriesTemplate] ([UnitID], [UnitIDTypeNumber]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblUnitSeriesTemplate] ADD CONSTRAINT [FK_tblUnitSeriesTemplate_tblUnitSeriesTemplateCatalog] FOREIGN KEY ([UnitIDTypeNumber]) REFERENCES [dbo].[tblUnitSeriesTemplateCatalog] ([ID])
GO
ALTER TABLE [dbo].[tblUnitSeriesTemplate] ADD CONSTRAINT [FK_tblUnitSeriesTemplate_Templates] FOREIGN KEY ([PrintTemplateId]) REFERENCES [DiamondJet].[Templates] ([TemplateID]) ON DELETE SET NULL ON UPDATE CASCADE
GO
