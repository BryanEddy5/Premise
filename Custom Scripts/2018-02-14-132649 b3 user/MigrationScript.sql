/*
This migration script replaces uncommitted changes made to these objects:
Premise_Cable_Shipments
usp_Order_History_Update_Premise_Cable_Shipments

Use this script to make necessary schema and data changes for these objects only. Schema changes to any other objects won't be deployed.

Schema changes and migration scripts are deployed in the order they're committed.

Migration scripts must not reference static data. When you deploy migration scripts alongside static data 
changes, the migration scripts will run first. This can cause the deployment to fail. 
Read more at https://documentation.red-gate.com/display/SOC6/Static+data+and+migrations.
*/

SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Dropping constraints from [dbo].[Premise_Cable_Shipments]'
GO
ALTER TABLE [dbo].[Premise_Cable_Shipments] DROP CONSTRAINT [PK_Premise_Cable_Shipments]
GO
PRINT N'Dropping [dbo].[Premise_Cable_Shipments]'
GO
DROP TABLE [dbo].[Premise_Cable_Shipments]
GO
PRINT N'Altering [dbo].[usp_Order_History_Update_Premise_Cable_Shipments]'
GO

/*
Author:			Bryan Eddy
Date:			1/12/2017
Desc:			Update the Sales History table for reporting ( Oracle.MarginRevenueExtractSalesHistory)
Version:		1
Update:			Updated criteria for deleting and updating information


*/

ALTER PROCEDURE [dbo].[usp_Order_History_Update_Premise_Cable_Shipments]
AS

DELETE FROM Oracle.MarginRevenueExtractSalesHistory
FROM            rp_revenue_margin_extract_POBI_CAB INNER JOIN
                         Oracle.MarginRevenueExtractSalesHistory ON rp_revenue_margin_extract_POBI_CAB.ORDER_NUMBER = Oracle.MarginRevenueExtractSalesHistory.ORDER_NUMBER and
                         rp_revenue_margin_extract_POBI_CAB.SO_LINE_NUMBER = Oracle.MarginRevenueExtractSalesHistory.SO_LINE_NUMBER AND 
						 MarginRevenueExtractSalesHistory.ORG_CODE = rp_revenue_margin_extract_POBI_CAB.ORG_CODE 

				

INSERT INTO Oracle.MarginRevenueExtractSalesHistory
                         (BUSINESS_UNIT, TRANSACTION_TYPE, ORDER_NUMBER, SO_LINE_NUMBER, INVOICE_NUMBER, INV_LINE_NUMBER, TRANSACTION_DATE, 
                         TRANSACTION_PERIOD, ITEM_NUMBER, ITEM_DESCRIPTION, BILL_TO_NUMBER, BILL_TO_CLASS, BILL_TO_CATEGORY, BILL_TO_NAME, BILL_TO_STATE, 
                         BILL_TO_COUNTRY, BILL_TO_POSTAL_CODE, SHIP_TO_NUMBER, SHIP_TO_CLASS, SHIP_TO_TERRITORY, SHIP_TO_NAME, SHIP_TO_STATE, 
                         SHIP_TO_COUNTRY, SHIP_TO_POSTAL_CODE, UNIT_OF_MEASURE, REVENUE, QUANTITY, CATEGORY1, CATEGORY2, CATEGORY3, CATEGORY4, CATEGORY5, 
                         CURR_MATERIAL_COST, CURR_RESOURCE_COST, CURR_OVERHEAD_COST, CURR_OUTSIDE_PROCESSING_COST, ACTUAL_MATERIAL_COST, 
                         ACTUAL_RESOURCE_COST, ACTUAL_OVERHEAD_COST, ACTUAL_OUTSIDE_PROCESSING_COST, SCHEDULING_APPROVAL, AGENT, AFL_ACCOUNT, 
                         AFL_NATIONAL, INSIDE_SALES, PURCHASE_ORDER, EXTRACT_DATE, BOOKED_DATE, SCHEDULE_PERIOD, SALES_CHANNEL, REQUEST_DATE, PROMISE_DATE, 
                         ORDER_TYPE, PARTIAL_ALLOWED, RESERVATION_FLAG, SHIP_TO_CITY, FOB_CODE, FREIGHT_TERMS_CODE, HOLD_FLAG, MULTI_ORG_SHIP_SET, 
                         MAKE_BUY_CODE, SHIP_SET_NUMBER, SO_LINE_FREIGHT_CARRIER, SCHEDULE_APPROVAL_DATE, SO_LINE_CREATE_DATE, QTY_IN_LBS, CUSTOMER_UOM, 
                         SPECIFICATION, QUOTE_NUMBER, NEW_PRODUCT, NEW_PRODUCT_CATEGORY, ACTUAL_COST_UPDATE_DATE, PRIMARY_QUANTITY, PRIMARY_UOM_CODE, 
                         INVOICE_SOURCE, QUOTE_TYPE, DATA_SOURCE, NEW_PRODUCT_TYPE, COMMENTS, CURR_MATERIAL_OVERHEAD_COST, 
                         ACTUAL_MATERIAL_OVERHEAD_COST, FORECAST_DESCRIPTION, FORECAST_DESIGNATOR, ORG_CODE)
