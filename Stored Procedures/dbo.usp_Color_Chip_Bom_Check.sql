SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_Color_Chip_Bom_Check]
as
IF OBJECT_ID(N'tempdb..#Oracle_BOM_ColorChips_No_Match', N'U') IS NOT NULL
DROP TABLE #Oracle_BOM_ColorChips_No_Match

SELECT Oracle, ColorChip, K.Color, g.ComponentItemNumber, AssemblyItemStatus, JacketMaterial
INTO #Oracle_BOM_ColorChips_No_Match
FROM [dbo].[vColor_Chip_OracleItem] K INNER JOIN DBO.AFLPRD_BOMInvComp_CAB G ON K.Oracle = G.AssemblyItemNumber
WHERE ComponentItemNumber LIKE 'CCP%' and colorchip <> ComponentItemNumber AND AssemblyItemStatus = 'Active';
--ORDER BY COLOR, JacketMaterial

IF OBJECT_ID(N'tempdb..#Oracle_BOM_ColorChips', N'U') IS NOT NULL
DROP TABLE #Oracle_BOM_ColorChips
SELECT Oracle, ColorChip, K.Color, g.ComponentItemNumber, AssemblyItemStatus, JacketMaterial
INTO #Oracle_BOM_ColorChips
FROM [dbo].[vColor_Chip_OracleItem] K INNER JOIN DBO.AFLPRD_BOMInvComp_CAB G ON K.Oracle = G.AssemblyItemNumber
WHERE ComponentItemNumber LIKE 'CCP%' and colorchip = ComponentItemNumber AND AssemblyItemStatus = 'Active';
--ORDER BY COLOR, JacketMaterial


--SELECT * FROM #Oracle_BOM_ColorChips_No_Match

SELECT G.Oracle, G.Color, G.ColorChip, G.ItemNo
FROM
(

SELECT *
FROM #Oracle_BOM_ColorChips

UNION ALL

SELECT * FROM #Oracle_BOM_ColorChips_No_Match

)X RIGHT JOIN DBO.CableUnion G ON G.Oracle = X.ORACLE
WHERE X.ORACLE IS NULL AND G.OracleStatus = 'ACTIVE' --AND G.COLOR LIKE '%STR%'
	AND G.colorchip <>'none' AND G.Oracle not like '%-__bx%' AND G.ORACLE NOT LIKE 'PT%'



SELECT G.Oracle, K.DateALTERd, K.[Item No], K.Color, K.ColorChip, G.ComponentItemNumber, G.ColorChip NewColorChip, G.JacketMaterial, ALTERdBy
FROM #Oracle_BOM_ColorChips_No_Match G INNER JOIN dbo.CableUnion K ON k.Oracle = G.Oracle
ORDER BY ComponentItemNumber

GO
