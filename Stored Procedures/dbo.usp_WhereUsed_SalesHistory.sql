SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_WhereUsed_SalesHistory]
as

IF OBJECT_ID(N'tempdb..#ItemWhereUsed', N'U') IS NOT NULL 
DROP TABLE #ItemWhereUsed
SELECT k.ItemNumber, e.AssemblyItemNumber, e.ComponentQuantity
INTO #ItemWhereUsed
FROM dbo.AFLPRD_INVSysItem_CAB K CROSS APPLY 
dbo.fn_WhereUsed(k.ItemNumber) E
WHERE ItemNumber LIKE 'RBN%SW%' AND ItemNumber NOT LIKE '%OSP%'


IF OBJECT_ID(N'tempdb..#FinishedCables', N'U') IS NOT NULL 
DROP TABLE #FinishedCables
SELECT K.AssemblyItemNumber,  sum(k.ComponentQuantity) as Component_Qty, E.BOOKED_DATE AS Date, REVENUE, CASE WHEN E.UNIT_OF_MEASURE = 'FT' THEN QUANTITY / 3.281 ELSE QUANTITY END AS Quantity,
CASE WHEN E.UNIT_OF_MEASURE = 'FT' THEN 'M' ELSE  UNIT_OF_MEASURE END AS UOM, E.ORDER_NUMBER AS SO_NUMBER, E.SO_LINE_NUMBER AS SO_LINE, INVOICE_NUMBER
INTO #FinishedCables
FROM #ItemWhereUsed K INNER JOIN oracle.MarginRevenueExtractSalesHistory E ON E.ITEM_NUMBER = K.AssemblyItemNumber
GROUP BY K.AssemblyItemNumber, E.BOOKED_DATE, REVENUE, Quantity, UNIT_OF_MEASURE, ORDER_NUMBER, SO_LINE_NUMBER, INVOICE_NUMBER

SELECT DISTINCT K.[Item No], G.*
FROM #FinishedCables G INNER JOIN dbo.[Basic Product Construction] K ON G.AssemblyItemNumber = K.[New Oracle Part #]



GO
