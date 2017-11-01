SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[usp_CatalogCode_SalesForce_Armor_Cost_Weight]
as
BEGIN 



IF OBJECT_ID(N'tempdb..#BaseArmor', N'U') IS NOT NULL
DROP TABLE #BaseArmor

	SELECT JacketLetter, B.NominalOD CoreOD, G.MaxCoreOD, Base, ArmorExtension, G.NominalOD ArmorOD, AmorMaterialCost
	, ArmorWeight, SalesForceDescription, K.BaseID, G.Armor, JacketRating, ArmorCostAdder, P.ArmorSize
	INTO #BaseArmor
	FROM dbo.tblCableConstructionReferences K INNER JOIN dbo.tblCableConstructions B ON K.BaseID = B.BaseID INNER JOIN dbo.tblArmor_Costing_Weight G ON G.JacketLetter = K.CableLevel1
		INNER JOIN dbo.tblDesignTypes E ON E.DesignTypeID = K.DesignTypeID INNER JOIN tblDesignArmor P ON P.Armor = G.Armor
	WHERE B.NominalOD <= G.MaxCoreOD AND E.Armor = 1
	order by base


IF OBJECT_ID(N'tempdb..#BaseMaxArmor', N'U') IS NOT NULL
DROP TABLE #BaseMaxArmor

SELECT MIN(MaxCoreOD) MaxCoreOD, Base, JacketLetter
INTO #BaseMaxArmor
FROM #BaseArmor
GROUP BY Base, JacketLetter


--IF OBJECT_ID(N'ArmorConstructionBase', N'U') IS NOT NULL
--DROP TABLE #ArmorCost

DELETE FROM ArmorConstructionBase_TEMP;

INSERT INTO ArmorConstructionBase_TEMP
SELECT Base, Resources + OverHead + AmorMaterialCost as ArmorLoadedCost, ArmorExtension, AmorMaterialCost, ArmorWeight, ArmorOD, Armor, JacketRating, ArmorCostAdder
,ArmorSize
--INTO ArmorConstructionBase
FROM 
(
	SELECT G.*, 0.02482 + 0.001667 as Resources, 0.12836 as OverHead
	FROM #BaseArmor G INNER JOIN #BaseMaxArmor K ON G.MaxCoreOD = K.MaxCoreOD AND G.Base = K.Base AND K.JacketLetter = G.JacketLetter

	--ORDER BY g.Base 
) Armor

--SELECT K.*, G.Active,G.ApprovedForQuoting
--FROM ArmorConstructionBase_TEMP K INNER JOIN tblCableConstructionReferences G ON G.Base = K.Base
--WHERE ApprovedForQuoting = 1 AND Active = 1

INSERT INTO tblSalesForce_Catalog
                         (CatalogCode, Base, Weight_kg_per_m, 
                         DesignTypeDesc, Jacket, TBType, TBDescription, NominalOD, NumSubFillers, NumSubPositions,FinishedCableColor,TBLetter,
						 CablePasses,FiberCount,UnitOD, BaseID,DesignTypeId, LoadedBaseCost, Armored, 
						 BaseCost, Boxed, OracleItem,Fiber_Type__c,Armor_Type__c,Print_Type__c, Min_Order_Quantity__c, ArmorJacket,FiberID,
						 FurcationTube, SetupID, Non_Standard, Active, ProdLevel3)

SELECT		CatalogCode  + ArmorExtension, c. Base, Weight_kg_per_m+ArmorWeight, 
                         C.DesignTypeDesc, Jacket, TBType, TBDescription, ArmorOD, NumSubFillers, NumSubPositions,FinishedCableColor,TBLetter,
						 CablePasses,FiberCount,UnitOD, BaseID,C.DesignTypeId, LoadedBaseCost ,1, 
						 BaseCost ,0 as Boxed, OracleItem,Fiber_Type__c, 'Armored' as Armor_Type__c,Print_Type__c,C.Min_Order_Quantity__c, JacketRating,FiberID
						 ,FurcationTube, SetupID, Non_Standard, C.Active,ProdLevel3
FROM		ArmorConstructionBase_TEMP A INNER JOIN tblSalesForce_Catalog C ON A.BASE = C.BASE INNER JOIN dbo.tblDesignTypes K ON K.DesignTypeID = C.DesignTypeID
WHERE		K.Armor = 1 AND C.NominalOD > 2.9




END

GO
