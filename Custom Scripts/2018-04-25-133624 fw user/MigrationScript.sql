/*
This migration script replaces uncommitted changes made to these objects:
tblColors_Available
tblItemBuildDescrepancyLog
usp_EmailInactiveItemsOnSchedule
usp_CutSheet_Email_Reminder
usp_GetWhereUsedMaterials
usp_Order_History_Update_Premise_Cable_Shipments
vBurnListingLengthRequirement
vFillersActive
vSalesHistory

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
PRINT N'Dropping foreign keys from [CutSheet].[Images]'
GO
ALTER TABLE [CutSheet].[Images] DROP CONSTRAINT [FK_Images_tblColors_Available]
GO
PRINT N'Dropping foreign keys from [dbo].[Basic Product Construction]'
GO
ALTER TABLE [dbo].[Basic Product Construction] DROP CONSTRAINT [FK_Basic Product Construction_tblColors_Available]
GO
PRINT N'Dropping foreign keys from [dbo].[tblColor_Chip_Concentration]'
GO
ALTER TABLE [dbo].[tblColor_Chip_Concentration] DROP CONSTRAINT [FK_tblColor_Chip_Concentration_tblColors_Available]
GO
PRINT N'Dropping constraints from [dbo].[tblColors_Available]'
GO
ALTER TABLE [dbo].[tblColors_Available] DROP CONSTRAINT [PK_tblColorChips]
GO
PRINT N'Dropping constraints from [dbo].[tblColors_Available]'
GO
ALTER TABLE [dbo].[tblColors_Available] DROP CONSTRAINT [DF_tblColorChips_CreatedBy]
GO
PRINT N'Dropping constraints from [dbo].[tblColors_Available]'
GO
ALTER TABLE [dbo].[tblColors_Available] DROP CONSTRAINT [DF_tblColorChips_DateCreated]
GO
PRINT N'Refreshing [dbo].[CableUnion]'
GO
EXEC sp_refreshview N'[dbo].[CableUnion]'
GO
PRINT N'Refreshing [dbo].[vScheduling_Construction_SubunitPrintSheet]'
GO
EXEC sp_refreshview N'[dbo].[vScheduling_Construction_SubunitPrintSheet]'
GO
PRINT N'Refreshing [dbo].[vSchedulingCableUnion]'
GO
EXEC sp_refreshview N'[dbo].[vSchedulingCableUnion]'
GO
PRINT N'Refreshing [dbo].[vBasic_Prod_plus_Basic_Sheath]'
GO
EXEC sp_refreshview N'[dbo].[vBasic_Prod_plus_Basic_Sheath]'
GO
PRINT N'Refreshing [Setup].[vSetup_Cable_Base]'
GO
EXEC sp_refreshview N'[Setup].[vSetup_Cable_Base]'
GO
PRINT N'Refreshing [dbo].[vSetup_Scheduling_LineSpeed]'
GO
EXEC sp_refreshview N'[dbo].[vSetup_Scheduling_LineSpeed]'
GO
PRINT N'Refreshing [dbo].[vColor_Chip_Jacket_Material]'
GO
EXEC sp_refreshview N'[dbo].[vColor_Chip_Jacket_Material]'
GO
PRINT N'Refreshing [dbo].[vSchedulingConstructionData]'
GO
EXEC sp_refreshview N'[dbo].[vSchedulingConstructionData]'
GO
PRINT N'Refreshing [dbo].[vSchedulingCableRunSpeeds]'
GO
EXEC sp_refreshview N'[dbo].[vSchedulingCableRunSpeeds]'
GO
PRINT N'Refreshing [CutSheet].[vImage]'
GO
EXEC sp_refreshview N'[CutSheet].[vImage]'
GO
PRINT N'Refreshing [dbo].[vSchedulingCableReferences]'
GO
EXEC sp_refreshview N'[dbo].[vSchedulingCableReferences]'
GO
PRINT N'Refreshing [dbo].[vScheduling_OpenOrders]'
GO
EXEC sp_refreshview N'[dbo].[vScheduling_OpenOrders]'
GO
PRINT N'Refreshing [dbo].[vScheduling_OpenOrders_AllComponentsDemand]'
GO
EXEC sp_refreshview N'[dbo].[vScheduling_OpenOrders_AllComponentsDemand]'
GO
PRINT N'Altering [dbo].[vBurnListingLengthRequirement]'
GO

/*
Author:		Bryan Eddy
Date:		2/28/2018
Desc:		Show the calculated length and cost for each burn test type
Version:	1
Update:		Initial Creation
*/

