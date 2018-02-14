/*
This migration script replaces uncommitted changes made to these objects:
MachineMappingToNCMIR
Machines
MarginRevenueExtractSalesHistory
AFLPRD_COMMON_QA_PROCESS_FY_2017_todate
AFLPRD_onhandqty_STD_Detailed_81_CAB
rp_revenue_margin_extract_POBI_AllHistory
tblFiberElementValue
tblFiberTBCatalog
tblStockItems
tblUnitSeriesTemplate
usp_PrintDefectImageBackup
usp_SchedulingMissingLineSpeedEmail
vInterFaceMesNcmirProcessData
vFBR00466Selection
CableUnion
qryBasePrint
vBurnListingInventory
vConstructionSearch
vCutSheet_Constructions
vCutSheet_Constructions_DELETE
vFindCutSheet
vItemSearch
vSalesHistory
vScheduling_Construction_SubunitPrintSheet
vScheduling_SubUnitPrintSpacing
vSinglePassComponentParent
NumericParser
WorkTime

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
PRINT N'Dropping [dbo].[vCutSheet_Constructions]'
GO
DROP VIEW [dbo].[vCutSheet_Constructions]
GO
PRINT N'Refreshing [Setup].[vSetupLineSpeed]'
GO
EXEC sp_refreshview N'[Setup].[vSetupLineSpeed]'
GO
PRINT N'Altering [dbo].[vScheduling_Construction_SubunitPrintSheet]'
GO

ALTER VIEW [dbo].[vScheduling_Construction_SubunitPrintSheet]
AS
SELECT        dbo.[Basic Product Construction].[New Oracle Part #] AS Oracle, [Basic Product Construction_1].[Item No], dbo.tblUnitSeriesTemplate.UnitID, 
                         dbo.[Unit Series].[Fiber Code], dbo.tblUnitSeriesTemplate.PrintSpacing, dbo.[Unit Series].[Print type], dbo.[Unit Series].OracleItem AS Oracle_Sub, 
                         dbo.[Basic Product Construction].Customer, dbo.[Basic Product Construction].[Item No] AS Finished_ItemNo, tblUnitSeriesTemplate.UnitNumber
FROM            dbo.[Basic Product Construction] AS [Basic Product Construction_1] INNER JOIN
                         dbo.[Unit Series] ON [Basic Product Construction_1].[New Oracle Part #] = dbo.[Unit Series].OracleItem INNER JOIN
                         dbo.[Basic Product Construction] ON dbo.[Unit Series].[Unit Color Series] = dbo.[Basic Product Construction].[Unit Series] INNER JOIN
                         dbo.tblCableConstructionReferences ON dbo.[Basic Product Construction].Base = dbo.tblCableConstructionReferences.Base LEFT OUTER JOIN
                         dbo.tblUnitSeriesTemplate ON dbo.tblCableConstructionReferences.UnitIDTypeNumber = dbo.tblUnitSeriesTemplate.UnitIDTypeNumber AND 
                         dbo.[Unit Series].UnitNumber = dbo.tblUnitSeriesTemplate.UnitNumber


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
PRINT N'Refreshing [dbo].[vSchedulingConstructionData]'
GO
EXEC sp_refreshview N'[dbo].[vSchedulingConstructionData]'
GO
PRINT N'Altering [dbo].[CableUnion]'
GO
ALTER VIEW [dbo].[CableUnion]
AS
SELECT        [New Oracle Part #] AS Oracle, LEFT([Fiber Oracle Item], 8) AS Fiber, [Jacket Color] AS Color, 
                          I.JacketMaterial AS [Jacket], G.BASE, [Color Chip ID] AS ColorChip, [Listing Company] AS ListingCompany, [Customer], [Print Line 4] AS PrintLine4, K.Active, Reason, 
                         [Item No],[Item No] as ItemNo, FiberType2 AS Fiber2, [Customer Part#] AS PID, [OracleStatus], Enumber
						 , FiberType3 AS Fiber3, CustomerRev, 1 AS Location, [Revision Date], [RibbonHighCure], [Print Spacing] as PrintSpacing, [Print Line 2] PrintLine2
						 , K.DateCreated, [Print Line 3] PrintLine3, [Print Line 1] PrintLine1, K.CreatedBy, [Unit Series], k.ID AS ItemID
						
FROM            [Basic Product Construction] K INNER JOIN dbo.tblCableConstructionReferences G ON G.BASE = K.Base
				INNER JOIN dbo.tblCableConstructions I ON I.BaseID = G.BaseID
--UNION ALL
--SELECT        [Basic (Cable/Sheath)].[New Oracle Part Number] AS Oracle, LEFT([Basic (Cable/Sheath)].[Fiber Type A], 8) AS Fiber, [Jacket Color] AS Color, 
--                         [Jacket Material] AS [Jacket], [Base], ColorChip, [Listing Company] AS ListingCompany, [Customer], [Print Line 4] AS PrintLine4, Active, Reason, [Item No],  [Item No] as ItemNo,
--                         LEFT([Fiber Type B], 8) AS Fiber2, [Customer Part Num] AS PID, [OracleStatus], [ENumber]
--						 , [Fiber Type C] AS Fiber3, CustomerRev, 2 AS Location, [Revision Date], '' as RibbonHighCure, PrintSpacing, [Print Line 2] PrintLine2
--						 , DateCreated, [Print Line 3] PrintLine3, [Print Line 1] PrintLine1, CreatedBy,[Unit Series]
						
--FROM            [Basic (Cable/Sheath)];

GO
PRINT N'Refreshing [dbo].[vSchedulingCableRunSpeeds]'
GO
EXEC sp_refreshview N'[dbo].[vSchedulingCableRunSpeeds]'
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
PRINT N'Refreshing [dbo].[vOracleBaseItems_Newest]'
GO
EXEC sp_refreshview N'[dbo].[vOracleBaseItems_Newest]'
GO
PRINT N'Refreshing [dbo].[vOracleBaseItems_Newest_NoMixedFibers]'
GO
EXEC sp_refreshview N'[dbo].[vOracleBaseItems_Newest_NoMixedFibers]'
GO
PRINT N'Refreshing [dbo].[vFiber]'
GO
EXEC sp_refreshview N'[dbo].[vFiber]'
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
PRINT N'Altering [dbo].[usp_SchedulingMissingLineSpeedEmail]'
GO





-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 6/12/17
-- Description:	Send email of missing line speeds to Process Engineers
-- Version:		4
-- Update:		Added number of missing SO Lines to the report.
-- =============================================
ALTER PROCEDURE [dbo].[usp_SchedulingMissingLineSpeedEmail]

AS



SET NOCOUNT ON;


/*******************************************************************
First query is to determine what setups are either not present in the setup database or
what setups are shutoff in the setup db that is in active items.
All setups in query following are in activec items.
*********************************************************************
**********************************************************************/


/*******************************************************************
Query is to determine what items have no run speed in the setup db.
*********************************************************************
**********************************************************************/

	
	IF OBJECT_ID(N'tempdb..#SetupLocation', N'U') IS NOT NULL
	DROP TABLE #SetupLocation;
	SELECT    DISTINCT 
		Item, 
		Item_Description,  
		Setup,
		PrimaryAlt,
		LineSpeed,
		MachineNumber,
		g.DepartmentCode
	INTO #SetupLocation 
	FROM Setup.vSetupLineSpeed K INNER JOIN AFLPRD_BOMOpSeq_CAB G ON G.TrueOperationCode = K.Setup 
	WHERE G.SendtoAps = 'Y'


	CREATE NONCLUSTERED INDEX TEMP_Index ON #SetupLocation
(Item,Setup ) INCLUDE (
	 LineSpeed,
		Item_Description ,
	MachineNumber ,
	DepartmentCode )
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]




/*******************************************************************
Determine what items and sub-items are located in open orders.
*********************************************************************
**********************************************************************/


--Check if any open item requests need commercial approval
IF OBJECT_ID(N'tempdb..#Results', N'U') IS NOT NULL
DROP TABLE #Results;

WITH 
	cteOrders(ItemNumber, ItemDesc,ScheduleDate,SalesOrder, SalesOrderLineNumber)
	as
	(
		SELECT distinct [Item Number], [Item Description], [Schedule Date], X.[Sales Order], X.[Line No]
		FROM(
			SELECT G.[Item Number], G.[Item Description], MIN([Schedule Date]) OVER (PARTITION BY [Item Number]) Max_Schedule_Date,[Schedule Date], G.[Sales Order], G.[Line No]
			FROM Premise.dbo.AFLPRD_ORDDTLREPT_UPLOAD_CAB G 
			--WHERE [Job Status] NOT IN  ('CLOSED', 'COMPLETE','Cancelled')
			)X
		--WHERE Max_Schedule_Date = [Schedule Date]
	)
