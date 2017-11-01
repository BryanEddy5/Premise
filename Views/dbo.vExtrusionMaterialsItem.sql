SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [dbo].[vExtrusionMaterialsItem]
AS
SELECT        CableUnion.Oracle, CableUnion.ItemNo, CableUnion.Color, tblCableConstructions.JacketMaterial, tblColor_Chip_Concentration.ColorChip, 
                         tblColor_Chip_Concentration.Color_Chip_Concentration, tblCableConstructions.Additive, tblCableConstructions.AdditivePercentage, tblCableConstructions.Additive2, 
                         tblCableConstructions.AdditivePercentage2, CableUnion.Base, tblCableConstructionReferences.BaseID, 
                         1 - coalesce(tblColor_Chip_Concentration.Color_Chip_Concentration,0) - coalesce(tblCableConstructions.AdditivePercentage,0) - coalesce(tblCableConstructions.AdditivePercentage2,0) AS JacketPercentage,
                          tblMaterialDensity.SpecificGravity, tblMaterialDensity.Compound
FROM            tblCableConstructionReferences INNER JOIN
                         tblColor_Jacket_Catalog INNER JOIN
                         tblColor_Chip_Concentration ON tblColor_Jacket_Catalog.Color_Chip_Catalog = tblColor_Chip_Concentration.Color_Chip_Catalog INNER JOIN
                         tblCableConstructions INNER JOIN
                         tblJacketMaterials ON tblCableConstructions.JacketMaterial = tblJacketMaterials.JacketMaterial ON 
                         tblColor_Jacket_Catalog.Color_Chip_Catalog = tblJacketMaterials.Color_Chip_Catalog ON 
                         tblCableConstructionReferences.BaseID = tblCableConstructions.BaseID INNER JOIN
                         tblMaterialDensity ON tblCableConstructions.JacketMaterial = tblMaterialDensity.Compound RIGHT OUTER JOIN
                         CableUnion ON CableUnion.Color = tblColor_Chip_Concentration.Color AND tblCableConstructionReferences.Base = CableUnion.Base
						-- where Oracle = 'PX03232-00'




GO