ALTER VIEW [dbo].[vBurnListingLengthRequirement]
AS
WITH cteItemBurnInfo
AS(
	SELECT DISTINCT dbo.CableUnion.Oracle
	,CASE WHEN ISNUMERIC(HEIGHT) =1 THEN SQRT(1.1284*(NominalOD*Height)) ELSE NominalOD END AS BurnNominalOD
	, dbo.CableUnion.[Item No] AS ItemNo
	, CableUnion.ListingCompany AS ListingCompanyPrint
	, NominalOD
	, B.Item_Status
	, B.Material_Cost Item_Cost
	, tblBurnListing.ListingTab
	, tblBurnListing.ListingSection
	, tblBurnListing.ListingConstruction
	, tblBurnListing.ListingCompany
	,printline2 + ' ' + printline3 AS CablePrint
	,tblCableConstructions.CablePasses
	,Height
	--,substring( PrintLine3, charindex('OF', PrintLine3),CHARINDEX(' ',PrintLine3,CHARINDEX('OF',PrintLine3))-CHARINDEX('OF',PrintLine3)) as BurnPrint 
	FROM --DBO.AFLPRD_acswopattn_CAB_SNF K 
	dbo.CableUnion --ON K.Item = dbo.CableUnion.Oracle
	INNER JOIN tblCableConstructionReferences ON tblCableConstructionReferences.Base = dbo.CableUnion.Base
	INNER JOIN tblCableConstructions ON tblCableConstructionReferences.BaseID = tblCableConstructions.BaseID
	INNER JOIN tblBurnListing ON dbo.CableUnion.Base = tblBurnListing.base AND CableUnion.ListingCompany = tblBurnListing.ListingCompany
	INNER JOIN dbo.AFLPRD_INVSysItemCost_CAB B ON dbo.CableUnion.Oracle = B.ItemNumber
	WHERE tblBurnListing.ListingCompany IN ('etl', 'ul') --AND B.Item_Status <> 'obsolete'
	AND NominalOD <>0 AND tblCableConstructionReferences.Active = 1 AND ReleasedDesign = 1
	--WHERE -- AND K.AvailQty <> 0 AND K.Locator NOT like 'wop%'
)
,cteBurnCalculation
AS(
SELECT 	 ROUND([NominalOD]*0.03936996,4)AS NomODInches
	, CAST(CEILING((12/(BurnNominalOD*0.03936996))*16.5*1.1/3.281) AS INT) AS BurnLength_M_OFNR
	, CAST(CEILING((6990/BurnNominalOD)*1.1/3) AS INT) AS BurnLength_M_OFNP
	,E.Length_Meters AS VerticalTrayTestLength_M
	,CEILING(((4/(BurnNominalOD*0.03936996))+0.33)*3.281) AS BurnLength_M_LS
	,g.*
FROM cteItemBurnInfo g CROSS APPLY dbo.GetBurnVerticalTrayTestLength(g.NominalOD) E
)
SELECT DISTINCT 
		CEILING(BurnLength_M_OFNR * Item_Cost) AS CableCost_OFNR
		,CEILING(BurnLength_M_OFNP * Item_Cost) AS CableCost_OFNP
		,CEILING(VerticalTrayTestLength_M * Item_Cost) AS CableCost_VerticalTray
		,CEILING(BurnLength_M_LS * Item_Cost) AS CableCost_LS
		,e.*
		--,g.Locator, g.AvailQty, g.ItemDesc, g.LotNumber
FROM cteBurnCalculation  e --INNER JOIN dbo.AFLPRD_acswopattn_CAB_SNF g ON g.Item = e.Oracle
WHERE e.Oracle ='PS05720-01'





GO
PRINT N'Refreshing [dbo].[vOracleBaseItems_Newest]'
GO
EXEC sp_refreshview N'[dbo].[vOracleBaseItems_Newest]'
GO
PRINT N'Refreshing [dbo].[vOracleBaseItems_Newest_NoMixedFibers]'
GO
EXEC sp_refreshview N'[dbo].[vOracleBaseItems_Newest_NoMixedFibers]'
GO
PRINT N'Refreshing [Schedule].[vInactiveItems]'
GO
EXEC sp_refreshview N'[Schedule].[vInactiveItems]'
GO
PRINT N'Altering [Schedule].[usp_EmailInactiveItemsOnSchedule]'
GO



/*
Author:		Bryan Eddy
Date:		4/2/2018
Desc:		Send list of inactive items on the schedule to premise product engineering to review
Revision:	1
Update:		n/a
*/

ALTER PROCEDURE	[Schedule].[usp_EmailInactiveItemsOnSchedule]
AS
DECLARE @html NVARCHAR(MAX),
 @ReceipientList NVARCHAR(1000),
 @sqlCommand NVARCHAR(1000),
 @Table NVARCHAR(1000),
 @Qry NVARCHAR(1000),
 @RowCount INT,
 @SubjectLine NVARCHAR(100) 

 SET @Table = 'Schedule.vInactiveItems'
 SET @sqlCommand = 'SELECT @RowCount  = COUNT(*) FROM ' + @Table
 SET @SubjectLine = 'Inactive Items on Premise Schedule ' + CAST(GETDATE() AS NVARCHAR(50))
EXECUTE sp_executesql @sqlCommand, N'@RowCount int OUTPUT', @RowCount=@RowCount OUTPUT
PRINT @RowCount

