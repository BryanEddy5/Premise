SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/* =============================================
-- Author:		Bryan Eddy
-- ALTER date: 6/22/2017
-- Description:	MRP function to report Customer purchase history with respect to Raw Materials
-- 
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

SELECT Material, AssemblyItemNumber, sum(ComponentQuantity) as TotalQuantity--, PrimaryUOM,CategoryName
FROM #TempFG T-- INNER JOIN AFLPRD_INVItmCatg_CAB G ON G.ItemNumber = T.AssemblyItemNumber
GROUP BY  Material, AssemblyItemNumber, PrimaryUOM--,CategorySetName,CategoryName
--HAVING G.CategorySetName = 'PRODUCT CLASS'
ORDER BY Material


IF OBJECT_ID(N'tempdb..##MaterialUsage', N'U') IS NOT NULL
drop table ##MaterialUsage;

--Shows orders for all FG contianing materials from the queried list.  Also shows where there have been no orders.
SELECT DISTINCT Material, AssemblyItemNumber, round(sum(ComponentQuantity),6) MaterialQuantity_PerPrimaryUOM--,CategoryName
,round(sum(ComponentQuantity),3) *CASE WHEN S.UOM = 'FT' THEN ROUND(S.QUANTITY / 3.281,0) ELSE S.QUANTITY END as MaterialQuanitty_PerOrder, PrimaryUOM,p.Item_Status
--, CASE WHEN CategoryName like '%premise%' THEN 'Premise' ELSE 'ACS' END BU
, S.Customer, S.SO_NUMBER as OrderNum,s.DATE as Shipped
,CASE WHEN S.UOM = 'FT' THEN ROUND(S.QUANTITY / 3.281,0) ELSE S.QUANTITY END as Quantity, CASE WHEN S.UOM = 'FT' THEN 'M' ELSE S.UOM END as QTY_UOM, s.REVENUE
INTO ##MaterialUsage
FROM #TempFG T --INNER JOIN AFLPRD_INVItmCatg_CAB G ON G.ItemNumber = T.AssemblyItemNumber 
INNER JOIN AFLPRD_INVSysItem_CAB K ON K.ItemNumber = t.AssemblyItemNumber
INNER JOIN AFLPRD_INVSysItemCost_CAB P ON P.ItemNumber = K.ItemNumber
LEFT JOIN [SalesHistory_BI_Data] S ON S.ITEM_NUMBER = K.ItemNumber
GROUP BY  Material, AssemblyItemNumber, PrimaryUOM,--CategorySetName,CategoryName,
TemplateName,Item_Status, S.Customer, S.SO_NUMBER, S.QUANTITY, s.DATE, S.UOM,s.REVENUE
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
