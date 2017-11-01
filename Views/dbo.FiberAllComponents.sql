SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [dbo].[FiberAllComponents]
AS
select d.Oracle,e.ComponentItemNumber,sum(e.ExtendedQuantityPer) as ExtendedQuantityPer,e.[PrimaryUOM] 
from  [dbo].CableUnion as d CROSS APPLY [dbo].[fn_ExplodeBOM](d.Oracle) as e 
group by  e.ComponentItemNumber,d.Oracle,e.[PrimaryUOM] 
HAVING  e.ComponentItemNumber like 'fbr%'
		









GO
