SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[vBOM_Usage_Calculator]
as
IF OBJECT_ID(N'tempdb..#CableOD', N'U') IS NOT NULL
DROP TABLE #CableOD
SELECT  CASE WHEN k.Height is null THEN k.NominalOD
								WHEN k.Height <> 0  AND b.base not like 'z%' or k.height is not null THEN 1.1284 * SQRT(k.NominalOD * k.Height)
								ELSE K.NominalOD 
					END OD, b.Base
INTO #CableOD
FROM dbo.tblCableConstructionReferences B 
INNER JOIN  dbo.tblCableConstructions K ON B.BASEID = K.BASEID 
INNER JOIN [dbo].[vColor_Chip_Jacket_Material] G ON G.JacketMaterial = K.JacketMaterial




IF OBJECT_ID(N'tempdb..#CableVolume', N'U') IS NOT NULL
DROP TABLE #CableVolume
SELECT B.Base, k.JacketMaterial, K.NominalOD, k.NominalWall,OD,k.Height, CASE WHEN AdditivePercentage IS NULL THEN 0 ELSE AdditivePercentage END AdditivePercentage,
	PI()*(SQUARE(OD/2) - SQUARE((OD-(2*K.NominalWall))/2))
		*(CASE WHEN B.BASE LIKE 'Z%' THEN 2
				WHEN b.DesignCode like 'w_____[abcdef]' THEN CAST(SUBSTRING(b.DesignCode,6,1) AS INT) 
				ELSE 1 END) as Volume_m3
INTO #CableVolume
FROM dbo.tblCableConstructionReferences B 
INNER JOIN  dbo.tblCableConstructions K ON B.BASEID = K.BASEID 
INNER JOIN #CableOD E ON E.Base = B.Base


IF OBJECT_ID(N'tempdb..#Cable_BOM_Usage', N'U') IS NOT NULL
DROP TABLE #Cable_BOM_Usage
SELECT DISTINCT B.Base, k.JacketMaterial, g.Color, g.Color_Chip_Concentration* A.SpecificGravity * Volume_m3 /1000 as ColorChip_km_m, K.NominalOD, k.NominalWall,OD, E.Volume_m3, K.Height, 
((1 - Color_Chip_Concentration - E.AdditivePercentage)*Volume_m3)/1000 * A.SpecificGravity as JacketUsage_km_m, ColorChip, SpecificGravity, Color_Chip_Concentration
, e.AdditivePercentage, e.AdditivePercentage*a.SpecificGravity*Volume_m3/1000 as AdditivesUsage_km_m
INTO #Cable_BOM_Usage								
FROM dbo.tblCableConstructionReferences B 
INNER JOIN  dbo.tblCableConstructions K ON B.BASEID = K.BASEID 
INNER JOIN [dbo].[vColor_Chip_Jacket_Material] G ON G.JacketMaterial = K.JacketMaterial
INNER JOIN #CableVolume E ON E.Base = B.Base
INNER JOIN dbo.tblMaterialDensity A ON A.Compound = K.JacketMaterial

--Jacket Usage
IF OBJECT_ID(N'tempdb..#Cable_Jacket_BOM_Usage', N'U') IS NOT NULL
DROP TABLE #Cable_Jacket_BOM_Usage
SELECT  B.AssemblyItemNumber, B.ItemSeqNumber, B.OperationSeqNumber, B.ComponentItemNumber, K.JacketUsage_km_m AS ComponentQuantity, B.CountPerUOM, B.UnitId, B.LayerId, ColorChip_km_m, k.ColorChip
--round(K.JacketUsage_km_m,6) JacketUsage_km_m, round(B.ComponentQuantity,6) ComponentQuantity, g.[Item No]
--, K.JacketMaterial, G.Base, K.OD, K.NominalWall, Volume_m3, Oracle, SpecificGravity, AdditivePercentage, k.Color, G.DateALTERd, k.ColorChip_km_m, k.Color_Chip_Concentration
--INTO #Cable_Jacket_BOM_Usage
FROM dbo.CableUnion G 
INNER JOIN #Cable_BOM_Usage K ON G.Base = K.Base
INNER JOIN dbo.AFLPRD_BOMInvComp_CAB B ON B.AssemblyItemNumber = G.Oracle AND K.JacketMaterial = B.ComponentItemNumber AND G.Color = K.Color
WHERE (ROUND(K.JacketUsage_km_m,6) > ROUND(B.ComponentQuantity,6) * 1.005 or ROUND(K.JacketUsage_km_m,6) < ROUND(B.ComponentQuantity,6) * .995) AND G.Active = 1 
AND( G.Oracle LIKE '%-__IA' OR G.Oracle LIKE '%-00' OR G.Oracle LIKE 'PT%') --and g.base like 'w%'
ORDER BY DateALTERd desc


--Color Chips
SELECT  B.AssemblyItemNumber, B.ItemSeqNumber, B.OperationSeqNumber, B.ComponentItemNumber, G.ColorChip_km_m AS ComponentQuantity, B.CountPerUOM, B.UnitId, B.LayerId, B.ComponentQuantity as BOM
--round(K.ColorChip_km_m,6) ColorChip_km_m, round(B.ComponentQuantity,6) ComponentQuantity
--, K.JacketMaterial, G.Base, K.OD, K.NominalWall, Volume_m3, Oracle, SpecificGravity, AdditivePercentage, k.Color, G.DateALTERd, k.ColorChip_km_m, k.Color_Chip_Concentration
FROM  #Cable_Jacket_BOM_Usage G 
INNER JOIN dbo.AFLPRD_BOMInvComp_CAB B ON B.AssemblyItemNumber = G.AssemblyItemNumber AND G.ColorChip = B.ComponentItemNumber 



GO