, cteMissingSetupOrders
as(	
	SELECT DISTINCT FinishedGood,K.Item,K.Item_Description, ScheduleDate, AssemblyItemNumber, Setup, Make_Buy, k.PrimaryAlt, DepartmentCode, cteOrders.SalesOrder,SalesOrderLineNumber
	, MIN(ScheduleDate) OVER (PARTITION BY Setup) Max_SechuduleDate, MAX(Item) OVER (PARTITION BY Setup) Max_Item, K.MachineNumber--, ROW_NUMBER() OVER (PARTITION BY Setup ORDER BY setup,G.FinishedGood) RowNumber
	FROM cteOrders CROSS APPLY fn_ExplodeBOM(cteOrders.ItemNumber) G
	INNER JOIN #SetupLocation K ON G.AssemblyItemNumber = K.Item
	INNER JOIN AFLPRD_INVSysItemCost_CAB B ON B.ItemNumber = K.ITEM 
	WHERE B.Make_Buy = 'MAKE' AND k.MachineNumber IS NULL  and left(ITEM,3) NOT in ('WTC','DNT')
	and LEFT(setup,1) not in ('k','Q','O','I') and setup not in ('R696','R093','PQC','pk01') AND setup NOT LIKE 'm00[4-9]'
	) 
	,cteConsolidatedMissingSetupOrders
	AS(
		SELECT *, COUNT(SalesOrder) OVER (PARTITION BY cteMissingSetupOrders.Setup) SoLinesMissingSetups--Determine the amount of sales order affected by missing setups
		FROM cteMissingSetupOrders
	)
SELECT DISTINCT FinishedGood,Item,Item_Description ItemDesc, ScheduleDate, AssemblyItemNumber, Setup, PrimaryAlt,DepartmentCode, MachineNumber, SoLinesMissingSetups
INTO #Results
FROM cteConsolidatedMissingSetupOrders
WHERE Max_SechuduleDate = ScheduleDate and item = Max_Item --AND X.RowNumber = 1
ORDER BY ScheduleDate

--SELECT *
--FROM #Results

--Add new missing setups
INSERT INTO [NAACAB-SCH01].PlanetTogether_Data_Test.setup.MissingSetups(Setup)
SELECT DISTINCT G.Setup
FROM #Results G LEFT JOIN [NAACAB-SCH01].PlanetTogether_Data_Test.setup.MissingSetups K ON K.Setup = G.Setup
WHERE K.Setup IS NULL

--Update existing records with the most recent date of the apperance
UPDATE K
SET K.DateMostRecentAppearance = GETDATE()
FROM [NAACAB-SCH01].PlanetTogether_Data_Test.setup.MissingSetups K INNER JOIN	#Results J ON K.Setup = J.Setup

--Results to populate the email table
IF OBJECT_ID(N'tempdb..#FinalResults', N'U') IS NOT NULL
DROP TABLE #FinalResults;
SELECT J.*,DATEDIFF(dd,K.DateCreated,K.DateMostRecentAppearance) DaysMissing
INTO #FinalResults
FROM [NAACAB-SCH01].PlanetTogether_Data_Test.setup.MissingSetups K INNER JOIN	#Results J ON K.Setup = J.Setup
ORDER BY J.ScheduleDate,DaysMissing DESC

--SELECT *
--FROM #Results

DECLARE @numRows int
DECLARE @Receipientlist varchar(1000)
DECLARE @BlindRecipientlist varchar(1000)

SELECT @numRows = count(*) FROM #Results;


SET @ReceipientList = (STUFF((SELECT ';' + UserEmail 
						FROM tblConfiguratorUser G  INNER JOIN users.UserResponsibility  K ON  G.UserID = K.UserID
  						WHERE K.ResponsibilityID = 1 FOR XML PATH('')),1,1,''))

SET @ReceipientList = @ReceipientList +';'+ (STUFF((SELECT ';' + UserEmail 
						FROM tblConfiguratorUser G  INNER JOIN users.UserResponsibility  K ON  G.UserID = K.UserID
  						WHERE K.ResponsibilityID = 4 FOR XML PATH('')),1,1,''))

SET @BlindRecipientlist = 'Bryan.Eddy@aflglobal.com';

PRINT @ReceipientList


DECLARE @body1 VARCHAR(MAX)
DECLARE @subject VARCHAR(MAX)
DECLARE @query VARCHAR(MAX) = N'SELECT * FROM tempdb..#Results;'
SET @subject = 'Missing Setup Line Speeds for Open Orders' 
SET @body1 = 'There are  ' + CAST(@numRows AS NVARCHAR) + ' items that are missing setup line speeds with open orders.  Please review.' +CHAR(13)+CHAR(13)

DECLARE @tableHTML  NVARCHAR(MAX) ;
IF @numRows > 0
BEGIN
	
			SET @tableHTML =
				N'<H1>Missing Setup Line Speed Report</H1>' +
				N'<H2 span style=''font-size:16.0pt;font-family:"Calibri","sans-serif";color:#EB3814''>Items with the setups below will be unable to schedule.</H2>' +
				--N'<H2 style = ''color: EB3814''>' +
				N'<p>'+@body1+'</p>' +
				N'<p class=MsoNormal><span style=''font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D''>'+
				N'<table border="1">' +
				N'<tr>' +
				'<th>Days Missing</th><th># Affected SO Lines</th>' +
				'<th>FinishedGood</th><th>Item</th>' +
				N'<th>ItemDesc</th><th>ScheduleDate</th>' +
				N'<th>Setup</th><th>Atlernate</th><th>DepartmentCode</th>'+
				'</tr>' +
				CAST ( ( SELECT		td=DaysMissing, '',
									td=SoLinesMissingSetups, '',
									td=FinishedGood,    '',
									td=Item, '',
									td=ItemDesc, '', 
									td=ScheduleDate, '',
									td=Setup, '', 
									td=PrimaryAlt, '',
									td=DepartmentCode
									
							FROM #FinalResults 
						  FOR XML PATH('tr'), TYPE 
				) AS NVARCHAR(MAX) ) +
				N'</table>' ;

		
			EXEC msdb.dbo.sp_send_dbmail 
			@recipients=@ReceipientList,
			--@recipients = 'bryan.eddy@aflglobal.com;Rich.DiDonato@aflglobal.com',
			@blind_copy_recipients =  @BlindRecipientlist, --@ReceipientList
			@subject = @subject,
			@body = @tableHTML,
			@body_format = 'HTML';
END


GO
PRINT N'Altering [Oracle].[MarginRevenueExtractSalesHistory]'
GO
ALTER TABLE [Oracle].[MarginRevenueExtractSalesHistory] ALTER COLUMN [PRIMARY_QUANTITY] [decimal] (18, 5) NULL
GO
PRINT N'Creating index [IX_MarginRevenueExtractSalesHistory] on [Oracle].[MarginRevenueExtractSalesHistory]'
GO
CREATE NONCLUSTERED INDEX [IX_MarginRevenueExtractSalesHistory] ON [Oracle].[MarginRevenueExtractSalesHistory] ([ITEM_NUMBER]) ON [PRIMARY]
GO
PRINT N'Altering [dbo].[vSalesHistory]'
GO


/*
Author:		Bryan Eddy
Desc:		Show sales history to various applications
Date:		1/23/2018
Version:	1
Update:		Updated table to pull data from SalesHistory_BI_Data to Oracle.MarginRevenueExtractSalesHistory (Margin extract from Oracle)

*/


ALTER VIEW [dbo].[vSalesHistory]
AS
SELECT BOOKED_DATE AS DATE, BILL_TO_NAME AS CUSTOMER, ITEM_NUMBER, ITEM_DESCRIPTION,ORDER_NUMBER AS SO_NUMBER,REVENUE, SO_LINE_NUMBER
,CASE WHEN UNIT_OF_MEASURE = 'FT' THEN ROUND(QUANTITY/3.281,2) ELSE QUANTITY END AS QUANTITY
, CASE WHEN UNIT_OF_MEASURE = 'FT' THEN ROUND(REVENUE/QUANTITY/3.281,5) ELSE REVENUE END AS PricePerUOM
, CASE WHEN UNIT_OF_MEASURE = 'FT' THEN 'M' ELSE UNIT_OF_MEASURE END AS UOM
,CURR_MATERIAL_COST, CURR_RESOURCE_COST, CURR_OVERHEAD_COST
FROM Oracle.MarginRevenueExtractSalesHistory


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
PRINT N'Altering [dbo].[vBurnListingInventory]'
GO
ALTER VIEW [dbo].[vBurnListingInventory]
AS

