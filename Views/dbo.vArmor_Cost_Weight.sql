SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [dbo].[vArmor_Cost_Weight]
as


SELECT        (ColorCost.Item_Cost * 0.03 * tblMaterialDensity.SpecificGravity) * (PI() * (SQUARE((ArmorCost.MaxArmorOD + A.WallThickness * 2) / 2) 
                         - SQUARE(ArmorCost.MaxArmorOD / 2))) / 1000 + (K.Item_Cost * 0.97 * tblMaterialDensity.SpecificGravity) * (PI() 
                         * (SQUARE((ArmorCost.MaxArmorOD + A.WallThickness * 2) / 2) - SQUARE(ArmorCost.MaxArmorOD / 2))) / 1000 + ArmorCost.ArmorCost AS ArmorCost, 
                         ArmorCost.MaxArmorOD, A.ArmorExtension, A.JacketLetter, ArmorCost.Armor, ArmorCost.MaxCoreOD, ROUND(A.WallThickness * 2 + ArmorCost.MaxArmorOD, 2) 
                         AS NominalOD, tblMaterialDensity.Compound, ArmorSize
FROM            tblDesignArmorJacket AS A INNER JOIN
                         dbo.AFLPRD_INVSysItemCost_CAB AS K ON A.JacketMaterial = K.ItemNumber INNER JOIN
                         dbo.AFLPRD_INVSysItemCost_CAB AS ColorCost ON ColorCost.ItemNumber = A.ColorChip INNER JOIN
                         tblMaterialDensity ON A.JacketMaterial = tblMaterialDensity.Compound CROSS JOIN
                             (SELECT        tblDesignArmor.MaxCoreOD, tblDesignArmor.MaxArmorOD, armorsize,
                                                         tblDesignArmor.ArmorUsage * dbo.AFLPRD_INVSysItemCost_CAB.Item_Cost AS ArmorCost, tblDesignArmor.Armor
                               FROM            tblDesignArmor INNER JOIN
                                                         dbo.AFLPRD_INVSysItemCost_CAB ON tblDesignArmor.OracleArmor = dbo.AFLPRD_INVSysItemCost_CAB.ItemNumber) 
                         AS ArmorCost
--ORDER BY		ArmorSize


GO