IF @RowCount > 0
	BEGIN
    
		SET @Qry = 'SELECT * FROM ' + @Table

		EXEC dbo.usp_QueryToHtmlTable @html = @html OUTPUT,  @query = @Qry, @orderBy = N'[Promise Date]';

		SET @ReceipientList = (STUFF((SELECT ';' + UserEmail 
								FROM tblConfiguratorUser G  INNER JOIN users.UserResponsibility  K ON  G.UserID = K.UserID
  								WHERE K.ResponsibilityID IN (5,15) FOR XML PATH('')),1,1,''))

						EXEC msdb.dbo.sp_send_dbmail 
						@recipients=@ReceipientList,
						--@recipients='bryan.eddy@aflglobal.com',
						@blind_copy_recipients = 'bryan.eddy@aflglobal.com',
						@subject = 'Inactive Items on Premise Schedule',
						@body = @html,
						@body_format = 'HTML',
						@query_no_truncate = 1,
						@attach_query_result_as_file = 0;

END

GO
PRINT N'Refreshing [dbo].[vOracleBaseItems]'
GO
EXEC sp_refreshview N'[dbo].[vOracleBaseItems]'
GO
PRINT N'Refreshing [dbo].[FurcationTube_Fill_Ratio]'
GO
EXEC sp_refreshview N'[dbo].[FurcationTube_Fill_Ratio]'
GO
PRINT N'Refreshing [PrintSafe].[vInterfacePrintView]'
GO
EXEC sp_refreshview N'[PrintSafe].[vInterfacePrintView]'
GO
PRINT N'Creating [dbo].[vFillersActive]'
GO
/*
AUTHOR:		Bryan Eddy
Date:		4/20/2018
Desc:		View of all active fillers
Version:	1
Update:		n/a

*/

CREATE VIEW [dbo].[vFillersActive]
AS
SELECT DISTINCT K.Oracle, K.ItemNo
FROM dbo.tblCableConstructionReferences J INNER JOIN dbo.[Product Desrcriptions] I ON I.ProductID = J.ProductID
INNER JOIN dbo.CableUnion K ON K.BASE = I.[Level 1 Product]
WHERE I.SubFiller = 1 AND K.Active = 1 AND K.[Item No] LIKE '__000@%'
GO
PRINT N'Altering [dbo].[vSalesHistory]'
GO

/*
Author:		Bryan Eddy
Desc:		Show sales history to various applications
Date:		1/23/2018
Version:	3
Update:		3 Removed the criteria to remove duplicates.  Duplicates are now being deleted from the data.

*/

/* TO DO : Aggregate by So Line*/
ALTER VIEW [dbo].[vSalesHistory]
AS
WITH cteSales
AS(
	SELECT DISTINCT TRANSACTION_DATE AS DATE, BILL_TO_NAME AS CUSTOMER, ITEM_NUMBER, ITEM_DESCRIPTION,ORDER_NUMBER AS SO_NUMBER,REVENUE, SO_LINE_NUMBER
	,PRIMARY_QUANTITY AS QUANTITY
	, PRIMARY_UOM_CODE AS UOM
	,CURR_MATERIAL_COST, CURR_RESOURCE_COST, CURR_OVERHEAD_COST
	FROM Oracle.MarginRevenueExtractSalesHistory
) 
--,cteNormalizedSalesHistory
--AS(
	SELECT *,  CASE WHEN QUANTITY <> 0 THEN ROUND(REVENUE/QUANTITY,5)  ELSE 0 END PricePerUOM
	FROM cteSales k 
--)
--SELECT SUM(S.REVENUE) REVENUE, SUM(S.QUANTITY) QUANTITY, SUM(S.CURR_MATERIAL_COST) CURR_MATERIAL_COST, SUM(S.CURR_RESOURCE_COST) CURR_RESOURCE_COST, SUM(S.CURR_OVERHEAD_COST) CURR_OVERHEAD_COST
--,S.DATE, S.CUSTOMER, S.ITEM_NUMBER,S.ITEM_DESCRIPTION,S.SO_NUMBER,S.SO_LINE_NUMBER,S.UOM,S.PricePerUOM
--FROM cteNormalizedSalesHistory S
--GROUP BY S.DATE, S.CUSTOMER, S.ITEM_NUMBER,S.ITEM_DESCRIPTION,S.SO_NUMBER,S.SO_LINE_NUMBER,S.UOM,S.PricePerUOM


