CREATE TABLE [dbo].[tblUnitSeriesTemplateCatalog]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[TemplateCatalog] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblUnitSeriesTemplateCatalog] ADD CONSTRAINT [PK_tblUnitSeriesTemplateCatalog] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
