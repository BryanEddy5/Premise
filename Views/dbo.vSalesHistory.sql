SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
Author:		Bryan Eddy
Desc:		Show sales history to various applications
Date:		1/23/2018
Version:	2
Update:		1. Updated table to pull data from SalesHistory_BI_Data to Oracle.MarginRevenueExtractSalesHistory (Margin extract from Oracle)
			2. Found that MarginRevenueExtractSalesHistory has duplicates due to differing CURR_MATERIAL_COST.  Logic put in to place to remove duplicates
				Also updated the to aggregate information by SO_Line_NUMBER

*/

/* TO DO : Aggregate by So Line*/
CREATE VIEW [dbo].[vSalesHistory]
AS
WITH cteSales
AS(
	SELECT DISTINCT TRANSACTION_DATE AS DATE, BILL_TO_NAME AS CUSTOMER, ITEM_NUMBER, ITEM_DESCRIPTION,ORDER_NUMBER AS SO_NUMBER,REVENUE, SO_LINE_NUMBER
	,PRIMARY_QUANTITY AS QUANTITY
	, PRIMARY_UOM_CODE AS UOM
	,CURR_MATERIAL_COST, CURR_RESOURCE_COST, CURR_OVERHEAD_COST
	, ROW_NUMBER() OVER (PARTITION BY TRANSACTION_DATE ,  BILL_TO_NAME, ITEM_NUMBER, ITEM_DESCRIPTION,ORDER_NUMBER ,REVENUE, SO_LINE_NUMBER
	,PRIMARY_QUANTITY , PRIMARY_UOM_CODE , CURR_RESOURCE_COST, CURR_OVERHEAD_COST ORDER BY CURR_MATERIAL_COST) AS RowNumber
	FROM Oracle.MarginRevenueExtractSalesHistory
) 
--,cteNormalizedSalesHistory
--AS(
	SELECT *,  CASE WHEN QUANTITY <> 0 THEN ROUND(REVENUE/QUANTITY,5)  ELSE 0 END PricePerUOM
	FROM cteSales k 
	WHERE  k.RowNumber = 1
--)
--SELECT SUM(S.REVENUE) REVENUE, SUM(S.QUANTITY) QUANTITY, SUM(S.CURR_MATERIAL_COST) CURR_MATERIAL_COST, SUM(S.CURR_RESOURCE_COST) CURR_RESOURCE_COST, SUM(S.CURR_OVERHEAD_COST) CURR_OVERHEAD_COST
--,S.DATE, S.CUSTOMER, S.ITEM_NUMBER,S.ITEM_DESCRIPTION,S.SO_NUMBER,S.SO_LINE_NUMBER,S.UOM,S.PricePerUOM
--FROM cteNormalizedSalesHistory S
--GROUP BY S.DATE, S.CUSTOMER, S.ITEM_NUMBER,S.ITEM_DESCRIPTION,S.SO_NUMBER,S.SO_LINE_NUMBER,S.UOM,S.PricePerUOM


GO