GO
PRINT N'Refreshing [dbo].[vScheduling_Gantt_TightBuffer]'
GO
EXEC sp_refreshview N'[dbo].[vScheduling_Gantt_TightBuffer]'
GO
PRINT N'Refreshing [Setup].[TightBufferSetupRecipe]'
GO
EXEC sp_refreshview N'[Setup].[TightBufferSetupRecipe]'
GO
PRINT N'Refreshing [dbo].[vCatalogTightBufferType]'
GO
EXEC sp_refreshview N'[dbo].[vCatalogTightBufferType]'
GO
PRINT N'Refreshing [dbo].[vBurnListingInventory]'
GO
EXEC sp_refreshview N'[dbo].[vBurnListingInventory]'
GO
PRINT N'Refreshing [dbo].[vArmorCoreItems_Approvals]'
GO
EXEC sp_refreshview N'[dbo].[vArmorCoreItems_Approvals]'
GO
PRINT N'Refreshing [dbo].[vExtrusionMaterialsItem]'
GO
EXEC sp_refreshview N'[dbo].[vExtrusionMaterialsItem]'
GO
PRINT N'Refreshing [Setup].[vSetup_Scheduling_LineSpeed]'
GO
EXEC sp_refreshview N'[Setup].[vSetup_Scheduling_LineSpeed]'
GO
PRINT N'Refreshing [Schedule].[vInterfaceItemAttributes]'
GO
EXEC sp_refreshview N'[Schedule].[vInterfaceItemAttributes]'
GO
PRINT N'Refreshing [dbo].[vColor_Chip_OracleItem]'
GO
EXEC sp_refreshview N'[dbo].[vColor_Chip_OracleItem]'
GO
PRINT N'Refreshing [dbo].[vCableTightBufferType]'
GO
EXEC sp_refreshview N'[dbo].[vCableTightBufferType]'
GO
PRINT N'Refreshing [dbo].[vSinglePassComponentParent]'
GO
EXEC sp_refreshview N'[dbo].[vSinglePassComponentParent]'
GO
PRINT N'Refreshing [dbo].[vqryPremiseItemDetails_Union]'
GO
EXEC sp_refreshview N'[dbo].[vqryPremiseItemDetails_Union]'
GO
PRINT N'Refreshing [dbo].[vqryPremiseItems]'
GO
EXEC sp_refreshview N'[dbo].[vqryPremiseItems]'
GO
PRINT N'Refreshing [dbo].[vCreateItemBaseFurcation]'
GO
EXEC sp_refreshview N'[dbo].[vCreateItemBaseFurcation]'
GO
PRINT N'Refreshing [dbo].[qrySelectItemNumber]'
GO
EXEC sp_refreshview N'[dbo].[qrySelectItemNumber]'
GO
PRINT N'Refreshing [dbo].[vFiber_Planning_Schedule]'
GO
EXEC sp_refreshview N'[dbo].[vFiber_Planning_Schedule]'
GO
PRINT N'Refreshing [dbo].[vCableQualities]'
GO
EXEC sp_refreshview N'[dbo].[vCableQualities]'
GO
PRINT N'Refreshing [dbo].[vOracleItemsUncommoned]'
GO
EXEC sp_refreshview N'[dbo].[vOracleItemsUncommoned]'
GO
PRINT N'Refreshing [dbo].[vCreateItemBaseCenterMember]'
GO
EXEC sp_refreshview N'[dbo].[vCreateItemBaseCenterMember]'
GO
PRINT N'Altering [dbo].[usp_Order_History_Update_Premise_Cable_Shipments]'
GO