SELECT DISTINCT dbo.CableUnion.Oracle
, dbo.CableUnion.[Item No] AS ItemNo
, CableUnion.ListingCompany AS ListingCompanyPrint
, K.Locator
, K.AvailQty
, K.LotNumber
, K.Subinv
, K.UOM
, K.ItemDesc
, ROUND([NominalOD]*0.03936996,4)AS NomODInches
, CAST(ROUND((12/([NominalOD]*0.03936996))*24*1.1/3.281,0) AS INT)AS BurnLengthFT_OFNP_ETL
, CAST(ROUND((12/([NominalOD]*0.03936996))*16.5*1.1/3.281,0) AS INT) AS BurnLengthFT_OFNR_ETL
, CAST(ROUND((900/([NominalOD]*0.03936996))*1.1/3/3.281,0) AS INT) AS BurnLengthFT_OFNP_UL
, CAST(ROUND(AvailQty*3.28,0) AS INT)AS QtyFt
, CAST(ROUND((12/([NominalOD]*0.03936996))*24*1.1/3.281 * B.Item_Cost,0) AS INT)AS CostBurnLengthFT_OFNP_ETL
, CAST(ROUND((12/([NominalOD]*0.03936996))*16.5*1.1/3.281 * B.Item_Cost,0) AS INT) AS CostBurnLengthFT_OFNR_ETL
, CAST(ROUND((900/([NominalOD]*0.03936996))*1.1/3/3.281 * B.Item_Cost,0) AS INT) AS CostBurnLengthFT_OFNP_UL
, B.Item_Status
, B.Item_Cost
, tblBurnListing.ListingTab
, tblBurnListing.ListingSection
, tblBurnListing.ListingConstruction
, tblBurnListing.ListingCompany
,printline2 + ' ' + printline3 AS CablePrint
,tblCableConstructions.CablePasses
--,substring( PrintLine3, charindex('OF', PrintLine3),CHARINDEX(' ',PrintLine3,CHARINDEX('OF',PrintLine3))-CHARINDEX('OF',PrintLine3)) as BurnPrint 
FROM DBO.AFLPRD_acswopattn_CAB_SNF K 
RIGHT JOIN dbo.CableUnion ON K.Item = dbo.CableUnion.Oracle
INNER JOIN tblCableConstructionReferences ON tblCableConstructionReferences.Base = dbo.CableUnion.Base
INNER JOIN tblCableConstructions ON tblCableConstructionReferences.BaseID = tblCableConstructions.BaseID
INNER JOIN tblBurnListing ON dbo.CableUnion.Base = tblBurnListing.base AND CableUnion.ListingCompany = tblBurnListing.ListingCompany
INNER JOIN dbo.AFLPRD_INVSysItemCost_CAB B ON dbo.CableUnion.Oracle = B.ItemNumber
--WHERE tblBurnListing.ListingCompany IN ('etl', 'ul')
WHERE NominalOD <>0 --AND ITEM = 'PD05668-01' 

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
PRINT N'Altering [dbo].[tblFiberTBCatalog]'
GO
ALTER TABLE [dbo].[tblFiberTBCatalog] ADD
[FiberCatalogID] [int] NOT NULL IDENTITY(1, 1)
GO
PRINT N'Creating [dbo].[vCutSheet_Constructions_DELETE]'
GO

CREATE VIEW [dbo].[vCutSheet_Constructions_DELETE]
as

SELECT DISTINCT 
                          tblCableConstructionReferences.base, 
						  tblCableConstructionReferences.FamilyID,
                         tblCableConstructionReferences.DesignCode, 
						 tblBOM_Base_Weight.Weight AS Weight_kg_per_m, 
						 tblDesignTypes.SalesForceDescription, 
                         tblDesignTypeGroups.DesignTypeGroupDesc, 
						 tblDesignCodeJacket.Jacket, 
						 tblCableConstructionReferences.TBType, 
                         tblCableConstructions.NominalOD, 
						 tblCableConstructionReferences.NumSubFillers, 
						 tblCableConstructionReferences.NumSubPositions, 
						 NULL FurcationTube, 
                         NULL Furcation, tblCableConstructions.CablePasses, 
						 cast(substring(tblCableConstructionReferences.DesignCode, 3,3) as int) FiberCount
						 ,CASE WHEN tblCableConstructionReferences.TBType = 'Ribbon' THEN substring(tblCableConstructionReferences.DesignCode, 6,2) 
						 ELSE (substring(tblCableConstructionReferences.DesignCode, 6,1) + '.' + substring(tblCableConstructionReferences.DesignCode, 7,1))+' mm'  END UnitOD
						 , tblCableConstructionReferences.BaseID, dbo.tblCableConstructionReferences.DesignTypeID
FROM            tbl_Fibers INNER JOIN
                         tblDesignCodeFiberElementValue ON tbl_Fibers.Fiber_Type = tblDesignCodeFiberElementValue.FiberLetter INNER JOIN
                         tblFiberTBCatalog ON tbl_Fibers.TBCatalogType = tblFiberTBCatalog.TBCatalogType INNER JOIN
                         tblFiberTBIndicators ON tblFiberTBCatalog.TBCatalogType = tblFiberTBIndicators.TBCatalogType INNER JOIN
                         tblBOM_Base_Weight INNER JOIN
                         tblCableTBType INNER JOIN
                         tblCableConstructionReferences INNER JOIN
                         tblCableTightBufferReference ON tblCableConstructionReferences.TBType = tblCableTightBufferReference.TBType INNER JOIN
                         tblCableConstructions ON tblCableConstructionReferences.BaseID = tblCableConstructions.BaseID ON 
                         tblCableTBType.TBIndicatorID = tblCableTightBufferReference.TBIndicatorID ON tblBOM_Base_Weight.BASE = tblCableConstructionReferences.Base INNER JOIN
                         tblDesignTypes ON tblCableConstructionReferences.DesignTypeID = tblDesignTypes.DesignTypeID INNER JOIN
                         tblDesignTypeGroups ON tblDesignTypes.DesignTypeGroupID = tblDesignTypeGroups.DesignTypeGroupID INNER JOIN
                         tblDesignCodeJacket ON tblCableConstructionReferences.CableFamily = tblDesignCodeJacket.CableLetter AND 
                         tblCableConstructionReferences.CableLevel1 = tblDesignCodeJacket.JacketLetter ON tblFiberTBIndicators.TBLetter = tblCableTBType.TBLetter
WHERE        (tblCableConstructionReferences.Active = 1) AND (tblCableConstructionReferences.ReleasedDesign = 1) AND (tblDesignCodeFiberElementValue.Active = 1) AND 
                         (tblDesignCodeFiberElementValue.FiberLetter NOT LIKE '%@%') AND (tblCableConstructionReferences.DesignTypeID IS NOT NULL) AND (tblDesignTypes.Active = 1) 
                         AND (tblDesignTypeGroups.Active = 1) AND (tblCableConstructionReferences.TBType <> 'Furcation') AND (tblCableConstructionReferences.ApprovedForQuoting = 1) 
                         AND (tbl_Fibers.Active = 1) --AND (tblCableConstructionReferences.Base = 'RQ072-4.5')
						 
--ORDER BY SalesForceDescription, base