SELECT        rp_revenue_margin_extract_POBI_CAB.BUSINESS_UNIT, rp_revenue_margin_extract_POBI_CAB.TRANSACTION_TYPE, 
                         rp_revenue_margin_extract_POBI_CAB.ORDER_NUMBER, rp_revenue_margin_extract_POBI_CAB.SO_LINE_NUMBER, 
                         rp_revenue_margin_extract_POBI_CAB.INVOICE_NUMBER, rp_revenue_margin_extract_POBI_CAB.INV_LINE_NUMBER, 
                         rp_revenue_margin_extract_POBI_CAB.TRANSACTION_DATE, rp_revenue_margin_extract_POBI_CAB.TRANSACTION_PERIOD, 
                         rp_revenue_margin_extract_POBI_CAB.ITEM_NUMBER, rp_revenue_margin_extract_POBI_CAB.ITEM_DESCRIPTION, 
                         rp_revenue_margin_extract_POBI_CAB.BILL_TO_NUMBER, rp_revenue_margin_extract_POBI_CAB.BILL_TO_CLASS, 
                         rp_revenue_margin_extract_POBI_CAB.BILL_TO_CATEGORY, rp_revenue_margin_extract_POBI_CAB.BILL_TO_NAME, 
                         rp_revenue_margin_extract_POBI_CAB.BILL_TO_STATE, rp_revenue_margin_extract_POBI_CAB.BILL_TO_COUNTRY, 
                         rp_revenue_margin_extract_POBI_CAB.BILL_TO_POSTAL_CODE, rp_revenue_margin_extract_POBI_CAB.SHIP_TO_NUMBER, 
                         rp_revenue_margin_extract_POBI_CAB.SHIP_TO_CLASS, rp_revenue_margin_extract_POBI_CAB.SHIP_TO_TERRITORY, 
                         rp_revenue_margin_extract_POBI_CAB.SHIP_TO_NAME, rp_revenue_margin_extract_POBI_CAB.SHIP_TO_STATE, 
                         rp_revenue_margin_extract_POBI_CAB.SHIP_TO_COUNTRY, rp_revenue_margin_extract_POBI_CAB.SHIP_TO_POSTAL_CODE, 
                         rp_revenue_margin_extract_POBI_CAB.UNIT_OF_MEASURE, rp_revenue_margin_extract_POBI_CAB.REVENUE, rp_revenue_margin_extract_POBI_CAB.QUANTITY, 
                         rp_revenue_margin_extract_POBI_CAB.CATEGORY1, rp_revenue_margin_extract_POBI_CAB.CATEGORY2, rp_revenue_margin_extract_POBI_CAB.CATEGORY3, 
                         rp_revenue_margin_extract_POBI_CAB.CATEGORY4, rp_revenue_margin_extract_POBI_CAB.CATEGORY5, 
                         rp_revenue_margin_extract_POBI_CAB.CURR_MATERIAL_COST, rp_revenue_margin_extract_POBI_CAB.CURR_RESOURCE_COST, 
                         rp_revenue_margin_extract_POBI_CAB.CURR_OVERHEAD_COST, rp_revenue_margin_extract_POBI_CAB.CURR_OUTSIDE_PROCESSING_COST, 
                         rp_revenue_margin_extract_POBI_CAB.ACTUAL_MATERIAL_COST, rp_revenue_margin_extract_POBI_CAB.ACTUAL_RESOURCE_COST, 
                         rp_revenue_margin_extract_POBI_CAB.ACTUAL_OVERHEAD_COST, rp_revenue_margin_extract_POBI_CAB.ACTUAL_OUTSIDE_PROCESSING_COST, 
                         rp_revenue_margin_extract_POBI_CAB.SCHEDULING_APPROVAL, rp_revenue_margin_extract_POBI_CAB.AGENT, 
                         rp_revenue_margin_extract_POBI_CAB.AFL_ACCOUNT, rp_revenue_margin_extract_POBI_CAB.AFL_NATIONAL, 
                         rp_revenue_margin_extract_POBI_CAB.INSIDE_SALES, rp_revenue_margin_extract_POBI_CAB.PURCHASE_ORDER, 
                         rp_revenue_margin_extract_POBI_CAB.EXTRACT_DATE, rp_revenue_margin_extract_POBI_CAB.BOOKED_DATE, 
                         rp_revenue_margin_extract_POBI_CAB.SCHEDULE_PERIOD, rp_revenue_margin_extract_POBI_CAB.SALES_CHANNEL, 
                         rp_revenue_margin_extract_POBI_CAB.REQUEST_DATE, rp_revenue_margin_extract_POBI_CAB.PROMISE_DATE, 
                         rp_revenue_margin_extract_POBI_CAB.ORDER_TYPE, rp_revenue_margin_extract_POBI_CAB.PARTIAL_ALLOWED, 
                         rp_revenue_margin_extract_POBI_CAB.RESERVATION_FLAG, rp_revenue_margin_extract_POBI_CAB.SHIP_TO_CITY, 
                         rp_revenue_margin_extract_POBI_CAB.FOB_CODE, rp_revenue_margin_extract_POBI_CAB.FREIGHT_TERMS_CODE, 
                         rp_revenue_margin_extract_POBI_CAB.HOLD_FLAG, rp_revenue_margin_extract_POBI_CAB.MULTI_ORG_SHIP_SET, 
                         rp_revenue_margin_extract_POBI_CAB.MAKE_BUY_CODE, rp_revenue_margin_extract_POBI_CAB.SHIP_SET_NUMBER, 
                         rp_revenue_margin_extract_POBI_CAB.SO_LINE_FREIGHT_CARRIER, rp_revenue_margin_extract_POBI_CAB.SCHEDULE_APPROVAL_DATE, 
                         rp_revenue_margin_extract_POBI_CAB.SO_LINE_CREATE_DATE, rp_revenue_margin_extract_POBI_CAB.QTY_IN_LBS, 
                         rp_revenue_margin_extract_POBI_CAB.CUSTOMER_UOM, rp_revenue_margin_extract_POBI_CAB.SPECIFICATION, 
                         rp_revenue_margin_extract_POBI_CAB.QUOTE_NUMBER, rp_revenue_margin_extract_POBI_CAB.NEW_PRODUCT, 
                         rp_revenue_margin_extract_POBI_CAB.NEW_PRODUCT_CATEGORY, rp_revenue_margin_extract_POBI_CAB.ACTUAL_COST_UPDATE_DATE, 
                         rp_revenue_margin_extract_POBI_CAB.PRIMARY_QUANTITY, rp_revenue_margin_extract_POBI_CAB.PRIMARY_UOM_CODE, 
                         rp_revenue_margin_extract_POBI_CAB.INVOICE_SOURCE, rp_revenue_margin_extract_POBI_CAB.QUOTE_TYPE, 
                         rp_revenue_margin_extract_POBI_CAB.DATA_SOURCE, rp_revenue_margin_extract_POBI_CAB.NEW_PRODUCT_TYPE, 
                         rp_revenue_margin_extract_POBI_CAB.COMMENTS, rp_revenue_margin_extract_POBI_CAB.CURR_MATERIAL_OVERHEAD_COST, 
                         rp_revenue_margin_extract_POBI_CAB.ACTUAL_MATERIAL_OVERHEAD_COST, rp_revenue_margin_extract_POBI_CAB.FORECAST_DESCRIPTION, 
                         rp_revenue_margin_extract_POBI_CAB.FORECAST_DESIGNATOR, rp_revenue_margin_extract_POBI_CAB.ORG_CODE