/*
Author:			Bryan Eddy
Date:			1/12/2017
Desc:			Update the Sales History table for reporting ( Oracle.MarginRevenueExtractSalesHistory)
Version:		3
Update:			Added query to remove duplicates
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
                         Premise_Cable_Shipments_1.ORG_CODE = rp_revenue_margin_extract_POBI_CAB.ORG_CODE
WHERE        rp_revenue_margin_extract_POBI_CAB.ORDER_NUMBER IS NOT NULL AND rp_revenue_margin_extract_POBI_CAB.SO_LINE_NUMBER IS NOT NULL AND 
                         --rp_revenue_margin_extract_POBI_CAB.INVOICE_NUMBER IS NOT NULL AND 
						 rp_revenue_margin_extract_POBI_CAB.INV_LINE_NUMBER IS NOT NULL
						  AND  Premise_Cable_Shipments_1.ORDER_NUMBER IS NULL AND Premise_Cable_Shipments_1.SO_LINE_NUMBER IS NULL 
						  --AND Premise_Cable_Shipments_1.INVOICE_NUMBER IS NULL AND Premise_Cable_Shipments_1.INV_LINE_NUMBER IS NULL
						 AND rp_revenue_margin_extract_POBI_CAB.ORDER_NUMBER IS NOT NULL AND rp_revenue_margin_extract_POBI_CAB.SO_LINE_NUMBER IS NOT NULL

;WITH cteUnique
AS(
SELECT ROW_NUMBER() OVER (PARTITION BY[ORG_CODE]
      ,[BUSINESS_UNIT]
      ,[TRANSACTION_TYPE]
      ,[ORDER_NUMBER]
      ,[SO_LINE_NUMBER]
      ,[INVOICE_NUMBER]
      ,[INV_LINE_NUMBER]
      ,[TRANSACTION_DATE]
      ,[TRANSACTION_PERIOD]
      ,[ITEM_NUMBER]
      ,[ITEM_DESCRIPTION]
      ,[BILL_TO_NUMBER]
      ,[BILL_TO_CLASS]
      ,[BILL_TO_CATEGORY]
      ,[BILL_TO_NAME]
      ,[BILL_TO_STATE]
      ,[BILL_TO_COUNTRY]
      ,[BILL_TO_POSTAL_CODE]
      ,[SHIP_TO_NUMBER]
      ,[SHIP_TO_CLASS]
      ,[SHIP_TO_TERRITORY]
      ,[SHIP_TO_NAME]
      ,[SHIP_TO_STATE]
      ,[SHIP_TO_COUNTRY]
      ,[SHIP_TO_POSTAL_CODE]
      ,[UNIT_OF_MEASURE]
      ,[REVENUE]
      ,[QUANTITY]
      ,[CATEGORY1]
      ,[CATEGORY2]
      ,[CATEGORY3]
      ,[CATEGORY4]
      ,[CATEGORY5]
      ,[ACTUAL_MATERIAL_COST]
      ,[ACTUAL_RESOURCE_COST]
      ,[ACTUAL_OVERHEAD_COST]
      ,[ACTUAL_OUTSIDE_PROCESSING_COST]
      ,[SCHEDULING_APPROVAL]
      ,[AGENT]
      ,[AFL_ACCOUNT]
      ,[AFL_NATIONAL]
      ,[INSIDE_SALES]
      ,[BOOKED_DATE]
      ,[SCHEDULE_PERIOD]
      ,[SALES_CHANNEL]
      ,[REQUEST_DATE]
      ,[PROMISE_DATE]
      ,[ORDER_TYPE]
      ,[PARTIAL_ALLOWED]
      ,[RESERVATION_FLAG]
      ,[SHIP_TO_CITY]
      ,[FOB_CODE]
      ,[FREIGHT_TERMS_CODE]
      ,[HOLD_FLAG]
      ,[MULTI_ORG_SHIP_SET]
      ,[MAKE_BUY_CODE]
      ,[SHIP_SET_NUMBER]
      ,[SO_LINE_FREIGHT_CARRIER]
      ,[SCHEDULE_APPROVAL_DATE]
      ,[SO_LINE_CREATE_DATE]
      ,[QTY_IN_LBS]
      ,[CUSTOMER_UOM]
      ,[SPECIFICATION]
      ,[QUOTE_NUMBER]
      ,[NEW_PRODUCT]
      ,[NEW_PRODUCT_CATEGORY]
      ,[ACTUAL_COST_UPDATE_DATE]
      ,[PRIMARY_QUANTITY]
      ,[PRIMARY_UOM_CODE]
      ,[INVOICE_SOURCE]
      ,[QUOTE_TYPE]
      ,[DATA_SOURCE]
      ,[NEW_PRODUCT_TYPE]
      ,[COMMENTS]
      ,[ACTUAL_MATERIAL_OVERHEAD_COST]
      ,[FORECAST_DESCRIPTION]
      ,[FORECAST_DESIGNATOR]
       ORDER BY CURR_MATERIAL_COST desc
	  ) AS RowNumber
	  ,[ORG_CODE]
      ,[BUSINESS_UNIT]
      ,[TRANSACTION_TYPE]
      ,[ORDER_NUMBER]
      ,[SO_LINE_NUMBER]
      ,[INVOICE_NUMBER]
      ,[INV_LINE_NUMBER]
      ,[TRANSACTION_DATE]
      ,[TRANSACTION_PERIOD]
      ,[ITEM_NUMBER]
      ,[ITEM_DESCRIPTION]
      ,[BILL_TO_NUMBER]
      ,[BILL_TO_CLASS]
      ,[BILL_TO_CATEGORY]
      ,[BILL_TO_NAME]
      ,[BILL_TO_STATE]
      ,[BILL_TO_COUNTRY]
      ,[BILL_TO_POSTAL_CODE]
      ,[SHIP_TO_NUMBER]
      ,[SHIP_TO_CLASS]
      ,[SHIP_TO_TERRITORY]
      ,[SHIP_TO_NAME]
      ,[SHIP_TO_STATE]
      ,[SHIP_TO_COUNTRY]
      ,[SHIP_TO_POSTAL_CODE]
      ,[UNIT_OF_MEASURE]
      ,[REVENUE]
      ,[QUANTITY]
      ,[CATEGORY1]
      ,[CATEGORY2]
      ,[CATEGORY3]
      ,[CATEGORY4]
      ,[CATEGORY5]
      ,[ACTUAL_MATERIAL_COST]
      ,[ACTUAL_RESOURCE_COST]
      ,[ACTUAL_OVERHEAD_COST]
      ,[ACTUAL_OUTSIDE_PROCESSING_COST]
      ,[SCHEDULING_APPROVAL]
      ,[AGENT]
      ,[AFL_ACCOUNT]
      ,[AFL_NATIONAL]
      ,[INSIDE_SALES]
      ,[BOOKED_DATE]
      ,[SCHEDULE_PERIOD]
      ,[SALES_CHANNEL]
      ,[REQUEST_DATE]
      ,[PROMISE_DATE]
      ,[ORDER_TYPE]
      ,[PARTIAL_ALLOWED]
      ,[RESERVATION_FLAG]
      ,[SHIP_TO_CITY]
      ,[FOB_CODE]
      ,[FREIGHT_TERMS_CODE]
      ,[HOLD_FLAG]
      ,[MULTI_ORG_SHIP_SET]
      ,[MAKE_BUY_CODE]
      ,[SHIP_SET_NUMBER]
      ,[SO_LINE_FREIGHT_CARRIER]
      ,[SCHEDULE_APPROVAL_DATE]
      ,[SO_LINE_CREATE_DATE]
      ,[QTY_IN_LBS]
      ,[CUSTOMER_UOM]
      ,[SPECIFICATION]
      ,[QUOTE_NUMBER]
      ,[NEW_PRODUCT]
      ,[NEW_PRODUCT_CATEGORY]
      ,[ACTUAL_COST_UPDATE_DATE]
      ,[PRIMARY_QUANTITY]
      ,[PRIMARY_UOM_CODE]
      ,[INVOICE_SOURCE]
      ,[QUOTE_TYPE]
      ,[DATA_SOURCE]
      ,[NEW_PRODUCT_TYPE]
      ,[COMMENTS]
      ,[CURR_MATERIAL_OVERHEAD_COST]
      ,[ACTUAL_MATERIAL_OVERHEAD_COST]
      ,[SalesID]
      ,[FORECAST_DESCRIPTION]
      ,[FORECAST_DESIGNATOR]
      ,[DateInserted]
  FROM [Premise].[Oracle].[MarginRevenueExtractSalesHistory]
  )
DELETE I 
FROM cteUnique K INNER JOIN ORACLE.[MarginRevenueExtractSalesHistory]  I ON I.SalesID = K.SalesID
WHERE K.RowNumber > 1--item_number = 'DNO-9246' AND cteUnique.ORDER_NUMBER ='1958265' AND cteUnique.SO_LINE_NUMBER = 1




GO
PRINT N'Refreshing [Setup].[vSetup_Cable_Machine]'
GO
EXEC sp_refreshview N'[Setup].[vSetup_Cable_Machine]'
GO
PRINT N'Altering [dbo].[tblItemBuildDescrepancyLog]'
GO
ALTER TABLE [dbo].[tblItemBuildDescrepancyLog] ADD
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblItemBuildDescrepancyLog_CreatedBy] DEFAULT (suser_sname())
GO
PRINT N'Altering [dbo].[usp_GetWhereUsedMaterials]'
GO


/* =============================================
-- Author:		Bryan Eddy
-- ALTER date: 6/22/2017
-- Description:	MRP function to report Customer purchase history with respect to Raw Materials
-- Version:		2
-- Update:		Update to pull sales history from oracle.MarginRevenueExtractSalesHistory
-- ============================================= */
ALTER PROCEDURE [dbo].[usp_GetWhereUsedMaterials]


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
,CASE WHEN S.UNIT_OF_MEASURE = 'FT' THEN ROUND(S.QUANTITY / 3.281,0) ELSE S.QUANTITY END AS Quantity, CASE WHEN S.UNIT_OF_MEASURE = 'FT' THEN 'M' ELSE S.UNIT_OF_MEASURE END AS QTY_UOM, s.REVENUE
,p.Description, S.SO_LINE_NUMBER, S.TRANSACTION_DATE
INTO ##MaterialUsage
FROM #TempFG T --INNER JOIN AFLPRD_INVItmCatg_CAB G ON G.ItemNumber = T.AssemblyItemNumber 
INNER JOIN AFLPRD_INVSysItem_CAB K ON K.ItemNumber = t.AssemblyItemNumber
INNER JOIN AFLPRD_INVSysItemCost_CAB P ON P.ItemNumber = K.ItemNumber
LEFT JOIN oracle.MarginRevenueExtractSalesHistory S ON S.ITEM_NUMBER = K.ItemNumber
GROUP BY  Material, AssemblyItemNumber, PrimaryUOM,--CategorySetName,CategoryName,
TemplateName,Item_Status, S.BILL_TO_NAME, S.ORDER_NUMBER, S.QUANTITY, s.PROMISE_DATE, S.UNIT_OF_MEASURE,s.REVENUE,p.Description
,SO_LINE_NUMBER,S.TRANSACTION_DATE
--HAVING shipped like '201[76]%'
ORDER BY Shipped DESC



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
PRINT N'Refreshing [dbo].[vFindItem]'
GO
EXEC sp_refreshview N'[dbo].[vFindItem]'
GO
PRINT N'Refreshing [Oracle].[vMissingFiberSpecs]'
GO
EXEC sp_refreshview N'[Oracle].[vMissingFiberSpecs]'
GO
PRINT N'Refreshing [dbo].[vCreateItemBase]'
GO
EXEC sp_refreshview N'[dbo].[vCreateItemBase]'
GO
PRINT N'Refreshing [dbo].[qryBasePrint]'
GO
EXEC sp_refreshview N'[dbo].[qryBasePrint]'
GO
PRINT N'Refreshing [dbo].[vCutSheet]'
GO
EXEC sp_refreshview N'[dbo].[vCutSheet]'
GO
PRINT N'Refreshing [SalesForce].[vInterfacePrintView]'
GO
EXEC sp_refreshview N'[SalesForce].[vInterfacePrintView]'
GO
PRINT N'Refreshing [dbo].[vScheduling_SubUnitPrintSpacing]'
GO
EXEC sp_refreshview N'[dbo].[vScheduling_SubUnitPrintSpacing]'
GO
PRINT N'Refreshing [dbo].[vCableConstruction]'
GO
EXEC sp_refreshview N'[dbo].[vCableConstruction]'
GO
PRINT N'Refreshing [dbo].[vCreateItemBaseCableExtensions]'
GO
EXEC sp_refreshview N'[dbo].[vCreateItemBaseCableExtensions]'
GO
PRINT N'Refreshing [dbo].[vItemSearch]'
GO
EXEC sp_refreshview N'[dbo].[vItemSearch]'
GO
PRINT N'Refreshing [Setup].[vSetupStandardOperationMismatch]'
GO
EXEC sp_refreshview N'[Setup].[vSetupStandardOperationMismatch]'
GO
PRINT N'Altering [dbo].[usp_CutSheet_Email_Reminder]'
GO

