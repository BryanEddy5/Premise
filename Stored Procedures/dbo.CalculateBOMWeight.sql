SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Bryan Eddy>
-- ALTER date: <7/14/2016>
-- Description:	<Calulates the weight of a cable>
-- =============================================
CREATE PROCEDURE [dbo].[CalculateBOMWeight](
	-- Add the parameters for the stored procedure here
	 @Item varchar(50),
	 @Weight decimal(16,8) OUTPUT
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


SELECT @Weight = Weight_kg_km
FROM
(

		SELECT FinishedGood, (SUM(Weight_kg_m) * 1000) as Weight,
	CASE WHEN (SUM(Weight_kg_m) * 1000) < 10 THEN ROUND(SUM(Weight_kg_m) * 1000,1)
		WHEN (SUM(Weight_kg_m) * 1000) BETWEEN 10 AND 100 THEN ROUND(SUM(Weight_kg_m) * 1000,0) 
		WHEN (SUM(Weight_kg_m) * 1000) > 100 THEN ROUND(SUM(Weight_kg_m)*1000/5,0)*5
	END						 
	AS Weight_kg_km
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

		FROM  [dbo].[fn_ExplodeBOM](@ITEM) AS e 
		INNER JOIN dbo.[AFLPRD_INVSysItemCost_CAB] s ON e.ComponentItemNumber = s.ItemNumber
		LEFT OUTER JOIN [dbo].[tblMaterialWeightsMetersUOM] m ON e.ComponentItemNumber = m.Material
		GROUP BY e.FinishedGood,e.[PrimaryUOM],e.ComponentItemNumber,ExtendedQuantityPer,s.Make_Buy,m.density
				HAVING s.Make_Buy = 'Buy' AND (ComponentItemNumber not like 'rbn%' AND s.Make_Buy = 'Buy')  
		AND e.ComponentItemNumber not like 'RBN%F%' AND e.ComponentItemNumber not like 'RBN%osp%print%' AND e.ComponentItemNumber not like 'Setup%'
		) X
	GROUP BY FinishedGood
	)Y

END



GO
GRANT EXECUTE ON  [dbo].[CalculateBOMWeight] TO [SPB spb_PREMISE]
GO