FROM            rp_revenue_margin_extract_POBI_CAB LEFT OUTER JOIN
                         Oracle.MarginRevenueExtractSalesHistory AS Premise_Cable_Shipments_1 ON 
                         rp_revenue_margin_extract_POBI_CAB.ORDER_NUMBER = Premise_Cable_Shipments_1.ORDER_NUMBER AND 
                         rp_revenue_margin_extract_POBI_CAB.SO_LINE_NUMBER = Premise_Cable_Shipments_1.SO_LINE_NUMBER AND 
                         rp_revenue_margin_extract_POBI_CAB.INVOICE_NUMBER = Premise_Cable_Shipments_1.INVOICE_NUMBER AND 
                         rp_revenue_margin_extract_POBI_CAB.INV_LINE_NUMBER = Premise_Cable_Shipments_1.INV_LINE_NUMBER AND
                         Premise_Cable_Shipments_1.ORG_CODE = rp_revenue_margin_extract_POBI_CAB.ORG_CODE
WHERE        (rp_revenue_margin_extract_POBI_CAB.ORDER_NUMBER IS NOT NULL AND rp_revenue_margin_extract_POBI_CAB.SO_LINE_NUMBER IS NOT NULL AND 
                         rp_revenue_margin_extract_POBI_CAB.INVOICE_NUMBER IS NOT NULL AND rp_revenue_margin_extract_POBI_CAB.INV_LINE_NUMBER IS NOT NULL)
						  AND  (Premise_Cable_Shipments_1.ORDER_NUMBER IS NULL AND Premise_Cable_Shipments_1.SO_LINE_NUMBER IS NULL AND 
                         Premise_Cable_Shipments_1.INVOICE_NUMBER IS NULL AND Premise_Cable_Shipments_1.INV_LINE_NUMBER IS NULL) 
						 AND rp_revenue_margin_extract_POBI_CAB.ORDER_NUMBER IS NOT NULL AND rp_revenue_margin_extract_POBI_CAB.SO_LINE_NUMBER IS NOT null


GO