/*
-- =============================================
-- Author:		Bryan Eddy
-- ALTER date:	2/15/2017
-- Description:	Send out emails to notify approvers of constructions awaiting for approval.
	Version:	3
	Update:		1. Added in a date differential to give more time before notification
				2. Put results into a table with differential of days the request has been open.
				3. Created a group for this alert as group 17
-- =============================================
*/
ALTER PROCEDURE [dbo].[usp_CutSheet_Email_Reminder]


AS

EXECUTE AS USER = 'dbo' 

SET ANSI_NULLS OFF;
SET NOCOUNT ON;

--Run around 8:30am everyday
DECLARE @numRows int
DECLARE @Receipientlist VARCHAR(1000)


--Check if any open item requests need commercial approval
IF OBJECT_ID(N'tempdb..#Results', N'U') IS NOT NULL
DROP TABLE #Results;
SELECT ItemRequested, Base, RequestedDate, Requestor, DATEDIFF(DAY,RequestedDate,GETDATE()) DaysOpen, CASE WHEN Commercial_Approval = 1 THEN 'Yes' ELSE 'No' END ApprovedByCommercial
, CASE WHEN Technical_Approval = 1 THEN 'Yes' ELSE 'No' END	ApprovedByEngineer
INTO #Results
FROM tblCutSheetApproval
WHERE Requested = 1 AND (Technical_Approval =0 OR Commercial_Approval = 0) and DATEDIFF(DD,RecordCreationDate,GETDATE()) > 3

