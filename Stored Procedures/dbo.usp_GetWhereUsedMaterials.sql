SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/* =============================================
-- Author:		Bryan Eddy
-- ALTER date: 6/22/2017
-- Description:	MRP function to report Customer purchase history with respect to Raw Materials
-- Version:		2
-- Update:		Update to pull sales history from oracle.MarginRevenueExtractSalesHistory
-- ============================================= */
CREATE PROCEDURE [dbo].[usp_GetWhereUsedMaterials]


AS


IF OBJECT_ID(N'tempdb..#TempFG', N'U') IS NOT NULL
drop table #TempFG;
SELECT OracleItem as Material,Component, AssemblyItemNumber, ComponentQuantity, PrimaryUOM, ComponentItemNumber
INTO #TempFG
FROM ##ItemPassToSQL CROSS APPLY fn_WhereUsed(OracleItem)

INSERT INTO #TempFG(Material,Component,AssemblyItemNumber)
SELECT OracleItem, OracleItem, OracleItem
FROM ##ItemPassToSQL

--select * from #TempFG

SELECT Material, AssemblyItemNumber, SUM(ComponentQuantity) AS TotalQuantity--, PrimaryUOM,CategoryName
FROM #TempFG T-- INNER JOIN AFLPRD_INVItmCatg_CAB G ON G.ItemNumber = T.AssemblyItemNumber
GROUP BY  Material, AssemblyItemNumber, PrimaryUOM--,CategorySetName,CategoryName
--HAVING G.CategorySetName = 'PRODUCT CLASS'
ORDER BY Material


IF OBJECT_ID(N'tempdb..##MaterialUsage', N'U') IS NOT NULL
DROP TABLE ##MaterialUsage;

--Shows orders for all FG contianing materials from the queried list.  Also shows where there have been no orders.
SELECT DISTINCT Material, AssemblyItemNumber, ROUND(SUM(ComponentQuantity),6) MaterialQuantity_PerPrimaryUOM--,CategoryName
,ROUND(SUM(ComponentQuantity),7) *CASE WHEN S.UNIT_OF_MEASURE = 'FT' THEN ROUND(S.QUANTITY / 3.281,7) ELSE S.QUANTITY END AS MaterialQuanitty_PerOrder, PrimaryUOM,p.Item_Status
--, CASE WHEN CategoryName like '%premise%' THEN 'Premise' ELSE 'ACS' END BU
, S.BILL_TO_NAME Customer, S.ORDER_NUMBER AS OrderNum,S.PROMISE_DATE AS Shipped
,CASE WHEN S.UNIT_OF_MEASURE = 'FT' THEN ROUND(S.QUANTITY / 3.281,0) ELSE S.QUANTITY END AS Quantity, CASE WHEN S.UNIT_OF_MEASURE = 'FT' THEN 'M' ELSE S.UNIT_OF_MEASURE END as QTY_UOM, s.REVENUE
,p.Description
INTO ##MaterialUsage
FROM #TempFG T --INNER JOIN AFLPRD_INVItmCatg_CAB G ON G.ItemNumber = T.AssemblyItemNumber 
INNER JOIN AFLPRD_INVSysItem_CAB K ON K.ItemNumber = t.AssemblyItemNumber
INNER JOIN AFLPRD_INVSysItemCost_CAB P ON P.ItemNumber = K.ItemNumber
LEFT JOIN oracle.MarginRevenueExtractSalesHistory S ON S.ITEM_NUMBER = K.ItemNumber
GROUP BY  Material, AssemblyItemNumber, PrimaryUOM,--CategorySetName,CategoryName,
TemplateName,Item_Status, S.BILL_TO_NAME, S.ORDER_NUMBER, S.QUANTITY, s.PROMISE_DATE, S.UNIT_OF_MEASURE,s.REVENUE,p.Description
--HAVING shipped like '201[76]%'
ORDER BY Shipped desc



--Shows materials are not located in BOM's
SELECT *
FROM ##ItemPassToSQL M LEFT JOIN #TempFG G ON M.OracleItem = G.Material
INNER JOIN AFLPRD_INVSysItemCost_CAB Cost ON COST.ItemNumber = M.OracleItem
WHERE G.Material IS NULL AND COST.Make_Buy = 'BUY'


--SELECT SHIPPED 
--FROM SalesHistory
--ORDER BY SHIPPED DESC


--select *
--from SalesHistory
--where shipped = '2017-05-12'
--order by shipped desc

--INSERT INTO SalesHistory
--SELECT S.*
--FROM SalesHistory_Temp S LEFT JOIN SalesHistory K ON S.OrderNum = K.OrderNum
--WHERE K.OrderNum IS NULL

GO
