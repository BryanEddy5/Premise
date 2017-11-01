SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		<Bryan Eddy>
-- ALTER date: <8/18/2016>
-- Description:	<Explodes all levels of BOM and aggregates weight by level>
-- =============================================
CREATE PROCEDURE [dbo].[GetExplodedBOMCost](
	-- Add the parameters for the stored procedure here
	 @Item varchar(50)
	--, @Weight decimal(16,8) OUTPUT
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

--declare @Item as nvarchar(50) = 'PG02328-10IA'


IF OBJECT_ID(N'tempdb..#TempBomExplode', N'U') IS NOT NULL
DROP TABLE dbo.#TempBomExplode;
	

		SELECT ComponentItemNumber, BomLevel, (SUM(Weight_kg_m) * 1000) as Weight,
	CASE WHEN (SUM(Weight_kg_m) * 1000) < 10 THEN ROUND(SUM(Weight_kg_m) * 1000,1)
		WHEN (SUM(Weight_kg_m) * 1000) BETWEEN 10 AND 100 THEN ROUND(SUM(Weight_kg_m) * 1000,0) 
		WHEN (SUM(Weight_kg_m) * 1000) > 100 THEN ROUND(SUM(Weight_kg_m)*1000/5,0)*5
	END as Weight_kg_km			 
	, round(Item_Cost * sum(Total_Usage) * 1000,3) as ItemCost_km
	,  Item_Cost * sum(Total_Usage)/sum(Item_Cost * sum(Total_Usage))  OVER (Partition by  FinishedGood) *100 as Cost_Ratio
	 , sum(Item_Cost * sum(Total_Usage)) OVER (PARTITION BY FinishedGood) *1000 Total_Cost_km
	,AssemblyItemNumber, FinishedGood
	INTO #TempBomExplode
	FROM
	(



		SELECT    e.FinishedGood,e.ComponentItemNumber,(e.ExtendedQuantityPer) AS ExtendedQuantityPer,e.[PrimaryUOM],s.Make_Buy,m.density,e.bomlevel, s.Item_Cost,sum(e.ExtendedQuantityPer) as Total_Usage,		
			
			CASE WHEN AssemblyItemNumber like 'pt%' then left(AssemblyItemNumber,7)
						WHEN AssemblyItemNumber like 'fbr%' then left(AssemblyItemNumber,8)
						--WHEN AssemblyItemNumber like 'pe%' then 'Subunits'
						--WHEN AssemblyItemNumber like 'pm%' then 'UJCM'
						else AssemblyItemNumber
				END AS AssemblyItemNumber,

			CASE WHEN e.[PrimaryUOM] = 'Meter' THEN
				CASE WHEN e.ComponentItemNumber like 'rbn%sw%' or e.ComponentItemNumber like 'swr%' THEN sum(e.ExtendedQuantityPer)*.000975
					 WHEN e.ComponentItemNumber like 'FBR%' THEN sum(e.ExtendedQuantityPer)*0.000075
					 WHEN  e.ComponentItemNumber  LIKE 'rbn%osp%' 
					 THEN sum(e.ExtendedQuantityPer)*0.000046125*
							 (SELECT cast(substring([Item No],3,3)as int) as FiberCount
							FROM dbo.[Basic Product Construction] as B 
							WHERE b.[New Oracle Part #] = e.ComponentItemNumber) 
						
					ELSE sum(e.ExtendedQuantityPer) * (CASE WHEN m.Density IS NULL THEN 0 ELSE m.Density END)
				END
				ELSE sum(e.ExtendedQuantityPer)
			END
			AS Weight_kg_m

		FROM  [dbo].fn_ExplodeBOM(@Item) AS e 
		INNER JOIN dbo.[AFLPRD_INVSysItemCost_CAB] s ON e.ComponentItemNumber = s.ItemNumber
		LEFT OUTER JOIN [dbo].[tblMaterialWeightsMetersUOM] m ON e.ComponentItemNumber = m.Material
		GROUP BY e.[PrimaryUOM],e.ComponentItemNumber,ExtendedQuantityPer,s.Make_Buy,m.density, e.bomlevel,s.Item_Cost, e.FinishedGood,AssemblyItemNumber
				HAVING s.Make_Buy = 'Buy' --AND (ComponentItemNumber not like 'rbn%' AND s.Make_Buy = 'Buy')  
		--AND e.ComponentItemNumber not like 'RBN%F%' AND e.ComponentItemNumber not like 'RBN%osp%print%' AND e.ComponentItemNumber not like 'Setup%'
		) X
	GROUP BY BomLevel, ComponentItemNumber, FinishedGood,AssemblyItemNumber, Item_Cost

	select * 
	from #TempBomExplode
	where ItemCost_km <>0
END



GO