SET @ReceipientList = (STUFF((SELECT ';' + UserEmail FROM tblConfiguratorUser I
						INNER JOIN Users.UserResponsibility K ON K.UserID = I.UserID
						 WHERE k.ResponsibilityID = (17) FOR XML PATH('')),1,1,''))

						PRINT @Receipientlist

SELECT @numRows = COUNT(*) FROM #Results

DECLARE @body1 VARCHAR(MAX)
DECLARE @subject VARCHAR(MAX)
DECLARE @query VARCHAR(MAX) = N'SELECT * FROM tempdb..#Results;'
SET @subject = 'PAST DUE - Premise Cut Sheet Request ' + CAST(GETDATE() AS NVARCHAR)
SET @body1 = 'There are  ' + CAST(@numRows AS NVARCHAR) + ' constructions awaiting approval.  Please review.' +CHAR(13)+CHAR(13)



DECLARE @tableHTML  NVARCHAR(MAX) ;
IF @numRows > 0
BEGIN
	
				SET @tableHTML =
				N'<H1>Open Cut Sheet Approval Report</H1>' +
				N'<p>'+@body1+'</p>' +
				N'<p class=MsoNormal><span style=''font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D''>'+
				N'<table border="1">' +
				N'<tr><th>Base</th><th>Item</th><th>Days Open</th>' +
				N'<th>Requestor</th><th>Approved By Commercial</th>' +
				N'<th>Approved by Engineer</th></tr>' +
				CAST ( ( SELECT		td=Base,       '',
									td=ItemRequested, '',
									td=DaysOpen, '',
									td=Requestor,'',
									td=ApprovedByCommercial,'',
									td=ApprovedByEngineer,''

							FROM #Results 
							ORDER BY DaysOpen desc
						  FOR XML PATH('tr'), TYPE 
				) AS NVARCHAR(MAX) ) +
				N'</table>' ;
			--SET @tableHTML =
			--	N'<H1>Premise Cut Sheet Approval</H1>' +
			--	N'<p>'+@body1+'</p>' +
			--	N'</table>' ;
		
			EXEC msdb.dbo.sp_send_dbmail 
			@recipients=@ReceipientList,
			--@recipients = 'Bryan.Eddy@aflglobal.com',
			@blind_copy_recipients = 'Bryan.Eddy@aflglobal.com',
			@subject = @subject,
			@body = @tableHTML,
			@body_format = 'HTML';
			


