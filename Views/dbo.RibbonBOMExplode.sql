SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO








CREATE VIEW [dbo].[RibbonBOMExplode]
AS
select d.AssemblyItemNumber,e.ComponentItemNumber,round(sum(e.ExtendedQuantityPer),0) as ExtendedQuantityPer,e.[PrimaryUOM]
from  [dbo].tblRibbonBOMItems as d CROSS APPLY [dbo].[fn_ExplodeBOM](d.AssemblyItemNumber) as e 
group by  e.ComponentItemNumber,d.AssemblyItemNumber,e.[PrimaryUOM]
HAVING e.ComponentItemNumber like 'rbn%' and e.ComponentItemNumber not like '%osp%' and e.ComponentItemNumber not like '%rbn%f%' AND e.ComponentItemNumber  not like '%sw%'--and s.Make_Buy = 'make'

UNION ALL

SELECT AssemblyItemNumber, AssemblyItemNumber, 1, 'Meter'
FROM [dbo].tblRibbonBOMItems K INNER JOIN AFLPRD_INVSysItemCost_CAB G ON K.AssemblyItemNumber = G.ItemNumber
WHERE ItemNumber LIKE 'RBN%'











GO
