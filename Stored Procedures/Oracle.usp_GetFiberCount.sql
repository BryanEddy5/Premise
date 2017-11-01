SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO







-- =============================================
-- Author:      Bryan Eddy
-- Create date: 8/23/2017
-- Description: Procedure to aggregate the fiber count for all cables
-- =============================================

CREATE PROCEDURE [Oracle].[usp_GetFiberCount]
AS



	SET NOCOUNT ON;
BEGIN

	DELETE FROM Oracle.ItemFiber

	IF OBJECT_ID(N'tempdb..#BomExplode', N'U') IS NOT NULL
	DROP TABLE #BomExplode;
	SELECT E.*
	INTO #BomExplode
	FROM dbo.[Basic Product Construction] G CROSS APPLY dbo.fn_ExplodeBOM(G.[New Oracle Part #]) E

	CREATE INDEX iBomXplode ON #BomExplode (ComponentItemNumber, FinishedGood, ExtendedQuantityPer)

	;WITH cteFiber
	AS(
		SELECT FinishedGood,p.ComponentItemNumber, part, position ,G.Make_Buy, ExtendedQuantityPer
		FROM dbo.AFLPRD_INVSysItemCost_CAB G CROSS APPLY dbo.usf_SplitString(g.[Product Class],'.') 
		INNER JOIN #BomExplode P ON P.ComponentItemNumber = G.ItemNumber
		WHERE  ((part IN ('Fiber'/*,'Ribbon'*/) AND position = 4)  --OR (part ='Bare Ribbon' AND position = 5)
				) AND make_buy = 'buy'
	)
	INSERT INTO Oracle.ItemFiber(ItemNumber,Fiber,FiberCount, FiberMeters)
	SELECT FinishedGood,LEFT(cteFiber.ComponentItemNumber,8),SUM(CAST(ExtendedQuantityPer AS INT)) AS FiberCount, SUM(ExtendedQuantityPer) AS FiberMeters
	FROM cteFiber
	GROUP BY FinishedGood,LEFT(cteFiber.ComponentItemNumber,8)
	ORDER BY FinishedGood

	--INSERT INTO Setup.ItemAttributes(ItemNumber,FiberCount,FiberMeters)
	--SELECT DISTINCT K.item_number, 0,0
	--FROM dbo.Oracle_Items K INNER JOIN dbo.Oracle_BOMs P ON K.item_number = P.item_number
	--LEFT JOIN setup.ItemAttributes G ON K.item_number = G.ItemNumber
	--WHERE G.ItemNumber  IS NULL AND K.make_buy = 'MAKE'
	--ORDER BY item_number


END


GO
