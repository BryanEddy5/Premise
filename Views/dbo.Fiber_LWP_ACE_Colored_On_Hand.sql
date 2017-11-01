SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE VIEW [dbo].[Fiber_LWP_ACE_Colored_On_Hand]
AS
SELECT [Item Number], 
	   CASE WHEN FiberType is null
			THEN 'ACE'
			ELSE FiberType
			END AS FiberType, TotalFiber_km
FROM
(

	SELECT [Item Number], GEO_CLAD_AVG_T as FiberType,sum([Onhand Qty])/1000 AS TotalFiber_km, Org
	  FROM [dbo].[fi_fiber_length_extract_AFLPRD]
	  GROUP BY [Item Number], GEO_CLAD_AVG_T, Org
	  HAVING ([Item Number] like 'FBR00360%' OR [Item Number] like 'FBR00365%') AND org = 'CAB' --and [GEO_CLAD_AVG_T] = 'LWP'
 ) t








GO
