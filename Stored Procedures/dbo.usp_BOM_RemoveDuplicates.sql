SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Bryan Eddy>
-- ALTER date: <10/03/2016>
-- Description:	<AFLPRD_BOMInvComp_CAB is updated once a day at 8:00 pm by Oracle to items that had been modified/changed/added during the day.
--				 This script will find the old iterations of items and delete them from the table.>
-- =============================================
CREATE PROCEDURE [dbo].[usp_BOM_RemoveDuplicates] 
as

BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;


	IF OBJECT_ID(N'tempdb..#ItemInsertDate', N'U') IS NOT NULL
	DROP TABLE #ItemInsertDate

	SELECT [AssemblyItemNumber]
	, Datepart(year,DateInserted) + DATEPART(MONTH,DateInserted)  + DATEPART(DAY,DateInserted) + DATEPART(HOUR,DateInserted)  as InsertDate
	INTO #ItemInsertDate
	FROM [dbo].[AFLPRD_BOMInvComp_CAB]
	GROUP BY [AssemblyItemNumber],Datepart(year,DateInserted) + DATEPART(MONTH,DateInserted)  + DATEPART(DAY,DateInserted) + DATEPART(HOUR,DateInserted),DateInserted
	--HAVING assemblyitemnumber like 'PS08662-01%'
	ORDER BY  assemblyitemnumber


	IF OBJECT_ID(N'tempdb..#DuplicateItems', N'U') IS NOT NULL
	DROP TABLE #DuplicateItems

	SELECT [AssemblyItemNumber]
	INTO #DuplicateItems
	FROM #ItemInsertDate
	GROUP BY [AssemblyItemNumber]
	HAVING count(*) >= 2


	--SELECT  K.AssemblyItemNumber, InsertDate, x.AssemblyItemNumber, x.LastEntry, b.ComponentItemNumber, b.AssemblyItemNumber, b.DateInserted
	DELETE B
	FROM #DuplicateItems K INNER JOIN #ItemInsertDate G ON K.AssemblyItemNumber = G.AssemblyItemNumber LEFT JOIN 
	(
		SELECT G.AssemblyItemNumber, MAX(G.InsertDate) LastEntry
		FROM #DuplicateItems k INNER JOIN #ItemInsertDate G ON K.AssemblyItemNumber = G.AssemblyItemNumber
		GROUP BY G.AssemblyItemNumber
	) X ON X.AssemblyItemNumber = G.AssemblyItemNumber AND X.LastEntry = G.InsertDate INNER JOIN [dbo].[AFLPRD_BOMInvComp_CAB] B ON B.AssemblyItemNumber = K.AssemblyItemNumber
	WHERE X.LastEntry IS NULL and Datepart(year,b.DateInserted) + DATEPART(MONTH,b.DateInserted)  + DATEPART(DAY,b.DateInserted) + DATEPART(HOUR,b.DateInserted) = InsertDate
	--ORDER BY  b.DateInserted,K.AssemblyItemNumber

	--SELECT *, Datepart(year,DateInserted) + DATEPART(MONTH,DateInserted)  + DATEPART(DAY,DateInserted) + DATEPART(HOUR,DateInserted)+ DATEPART(MINUTE,DateInserted)  as InsertDate 
	--FROM [dbo].[AFLPRD_BOMInvComp_CAB_Temp]
	----WHERE AssemblyItemNumber = 'PW01806-00'
	--ORDER BY DateInserted, ItemSeqNumber

	--select OrganizationCode, COUNT(*)
	--FROM [dbo].[AFLPRD_BOMInvComp_CAB_Temp] 
	--group by OrganizationCode

END



GO