END




GO
PRINT N'Refreshing [Oracle].[vInterFaceMesNcmirProcessData]'
GO
EXEC sp_refreshview N'[Oracle].[vInterFaceMesNcmirProcessData]'
GO
PRINT N'Refreshing [dbo].[vBurnTestingLength]'
GO
EXEC sp_refreshview N'[dbo].[vBurnTestingLength]'
GO
PRINT N'Refreshing [dbo].[Build CM Base]'
GO
EXEC sp_refreshview N'[dbo].[Build CM Base]'
GO
PRINT N'Refreshing [dbo].[vItemPrintByLine]'
GO
EXEC sp_refreshview N'[dbo].[vItemPrintByLine]'
GO
PRINT N'Refreshing [dbo].[vFindCutSheet]'
GO
EXEC sp_refreshview N'[dbo].[vFindCutSheet]'
GO
PRINT N'Refreshing [dbo].[FiberAllComponents]'
GO
EXEC sp_refreshview N'[dbo].[FiberAllComponents]'
GO
PRINT N'Refreshing [dbo].[vSchedulingGanttFiberPlanning]'
GO
EXEC sp_refreshview N'[dbo].[vSchedulingGanttFiberPlanning]'
GO
PRINT N'Refreshing [CutSheet].[vImageGroupPivotImages]'
GO
EXEC sp_refreshview N'[CutSheet].[vImageGroupPivotImages]'
GO
PRINT N'Rebuilding [dbo].[tblColors_Available]'
GO
CREATE TABLE [dbo].[RG_Recovery_1_tblColors_Available]
(
[Color] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Color_ID] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[TimeStamp] [timestamp] NULL,
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblColorChips_CreatedBy] DEFAULT (suser_sname()),
[DateCreated] [datetime] NULL CONSTRAINT [DF_tblColorChips_DateCreated] DEFAULT (getdate()),
[AccessColorID] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_1_tblColors_Available] ON
GO
INSERT INTO [dbo].[RG_Recovery_1_tblColors_Available]([Color], [Color_ID], [ID], [CreatedBy], [DateCreated]) SELECT [Color], [Color_ID], [ID], [CreatedBy], [DateCreated] FROM [dbo].[tblColors_Available]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_1_tblColors_Available] OFF
GO
DECLARE @idVal BIGINT
SELECT @idVal = IDENT_CURRENT(N'[dbo].[tblColors_Available]')
IF @idVal IS NOT NULL
    DBCC CHECKIDENT(N'[dbo].[RG_Recovery_1_tblColors_Available]', RESEED, @idVal)
GO
DROP TABLE [dbo].[tblColors_Available]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_1_tblColors_Available]', N'tblColors_Available', N'OBJECT'
GO
PRINT N'Creating primary key [PK_tblColorChips] on [dbo].[tblColors_Available]'
GO
ALTER TABLE [dbo].[tblColors_Available] ADD CONSTRAINT [PK_tblColorChips] PRIMARY KEY CLUSTERED  ([Color]) ON [PRIMARY]
GO
PRINT N'Adding foreign keys to [dbo].[Basic Product Construction]'
GO
ALTER TABLE [dbo].[Basic Product Construction] ADD CONSTRAINT [FK_Basic Product Construction_tblColors_Available] FOREIGN KEY ([Jacket Color]) REFERENCES [dbo].[tblColors_Available] ([Color]) ON DELETE SET NULL ON UPDATE CASCADE
GO
PRINT N'Adding foreign keys to [CutSheet].[Images]'
GO
ALTER TABLE [CutSheet].[Images] ADD CONSTRAINT [FK_Images_tblColors_Available] FOREIGN KEY ([Color]) REFERENCES [dbo].[tblColors_Available] ([Color]) ON DELETE CASCADE ON UPDATE CASCADE
GO
PRINT N'Adding foreign keys to [dbo].[tblColor_Chip_Concentration]'
GO
ALTER TABLE [dbo].[tblColor_Chip_Concentration] ADD CONSTRAINT [FK_tblColor_Chip_Concentration_tblColors_Available] FOREIGN KEY ([Color]) REFERENCES [dbo].[tblColors_Available] ([Color]) ON DELETE CASCADE ON UPDATE CASCADE
GO