GO
PRINT N'Refreshing [dbo].[vCableTightBufferType]'
GO
EXEC sp_refreshview N'[dbo].[vCableTightBufferType]'
GO
PRINT N'Altering [dbo].[vSinglePassComponentParent]'
GO
ALTER VIEW [dbo].[vSinglePassComponentParent]
AS
SELECT        CASE WHEN [New Oracle Part #] LIKE 'pt%' THEN LEFT([New Oracle Part #], 7) ELSE LEFT([New Oracle Part #], 8) END AS Component, COUNT(*) AS Count, 
                         LEFT(Customer, 3) AS Customer, [TB Material], [TB Nominal OD], [EZ Strip], [Fiber Oracle item] AS Fiber, RibbonHighCure, SUBSTRING([Item No], 3, 3) AS FiberCount, 
                         SUBSTRING([Item No], 12, 1) AS TBLetter, I.FibersPerBundle
FROM            dbo.[Basic Product Construction] K INNER JOIN dbo.tblCableConstructionReferences I ON I.BASE = K.Base
GROUP BY CASE WHEN [New Oracle Part #] LIKE 'pt%' THEN LEFT([New Oracle Part #], 7) ELSE LEFT([New Oracle Part #], 8) END, SUBSTRING([Item No], 3, 3), 
                         SUBSTRING([Item No], 12, 1), [TB Material], [TB Nominal OD], [EZ Strip], [Fiber Oracle item], RibbonHighCure, K.Active, LEFT(Customer, 3)
						 ,I.FibersPerBundle, I.CableType
HAVING        (CASE WHEN [New Oracle Part #] LIKE 'pt%' THEN LEFT([New Oracle Part #], 7) ELSE LEFT([New Oracle Part #], 8) END LIKE 'pt%' OR
                         CASE WHEN [New Oracle Part #] LIKE 'pt%' THEN LEFT([New Oracle Part #], 7) ELSE LEFT([New Oracle Part #], 8) END LIKE 'rbn%' OR
                         CASE WHEN [New Oracle Part #] LIKE 'pt%' THEN LEFT([New Oracle Part #], 7) ELSE LEFT([New Oracle Part #], 8) END LIKE 'swr%') AND (K.Active <> 0) AND 
                         (LEFT(Customer, 3) = 'AFL' or LEFT(Customer, 3) = 'unp') AND CABLETYPE <> 'FILLER'

GO
PRINT N'Refreshing [dbo].[vCorningPrintFiberExtension]'
GO
EXEC sp_refreshview N'[dbo].[vCorningPrintFiberExtension]'
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
PRINT N'Refreshing [Setup].[vSetup_Cable_Machine]'
GO
EXEC sp_refreshview N'[Setup].[vSetup_Cable_Machine]'
GO
PRINT N'Creating [Schedule].[vFBR00466Selection]'
GO
CREATE VIEW [Schedule].[vFBR00466Selection]
AS
SELECT Name, [Item Number], [Lot Number], Locator, [Box Number], [Onhand Qty]
FROM dbo.fi_fiber_length_extract_AFLPRD
WHERE [Item Number] LIKE 'FBR00356%' AND [MFD 1310nm] BETWEEN 8.7000 AND 9.2000
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
PRINT N'Altering [dbo].[qryBasePrint]'
GO

/*
Author:		Bryan Eddy
Date:		1/25/2018
Desc:		View to show print for items
Version:	1
Update:		Addd concatenated print field
*/

ALTER VIEW [dbo].[qryBasePrint]
AS
SELECT        [Print Line 1] AS PrintLine1, RTRIM([Customer]) AS Cust, [Print Line 2] AS PrintLine2, [Print Line 3] AS PrintLine3, LEFT([Item No], 2) AS CabFam, 
                         [New Oracle Part #] AS Oracle, [Print Line 4] AS PrintLine4, [Print Item No], [Print Type (base)], [Print Reel No], [Item No], OracleStatus, [NewPrintLine4]
						 , COALESCE([Print Line 1],'') + ' ' + COALESCE([print line 2],'') + ' ' + CASE WHEN [Print Item No] <> 0 THEN [Item No] + ' ' ELSE ' ' END 
						+ COALESCE([Print Line 3],'') + ' ' 
						+ CASE WHEN [Print Reel No] <> 0 THEN 'LOT ###### ' ELSE ' ' END + COALESCE([Print Line 4],'') AS ConcatPrintLine
FROM            [Basic Product Construction]
--UNION ALL
--SELECT        [Print Line 1] AS PrintLine1, RTRIM([Customer]) AS Cust, [Print Line 2] AS PrintLine2, [Print Line 3] AS PrintLine3, LEFT([Item No], 2) AS CabFam, 
--                         [New Oracle Part Number] AS Oracle, [Print Line 4] AS PrintLine4, [Print Item No], [Print Type (base)], [Print Reel No], [Item No], OracleStatus,[NewPrintLine4]
--FROM            [Basic (Cable/Sheath)]



GO
PRINT N'Refreshing [dbo].[vCutSheet]'
GO
EXEC sp_refreshview N'[dbo].[vCutSheet]'
GO
PRINT N'Refreshing [SalesForce].[vInterfacePrintView]'
GO
EXEC sp_refreshview N'[SalesForce].[vInterfacePrintView]'
GO
PRINT N'Altering [dbo].[vScheduling_SubUnitPrintSpacing]'
GO



ALTER VIEW [dbo].[vScheduling_SubUnitPrintSpacing]
AS
SELECT DISTINCT
    dbo.CableUnion.Oracle,
    dbo.CableUnion.Customer,
    tblUnitSeriesTemplate.PrintSpacing AS [print spacing],
    [Unit Series].[Unit Color Series],
    [Basic Product Construction].[Item No] AS [unit type],
    tblUnitSeriesTemplate.PrintSpacing,
    [Basic Product Construction].[Item No],
    [Basic Product Construction].[New Oracle Part #]
	,tblUnitSeriesTemplate.UnitNumber
FROM [Basic Product Construction]
    INNER JOIN(tblUnitSeriesTemplate
    RIGHT JOIN((dbo.CableUnion
    INNER JOIN [Unit Series]
        ON dbo.CableUnion.[Unit Series] = [Unit Series].[Unit Color Series])
    INNER JOIN tblCableConstructionReferences
        ON dbo.CableUnion.Base = tblCableConstructionReferences.Base)
        ON (tblUnitSeriesTemplate.UnitNumber = [Unit Series].UnitNumber)
           AND (tblUnitSeriesTemplate.UnitIDTypeNumber = tblCableConstructionReferences.UnitIDTypeNumber))
        ON [Basic Product Construction].[New Oracle Part #] = [Unit Series].OracleItem;


GO
PRINT N'Refreshing [dbo].[vCableConstruction]'
GO
EXEC sp_refreshview N'[dbo].[vCableConstruction]'
GO
PRINT N'Refreshing [dbo].[vCreateItemBaseCableExtensions]'
GO
EXEC sp_refreshview N'[dbo].[vCreateItemBaseCableExtensions]'
GO
PRINT N'Altering [dbo].[vItemSearch]'
GO
ALTER VIEW [dbo].[vItemSearch]
AS
SELECT        dbo.CableUnion.Oracle, dbo.CableUnion.Fiber, dbo.CableUnion.Color, dbo.CableUnion.Base, dbo.tblCableConstructions.StandardOperation, ItemNo, 
                         dbo.tblCableConstructions.CablePasses as 'Location', dbo.tblCableConstructionReferences.RevisionDate, dbo.CableUnion.Active, dbo.CableUnion.Reason, 
                         dbo.CableUnion.OracleStatus, dbo.CableUnion.PID, dbo.CableUnion.Fiber2, dbo.CableUnion.Fiber3, dbo.CableUnion.CustomerRev, dbo.CableUnion.[Revision Date], 
                         dbo.CableUnion.RibbonHighCure, dbo.CableUnion.PrintLine4, dbo.CableUnion.Customer, dbo.tblCableConstructions.JacketMaterial,dbo.CableUnion.ItemID,
                         dbo.tblCableConstructions.NominalOD, convert(date, [Revision Date]) RevDate, PrintSpacing , [Item No], dbo.CableUnion.DateCreated as CreationDate
						 ,tblCableConstructionReferences.DesignCode
FROM            dbo.CableUnion INNER JOIN
                         dbo.tblCableConstructionReferences ON dbo.CableUnion.Base = dbo.tblCableConstructionReferences.Base INNER JOIN
                         dbo.tblCableConstructions ON dbo.tblCableConstructionReferences.BaseID = dbo.tblCableConstructions.BaseID







GO
PRINT N'Altering [dbo].[tblStockItems]'
GO
ALTER TABLE [dbo].[tblStockItems] ADD
[RevisedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblStockItems_RevisedBy] DEFAULT (suser_sname()),
[RevisionDate] [datetime] NULL CONSTRAINT [DF_tblStockItems_RevisionDate] DEFAULT (getdate())
GO
PRINT N'Creating trigger [dbo].[StockItemsUpdate_trgr] on [dbo].[tblStockItems]'
GO
-- =============================================
-- Author:		Bryan Eddy
-- Create date: 1/24/2018
-- Description:	Update the fields for who made a revision to the record
-- =============================================
CREATE TRIGGER [dbo].[StockItemsUpdate_trgr] 
   ON  [dbo].[tblStockItems] 
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF UPDATE(Min_Order_Quantity) OR UPDATE(ItemNo) OR UPDATE(Price_feet)
		BEGIN
			UPDATE T
			SET RevisedBy = SUSER_SNAME(), RevisionDate = GETDATE()
			FROM dbo.tblStockItems T INNER JOIN Inserted I ON T.ItemNo = I.ItemNo
		END;

END
GO
PRINT N'Refreshing [Setup].[vSetupStandardOperationMismatch]'
GO
EXEC sp_refreshview N'[Setup].[vSetupStandardOperationMismatch]'
GO
PRINT N'Creating [dbo].[NumericParser]'
GO
-- =============================================
-- Author:		Bryan Eddy
-- Create date: 2/12/2018
-- Description:	Function to remove non-numeric characters from a string
-- =============================================
CREATE FUNCTION [dbo].[NumericParser] 
(	
	-- Add the parameters for the function here

	@textval nvarchar(MAX)
)
RETURNS
@NumericValues 
TABLE (NumericValue int)
AS
	begin

		INSERT INTO  @NumericValues
		SELECT LEFT(SUBSTRING(@textval, PATINDEX('%[0-9.-]%', @textval), 8000),
				   PATINDEX('%[^0-9.-]%', SUBSTRING(@textval, PATINDEX('%[0-9.-]%', @textval), 8000) + 'X') -1)
	RETURN
	end

GO
PRINT N'Creating [Oracle].[Machines]'
GO
CREATE TABLE [Oracle].[Machines]
(
[MachineID] [int] NOT NULL IDENTITY(100, 1),
[MachineName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Machines__Create__61D22120] DEFAULT (suser_sname()),
[DateCreated] [datetime] NULL CONSTRAINT [DF__Machines__DateCr__62C64559] DEFAULT (getdate())
) ON [PRIMARY]
GO
PRINT N'Creating primary key [PK__Machines__44EE5B58C6442E04] on [Oracle].[Machines]'
GO
ALTER TABLE [Oracle].[Machines] ADD CONSTRAINT [PK__Machines__44EE5B58C6442E04] PRIMARY KEY CLUSTERED  ([MachineID]) ON [PRIMARY]
GO
PRINT N'Adding constraints to [Oracle].[Machines]'
GO
ALTER TABLE [Oracle].[Machines] ADD CONSTRAINT [IX_Machines] UNIQUE NONCLUSTERED  ([MachineName]) ON [PRIMARY]
GO
PRINT N'Creating [Oracle].[MachineMappingToNCMIR]'
GO
CREATE TABLE [Oracle].[MachineMappingToNCMIR]
(
[NcmirMachineID] [int] NULL,
[OracleMachineID] [int] NULL,
[MachineMappingID] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY]
GO
PRINT N'Creating primary key [PK_MachineMappingToNCMIR] on [Oracle].[MachineMappingToNCMIR]'
GO
ALTER TABLE [Oracle].[MachineMappingToNCMIR] ADD CONSTRAINT [PK_MachineMappingToNCMIR] PRIMARY KEY CLUSTERED  ([MachineMappingID]) ON [PRIMARY]
GO
PRINT N'Creating index [UQ__MachineM__65FF5465ECE2D5EF] on [Oracle].[MachineMappingToNCMIR]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ__MachineM__65FF5465ECE2D5EF] ON [Oracle].[MachineMappingToNCMIR] ([NcmirMachineID], [OracleMachineID]) ON [PRIMARY]
GO
PRINT N'Altering [dbo].[AFLPRD_COMMON_QA_PROCESS_FY_2017_todate]'
GO
ALTER TABLE [dbo].[AFLPRD_COMMON_QA_PROCESS_FY_2017_todate] ADD
[MesID] [int] NOT NULL IDENTITY(1, 1)
GO
ALTER TABLE [dbo].[AFLPRD_COMMON_QA_PROCESS_FY_2017_todate] ALTER COLUMN [Transaction Time] [time] NULL
GO
PRINT N'Creating primary key [pk_Mes] on [dbo].[AFLPRD_COMMON_QA_PROCESS_FY_2017_todate]'
GO
ALTER TABLE [dbo].[AFLPRD_COMMON_QA_PROCESS_FY_2017_todate] ADD CONSTRAINT [pk_Mes] PRIMARY KEY CLUSTERED  ([MesID]) ON [PRIMARY]
GO
PRINT N'Creating index [IX_AFLPRD_COMMON_QA_PROCESS_FY_2017_todate] on [dbo].[AFLPRD_COMMON_QA_PROCESS_FY_2017_todate]'
GO
CREATE NONCLUSTERED INDEX [IX_AFLPRD_COMMON_QA_PROCESS_FY_2017_todate] ON [dbo].[AFLPRD_COMMON_QA_PROCESS_FY_2017_todate] ([Actual Machine], [JOB]) ON [PRIMARY]
GO
PRINT N'Creating [Oracle].[vInterFaceMesNcmirProcessData]'
GO

/*
Author:		Bryan Eddy
Desc:		Connect the Oracle Mes data to Ncmir and construction data
			Allow for process engineers to perform roote cause analysis
			Attached to excel file
Date:		1/26/2018
Version:	1
Update:		Initial creation

*/
CREATE VIEW [Oracle].[vInterFaceMesNcmirProcessData]
AS
WITH cteMesNcmir
AS (		
	SELECT DISTINCT --MachMap.NcmirMachineID,
	NCMIR.ResponsibleMachine,NCMIR.IssuingDepartment,NCMIR.Machine IssuingMachine,  NCMIR.ResponsibleDepartment
	, Mes.[Actual Machine] MesMachine
	,mes.[Sales Order Number] SalesOrder, Mes.[SO Line #] SalesOrderLine--, Mes.[Cut Number] MesCutNumber, NCMIR.CutNumber NcmirCutNumber
	,Mes.ITEM ItemNumber,Mes.JOB AS JobNumber, CAST(NCMIR.ProblemDescription AS NVARCHAR(MAX)) ProblemDescription,NCMIR.Category,NCMIR.FinalDispositions, NCMIR.CauseCategory
	, NCMIR.CurrentCableLength,NCMIR.Customer, 
	Mes.[Actual Line Speed], Mes.[Design Line Speed], Mes.[Transaction Date] + Mes.[Transaction Time] AS TransactionDate
	, ncmir.Number NcmirNumber,Mes.[NCMIR #] MesNcmirNumber, Mes.[STD Operation] SetupNumber
	,Mes.[QTS OTDR Length], Mes.[QTY Produced], Mes.[QTY Requested], Mes.[Record Entered By],CAST(NCMIR.EngineeringComments AS  NVARCHAR(MAX)) EngineeringComments,
	G.NumericValue MesCutNumber, COALESCE(K.NumericValue,0) NcmirCutNumber
	FROM  dbo.AFLPRD_COMMON_QA_PROCESS_FY_2017_todate Mes 
			LEFT JOIN Oracle.Machines OrclMach ON Mes.[Actual Machine] = OrclMach.MachineName 
			LEFT JOIN ORACLE.MachineMappingToNCMIR MachMap ON MachMap.OracleMachineID = OrclMach.MachineID
			CROSS APPLY Dbo.usf_SplitString(Mes.[NCMIR #],',')  AS MesNcmir 
			LEFT JOIN [NAAMFG-SQL01].[Ncmir].[dbo].[vInterfaceMainExtract]  NCMIR 
			ON  --LTRIM(MesNcmir.part) = CAST(NCMIR.Number AS NVARCHAR(50)) and
			Mes.JOB =  NCMIR.JobNumber
			AND ncmir.ResponsibleMachineID = MachMap.NcmirMachineID 
			CROSS APPLY dbo.NumericParser(NCMIR.CutNumber) K 
			CROSS APPLY dbo.NumericParser(Mes.[Cut Number]) G
	WHERE G.NumericValue = COALESCE(K.NumericValue,0)
	),
cteMesNcmirCount
AS(
	SELECT DISTINCT 
	CASE WHEN ProblemDescription IS NULL THEN 0 ELSE COUNT(*) OVER (PARTITION BY M.JobNumber, M.MesCutNumber, M.SetupNumber) END  AS NumNcmirsPerJobPerCut,
	CASE WHEN M.ProblemDescription IS NULL THEN 'Yes' ELSE 'No' END AS RFT
	,m.*
	FROM cteMesNcmir M 
)
SELECT DISTINCT m.*, D.SalesForceDescription, C.NominalOD, P.Base, P.[Item No] CatalogCode
FROM cteMesNcmirCount M INNER JOIN dbo.[Basic Product Construction] P ON P.[New Oracle Part #] = M.ItemNumber
						INNER JOIN dbo.tblCableConstructionReferences R ON R.BASE = P.BASE 
						INNER JOIN dbo.tblCableConstructions C ON C.BaseID = R.BaseID
						INNER JOIN dbo.tblDesignTypes D ON D.DesignTypeID = R.DesignTypeID
						--RIGHT JOIN #Temp T ON T.NmcirNumber = M.NcmirNumber
--WHERE M.JobNumber = '15955286-2049799'


GO
PRINT N'Refreshing [dbo].[vSubunitBases]'
GO
EXEC sp_refreshview N'[dbo].[vSubunitBases]'
GO
PRINT N'Altering [dbo].[vConstructionSearch]'
GO
/*WHERE FamilyID = 25
WHERE tblCableConstructionReferences.base = 'ER012-3.0-SW'*/
ALTER VIEW [dbo].[vConstructionSearch]
AS
SELECT DISTINCT 
                         dbo.tblCableConstructionReferences.Base, dbo.tblCableConstructionReferences.DesignCode, dbo.tblCableConstructionReferences.DesignExtension, 
                         dbo.tblCableConstructionReferences.ConstructionDescription, dbo.tblCableConstructionReferences.BaseID, dbo.tblCableConstructionReferences.NumSubFillers, 
                         dbo.tblCableConstructionReferences.Active, dbo.tblCableConstructionReferences.PrefixID, dbo.tblCableConstructionReferences.ProductID, 
                         dbo.tblCableConstructionReferences.SetupID, dbo.tblCableConstructionReferences.FamilyID, dbo.tblCableConstructionReferences.FibersPerBundle, 
                         dbo.tblCableConstructionReferences.UnitIDTypeNumber, dbo.tblCableConstructions.StandardOperation, dbo.tblCableConstructions.JacketMaterial, 
                         dbo.tblCableConstructions.ODTolPlus, dbo.tblCableConstructions.ODTolMinus, dbo.tblCableConstructions.Height, dbo.tblCableConstructions.HeightTolPlus, 
                         dbo.tblCableConstructions.HeightTolMinus, dbo.tblCableConstructions.NominalWall, dbo.tblCableConstructions.MaxAveWall, dbo.tblCableConstructions.MinAveWall, 
                         dbo.tblCableConstructions.MinSpotWall, dbo.tblCableConstructions.AramidType1, dbo.tblCableConstructions.AramidEnds1, dbo.tblCableConstructions.AramidType2, 
                         dbo.tblCableConstructions.AramidEnds2, dbo.tblCableConstructions.ChipType, dbo.tblCableConstructions.Ripcord, dbo.tblCableConstructions.LayLength, 
                         dbo.tblCableConstructions.Talc, dbo.tblCableConstructions.FRP_Dia, dbo.tblCableConstructions.CM, dbo.tblCableConstructions.CMMaterial, 
                         dbo.tblCableConstructions.CM_OD, dbo.tblCableConstructions.CMODTolPlus, dbo.tblCableConstructions.CMODTolMinus, dbo.tblCableConstructions.CMWall, 
                         dbo.tblCableConstructions.CMMinWall, dbo.tblCableConstructions.HelixFactor, dbo.tblCableConstructions.CoreWrap, dbo.tblCableConstructions.CoreDia, 
                         dbo.tblCableConstructions.Binder1, dbo.tblCableConstructions.QtyBinder1, dbo.tblCableConstructions.Binder1LayLength, dbo.tblCableConstructions.Binder2, 
                         dbo.tblCableConstructions.QtyBinder2, dbo.tblCableConstructions.Binder2LayLength, dbo.tblCableConstructions.Binder3, dbo.tblCableConstructions.QtyBinder3, 
                         dbo.tblCableConstructions.Binder3LayLength, CASE WHEN [CablePasses] IS NULL THEN 0 ELSE CAST(CablePasses AS int) END AS Location, 
                         dbo.tblCableConstructions.RevisionDate, dbo.tblCableConstructions.RevisionNumber, dbo.tblCableConstructions.RevisionHistory, 
                         dbo.tblCableConstructions.Instructions, dbo.tblCableConstructions.Instructions2, dbo.tblCableConstructions.SSMA_TimeStamp, 
                         dbo.tblCableConstructions.DateCreated, dbo.tblCableConstructions.CreatedBy, dbo.tblCableConstructions.RevisedBy, 
                         dbo.tblCableConstructions.ColorChipPercentage, dbo.tblCableConstructionReferences.InactiveReason, CASE WHEN CablePasses = 2 THEN SUBSTRING([Base], 7, 3) 
                         ELSE '' END AS SubOD, dbo.tblCableConstructions.NominalOD, dbo.tblCableConstructionReferences.NumSubPositions, 
                         dbo.tblCableConstructionReferences.ReleasedDesign, dbo.tblCableConstructionReferences.TBType, dbo.tblDesignTypes.SalesForceDescription, 
                         CASE WHEN CablePasses = 1 THEN '' ELSE SUBSTRING(dbo.vSubunitBases.[Level 1 Product], 3, 3) END AS SubFiberCount, 
                         dbo.tblCableConstructionReferences.FiberCount, dbo.tblDesignCodeJacket.JacketDescription_SalesForce, 
                         dbo.tblCableConstructionReferences.ApprovedForQuoting, dbo.tblCableConstructionReferences.SetupID AS ConstructionID
FROM            dbo.tblCableConstructionReferences LEFT OUTER JOIN
                         dbo.tblDesignTypes ON dbo.tblCableConstructionReferences.DesignTypeID = dbo.tblDesignTypes.DesignTypeID LEFT OUTER JOIN
                         dbo.tblDesignCodeJacket ON dbo.tblCableConstructionReferences.CableFamily = dbo.tblDesignCodeJacket.CableLetter AND 
                         dbo.tblCableConstructionReferences.CableLevel1 = dbo.tblDesignCodeJacket.JacketLetter LEFT OUTER JOIN
                         dbo.vSubunitBases ON dbo.tblCableConstructionReferences.SetupID = dbo.vSubunitBases.ProductID LEFT OUTER JOIN
                         dbo.tblCableConstructions ON dbo.tblCableConstructionReferences.BaseID = dbo.tblCableConstructions.BaseID




GO
PRINT N'Refreshing [dbo].[vBurnTestingLength]'
GO
EXEC sp_refreshview N'[dbo].[vBurnTestingLength]'
GO
PRINT N'Refreshing [dbo].[vCutSheet_Fiber2]'
GO
EXEC sp_refreshview N'[dbo].[vCutSheet_Fiber2]'
GO
PRINT N'Refreshing [dbo].[Build CM Base]'
GO
EXEC sp_refreshview N'[dbo].[Build CM Base]'
GO
PRINT N'Refreshing [dbo].[vItemPrintByLine]'
GO
EXEC sp_refreshview N'[dbo].[vItemPrintByLine]'
GO
PRINT N'Altering [dbo].[vFindCutSheet]'
GO
/*
Author:		Bryan Eddy
Date:		1/11/2018
Desc:		Data provided for cut sheet view
Version:	1
Update:		Changed criteria to allow for more items to be viewed for cut sheets

*/
ALTER VIEW [dbo].[vFindCutSheet]
as
SELECT DISTINCT 
                         CableUnion.Oracle, CableUnion.Fiber, CableUnion.Color, CableUnion.Base, tblCableConstructions_1.StandardOperation, CableUnion.ItemNo, tblCableConstructions_1.CablePasses AS Location, 
                         tblCableConstructionReferences.RevisionDate, CableUnion.OracleStatus, CableUnion.PID, CableUnion.Fiber2, CableUnion.Customer, tblCableConstructions_1.NominalOD, CONVERT(DATE, CableUnion.[Revision Date]) 
                         AS RevDate, CableUnion.PrintSpacing, CableUnion.[Item No], tblCableConstructions_1.TensileApplication, tblCableConstructionReferences.DesignTypeID, tblCableConstructions_1.TemperatureApplication, 
                         tblDesignTypes.SalesForceDescription, CAST(SUBSTRING(CableUnion.ItemNo, 3, 3) AS INT) AS FiberCount, tblCableConstructionReferences.CableType, tblCableConstructionReferences.NumSubPositions, 
                         tblCableConstructionReferences.NumCopperUnits, 
                         CASE WHEN tblCableConstructions_1.CablePasses = 1 THEN tblCableConstructionReferences.FibersPerBundle ELSE tblCableConstructionReferences_1.FibersPerBundle END AS FibersPerBundle, 
                         CASE WHEN tblCableConstructions_1.CablePasses = 1 THEN tblCableConstructions_1.NominalOD ELSE tblCableConstructions.NominalOD END AS SubOD, tblCutSheetApproval.Technical_Approval, 
                         tblCutSheetApproval.Commercial_Approval, tblCutSheetApproval.Requested, CASE WHEN ((tblCutSheetApproval.Commercial_Approval = 0 OR
                         tblCutSheetApproval.Technical_Approval = 0 OR
                         COALESCE (vArmorCoreItems_Approvals.CorCommercial_Approval, 1) = 0 OR
                         COALESCE (vArmorCoreItems_Approvals.CoreTechnical_Approval, 1) = 0)) AND Requested = 1 THEN 'Requested' WHEN ((tblCutSheetApproval.Commercial_Approval = 0 OR
                         tblCutSheetApproval.Technical_Approval = 0 OR
                         COALESCE (vArmorCoreItems_Approvals.CorCommercial_Approval, 1) = 0 OR
                         COALESCE (vArmorCoreItems_Approvals.CoreTechnical_Approval, 1) = 0)) AND Requested = 0 THEN 'Not Approved' ELSE 'Approved' END AS Status
						 ,tblCableConstructionReferences.SetupID AS ConstructionID, ItemID
FROM            CableUnion INNER JOIN
                         tblCableConstructionReferences ON CableUnion.Base = tblCableConstructionReferences.Base INNER JOIN
                         tblCableConstructions AS tblCableConstructions_1 ON tblCableConstructionReferences.BaseID = tblCableConstructions_1.BaseID INNER JOIN
                         tblDesignTypes ON tblCableConstructionReferences.DesignTypeID = tblDesignTypes.DesignTypeID INNER JOIN
                         tblCableTightBufferReference ON tblCableConstructionReferences.TBType = tblCableTightBufferReference.TBType INNER JOIN
                         tblCutSheetApproval ON tblCableConstructionReferences.Base = tblCutSheetApproval.Base LEFT OUTER JOIN
                         --tblCableTemperatureStandards ON tblCableConstructions_1.TemperatureApplication = tblCableTemperatureStandards.TemperatureApplication LEFT OUTER JOIN
                         vSubunitBases RIGHT OUTER JOIN
                         tblCableConstructionReferences AS tblCableConstructionReferences_1 ON vSubunitBases.[Level 1 Product] = tblCableConstructionReferences_1.Base ON 
                         tblCableConstructionReferences.SetupID = vSubunitBases.ProductID LEFT OUTER JOIN
                         tblCableConstructions ON tblCableConstructionReferences_1.BaseID = tblCableConstructions.BaseID LEFT OUTER JOIN
                         Standards.CableConstructionStandards ON Standards.CableConstructionStandards.BaseID = tblCableConstructions_1.BaseID LEFT OUTER JOIN
                         vArmorCoreItems_Approvals ON vArmorCoreItems_Approvals.ArmoredItem = CableUnion.Oracle
						 INNER JOIN dbo.tblCableType K ON K.CableType = tblCableConstructionReferences.CableType
WHERE        (CableUnion.Customer LIKE 'AFL STANDARD%' OR
                         CableUnion.Customer LIKE 'AFL GENERIC%' OR  CableUnion.Oracle LIKE 'DN%') AND (tblCableConstructionReferences.ReleasedDesign <> 0) AND (CableUnion.Oracle NOT LIKE '%test%') AND (CableUnion.OracleStatus <> 'Obsolete') AND 
                         (CableUnion.OracleStatus <> 'Discontd') AND (ISNUMERIC(SUBSTRING(CableUnion.ItemNo, 3, 3)) = 1) AND (CableUnion.Active <> 0) AND 
                         (tblCableConstructionReferences.ReleasedDesign <> 0) AND (CableUnion.OracleStatus <> 'Obsolete') AND (CableUnion.OracleStatus <> 'Discontd') AND 
                         (ISNUMERIC(SUBSTRING(CableUnion.ItemNo, 3, 3)) = 1) AND (CableUnion.Active <> 0) AND (CableUnion.Oracle NOT LIKE '%test%') AND K.CableID = 1 --AND LEFT(ORACLE,1) = 'P'




GO
PRINT N'Refreshing [dbo].[FiberAllComponents]'
GO
EXEC sp_refreshview N'[dbo].[FiberAllComponents]'
GO
PRINT N'Refreshing [dbo].[vSchedulingGanttFiberPlanning]'
GO
EXEC sp_refreshview N'[dbo].[vSchedulingGanttFiberPlanning]'
GO
PRINT N'Refreshing [dbo].[FiberSumTotalForAllItems]'
GO
EXEC sp_refreshview N'[dbo].[FiberSumTotalForAllItems]'
GO
PRINT N'Altering [dbo].[AFLPRD_onhandqty_STD_Detailed_81_CAB]'
GO
ALTER TABLE [dbo].[AFLPRD_onhandqty_STD_Detailed_81_CAB] ALTER COLUMN [QTY] [float] NULL
GO
PRINT N'Altering [dbo].[WorkTime]'
GO
-- =============================================
-- Author:      Baran Kaynak (modified by Kodak 2012-04-18)
-- Create date: 14.03.2011
-- Description: 09:30 ile 17:30 arasındaki iş saatlerini hafta sonlarını almayarak toplar.
-- =============================================
ALTER FUNCTION [dbo].[WorkTime] 
(
    @StartDate DATETIME,
    @FinishDate DATETIME
)
RETURNS BIGINT
AS
BEGIN
    DECLARE @Temp BIGINT
    SET @Temp=0

    DECLARE @FirstDay DATE
    SET @FirstDay = CONVERT(DATE, @StartDate, 112)

    DECLARE @LastDay DATE
    SET @LastDay = CONVERT(DATE, @FinishDate, 112)

    DECLARE @StartTime TIME
    SET @StartTime = CONVERT(TIME, @StartDate)

    DECLARE @FinishTime TIME
    SET @FinishTime = CONVERT(TIME, @FinishDate)

    DECLARE @WorkStart TIME
    SET @WorkStart = '08:00'

    DECLARE @WorkFinish TIME
    SET @WorkFinish = '17:00'

    DECLARE @DailyWorkTime BIGINT
    SET @DailyWorkTime = DATEDIFF(MINUTE, @WorkStart, @WorkFinish)

    IF (@StartTime<@WorkStart)
    BEGIN
        SET @StartTime = @WorkStart
    END
    IF (@FinishTime>@WorkFinish)
    BEGIN
        SET @FinishTime=@WorkFinish
    END
    IF (@FinishTime<@WorkStart)
    BEGIN
        SET @FinishTime=@WorkStart
    END
    IF (@StartTime>@WorkFinish)
    BEGIN
        SET @StartTime = @WorkFinish
    END

    DECLARE @CurrentDate DATE
    SET @CurrentDate = @FirstDay
    DECLARE @LastDate DATE
    SET @LastDate = @LastDay

    WHILE(@CurrentDate<=@LastDate)
    BEGIN       
        IF (DATEPART(dw, @CurrentDate)!=1 AND DATEPART(dw, @CurrentDate)!=7)
        BEGIN
            IF (@CurrentDate!=@FirstDay) AND (@CurrentDate!=@LastDay)
            BEGIN
                SET @Temp = @Temp + @DailyWorkTime
            END
            --IF it starts at startdate and it finishes not this date find diff between work finish and start as minutes
            ELSE IF (@CurrentDate=@FirstDay) AND (@CurrentDate!=@LastDay)
            BEGIN
                SET @Temp = @Temp + DATEDIFF(MINUTE, @StartTime, @WorkFinish)
            END

            ELSE IF (@CurrentDate!=@FirstDay) AND (@CurrentDate=@LastDay)
            BEGIN
                SET @Temp = @Temp + DATEDIFF(MINUTE, @WorkStart, @FinishTime)
            END
            --IF it starts and finishes in the same date
            ELSE IF (@CurrentDate=@FirstDay) AND (@CurrentDate=@LastDay)
            BEGIN
                SET @Temp = DATEDIFF(MINUTE, @StartTime, @FinishTime)
            END
        END
        SET @CurrentDate = DATEADD(day, 1, @CurrentDate)
    END

    -- Return the result of the function
    IF @Temp<0
    BEGIN
        SET @Temp=0
    END
    RETURN @Temp

END
GO
PRINT N'Altering [dbo].[rp_revenue_margin_extract_POBI_AllHistory]'
GO
ALTER TABLE [dbo].[rp_revenue_margin_extract_POBI_AllHistory] ALTER COLUMN [BILL_TO_NUMBER] [int] NULL
GO
ALTER TABLE [dbo].[rp_revenue_margin_extract_POBI_AllHistory] ALTER COLUMN [SHIP_TO_NUMBER] [int] NULL
GO
ALTER TABLE [dbo].[rp_revenue_margin_extract_POBI_AllHistory] ALTER COLUMN [REVENUE] [decimal] (18, 6) NULL
GO
ALTER TABLE [dbo].[rp_revenue_margin_extract_POBI_AllHistory] ALTER COLUMN [QUANTITY] [decimal] (18, 4) NULL
GO
ALTER TABLE [dbo].[rp_revenue_margin_extract_POBI_AllHistory] ALTER COLUMN [CURR_MATERIAL_COST] [money] NULL
GO
ALTER TABLE [dbo].[rp_revenue_margin_extract_POBI_AllHistory] ALTER COLUMN [CURR_RESOURCE_COST] [money] NULL
GO
ALTER TABLE [dbo].[rp_revenue_margin_extract_POBI_AllHistory] ALTER COLUMN [CURR_OVERHEAD_COST] [money] NULL
GO
ALTER TABLE [dbo].[rp_revenue_margin_extract_POBI_AllHistory] ALTER COLUMN [CURR_OUTSIDE_PROCESSING_COST] [money] NULL
GO
ALTER TABLE [dbo].[rp_revenue_margin_extract_POBI_AllHistory] ALTER COLUMN [ACTUAL_MATERIAL_COST] [money] NULL
GO
ALTER TABLE [dbo].[rp_revenue_margin_extract_POBI_AllHistory] ALTER COLUMN [ACTUAL_RESOURCE_COST] [money] NULL
GO
ALTER TABLE [dbo].[rp_revenue_margin_extract_POBI_AllHistory] ALTER COLUMN [ACTUAL_OVERHEAD_COST] [money] NULL
GO
ALTER TABLE [dbo].[rp_revenue_margin_extract_POBI_AllHistory] ALTER COLUMN [ACTUAL_OUTSIDE_PROCESSING_COST] [money] NULL
GO
ALTER TABLE [dbo].[rp_revenue_margin_extract_POBI_AllHistory] ALTER COLUMN [PRIMARY_QUANTITY] [decimal] (18, 5) NULL
GO
ALTER TABLE [dbo].[rp_revenue_margin_extract_POBI_AllHistory] ALTER COLUMN [CURR_MATERIAL_OVERHEAD_COST] [money] NULL
GO
ALTER TABLE [dbo].[rp_revenue_margin_extract_POBI_AllHistory] ALTER COLUMN [ACTUAL_MATERIAL_OVERHEAD_COST] [money] NULL
GO
PRINT N'Creating [dbo].[tblFiberElementValue]'
GO
CREATE TABLE [dbo].[tblFiberElementValue]
(
[FiberLetter] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FiberValue] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Count] [int] NULL
) ON [PRIMARY]
GO
PRINT N'Creating primary key [tblFiberElementValue$PrimaryKey] on [dbo].[tblFiberElementValue]'
GO
ALTER TABLE [dbo].[tblFiberElementValue] ADD CONSTRAINT [tblFiberElementValue$PrimaryKey] PRIMARY KEY CLUSTERED  ([FiberLetter]) ON [PRIMARY]
GO
PRINT N'Creating [PrintSafe].[usp_PrintDefectImageBackup]'
GO

/*
-- =============================================
-- Author:		Bryan Eddy
-- ALTER date:	1/29/2018
-- Description:	Back up defective camera images for each line
-- Version:		1 
-- Update:		n/a
-- =============================================
*/
create PROCEDURE [PrintSafe].[usp_PrintDefectImageBackup]
AS
DECLARE
@Cur Cursor, 
@Command1 varchar(200),
@Command2 varchar(200),
@Command3 VARCHAR(200),
@Command4 varchar(200),
@Command5 varchar(200),
@Command6 varchar(200),
@Command7 varchar(200),
@Command8 varchar(200),
@Machine VARCHAR(50),
@Dir NVARCHAR(100),
@File nvarchar(100),
@FileDir nvarchar(200)
SET @File = 'ImageFailBackup.bat'
SET @Dir = '\\naa.fujikurausa.com\dfs\SPB\MFGSHARE\'
SET @FileDir = @Dir + @File
SET NOCOUNT ON


IF OBJECT_ID(N'tempdb..#Machines', N'U') IS NOT NULL
DROP TABLE #Machines;
CREATE TABLE #Machines(
Machine  nvarchar(20)
)
INSERT INTO #Machines
(
    Machine
)
VALUES
('lineb1'),
('lineB2'),
('lineb4'),
('lineb6'),
('lineb9'),
('lineb10'),
('blineb11'),
('lineb18');

BEGIN
    SET @Cur = CURSOR FOR SELECT Machine FROM #Machines
    OPEN @Cur
    FETCH NEXT FROM @Cur INTO @Machine
    WHILE (@@FETCH_STATUS = 0)
    BEGIN
	
	SET @Command1 = 'echo echo on > ' + @FileDir + 'NO_OUTPUT'
	SET @Command2 = 'echo SET Today=%Date:~10,4%_%Date:~4,2%_%Date:~7,2% >> ' + @FileDir + 'NO_OUTPUT'
	SET @Command3 =	'echo echo %Today=% >> '  + @FileDir + 'NO_OUTPUT'
	SET @Command4 =	'echo SET Source=' + @Dir + @Machine + '\Fails >> ' + @FileDir + 'NO_OUTPUT'
	SET @Command5 =	'echo SET Target=' + @Dir + @Machine + '\BackupFails\%Today% >> ' + @FileDir + 'NO_OUTPUT'
	SET @Command6 =	'echo REM mkdir %Today% >> ' + @FileDir + 'NO_OUTPUT'
	SET @Command7 =	'echo if not exist %Target% mkdir %Target% >> ' + @FileDir + 'NO_OUTPUT'
	SET @Command8 =	'echo robocopy %Source% %Target% /MOV /njh /njs /ndl /nc /ns /np /nfl >> '  + @FileDir + 'NO_OUTPUT'


       EXEC master..xp_cmdshell @Command1 
	   EXEC master..xp_cmdshell @Command2;
	   EXEC master..xp_cmdshell @Command3;
	   EXEC master..xp_cmdshell @Command4;
	   EXEC master..xp_cmdshell @Command5;
	   EXEC master..xp_cmdshell @Command6;
	   EXEC master..xp_cmdshell @Command7;
	   EXEC master..xp_cmdshell @Command8;


	   EXEC xp_cmdshell @FileDir

	    FETCH NEXT FROM @Cur
		INTO @Machine
    END;

	CLOSE @Cur
	DEALLOCATE @Cur

END;

DROP TABLE #Machines


GO
PRINT N'Adding constraints to [dbo].[tblUnitSeriesTemplate]'
GO
ALTER TABLE [dbo].[tblUnitSeriesTemplate] ADD CONSTRAINT [chk_UnitType] CHECK (([UnitIDType]='Unit' OR [UnitIDType]='Color' OR [UnitIDType]='Filler'))
GO
PRINT N'Creating extended properties'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premise Configurator.[tblFiberElementValue]', 'SCHEMA', N'dbo', 'TABLE', N'tblFiberElementValue', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premise Configurator.[tblFiberElementValue].[Count]', 'SCHEMA', N'dbo', 'TABLE', N'tblFiberElementValue', 'COLUMN', N'Count'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premise Configurator.[tblFiberElementValue].[FiberLetter]', 'SCHEMA', N'dbo', 'TABLE', N'tblFiberElementValue', 'COLUMN', N'FiberLetter'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premise Configurator.[tblFiberElementValue].[FiberValue]', 'SCHEMA', N'dbo', 'TABLE', N'tblFiberElementValue', 'COLUMN', N'FiberValue'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premise Configurator.[tblFiberElementValue].[PrimaryKey]', 'SCHEMA', N'dbo', 'TABLE', N'tblFiberElementValue', 'CONSTRAINT', N'tblFiberElementValue$PrimaryKey'
GO

