CREATE TABLE [dbo].[tblRibbonBOMItems]
(
[AssemblyItemNumber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblRibbonBOMItems] ADD CONSTRAINT [PK_tblRibbonBOMItems] PRIMARY KEY CLUSTERED  ([AssemblyItemNumber]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[tblRibbonBOMItems] TO [NAA\SPB Premise SQL RO]
GO
GRANT INSERT ON  [dbo].[tblRibbonBOMItems] TO [NAA\SPB Premise SQL RO]
GO
GRANT SELECT ON  [dbo].[tblRibbonBOMItems] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ON  [dbo].[tblRibbonBOMItems] TO [NAA\SPB Premise SQL RO]
GO
