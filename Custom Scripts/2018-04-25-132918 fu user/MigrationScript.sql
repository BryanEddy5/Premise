/*
This migration script replaces uncommitted changes made to these objects:
Buff#1/#2 Alloc Table
vCutSheet_Constructions_DELETE

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
PRINT N'Dropping [dbo].[vCutSheet_Constructions_DELETE]'
GO
DROP VIEW [dbo].[vCutSheet_Constructions_DELETE]
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
PRINT N'Refreshing [dbo].[vSchedulingConstructionData]'
GO
EXEC sp_refreshview N'[dbo].[vSchedulingConstructionData]'
GO
PRINT N'Altering [dbo].[Buff#1/#2 Alloc Table]'
GO
ALTER TABLE [dbo].[Buff#1/#2 Alloc Table] ADD
[B2_Second_Pass] [decimal] (18, 3) NULL
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
PRINT N'Refreshing [dbo].[vCosntructionReferenceActiveDesignCodeExtensions]'
GO
EXEC sp_refreshview N'[dbo].[vCosntructionReferenceActiveDesignCodeExtensions]'
GO
PRINT N'Refreshing [dbo].[vCableConstructions]'
GO
EXEC sp_refreshview N'[dbo].[vCableConstructions]'
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
PRINT N'Refreshing [dbo].[vFindImages_AllBases]'
GO
EXEC sp_refreshview N'[dbo].[vFindImages_AllBases]'
GO
PRINT N'Refreshing [Schedule].[vInactiveItems]'
GO
EXEC sp_refreshview N'[Schedule].[vInactiveItems]'
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
PRINT N'Refreshing [dbo].[vSubunitConstruction]'
GO
EXEC sp_refreshview N'[dbo].[vSubunitConstruction]'
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
PRINT N'Refreshing [dbo].[vDesignCode]'
GO
EXEC sp_refreshview N'[dbo].[vDesignCode]'
GO
PRINT N'Refreshing [dbo].[vCreateItemBaseCenterMember]'
GO
EXEC sp_refreshview N'[dbo].[vCreateItemBaseCenterMember]'
GO
PRINT N'Refreshing [dbo].[vCutSheet_TechApproval]'
GO
EXEC sp_refreshview N'[dbo].[vCutSheet_TechApproval]'
GO
PRINT N'Refreshing [dbo].[vDesignCodeCableRating]'
GO
EXEC sp_refreshview N'[dbo].[vDesignCodeCableRating]'
GO
PRINT N'Refreshing [dbo].[vCutSheet_CommericalApproval]'
GO
EXEC sp_refreshview N'[dbo].[vCutSheet_CommericalApproval]'
GO
PRINT N'Refreshing [Setup].[vSetup_Cable_Machine]'
GO
EXEC sp_refreshview N'[Setup].[vSetup_Cable_Machine]'
GO
PRINT N'Refreshing [dbo].[vBurnListingBase]'
GO
EXEC sp_refreshview N'[dbo].[vBurnListingBase]'
GO
PRINT N'Refreshing [dbo].[vSalesForce_Catalog_Price_view]'
GO
EXEC sp_refreshview N'[dbo].[vSalesForce_Catalog_Price_view]'
GO
PRINT N'Refreshing [dbo].[vFindImages]'
GO
EXEC sp_refreshview N'[dbo].[vFindImages]'
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
PRINT N'Refreshing [dbo].[vSubunitBases]'
GO
EXEC sp_refreshview N'[dbo].[vSubunitBases]'
GO
PRINT N'Refreshing [dbo].[vConstructionSearch]'
GO
EXEC sp_refreshview N'[dbo].[vConstructionSearch]'
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

