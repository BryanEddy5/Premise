SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 12/2/2016
-- Description:	Insert new base costs into tblBase_Skeletal_Cost
-- =============================================
CREATE PROCEDURE [dbo].[usp_CatalogCode_SalesForce_NonArmored_Costing_InsertNewBase]
AS
BEGIN



INSERT INTO  dbo.tblBase_Skeletal_Cost( Base, BaseSkeletalCost, AssemblyItemNumber, LoadedBaseCost, SetupID)

Select Base, sum(MaterialCost) as BaseSkeletalCost, AssemblyItemNumber, sum(MaterialCost) as LoadedBaseCost, SetupID

FROM
(
	SELECT d.AssemblyItemNumber,e.ComponentItemNumber,sum(e.ExtendedQuantityPer) as ExtendedQuantityPer,e.[PrimaryUOM],s.Make_Buy , sum(e.UnitCost) as MaterialCost,  d.base, D.SetupID
	FROM  [dbo].vOracleBaseItems as d CROSS APPLY [dbo].[fn_ExplodeBOM](D.AssemblyItemNumber) as e 
	INNER JOIN [dbo].[AFLPRD_INVSysItemCost_CAB] as S ON e.ComponentItemNumber = s.ItemNumber LEFT JOIN dbo.tblBase_Skeletal_Cost G ON G.SetupID = D.SetupID
	GROUP BY  e.ComponentItemNumber,d.AssemblyItemNumber,e.[PrimaryUOM],s.Make_Buy , e.UnitCost, d.base, D.SetupID,G.SetupID
	HAVING s.Make_Buy = 'buy' AND not (e.ComponentItemNumber like 'fbr%' or e.ComponentItemNumber like 'rbn%' or e.ComponentItemNumber like 'swr%' or e.ComponentItemNumber like 'frc%')  
			AND G.SetupID IS NULL
			--(e.ComponentItemNumber  like 'rbn%' AND e.ComponentItemNumber  like '%osp%' and e.ComponentItemNumber  like '%rbn%f%')))
			--OR  (e.ComponentItemNumber like 'swr%' AND e.ComponentItemNumber  LIKE  '%osp%'))
	--having s.make_buy = 'buy' and base = 'GQ048-3.0-SW'
)X 
GROUP BY X.BASE, x.AssemblyItemNumber, X.SetupID 

UPDATE dbo.tblBase_Skeletal_Cost
SET LoadedBaseCost = g.Resource_Cost + g.Overhead_Cost + BaseSkeletalCost
FROM dbo.tblBase_Skeletal_Cost X INNER JOIN  dbo.AFLPRD_INVSysItemCost_CAB G ON G.ItemNumber = X.AssemblyItemNumber



END

GO
