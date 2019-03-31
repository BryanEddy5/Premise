SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [Schedule].[vGanttMaterials]
AS
	SELECT i.ID, K.ComponentItemNumber Material, CAST(ROUND(K.ComponentQuantity * i.[Length Meters],2) AS NUMERIC(32,2)) MaterialQty, K.PrimaryUOM MaterialUom
	FROM dbo.[Temp (Premise Load)] i
	INNER JOIN dbo.AFLPRD_BOMInvComp_CAB K ON i.[Item number] = k.AssemblyItemNumber
	INNER JOIN dbo.AFLPRD_INVSysItemSpec_CAB S ON K.ComponentItemNumber = s.ItemNumber
	WHERE S.SpecificationElement IN ('MATERIAL TYPE') AND S.TargetValue IN ('COLOR CHIPS', 'COMPOUND')



GO
