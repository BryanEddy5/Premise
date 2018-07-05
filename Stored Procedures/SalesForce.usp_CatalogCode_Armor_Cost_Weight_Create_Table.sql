SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [SalesForce].[usp_CatalogCode_Armor_Cost_Weight_Create_Table]
as
BEGIN 


DECLARE @ErrorNumber INT = ERROR_NUMBER();
DECLARE @ErrorLine INT = ERROR_LINE();

TRUNCATE TABLE tblArmor_Costing_Weight;

	BEGIN TRY
		BEGIN TRAN
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
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;

	BEGIN TRY
		BEGIN TRAN
		UPDATE tblArmor_Costing_Weight
		SET ArmorLoadedCost = 0.02482 + 0.001667 + 0.12836 + AmorMaterialCost
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;


END

GO
