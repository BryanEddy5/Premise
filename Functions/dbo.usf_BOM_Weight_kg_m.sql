SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Bryan Eddy>
-- ALTER date: <10/17/2016>
-- Description:	<Calulate weight of all cables>
-- =============================================
CREATE FUNCTION [dbo].[usf_BOM_Weight_kg_m]
(

-- Input parameters
   @Item varchar(50)
)
returns
@CableWeight table
(
   -- Returned table layout
   Weight decimal(10,4)

)

AS
BEGIN


INSERT INTO @CableWeight
SELECT  Weight_kg_m
FROM
(

		SELECT FinishedGood, SUM(Weight_kg_m) as  Weight_kg_m
	FROM
	(

		SELECT    e.FinishedGood,(e.ExtendedQuantityPer) AS ExtendedQuantityPer,e.[PrimaryUOM], e.ComponentItemNumber,s.Make_Buy,m.density,

			CASE WHEN e.[PrimaryUOM] = 'Meter' THEN
				CASE WHEN e.ComponentItemNumber like 'rbn%sw%' or e.ComponentItemNumber like 'swr%' THEN sum(e.ExtendedQuantityPer)*.000975
					 WHEN e.ComponentItemNumber like 'FBR%' THEN sum(e.ExtendedQuantityPer)*0.000075
					 WHEN  e.ComponentItemNumber  LIKE 'rbn%osp%' 
					 THEN sum(e.ExtendedQuantityPer)*0.000046125*
							 (SELECT cast(substring([Item No],3,3)as int) as FiberCount
							FROM dbo.[Basic Product Construction] as B 
							WHERE b.[New Oracle Part #] = e.ComponentItemNumber) 
						
					ELSE sum(e.ExtendedQuantityPer) * m.Density 
				END
				ELSE sum(e.ExtendedQuantityPer)
			END
			AS Weight_kg_m

		FROM  [dbo].[fn_ExplodeBOM](@Item) AS e 
		INNER JOIN dbo.[AFLPRD_INVSysItemCost_CAB] s ON e.ComponentItemNumber = s.ItemNumber
		LEFT OUTER JOIN [dbo].[tblMaterialWeightsMetersUOM] m ON e.ComponentItemNumber = m.Material
		GROUP BY e.FinishedGood,e.[PrimaryUOM],e.ComponentItemNumber,ExtendedQuantityPer,s.Make_Buy,m.density
				HAVING s.Make_Buy = 'Buy' AND (ComponentItemNumber not like 'rbn%' AND s.Make_Buy = 'Buy')  
		AND e.ComponentItemNumber not like 'RBN%F%' AND e.ComponentItemNumber not like 'RBN%osp%print%' AND e.ComponentItemNumber not like 'Setup%'
		) X
	GROUP BY FinishedGood
	)Y

Return 

END



GO
