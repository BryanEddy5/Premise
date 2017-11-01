SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO










CREATE VIEW [dbo].[Fiber_LWP_ACE_Total_on_Hand]
AS

SELECT CASE WHEN GEO_CLAD_AVG_T is null
			THEN 'ACE'
			ELSE GEO_CLAD_AVG_T
			END AS FiberType, sum(TotalFiber_m)/1000 as Fiber_km
FROM
(
	SELECT [Item Number], GEO_CLAD_AVG_T,sum([Onhand Qty]) AS TotalFiber_m, Org
	  FROM [dbo].[fi_fiber_length_extract_AFLPRD]
	  GROUP BY [Item Number], GEO_CLAD_AVG_T, Org
	  HAVING ([Item Number] like 'FBR00360%' OR [Item Number] like 'FBR00365%') AND org = 'CAB' --and [GEO_CLAD_AVG_T] = 'LWP'
	  ) t
GROUP BY GEO_CLAD_AVG_T





GO
