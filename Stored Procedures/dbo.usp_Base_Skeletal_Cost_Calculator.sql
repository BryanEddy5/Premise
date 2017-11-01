SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[usp_Base_Skeletal_Cost_Calculator]
as

BEGIN

IF OBJECT_ID(N'dbo.tblBase_Skeletal_Cost', N'U') IS NOT NULL
DROP TABLE dbo.tblBase_Skeletal_Cost


Select Base, sum(MaterialCost) as BaseSkeletalCost, AssemblyItemNumber, sum(MaterialCost) as LoadedBaseCost, SetupID
INTO dbo.tblBase_Skeletal_Cost
FROM
(
	select d.AssemblyItemNumber,e.ComponentItemNumber,sum(e.ExtendedQuantityPer) as ExtendedQuantityPer,e.[PrimaryUOM],s.Make_Buy , sum(e.UnitCost) as MaterialCost,  d.base, SetupID
	from  [dbo].vOracleBaseItems as d CROSS APPLY [dbo].[fn_ExplodeBOM](D.AssemblyItemNumber) as e INNER JOIN [dbo].[AFLPRD_INVSysItemCost_CAB] as S ON e.ComponentItemNumber = s.ItemNumber
	group by  e.ComponentItemNumber,d.AssemblyItemNumber,e.[PrimaryUOM],s.Make_Buy , e.UnitCost, d.base, SetupID
	HAVING s.Make_Buy = 'buy' AND not (e.ComponentItemNumber like 'fbr%' or e.ComponentItemNumber like 'rbn%' or e.ComponentItemNumber like 'swr%')  
			--(e.ComponentItemNumber  like 'rbn%' AND e.ComponentItemNumber  like '%osp%' and e.ComponentItemNumber  like '%rbn%f%')))
			--OR  (e.ComponentItemNumber like 'swr%' AND e.ComponentItemNumber  LIKE  '%osp%'))
	--having s.make_buy = 'buy' and base = 'GQ048-3.0-SW'
)X 	GROUP BY X.BASE, x.AssemblyItemNumber, X.SetupID

UPDATE dbo.tblBase_Skeletal_Cost
SET LoadedBaseCost = g.Resource_Cost + g.Overhead_Cost + BaseSkeletalCost
FROM dbo.tblBase_Skeletal_Cost X INNER JOIN  dbo.AFLPRD_INVSysItemCost_CAB G ON G.ItemNumber = X.AssemblyItemNumber





END





GO
