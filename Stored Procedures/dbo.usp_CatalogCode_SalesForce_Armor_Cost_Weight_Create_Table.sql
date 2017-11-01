SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[usp_CatalogCode_SalesForce_Armor_Cost_Weight_Create_Table]
as
BEGIN 

--IF OBJECT_ID(N'tblArmor_Costing_Weight', N'U') IS NOT NULL
--DROP TABLE tblArmor_Costing_Weight;

DELETE FROM tblArmor_Costing_Weight;

INSERT INTO tblArmor_Costing_Weight (AmorMaterialCost, ArmorWeight, MaxArmorOD,ArmorExtension, JacketLetter, Armor, MaxCoreOD, NominalOD, Compound, ArmorSize, JacketRating)
SELECT        ROUND((ColorCost.Item_Cost * 0.03 * tblMaterialDensity.SpecificGravity) * (PI() * (SQUARE((AmorMaterialCost.MaxArmorOD + A.WallThickness * 2) / 2) 
                         - SQUARE(AmorMaterialCost.MaxArmorOD / 2))) / 1000 + (K.Item_Cost * 0.97 * tblMaterialDensity.SpecificGravity) * (PI() 
                         * (SQUARE((AmorMaterialCost.MaxArmorOD + A.WallThickness * 2) / 2) - SQUARE(AmorMaterialCost.MaxArmorOD / 2))) / 1000 + AmorMaterialCost.AmorMaterialCost,6) AS AmorMaterialCost, 


			ROUND(( tblMaterialDensity.SpecificGravity) * (PI()* (SQUARE((AmorMaterialCost.MaxArmorOD + A.WallThickness * 2) / 2) - SQUARE(AmorMaterialCost.MaxArmorOD / 2)))
			 / 1000 + AmorMaterialCost.ArmorUsage,6) AS ArmorWeight, 

                         AmorMaterialCost.MaxArmorOD, A.ArmorExtension, A.JacketLetter, AmorMaterialCost.Armor, AmorMaterialCost.MaxCoreOD, ROUND(A.WallThickness * 2 + AmorMaterialCost.MaxArmorOD, 2) 
                         AS NominalOD, tblMaterialDensity.Compound, ArmorSize, JacketRating
--INTO	tblArmor_Costing_Weight
FROM            tblDesignArmorJacket AS A INNER JOIN
                         dbo.AFLPRD_INVSysItemCost_CAB AS K ON A.JacketMaterial = K.ItemNumber INNER JOIN
                         dbo.AFLPRD_INVSysItemCost_CAB AS ColorCost ON ColorCost.ItemNumber = A.ColorChip INNER JOIN
                         tblMaterialDensity ON A.JacketMaterial = tblMaterialDensity.Compound CROSS JOIN
                             (SELECT        tblDesignArmor.MaxCoreOD, tblDesignArmor.MaxArmorOD, armorsize,ArmorUsage,
                                                         tblDesignArmor.ArmorUsage * dbo.AFLPRD_INVSysItemCost_CAB.Item_Cost AS AmorMaterialCost, tblDesignArmor.Armor
                               FROM            tblDesignArmor INNER JOIN
                                                         dbo.AFLPRD_INVSysItemCost_CAB ON tblDesignArmor.OracleArmor = dbo.AFLPRD_INVSysItemCost_CAB.ItemNumber) 
                         AS AmorMaterialCost
--ORDER BY		ArmorSize

UPDATE tblArmor_Costing_Weight
SET ArmorLoadedCost = 0.02482 + 0.001667 + 0.12836 + AmorMaterialCost



END

GO
