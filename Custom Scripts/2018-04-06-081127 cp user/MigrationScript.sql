/*
This migration script replaces uncommitted changes made to these objects:
ImageGroupReference
ImageGroup
Images
MachineMapping
tblProcessMachines
Basic Product Construction
Buff#1/#2 Alloc Table
BurnTestVerticalTray
SalesHistory
SalesHistory_BI_Data
SalesHistory_BI_Data_TEMP
SalesHistory_Temp
TB Color Series
XXAFL_CAB_DESIGN_ITEMS_ATTR
XXAFL_CAB_DESIGN_ITEMS_ATTR_DELETE
sales_pivot_bi
tblCableConstructionReferences
tblSwitchboard
usp_EmailInactiveItemsOnSchedule
usp_CutSheet_Email_Reminder
usp_EmailActiveItemsWithObsoleteComponents
usp_GetWhereUsedMaterials
usp_MTY_ObsoleteComponentNotification
usp_MissingSpecsNotification
usp_QueryToHtmlTable
usp_SalesHistoryUpdate_BI
usp_SalesHistoryUpdate_BI_DELETE
usp_SchedulingMissingLineSpeedEmail
usp_WhereUsed_SalesHistory
vImageGroupPivotImages
vImage
vInactiveItems
vSetupAttributes_Scheduling
vSetupLineSpeed
vSetupLineSpeed_New
vSetupSheet
vSetup_Cable_Machine
vBurnListingInventory
vBurnListingLengthRequirement
vCableConstruction
vConstructionSearch
vCosntructionReferenceActiveDesignCodeExtensions
vCreateItemBaseCableExtensions
vCreateItemBaseCenterMember
vCreateItemBaseFurcation
vCreateItemBase
vFindCutSheet
vSalesHistory
vSetup_Scheduling_LineSpeed
GetBurnVerticalTrayTestLength
GetExistingOracleItemByBase
fn_ExplodeRoute
usf_BOM_Weight

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
PRINT N'Dropping foreign keys from [CutSheet].[ImageGroupReference]'
GO
ALTER TABLE [CutSheet].[ImageGroupReference] DROP CONSTRAINT [FK_ImageGroupReference_Images]
GO
PRINT N'Dropping constraints from [dbo].[TB Color Series]'
GO
ALTER TABLE [dbo].[TB Color Series] DROP CONSTRAINT [SSMA_CC$TB Color Series$TB Color Series$disallow_zero_length]
GO
PRINT N'Dropping constraints from [dbo].[TB Color Series]'
GO
ALTER TABLE [dbo].[TB Color Series] DROP CONSTRAINT [SSMA_CC$TB Color Series$Color$disallow_zero_length]
GO
PRINT N'Dropping constraints from [dbo].[TB Color Series]'
GO
ALTER TABLE [dbo].[TB Color Series] DROP CONSTRAINT [SSMA_CC$TB Color Series$Description$disallow_zero_length]
GO
PRINT N'Dropping constraints from [CutSheet].[ImageGroupReference]'
GO
ALTER TABLE [CutSheet].[ImageGroupReference] DROP CONSTRAINT [PK_ImageGroupReference_1]
GO
PRINT N'Dropping constraints from [dbo].[SalesHistory]'
GO
ALTER TABLE [dbo].[SalesHistory] DROP CONSTRAINT [PK_SalesHistory]
GO
PRINT N'Dropping constraints from [dbo].[SalesHistory]'
GO
ALTER TABLE [dbo].[SalesHistory] DROP CONSTRAINT [DF_SalesHistory_DateInserted]
GO
PRINT N'Dropping constraints from [dbo].[SalesHistory_BI_Data]'
GO
ALTER TABLE [dbo].[SalesHistory_BI_Data] DROP CONSTRAINT [PK_SalesHistory_BI_Data]
GO
PRINT N'Dropping constraints from [dbo].[SalesHistory_BI_Data]'
GO
ALTER TABLE [dbo].[SalesHistory_BI_Data] DROP CONSTRAINT [DF_SalesHistory_BI_Data_DateInserted]
GO
PRINT N'Dropping constraints from [dbo].[XXAFL_CAB_DESIGN_ITEMS_ATTR]'
GO
ALTER TABLE [dbo].[XXAFL_CAB_DESIGN_ITEMS_ATTR] DROP CONSTRAINT [PK_XXAFL_CAB_DESIGN_ITEMS_ATTR]
GO
PRINT N'Dropping constraints from [dbo].[sales_pivot_bi]'
GO
ALTER TABLE [dbo].[sales_pivot_bi] DROP CONSTRAINT [PK_sales_pivot_bi_1]
GO
PRINT N'Dropping constraints from [dbo].[tblSwitchboard]'
GO
ALTER TABLE [dbo].[tblSwitchboard] DROP CONSTRAINT [PK_tblSwitchboard]
GO
PRINT N'Dropping constraints from [dbo].[tblSwitchboard]'
GO
ALTER TABLE [dbo].[tblSwitchboard] DROP CONSTRAINT [DF_tblSwitchboard_CreatedBy]
GO
PRINT N'Dropping constraints from [dbo].[tblSwitchboard]'
GO
ALTER TABLE [dbo].[tblSwitchboard] DROP CONSTRAINT [DF_tblSwitchboard_CreationDate]
GO
PRINT N'Dropping trigger [dbo].[trgr_SalesHistory] from [dbo].[SalesHistory_BI_Data]'
GO
DROP TRIGGER [dbo].[trgr_SalesHistory]
GO
PRINT N'Dropping [dbo].[XXAFL_CAB_DESIGN_ITEMS_ATTR]'
GO
DROP TABLE [dbo].[XXAFL_CAB_DESIGN_ITEMS_ATTR]
GO
PRINT N'Dropping [dbo].[TB Color Series]'
GO
DROP TABLE [dbo].[TB Color Series]
GO
PRINT N'Dropping [dbo].[SalesHistory_Temp]'
GO
DROP TABLE [dbo].[SalesHistory_Temp]
GO
PRINT N'Dropping [dbo].[SalesHistory_BI_Data_TEMP]'
GO
DROP TABLE [dbo].[SalesHistory_BI_Data_TEMP]
GO
PRINT N'Dropping [dbo].[usp_SalesHistoryUpdate_BI]'
GO
DROP PROCEDURE [dbo].[usp_SalesHistoryUpdate_BI]
GO
PRINT N'Dropping [dbo].[sales_pivot_bi]'
GO
DROP TABLE [dbo].[sales_pivot_bi]
GO
PRINT N'Dropping [dbo].[tblSwitchboard]'
GO
DROP TABLE [dbo].[tblSwitchboard]
GO
PRINT N'Dropping [dbo].[SalesHistory_BI_Data]'
GO
DROP TABLE [dbo].[SalesHistory_BI_Data]
GO
PRINT N'Dropping [dbo].[SalesHistory]'
GO
DROP TABLE [dbo].[SalesHistory]
GO
PRINT N'Altering [dbo].[tblCableConstructionReferences]'
GO
ALTER TABLE [dbo].[tblCableConstructionReferences] ADD
[IsCommoned] [bit] NULL CONSTRAINT [DF_tblCableConstructionReferences_IsCommoned] DEFAULT ((1))
GO
PRINT N'Refreshing [dbo].[CableUnion]'
GO
EXEC sp_refreshview N'[dbo].[CableUnion]'
GO
PRINT N'Creating [dbo].[GetExistingOracleItemByBase]'
GO
/*
-- =============================================
Author:			Bryan Eddy
Date:			2/28/2018
Desc:			Get an existing items by base.  Calculations based on Oracle data must exist in the oracle information.
				This will be used to get a differing base item for BOM calculations
-- =============================================
*/
CREATE FUNCTION [dbo].[GetExistingOracleItemByBase]
(	
	-- Add the parameters for the function here
	@Item nvarchar(50)
)
returns
@ExistingItem table
(
   -- Returned table layout
   ExistingItem NVARCHAR(50)

)

AS
BEGIN
INSERT INTO @ExistingItem(ExistingItem)
SELECT DISTINCT TOP 1 Existing.Oracle--, new.Oracle, Existing.BASE, Existing.DateCreated
FROM dbo.AFLPRD_BOMInvComp_CAB k INNER JOIN dbo.CableUnion Existing ON Existing.Oracle = K.AssemblyItemNumber
INNER JOIN dbo.CableUnion New ON Existing.BASE = New.BASE
WHERE New.Oracle NOT LIKE '%OSP%' AND NEW.Oracle = @Item
ORDER BY Existing.Oracle DESC

RETURN
END
GO
PRINT N'Altering [Setup].[tblProcessMachines]'
GO
ALTER TABLE [Setup].[tblProcessMachines] DROP
COLUMN [PreactorMachineID],
COLUMN [ProcessMachineID],
COLUMN [PreactorProcessID],
COLUMN [PreactorMachineNumber],
COLUMN [PlanetTogetherMachineNumber]
GO
PRINT N'Creating [Setup].[MachineMapping]'
GO
CREATE TABLE [Setup].[MachineMapping]
(
[PreactorMachineID] [int] NULL,
[PreactorProcessID] [int] NULL,
[PreactorMachineNumber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PlanetTogetherMachineNumber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProcessID] [int] NOT NULL,
[MachineID] [int] NOT NULL,
[PlanetTogetherMachineID] [int] NULL
) ON [PRIMARY]
GO
PRINT N'Creating primary key [pk_MachineMapping] on [Setup].[MachineMapping]'
GO
ALTER TABLE [Setup].[MachineMapping] ADD CONSTRAINT [pk_MachineMapping] PRIMARY KEY CLUSTERED  ([ProcessID], [MachineID]) ON [PRIMARY]
GO
PRINT N'Altering [Setup].[vSetupLineSpeed]'
GO












/* View created to pull line speeds from Setup Database
	to supply to Scheduling for Run Speeds
	7/7/2017 - Bryan Eddy							*/


ALTER VIEW [Setup].[vSetupLineSpeed]
	as


 WITH cteSetupLineSpeed(OperationCode, MachineID,LineSpeed, ProcessID, MachineNumber, SetupDesc,PreactorMachineID,PlanetTogetherMachineNumber)
 as(
	 SELECT K.SetupNumber, K.MachineID,e.AttributeValue as LineSpeed, e.ProcessID, MachineNumber, k.SetupDesc,PreactorMachineID,PlanetTogetherMachineNumber
	 FROM  Setup.tblSetup K
	 INNER JOIN setup.tblSetupAttributes E ON E.SetupID = K.SetupID
	 INNER JOIN [Setup].[tblAttributes] I ON E.AttributeID = I.AttributeID
	 INNER JOIN (Setup.tblProcessMachines AS BLeft INNER JOIN Setup.MachineMapping AS BRight ON BLeft.processid=BRight.processid AND BLeft.machineid=BRight.machineid) ON BLeft.MachineID = K.MachineID
	 AND BLeft.ProcessID = E.ProcessID
	 WHERE I.AttributeName LIKE 'LINESPEED' 
	  --and K.IneffectiveDate > GETDATE() 
	  AND I.AttrIneffectiveDate >= GETDATE()
	 and   e.IneffectiveDate >= GETDATE()
	 AND BLeft.Active <> 0 AND K.IneffectiveDate >= getdate()
	 and isnumeric(AttributeValue) = 1 
		),
	cteBomSetup(Item,OperationSeqNum,SetupLocation, BomSetup,Alternate,UnitId,LayerID)
	as(
		SELECT DISTINCT G.AssemblyItemNumber,OperationSeqNumber,'Bom' as SetupLocation,REPLACE(ComponentItemNumber,'SETUP ','') BomSetup
		,AlternateBOMDesignator,UnitId,LayerId
		FROM AFLPRD_BOMInvComp_CAB G
		WHERE ComponentItemNumber like 'Setup%' 

	),
	cteRoute(Item, OperationSeqNum,SetupLocation,OperationCode, ItemStatus, Alternate, SendToAPS)
	as(

		SELECT DISTINCT AssemblyItemNumber,OperationSeqNum,'Route' as SetupLocation
		,TrueOperationCode  as OperationCode
		, Item_Status, AlternateRoutingDesignator,SendToAPS
		FROM AFLPRD_BOMOpSeq_CAB K INNER JOIN AFLPRD_INVSysItemCost_CAB G ON K.AssemblyItemNumber = G.ItemNumber
		WHERE Item_Status NOT IN ('obsolete') 
	)

	SELECT DISTINCT cteRoute.Item, 
	MachineID,COALESCE(cast(LineSpeed as float),0)  as LineSpeed,ProcessID,MachineNumber,SendToAPS,PlanetTogetherMachineNumber,
	COALESCE(BomSetup,cteRoute.OperationCode) as Setup ,BomSetup
	  ,cteRoute.ItemStatus,SetupDesc, k.DESCRIPTION as Item_Description, COALESCE(cteBomSetup.OperationSeqNum,cteRoute.OperationSeqNum) OperationSeqNum
	,COALESCE(cteBomSetup.SetupLocation,cteRoute.SetupLocation) as SetupLocation
	,COALESCE(cteBomSetup.Alternate,cteRoute.Alternate,'Primary') as PrimaryAlt
	,UnitID,LayerID,PreactorMachineID
	--INTO #SetupLocation
	FROM cteRoute LEFT JOIN cteBomSetup ON cteRoute.Item = cteBomSetup.item AND cteRoute.OperationSeqNum = cteBomSetup.OperationSeqNum
	LEFT JOIN cteSetupLineSpeed ON COALESCE(BomSetup,cteRoute.OperationCode) = cteSetupLineSpeed.OperationCode
	INNER JOIN AFLPRD_INVSysItem_CAB K ON cteRoute.Item = K.ItemNumber
	AND COALESCE(cteRoute.Alternate,'Primary') = COALESCE(cteBomSetup.Alternate,'Primary')
	WHERE SendToAPS IN ('Y','D')






GO
PRINT N'Refreshing [dbo].[vSchedulingLineSpeeds]'
GO
EXEC sp_refreshview N'[dbo].[vSchedulingLineSpeeds]'
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
PRINT N'Altering [dbo].[vSetup_Scheduling_LineSpeed]'
GO







 ALTER VIEW [dbo].[vSetup_Scheduling_LineSpeed]
 as
 SELECT DISTINCT  G.OperationCode, K.MachineID,E.AttributeValue as LineSpeed, e.ProcessID, DLeft.MachineNumber
 FROM Setup.vSetup_Cable_Base G INNER JOIN Setup.tblSetup K ON G.Setup = K.SetupNumber
 INNER JOIN setup.tblSetupAttributes E ON E.SetupID = K.SetupID
 INNER JOIN [Setup].[tblAttributes] I ON E.AttributeID = I.AttributeID
 INNER JOIN (Setup.tblProcessMachines AS DLeft INNER JOIN Setup.MachineMapping AS DRight ON DLeft.processid=DRight.processid AND DLeft.machineid=DRight.machineid) ON DLeft.MachineID = K.MachineID AND DLeft.ProcessID = K.ProcessID
 WHERE I.AttributeName LIKE 'LINESPEED' AND E.IneffectiveDate > GETDATE() AND I.AttrIneffectiveDate > GETDATE()
 and e.AttributeValue <> 'tbd' AND MachineNumber  like 'sh [124]'
 and E.ProcessID in (510,523,615,850) --and base like 't%'
 --ORDER BY MachineNumber
 --AND --fibercount <12 and 
 --(k.MachineID = 1 or k.MachineID = 2)
--and JacketMaterial = 'POL00127'








GO
PRINT N'Refreshing [dbo].[vSchedulingConstructionData]'
GO
EXEC sp_refreshview N'[dbo].[vSchedulingConstructionData]'
GO
PRINT N'Refreshing [dbo].[vSchedulingCableRunSpeeds]'
GO
EXEC sp_refreshview N'[dbo].[vSchedulingCableRunSpeeds]'
GO
PRINT N'Creating [dbo].[BurnTestVerticalTray]'
GO
CREATE TABLE [dbo].[BurnTestVerticalTray]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[FromNominalODmm] [decimal] (8, 3) NULL,
[ToNominalODmm] [decimal] (8, 3) NULL,
[NumberOfCablesPerBundles] [int] NULL,
[NumberOfBundles] [int] NULL
) ON [PRIMARY]
GO
PRINT N'Creating primary key [k_BurnTestIee1202Length] on [dbo].[BurnTestVerticalTray]'
GO
ALTER TABLE [dbo].[BurnTestVerticalTray] ADD CONSTRAINT [k_BurnTestIee1202Length] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
PRINT N'Creating [dbo].[GetBurnVerticalTrayTestLength]'
GO

/*
Author:		Bryan Eddy
Date:		2/28/2018
Desc:		Calculate Vertical Tray Test IEEE 1202 
Version:	1
Update:		Initial creation
Note:		Calculation is based on Vertical Tray Test IEEE 1202
			Length = 2.438 * N
			N = Number of Cables Per Bundle * Number of Bundles in Tray
*/


CREATE FUNCTION [dbo].[GetBurnVerticalTrayTestLength]
(	
	-- Add the parameters for the function here
	@NominalODmm DECIMAL(8,5)
)
RETURNS  
@BurnLength TABLE (
Length_Meters  INT
)
AS
BEGIN 
	INSERT INTO @BurnLength
	SELECT CEILING(2.438 * (K.NumberOfCablesPerBundles*K.NumberOfBundles)*2*1.1)
	FROM dbo.BurnTestVerticalTray K
	WHERE @NominalODmm >= K.FromNominalODmm AND @NominalODmm < K.ToNominalODmm
	RETURN
END 

GO
PRINT N'Altering [CutSheet].[Images]'
GO
ALTER TABLE [CutSheet].[Images] ADD
[ImageFileType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO
PRINT N'Altering [CutSheet].[vImage]'
GO
/*
Author:		Bryan Eddy
Date:		2/20/2018
Desc:		Get cable images
Version:	2
Update:		Added ImageID and ImageGroupID

*/
ALTER VIEW [CutSheet].[vImage]
AS
SELECT        Images.ImageName, ImageType.ImageTypeName, tblCableConstructionReferences.Base, ImageGroupReference.Color, 
                         ImageGroup.ImageGroupName, ImageGroupReference.ImageTypeID, ImageGroupReference.Armored, Images.ImageID, ImageGroup.ImageGroupID, images.ImageFileType
FROM            CutSheet.Images INNER JOIN
                         CutSheet.ImageType ON CutSheet.Images.ImageTypeID = CutSheet.ImageType.ImageTypeID INNER JOIN
                         CutSheet.ImageGroupReference ON CutSheet.Images.ImageID = CutSheet.ImageGroupReference.ImageID AND 
                         CutSheet.Images.ImageTypeID = CutSheet.ImageGroupReference.ImageTypeID AND CutSheet.Images.Color = CutSheet.ImageGroupReference.Color AND 
                         CutSheet.Images.Armored = CutSheet.ImageGroupReference.Armored INNER JOIN
                         dbo.tblCableConstructionReferences ON CutSheet.ImageGroupReference.ImageGroupID = tblCableConstructionReferences.ImageGroupID INNER JOIN
                         CutSheet.ImageGroup ON CutSheet.ImageGroupReference.ImageGroupID = CutSheet.ImageGroup.ImageGroupID
GO
PRINT N'Refreshing [dbo].[vSchedulingCableReferences]'
GO
EXEC sp_refreshview N'[dbo].[vSchedulingCableReferences]'
GO
PRINT N'Creating [dbo].[vCosntructionReferenceActiveDesignCodeExtensions]'
GO
/*
Author:		Bryan Eddy
Date:		2/28/2018
Desc:		Consolidated list of active design code extensions to check during item builds
Version:	1
Update:		Initial Creation

*/

CREATE VIEW [dbo].[vCosntructionReferenceActiveDesignCodeExtensions]
AS
SELECT  DISTINCT DesignExtension
FROM dbo.tblCableConstructionReferences
WHERE DesignExtension IS NOT NULL AND Active = 1

GO
PRINT N'Refreshing [dbo].[vScheduling_OpenOrders]'
GO
EXEC sp_refreshview N'[dbo].[vScheduling_OpenOrders]'
GO
PRINT N'Refreshing [dbo].[vScheduling_OpenOrders_AllComponentsDemand]'
GO
EXEC sp_refreshview N'[dbo].[vScheduling_OpenOrders_AllComponentsDemand]'
GO
PRINT N'Creating [dbo].[vBurnListingLengthRequirement]'
GO
/*
Author:		Bryan Eddy
Date:		2/28/2018
Desc:		Show the calculated length and cost for each burn test type
Version:	1
Update:		Initial Creation
*/

CREATE VIEW [dbo].[vBurnListingLengthRequirement]
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
	WHERE tblBurnListing.ListingCompany IN ('etl', 'ul') AND B.Item_Status <> 'obsolete'
	AND NominalOD <>0 AND tblCableConstructionReferences.Active = 1 AND ReleasedDesign = 1
	--WHERE -- AND K.AvailQty <> 0 AND K.Locator NOT like 'wop%'
)
,cteBurnCalculation
AS(
SELECT 	 round([NominalOD]*0.03936996,4)AS NomODInches
	, CAST(CEILING((12/(BurnNominalOD*0.03936996))*16.5*1.1/3.281) AS INT) AS BurnLength_M_OFNR
	, CAST(CEILING((6990/BurnNominalOD)*1.1/3) AS int) AS BurnLength_M_OFNP
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





GO
PRINT N'Refreshing [dbo].[vOracleBaseItems_Newest]'
GO
EXEC sp_refreshview N'[dbo].[vOracleBaseItems_Newest]'
GO
PRINT N'Refreshing [dbo].[vOracleBaseItems_Newest_NoMixedFibers]'
GO
EXEC sp_refreshview N'[dbo].[vOracleBaseItems_Newest_NoMixedFibers]'
GO
PRINT N'Creating [Schedule].[vInactiveItems]'
GO


CREATE VIEW [Schedule].[vInactiveItems]
as
SELECT K.[New Oracle Part #],K.Reason,k.Customer, I.[Reel No], I.[Order Qty], I.Customer CustomerOrder, P.[Buff Line #], I.[Schedule date], I.Desgin, I.Job#, O.[Promise Date], I.[Shipped Qty]
, P.Shipped, I.[Type Order], k.Active
FROM dbo.[Basic Product Construction] K INNER JOIN dbo.[Cust Order Specifications] I ON I.[Item No] = K.[New Oracle Part #]
INNER JOIN dbo.[Printed Labels (Data Products)] P ON  P.[Order Qty] = I.[Order Qty] AND p.[Reel No] = i.[Co Number]
INNER JOIN dbo.[New Orders Spreadsheet] O ON O.[Order #] = I.[Reel No]
INNER JOIN dbo.tblCableConstructionReferences R ON R.BASE = K.Base
WHERE (K.Active = 0 or r.active = 0)  AND P.Shipped = 0 AND I.[Type Order] IN ('new' , 'sset') 
and LEFT(K.[New Oracle Part #],2) NOT IN ('bu','rb','fb','cu')
GO
PRINT N'Creating [dbo].[usp_QueryToHtmlTable]'
GO




-- Description: Turns a query into a formatted HTML table. Useful for emails. 
-- Any ORDER BY clause needs to be passed in the separate ORDER BY parameter.
-- =============================================
CREATE PROC [dbo].[usp_QueryToHtmlTable] 
(
  @query NVARCHAR(MAX), --A query to turn into HTML format. It should not include an ORDER BY clause.
  @orderBy NVARCHAR(MAX) = NULL, --An optional ORDER BY clause. It should contain the words 'ORDER BY'.
  @html NVARCHAR(MAX) = NULL OUTPUT --The HTML output of the procedure.
)
AS
BEGIN   
  SET NOCOUNT ON;

  IF @orderBy IS NULL BEGIN
    SET @orderBy = ''  
  END

  SET @orderBy = REPLACE(@orderBy, '''', '''''');

  DECLARE @realQuery NVARCHAR(MAX) = '
    DECLARE @headerRow nvarchar(MAX);
    DECLARE @cols nvarchar(MAX);    

    SELECT * INTO #dynSql FROM (' + @query + ') sub;

    SELECT @cols = COALESCE(@cols + '', '''''''', '', '''') + ''['' + name + ''] AS ''''td''''''
    FROM tempdb.sys.columns 
    WHERE object_id = object_id(''tempdb..#dynSql'')
    ORDER BY column_id;

    SET @cols = ''SET @html = CAST(( SELECT '' + @cols + '' FROM #dynSql ' + @orderBy + ' FOR XML PATH(''''tr''''), ELEMENTS XSINIL) AS nvarchar(max))''    

    EXEC sys.sp_executesql @cols, N''@html nvarchar(MAX) OUTPUT'', @html=@html OUTPUT

    SELECT @headerRow = COALESCE(@headerRow + '''', '''') + ''<th>'' + name + ''</th>'' 
    FROM tempdb.sys.columns 
    WHERE object_id = object_id(''tempdb..#dynSql'')
    ORDER BY column_id;

    SET @headerRow = ''<tr>'' + @headerRow + ''</tr>'';

    SET @html = ''<table border="1">'' + @headerRow + @html + ''</table>'';    
    ';

  EXEC sys.sp_executesql @realQuery, N'@html nvarchar(MAX) OUTPUT', @html=@html OUTPUT
END
GO
PRINT N'Creating [Schedule].[usp_EmailInactiveItemsOnSchedule]'
GO
/*
Author:		Bryan Eddy
Date:		4/2/2018
Desc:		Send list of inactive items on the schedule to premise product engineering to review
Revision:	1
Update:		n/a
*/

CREATE PROCEDURE	[Schedule].[usp_EmailInactiveItemsOnSchedule]
as
DECLARE @html nvarchar(MAX),
 @ReceipientList NVARCHAR(1000),
 @NumRows VARCHAR(1000),
 @Table NVARCHAR(1000),
 @Qry NVARCHAR(1000)
 SET @Table = 'Schedule.vInactiveItems'
 SET @NumRows = 'SELECT COUNT(*) FROM ' + @Table
 EXEC (@NumRows)

IF @NumRows > 0
	BEGIN
    
		SET @Qry = 'SELET * FROM ' + @Table

		EXEC dbo.usp_QueryToHtmlTable @html = @html OUTPUT,  @query = @Qry, @orderBy = N'[Promise Date]';

		SET @ReceipientList = (STUFF((SELECT ';' + UserEmail 
								FROM tblConfiguratorUser G  INNER JOIN users.UserResponsibility  K ON  G.UserID = K.UserID
  								WHERE K.ResponsibilityID in (5,15) FOR XML PATH('')),1,1,''))

						EXEC msdb.dbo.sp_send_dbmail 
						@recipients=@ReceipientList,
						@blind_copy_recipients = 'bryan.eddy@aflglobal.com',
						@subject = 'Inactive Items on Premise Schedule',
						@body = @html,
						@body_format = 'HTML',
						@query_no_truncate = 1,
						@attach_query_result_as_file = 0;

end

GO
PRINT N'Creating [dbo].[fn_ExplodeRoute]'
GO
CREATE FUNCTION [dbo].[fn_ExplodeRoute] 
(
-- Input parameters
   @FinishedGood varchar(100)
)
returns
@BOM table
(
   -- Returned table layout
   FinishedGood varchar(100),
   AssemblyItemNumber varchar(100), 
   ComponentItemNumber varchar(100),
   TrueOperationCode VARCHAR(100)
	
)
as
begin
      -- add current level
   insert into @BOM
   select g.AssemblyItemNumber, g.AssemblyItemNumber, ComponentItemNumber , i.TrueOperationCode
     from AFLPRD_BOMInvComp_CAB G INNER JOIN AFLPRD_INVSysItemCost_CAB K ON G.AssemblyItemNumber = K.ItemNumber  
		INNER JOIN dbo.AFLPRD_BOMOpSeq_CAB i ON i.AssemblyItemNumber = g.AssemblyItemNumber AND i.AlternateRoutingDesignator = g.AlternateBOMDesignator
		AND i.OperationSeqNum = g.OperationSeqNumber
   where g.AssemblyItemNumber = @FinishedGood AND LEN(EffectivityDateTo) > 0 and AlternateBOMDesignator is null

    --explode downward
   insert into @BOM
   select c.FinishedGood, n.AssemblyItemNumber, n.ComponentItemNumber, n.TrueOperationCode 
   from @BOM c
   cross apply dbo.[fn_ExplodeRoute](c.ComponentItemNumber) n
  return
end



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
-- Version:		7
-- Update:		Updated to pull from [SPBAPS-TST01] server while in testing
-- =============================================
ALTER PROC [dbo].[usp_SchedulingMissingLineSpeedEmail]

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
	, MIN(ScheduleDate) OVER (PARTITION BY Setup) Max_SechuduleDate, K.MachineNumber--, ROW_NUMBER() OVER (PARTITION BY Setup ORDER BY setup,G.FinishedGood) RowNumber
	FROM cteOrders CROSS APPLY fn_ExplodeBOM(cteOrders.ItemNumber) G
	INNER JOIN #SetupLocation K ON G.AssemblyItemNumber = K.Item
	INNER JOIN AFLPRD_INVSysItemCost_CAB B ON B.ItemNumber = K.ITEM 
	WHERE B.Make_Buy = 'MAKE' AND k.MachineNumber IS NULL  and left(ITEM,3) NOT in ('WTC','DNT')
	and LEFT(setup,1) not in ('k','Q','O','I') and setup not in ('R696','R093','PQC','pk01','SK01') AND setup NOT LIKE 'm00[4-9]'
	) 
	,cteConsolidatedMissingSetupOrders
	AS(
		SELECT *, COUNT(SalesOrder) OVER (PARTITION BY cteMissingSetupOrders.Setup) SoLinesMissingSetups--Determine the amount of sales order affected by missing setups
		FROM cteMissingSetupOrders
		--WHERE	
	)
SELECT DISTINCT FinishedGood,Item,Item_Description ItemDesc, ScheduleDate, AssemblyItemNumber, Setup, PrimaryAlt,DepartmentCode, MachineNumber, SoLinesMissingSetups
INTO #Results
FROM cteConsolidatedMissingSetupOrders
WHERE Max_SechuduleDate = ScheduleDate --  item = Max_Item = 1 /* To get just max item another CTE will have to be used*/
ORDER BY ScheduleDate

--SELECT *
--FROM #Results

SELECT *
FROM [SPBAPS-TST01].PlanetTogether_Data_Test.Setup.[vMissingSetupsUnion]

--Add new missing setups
INSERT INTO [SPBAPS-TST01].PlanetTogether_Data_Test.setup.MissingSetups(Setup)
SELECT DISTINCT G.Setup
FROM #Results G LEFT JOIN [SPBAPS-TST01].PlanetTogether_Data_Test.setup.MissingSetups K ON K.Setup = G.Setup
WHERE K.Setup IS NULL

--Update existing records with the most recent date of the apperance
UPDATE K
SET K.DateMostRecentAppearance = GETDATE()
FROM [SPBAPS-TST01].PlanetTogether_Data_Test.setup.MissingSetups K INNER JOIN	#Results J ON K.Setup = J.Setup

--Results to populate the email table
IF OBJECT_ID(N'tempdb..#FinalResults', N'U') IS NOT NULL
DROP TABLE #FinalResults;
SELECT J.*,DATEDIFF(dd,K.DateCreated,K.DateMostRecentAppearance) DaysMissing
INTO #FinalResults
FROM [SPBAPS-TST01].PlanetTogether_Data_Test.setup.MissingSetups K INNER JOIN	#Results J ON K.Setup = J.Setup
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
SET @subject = 'Missing Setup Line Speeds for Open Orders ' + CAST(GETDATE() AS NVARCHAR)
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
PRINT N'Refreshing [dbo].[vItemRunSpeedSelectViewFormulaNoVars_TEST_PREACTOR]'
GO
EXEC sp_refreshview N'[dbo].[vItemRunSpeedSelectViewFormulaNoVars_TEST_PREACTOR]'
GO
PRINT N'Altering [dbo].[vSalesHistory]'
GO

/*
Author:		Bryan Eddy
Desc:		Show sales history to various applications
Date:		1/23/2018
Version:	2
Update:		1. Updated table to pull data from SalesHistory_BI_Data to Oracle.MarginRevenueExtractSalesHistory (Margin extract from Oracle)
			2. 

*/


ALTER VIEW [dbo].[vSalesHistory]
AS
WITH cteSales
AS(
SELECT BOOKED_DATE AS DATE, BILL_TO_NAME AS CUSTOMER, ITEM_NUMBER, ITEM_DESCRIPTION,ORDER_NUMBER AS SO_NUMBER,REVENUE, SO_LINE_NUMBER
,CASE WHEN UNIT_OF_MEASURE = 'FT' THEN ROUND(QUANTITY/3.281,2) ELSE QUANTITY END AS QUANTITY
, CASE WHEN UNIT_OF_MEASURE = 'FT' THEN 'M' ELSE UNIT_OF_MEASURE END AS UOM
,CURR_MATERIAL_COST, CURR_RESOURCE_COST, CURR_OVERHEAD_COST
FROM Oracle.MarginRevenueExtractSalesHistory
)
SELECT *,  CASE WHEN QUANTITY <> 0 THEN ROUND(REVENUE/QUANTITY,5)  ELSE 0 END PricePerUOM
FROM cteSales


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
INNER JOIN dbo.CableUnion ON K.Item = dbo.CableUnion.Oracle
INNER JOIN tblCableConstructionReferences ON tblCableConstructionReferences.Base = dbo.CableUnion.Base
INNER JOIN tblCableConstructions ON tblCableConstructionReferences.BaseID = tblCableConstructions.BaseID
INNER JOIN tblBurnListing ON dbo.CableUnion.Base = tblBurnListing.base AND CableUnion.ListingCompany = tblBurnListing.ListingCompany
INNER JOIN dbo.AFLPRD_INVSysItemCost_CAB B ON dbo.CableUnion.Oracle = B.ItemNumber
--WHERE tblBurnListing.ListingCompany IN ('etl', 'ul')
WHERE NominalOD <>0 AND K.AvailQty <> 0

GO
PRINT N'Altering [Setup].[vSetupAttributes_Scheduling]'
GO






ALTER VIEW [Setup].[vSetupAttributes_Scheduling]
AS
/*and AttributeName like '%pos%'*/
SELECT        tblProcessMachines.ProcessID, tblProcessMachines.MachineID, MachineMapping.PlanetTogetherMachineNumber, Setup.tblAttributes.AttributeID, 
                         Setup.tblAttributes.AttributeDesc, Setup.tblAttributes.AttributeName, Setup.tblSetup.SetupID, Setup.tblSetup.SetupNumber, Setup.tblSetupAttributes.AttributeValue, 
                         Setup.tblSetupAttributes.MachineSpecific, Setup.tblSetupAttributes.MinValue, Setup.tblAttributes.Active, Setup.tblSetupAttributes.EffectiveDate, 
                         Setup.tblAttributes.AttrEffectiveDate, Setup.tblAttributes.AttributeGroupID, Setup.tblSetup.IneffectiveDate, Setup.tblAttributes.AttributeUOM
						 , Setup.tblAttributes.AttrIneffectiveDate AttributeIneffectiveDate,Setup.tblSetupAttributes.IneffectiveDate SetupAttributesIneffectiveDate
FROM            Setup.tblAttributes INNER JOIN
                         Setup.tblSetupAttributes ON Setup.tblAttributes.AttributeID = Setup.tblSetupAttributes.AttributeID INNER JOIN
                         Setup.tblSetup ON Setup.tblSetupAttributes.SetupID = Setup.tblSetup.SetupID AND Setup.tblSetupAttributes.MachineID = Setup.tblSetup.MachineID INNER JOIN
                         (Setup.tblProcessMachines INNER JOIN Setup.MachineMapping ON tblProcessMachines.processid=MachineMapping.processid AND tblProcessMachines.machineid=MachineMapping.machineid) ON Setup.tblSetup.MachineID = tblProcessMachines.MachineID AND 
                         Setup.tblSetup.ProcessID = tblProcessMachines.ProcessID
WHERE        (Setup.tblAttributes.AttrIneffectiveDate >= GETDATE()) AND (Setup.tblSetup.IneffectiveDate >= GETDATE()) and Setup.tblSetupAttributes.IneffectiveDate >=getdate() --AND (Setup.tblSetup.SetupNumber = 'M103')
			AND tblProcessMachines.Active <> 0


--ORDER BY AttributeName





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
PRINT N'Altering [Setup].[vSetupLineSpeed_New]'
GO












/* View created to pull line speeds from Setup Database
	to supply to Scheduling for Run Speeds
	7/26/2017 - Bryan Eddy							*/


ALTER VIEW [Setup].[vSetupLineSpeed_New]
	as


 WITH cteSetupLineSpeed(OperationCode, MachineID,LineSpeed, ProcessID, MachineNumber, SetupDesc,PreactorMachineID,PlanetTogetherMachineNumber)
 as(
	 SELECT K.SetupNumber, K.MachineID,e.AttributeValue as LineSpeed, e.ProcessID, MachineNumber, k.SetupDesc,PreactorMachineID,PlanetTogetherMachineNumber
	 FROM  Setup.tblSetup K
	 INNER JOIN setup.tblSetupAttributes E ON E.SetupID = K.SetupID
	 INNER JOIN [Setup].[tblAttributes] I ON E.AttributeID = I.AttributeID
	 INNER JOIN (Setup.tblProcessMachines AS BLeft INNER JOIN Setup.MachineMapping AS BRight ON BLeft.processid=BRight.processid AND BLeft.machineid=BRight.machineid) ON BLeft.MachineID = K.MachineID
	 AND BLeft.ProcessID = E.ProcessID
	 WHERE I.AttributeName LIKE 'LINESPEED' 
	  --and K.IneffectiveDate > GETDATE() 
	  AND I.AttrIneffectiveDate >= GETDATE()
	 and   e.IneffectiveDate >= GETDATE()
	 AND BLeft.Active <> 0 AND K.IneffectiveDate >= getdate()
	 and isnumeric(AttributeValue) = 1 
		),
	--cteBomSetup(Item,OperationSeqNum,SetupLocation, BomSetup,Alternate,UnitId,LayerID)
	--as(
	--	SELECT DISTINCT G.AssemblyItemNumber,OperationSeqNumber,'Bom' as SetupLocation,REPLACE(ComponentItemNumber,'SETUP ','') BomSetup
	--	,AlternateBOMDesignator,UnitId,LayerId
	--	FROM AFLPRD_BOMInvComp_CAB G
	--	WHERE ComponentItemNumber like 'Setup%' 

	--),
	cteRoute(Item, OperationSeqNum,SetupLocation,OperationCode, ItemStatus, Alternate, SendToAPS)
	as(

		SELECT DISTINCT AssemblyItemNumber,OperationSeqNum,'Route' as SetupLocation
		,TrueOperationCode  as OperationCode
		, Item_Status, AlternateRoutingDesignator,SendToAPS
		FROM AFLPRD_BOMOpSeq_CAB K INNER JOIN AFLPRD_INVSysItemCost_CAB G ON K.AssemblyItemNumber = G.ItemNumber
		WHERE Item_Status NOT IN ('obsolete') 
	)

	SELECT DISTINCT cteRoute.Item, 
	MachineID,COALESCE(cast(LineSpeed as float),0)  as LineSpeed,ProcessID,MachineNumber,SendToAPS,PlanetTogetherMachineNumber,
	cteRoute.OperationCode as Setup 
	,cteRoute.ItemStatus,SetupDesc, k.DESCRIPTION as Item_Description, cteRoute.OperationSeqNum 
	,cteRoute.SetupLocation as SetupLocation
	,cteRoute.Alternate as PrimaryAlt
	--,UnitID,LayerID
	,PreactorMachineID
	--INTO #SetupLocation
	FROM cteRoute 
	LEFT JOIN cteSetupLineSpeed ON cteRoute.OperationCode = cteSetupLineSpeed.OperationCode
	INNER JOIN AFLPRD_INVSysItem_CAB K ON cteRoute.Item = K.ItemNumber
	--AND COALESCE(cteRoute.Alternate,'Primary') = COALESCE(cteBomSetup.Alternate,'Primary')
	WHERE SendToAPS IN ('Y','D')






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
PRINT N'Altering [dbo].[vCreateItemBaseFurcation]'
GO
ALTER VIEW [dbo].[vCreateItemBaseFurcation]
AS
SELECT    DISTINCT    dbo.tblCableConstructionReferences.Base, dbo.tblCableConstructionReferences.ConstructionDescription, dbo.tblCableConstructions.NominalOD AS OD, 
                         dbo.tblCableConstructionReferences.NumSubPositions AS NumPositions, dbo.tblCableConstructionReferences.NumSubFillers AS NumFillers, 
                         dbo.tblCableConstructions.JacketMaterial, '' AS CountOfBase, dbo.tblCableConstructionReferences.Active, 
                         dbo.tblCableConstructionReferences.DesignCode, dbo.tblCableConstructions.CablePasses AS Location, dbo.tblCableConstructionReferences.ReleasedDesign, 
                         dbo.tblCableTBType.TBLetter, dbo.tblCableConstructionReferences.TBType, dbo.tblCableConstructionReferences.BaseID, 
                         dbo.tblDesignCodeFurcationTube.FurcationLetter, dbo.tblDesignCodeFurcationTube.Furcation, dbo.tblCableTightBufferReference.TBTypeID, 
                         dbo.tblCableTightBufferReference.TightBuffered, DesignExtension
FROM            dbo.tblCableConstructions INNER JOIN
                         dbo.tblCableConstructionReferences INNER JOIN
                         dbo.CableRunSpeeds ON dbo.tblCableConstructionReferences.PrefixID = dbo.CableRunSpeeds.PrefixID ON 
                         dbo.tblCableConstructions.BaseID = dbo.tblCableConstructionReferences.BaseID LEFT OUTER JOIN
                         dbo.CableUnion ON dbo.tblCableConstructionReferences.Base = dbo.CableUnion.Base INNER JOIN
                         dbo.tblCableTightBufferReference ON dbo.tblCableConstructionReferences.TBType = dbo.tblCableTightBufferReference.TBType INNER JOIN
                         dbo.tblCableTBType ON dbo.tblCableTightBufferReference.TBtypeID = dbo.tblCableTBType.TBIndicatorID INNER JOIN
                         dbo.tblFurcationTubeReference ON dbo.tblFurcationTubeReference.BaseID = dbo.tblCableConstructionReferences.BaseID INNER JOIN
                         dbo.tblDesignCodeFurcationTube ON dbo.tblDesignCodeFurcationTube.Furcation = dbo.tblFurcationTubeReference.Furcation
WHERE					tblCableConstructionReferences.Active = 1



GO
PRINT N'Refreshing [dbo].[qrySelectItemNumber]'
GO
EXEC sp_refreshview N'[dbo].[qrySelectItemNumber]'
GO
PRINT N'Refreshing [dbo].[vFiber_Planning_Schedule]'
GO
EXEC sp_refreshview N'[dbo].[vFiber_Planning_Schedule]'
GO
PRINT N'Altering [dbo].[usp_MissingSpecsNotification]'
GO
-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 2/15/2017
-- Description:	Send out emails to notify approvers of constructions awaiting for approval.
-- Job has been ALTERd to run automatically with these notifications
-- =============================================
ALTER PROCEDURE [dbo].[usp_MissingSpecsNotification]


AS

EXECUTE AS USER = 'dbo' 

SET ANSI_NULLS OFF;
SET NOCOUNT ON;

--Run around 8:30am everyday
DECLARE @numRows int
DECLARE @Receipientlist varchar(1000)

--Check if any open item requests need commercial approval
IF OBJECT_ID(N'tempdb..#Results', N'U') IS NOT NULL
DROP TABLE #Results;
select K.[New Oracle Part #], K.[Item No], K.[Fiber Oracle item],K.FiberType2, K.FiberType3, K.DateCreated, K.CreatedBy, [Label Type], [Print Line 3], Item_Status
INTO #Results
from [Basic Product Construction] K LEFT JOIN AFLPRD_INVSysItemSpec_CAB G ON K.[New Oracle Part #] = G.ItemNumber
inner join AFLPRD_INVSysItemCost_CAB t on k.[New Oracle Part #] = t.ItemNumber
where   G.ItemNumber IS NULL AND [Fiber Oracle item] NOT IN ('NONE','FBRRD999','FBR00100' ) AND [New Oracle Part #] NOT LIKE '%OSP%' and t.Item_Status <> 'obsolete'
AND [New Oracle Part #] NOT LIKE 'FBR%' and [New Oracle Part #] not like 'rbn%' and [New Oracle Part #] not like 'swr%'

SELECT @numRows = count(*) FROM #Results




SET @ReceipientList = (STUFF((SELECT ';' + UserEmail 
						FROM tblConfiguratorUser G  INNER JOIN users.UserResponsibility  K ON  G.UserID = K.UserID
  						WHERE K.ResponsibilityID = 5 FOR XML PATH('')),1,1,''))
declare @body1 varchar(max)
declare @subject varchar(max)
declare @query varchar(max) = N'SELECT * FROM tempdb..#Results;'
set @subject = 'Missing Oracle Specs' 
set @body1 = 'There are  ' + CAST(@numRows AS NVARCHAR) + ' items are missing specs.  Please review.' +char(13)+CHAR(13)

DECLARE @tableHTML  NVARCHAR(MAX) ;
if @numRows > 0
begin
	
			SET @tableHTML =
				N'<H1>Oracle Spec Missing Report</H1>' +
				N'<p>'+@body1+'</p>' +
				N'<p class=MsoNormal><span style=''font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D''>'+
				N'<table border="1">' +
				N'<tr><th>Item</th><th>Fiber1</th>' +
				N'<th>Fiber2</th><th>Fiber3</th><th>Item No</th>' +
				N'<th>DateCreated</th><th>CreatedBy</th><th>Label Type</th></tr>' +
				CAST ( ( SELECT		td=[New Oracle Part #],       '',
									td=[Fiber Oracle item], '',
									td=FiberType2, '',
									td=FiberType3, '', 
									td=[Item No], '',
									td=DateCreated, '', 
									td=CreatedBy, '', 
									td=[Label Type], ''
							FROM #Results 
						  FOR XML PATH('tr'), TYPE 
				) AS NVARCHAR(MAX) ) +
				N'</table>' ;
			--SET @tableHTML =
			--	N'<H1>Premise Cut Sheet Approval</H1>' +
			--	N'<p>'+@body1+'</p>' +
			--	N'</table>' ;
		
			EXEC msdb.dbo.sp_send_dbmail 
			@recipients=@ReceipientList,
			@blind_copy_recipients = 'Bryan.Eddy@aflglobal.com',
			@subject = @subject,
			@body = @tableHTML,
			@body_format = 'HTML';
end

GO
PRINT N'Refreshing [dbo].[vCableQualities]'
GO
EXEC sp_refreshview N'[dbo].[vCableQualities]'
GO
PRINT N'Altering [dbo].[usf_BOM_Weight]'
GO
-- =============================================
-- Author:		<Bryan Eddy>
-- ALTER date: <10/3/2016>
-- Description:	<Calulate weight of all cables>
-- =============================================
ALTER FUNCTION [dbo].[usf_BOM_Weight]
(

-- Input parameters
   @Item varchar(50)
)
returns
@CableWeight table
(
   -- Returned table layout
   Weight decimal(10,4)

)

AS
BEGIN


INSERT INTO @CableWeight
SELECT  Weight_kg_km
FROM
(

		SELECT FinishedGood, (SUM(Weight_kg_m) * 1000) as Weight,
	CASE WHEN (SUM(Weight_kg_m) * 1000) < 10 THEN ROUND(SUM(Weight_kg_m) * 1000,1)
		WHEN (SUM(Weight_kg_m) * 1000) BETWEEN 10 AND 100 THEN ROUND(SUM(Weight_kg_m) * 1000,0) 
		WHEN (SUM(Weight_kg_m) * 1000) > 100 THEN ROUND(SUM(Weight_kg_m)*1000/5,0)*5
	END						 
	AS Weight_kg_km
	FROM
	(

		SELECT    e.FinishedGood,(e.ExtendedQuantityPer) AS ExtendedQuantityPer,e.[PrimaryUOM], e.ComponentItemNumber,s.Make_Buy,m.density,

			CASE WHEN e.[PrimaryUOM] = 'Meter' THEN
				CASE WHEN e.ComponentItemNumber like 'rbn%sw%'or e.ComponentItemNumber like 'swr%' THEN sum(e.ExtendedQuantityPer)*.000975
					 WHEN e.ComponentItemNumber like 'FBR%' THEN sum(e.ExtendedQuantityPer)*0.000075
					 WHEN  e.ComponentItemNumber  LIKE 'rbn%osp%' 
					 THEN sum(e.ExtendedQuantityPer)*0.000046125*
							 (SELECT cast(substring([Item No],3,3)as int) as FiberCount
							FROM dbo.[Basic Product Construction] as B 
							WHERE b.[New Oracle Part #] = e.ComponentItemNumber) 
						
					ELSE sum(e.ExtendedQuantityPer) * m.Density 
				END
				ELSE sum(e.ExtendedQuantityPer)
			END
			AS Weight_kg_m

		FROM  [dbo].[fn_ExplodeBOM]((SELECT * FROM GetExistingOracleItemByBase(@Item)))  e 
		INNER JOIN dbo.[AFLPRD_INVSysItemCost_CAB] s ON e.ComponentItemNumber = s.ItemNumber
		LEFT OUTER JOIN [dbo].[tblMaterialWeightsMetersUOM] m ON e.ComponentItemNumber = m.Material
		GROUP BY e.FinishedGood,e.[PrimaryUOM],e.ComponentItemNumber,ExtendedQuantityPer,s.Make_Buy,m.density
				HAVING s.Make_Buy = 'Buy' AND (ComponentItemNumber not like 'rbn%' AND s.Make_Buy = 'Buy')  
		AND e.ComponentItemNumber not like 'RBN%F%' AND e.ComponentItemNumber not like 'RBN%osp%print%' AND e.ComponentItemNumber not like 'Setup%'
		) X
	GROUP BY FinishedGood
	)Y

Return 

END



GO
PRINT N'Refreshing [dbo].[vOracleItemsUncommoned]'
GO
EXEC sp_refreshview N'[dbo].[vOracleItemsUncommoned]'
GO
PRINT N'Altering [dbo].[vCreateItemBaseCenterMember]'
GO
ALTER VIEW [dbo].[vCreateItemBaseCenterMember]
AS
SELECT  DISTINCT	      tblCableConstructionReferences.Base, tblCableConstructionReferences.ConstructionDescription, tblCableConstructions.NominalOD AS OD, 
                         tblCableConstructionReferences.NumSubPositions AS NumPositions, tblCableConstructionReferences.NumSubFillers AS NumFillers, 
                         tblCableConstructions.JacketMaterial, '' CountOfBase, tblCableConstructionReferences.Active, 
                         tblCableConstructionReferences.DesignCode, tblCableConstructions.CablePasses AS Location, tblCableConstructionReferences.ReleasedDesign, 
                         tblCableConstructionReferences.TBType, tblCableConstructionReferences.BaseID, DesignExtension
FROM            tblCableConstructions INNER JOIN
                         tblCableConstructionReferences INNER JOIN
                         CableRunSpeeds ON tblCableConstructionReferences.PrefixID = CableRunSpeeds.PrefixID ON 
                         tblCableConstructions.BaseID = tblCableConstructionReferences.BaseID LEFT OUTER JOIN
                         CableUnion ON tblCableConstructionReferences.Base = CableUnion.Base
--GROUP BY tblCableConstructionReferences.Base, tblCableConstructionReferences.ConstructionDescription, tblCableConstructions.NominalOD, 
--                         tblCableConstructionReferences.NumSubPositions, tblCableConstructionReferences.NumSubFillers, tblCableConstructions.JacketMaterial, 
--                         tblCableConstructionReferences.Active, tblCableConstructionReferences.DesignCode, tblCableConstructions.CablePasses, 
--                         tblCableConstructionReferences.ReleasedDesign, tblCableConstructionReferences.TBType, tblCableConstructionReferences.BaseID


GO
PRINT N'Altering [Setup].[vSetup_Cable_Machine]'
GO








 ALTER VIEW [Setup].[vSetup_Cable_Machine]
 as
 SELECT  [SalesForceDescription]
      ,[Base]
      ,[BaseID]
      ,[OperationCode]
      ,[Setup]
      ,[PrefixID]
      ,[CablePasses]
      ,[FiberCount]
      ,[NominalOD]
      ,[Height]
      ,[JacketMaterial], K.MachineID, E.AttributeValue, I.AttributeName, E.AttributeValue AS [New_Scheduling_Line_Speed],E.AttributeValue as LineSpeed, e.ProcessID, MachineSpecific, BLeft.MachineNumber
 FROM Setup.vSetup_Cable_Base G INNER JOIN Setup.tblSetup K ON G.Setup = K.SetupNumber
 INNER JOIN setup.tblSetupAttributes E ON E.SetupID = K.SetupID
 INNER JOIN [Setup].[tblAttributes] I ON E.AttributeID = I.AttributeID
 INNER JOIN (Setup.tblProcessMachines AS BLeft INNER JOIN Setup.MachineMapping AS BRight ON BLeft.processid=BRight.processid AND BLeft.machineid=BRight.machineid) ON BLeft.ProcessID = E.ProcessID AND BLeft.MachineID = K.MachineID
 WHERE I.AttributeName LIKE 'LINESPEED' AND E.IneffectiveDate > GETDATE() AND I.AttrIneffectiveDate > GETDATE()
 and e.AttributeValue <> 'tbd' and E.ProcessID in (510,523,615) --and base like 't%'
 --AND --fibercount <12 and 
 --(k.MachineID = 1 or k.MachineID = 2)
--and JacketMaterial = 'POL00127'









GO
PRINT N'Altering [Setup].[vSetupSheet]'
GO




ALTER VIEW [Setup].[vSetupSheet]
AS
/*and AttributeName like '%pos%'*/
SELECT        tblProcessMachines.ProcessID, tblProcessMachines.MachineID, tblProcessMachines.MachineNumber, Setup.tblAttributes.AttributeID, 
                         Setup.tblAttributes.AttributeDesc, Setup.tblAttributes.AttributeName, Setup.tblSetup.SetupID, Setup.tblSetup.SetupNumber, Setup.tblSetupAttributes.AttributeValue, 
                         Setup.tblSetupAttributes.MachineSpecific, Setup.tblSetupAttributes.MinValue, Setup.tblAttributes.Active, Setup.tblSetupAttributes.EffectiveDate, 
                         Setup.tblAttributes.AttrEffectiveDate, Setup.tblAttributes.AttributeGroupID, Setup.tblSetup.IneffectiveDate, Setup.tblAttributes.AttributeUOM
						 , Setup.tblAttributes.AttrIneffectiveDate AttributeIneffectiveDate,Setup.tblSetupAttributes.IneffectiveDate SetupAttributesIneffectiveDate
FROM            Setup.tblAttributes INNER JOIN
                         Setup.tblSetupAttributes ON Setup.tblAttributes.AttributeID = Setup.tblSetupAttributes.AttributeID INNER JOIN
                         Setup.tblSetup ON Setup.tblSetupAttributes.SetupID = Setup.tblSetup.SetupID AND Setup.tblSetupAttributes.MachineID = Setup.tblSetup.MachineID INNER JOIN
                         (Setup.tblProcessMachines INNER JOIN Setup.MachineMapping ON tblProcessMachines.processid=MachineMapping.processid AND tblProcessMachines.machineid=MachineMapping.machineid) ON Setup.tblSetup.MachineID = tblProcessMachines.MachineID AND 
                         Setup.tblSetup.ProcessID = tblProcessMachines.ProcessID
WHERE        (Setup.tblAttributes.AttrIneffectiveDate >= GETDATE()) AND (Setup.tblSetup.IneffectiveDate >= GETDATE()) and Setup.tblSetupAttributes.IneffectiveDate >=getdate() --AND (Setup.tblSetup.SetupNumber = 'M103')
AND tblProcessMachines.Active <> 0

--ORDER BY AttributeName



GO
PRINT N'Altering [dbo].[usp_WhereUsed_SalesHistory]'
GO
ALTER PROCEDURE [dbo].[usp_WhereUsed_SalesHistory]
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
PRINT N'Altering [dbo].[usp_GetWhereUsedMaterials]'
GO
/* =============================================
-- Author:		Bryan Eddy
-- ALTER date: 6/22/2017
-- Description:	MRP function to report Customer purchase history with respect to Raw Materials
-- 
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

SELECT Material, AssemblyItemNumber, sum(ComponentQuantity) as TotalQuantity--, PrimaryUOM,CategoryName
FROM #TempFG T-- INNER JOIN AFLPRD_INVItmCatg_CAB G ON G.ItemNumber = T.AssemblyItemNumber
GROUP BY  Material, AssemblyItemNumber, PrimaryUOM--,CategorySetName,CategoryName
--HAVING G.CategorySetName = 'PRODUCT CLASS'
ORDER BY Material


IF OBJECT_ID(N'tempdb..##MaterialUsage', N'U') IS NOT NULL
drop table ##MaterialUsage;

--Shows orders for all FG contianing materials from the queried list.  Also shows where there have been no orders.
SELECT DISTINCT Material, AssemblyItemNumber, round(sum(ComponentQuantity),6) MaterialQuantity_PerPrimaryUOM--,CategoryName
,round(sum(ComponentQuantity),7) *CASE WHEN S.UNIT_OF_MEASURE = 'FT' THEN ROUND(S.QUANTITY / 3.281,7) ELSE S.QUANTITY END as MaterialQuanitty_PerOrder, PrimaryUOM,p.Item_Status
--, CASE WHEN CategoryName like '%premise%' THEN 'Premise' ELSE 'ACS' END BU
, S.BILL_TO_NAME Customer, S.ORDER_NUMBER as OrderNum,S.PROMISE_DATE as Shipped
,CASE WHEN S.UNIT_OF_MEASURE = 'FT' THEN ROUND(S.QUANTITY / 3.281,0) ELSE S.QUANTITY END as Quantity, CASE WHEN S.UNIT_OF_MEASURE = 'FT' THEN 'M' ELSE S.UNIT_OF_MEASURE END as QTY_UOM, s.REVENUE
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
PRINT N'Refreshing [dbo].[vFindItem]'
GO
EXEC sp_refreshview N'[dbo].[vFindItem]'
GO
PRINT N'Refreshing [Oracle].[vMissingFiberSpecs]'
GO
EXEC sp_refreshview N'[Oracle].[vMissingFiberSpecs]'
GO
PRINT N'Altering [dbo].[vCreateItemBase]'
GO
ALTER VIEW [dbo].[vCreateItemBase]
AS
SELECT       DISTINCT dbo.tblCableConstructionReferences.Base, dbo.tblCableConstructionReferences.ConstructionDescription, dbo.tblCableConstructions.NominalOD AS OD, 
                         dbo.tblCableConstructionReferences.NumSubPositions AS NumPositions, dbo.tblCableConstructionReferences.NumSubFillers AS NumFillers, 
                         dbo.tblCableConstructions.JacketMaterial, '' AS CountOfBase, dbo.tblCableConstructionReferences.Active, 
                         dbo.tblCableConstructionReferences.DesignCode, dbo.tblCableConstructions.CablePasses AS Location, dbo.tblCableConstructionReferences.ReleasedDesign, 
                         dbo.tblCableTBType.TBLetter, dbo.tblCableConstructionReferences.TBType, dbo.tblCableConstructionReferences.BaseID, dbo.tblCableConstructions.Additive, 
                         dbo.tblCableTightBufferReference.TBTypeID, dbo.tblCableConstructionReferences.FibersPerBundle, dbo.tblCableTightBufferReference.TightBuffered, 
                         dbo.tblCableConstructionReferences.ProductID, dbo.tblCableConstructionReferences.DesignTypeID, dbo.tblCableConstructionReferences.CableFamily
						 ,FiberCount, dbo.tblCableConstructionReferences.SetupID, StandardOperation, DesignExtension
FROM            dbo.tblCableConstructions INNER JOIN
                         dbo.tblCableConstructionReferences INNER JOIN
                         dbo.CableRunSpeeds ON dbo.tblCableConstructionReferences.PrefixID = dbo.CableRunSpeeds.PrefixID ON 
                         dbo.tblCableConstructions.BaseID = dbo.tblCableConstructionReferences.BaseID LEFT OUTER JOIN
                         dbo.CableUnion ON dbo.tblCableConstructionReferences.Base = dbo.CableUnion.Base INNER JOIN
                         dbo.tblCableTightBufferReference ON dbo.tblCableConstructionReferences.TBType = dbo.tblCableTightBufferReference.TBType INNER JOIN
                         dbo.tblCableTBType ON dbo.tblCableTightBufferReference.TBTypeID = dbo.tblCableTBType.TBIndicatorID
--GROUP BY dbo.tblCableConstructionReferences.Base, dbo.tblCableConstructionReferences.ConstructionDescription, dbo.tblCableConstructions.NominalOD, 
--                         dbo.tblCableConstructionReferences.NumSubPositions, dbo.tblCableConstructionReferences.NumSubFillers, dbo.tblCableConstructions.JacketMaterial, 
--                         dbo.tblCableConstructionReferences.Active, dbo.tblCableConstructionReferences.DesignCode, dbo.tblCableConstructions.CablePasses, 
--                         dbo.tblCableConstructionReferences.ReleasedDesign, dbo.tblCableTBType.TBLetter, dbo.tblCableConstructionReferences.TBType, 
--                         dbo.tblCableConstructionReferences.BaseID, dbo.tblCableConstructions.Additive, dbo.tblCableTightBufferReference.TBTypeID, 
--                         dbo.tblCableConstructionReferences.FibersPerBundle, dbo.tblCableTightBufferReference.TightBuffered, dbo.tblCableConstructionReferences.ProductID, 
--                         dbo.tblCableConstructionReferences.DesignTypeID, dbo.tblCableConstructionReferences.CableFamily,FiberCount,dbo.tblCableConstructionReferences.SetupID,StandardOperation
WHERE        (dbo.tblCableConstructionReferences.Active <> 0)





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
PRINT N'Altering [dbo].[vCableConstruction]'
GO
ALTER VIEW [dbo].[vCableConstruction]
AS
SELECT         DISTINCT dbo.tblCableConstructionReferences.Base, dbo.tblCableConstructionReferences.ConstructionDescription, dbo.tblCableConstructions.NominalOD AS OD, 
                         dbo.tblCableConstructionReferences.NumSubPositions AS NumPositions, dbo.tblCableConstructionReferences.NumSubFillers AS NumFillers, 
                         dbo.tblCableConstructions.JacketMaterial,  dbo.tblCableConstructionReferences.Active, 
                         dbo.tblCableConstructionReferences.DesignCode, dbo.tblCableConstructions.CablePasses AS Location, dbo.tblCableConstructionReferences.ReleasedDesign, 
                          dbo.tblCableConstructionReferences.TBType, dbo.tblCableConstructionReferences.BaseID, dbo.tblCableConstructions.Additive, 
                         dbo.tblCableTightBufferReference.TBTypeID, dbo.tblCableConstructionReferences.FibersPerBundle, dbo.tblCableTightBufferReference.TightBuffered, 
                         dbo.tblCableConstructionReferences.ProductID, dbo.tblCableConstructionReferences.DesignTypeID, dbo.tblCableConstructionReferences.CableFamily
						 ,FiberCount, dbo.tblCableConstructionReferences.SetupID, StandardOperation, IsCommoned
FROM            dbo.tblCableConstructions INNER JOIN
                         dbo.tblCableConstructionReferences INNER JOIN
                         dbo.CableRunSpeeds ON dbo.tblCableConstructionReferences.PrefixID = dbo.CableRunSpeeds.PrefixID ON 
                         dbo.tblCableConstructions.BaseID = dbo.tblCableConstructionReferences.BaseID LEFT OUTER JOIN
                         dbo.CableUnion ON dbo.tblCableConstructionReferences.Base = dbo.CableUnion.Base INNER JOIN
                         dbo.tblCableTightBufferReference ON dbo.tblCableConstructionReferences.TBType = dbo.tblCableTightBufferReference.TBType --INNER JOIN
                         --dbo.tblCableTBType ON dbo.tblCableTightBufferReference.TBTypeID = dbo.tblCableTBType.TBIndicatorID
--where DesignCode LIKE 'm%'






GO
PRINT N'Altering [dbo].[vCreateItemBaseCableExtensions]'
GO
ALTER VIEW [dbo].[vCreateItemBaseCableExtensions]
AS
SELECT        dbo.tblCableConstructionReferences.Base, dbo.tblCableConstructionReferences.ConstructionDescription, dbo.tblCableConstructions.NominalOD AS OD, 
                         dbo.tblCableConstructionReferences.NumSubPositions AS NumPositions, dbo.tblCableConstructionReferences.NumSubFillers AS NumFillers, 
                         dbo.tblCableConstructions.JacketMaterial, '' AS CountOfBase, dbo.tblCableConstructionReferences.Active, 
                         dbo.tblCableConstructionReferences.DesignCode, dbo.tblCableConstructions.CablePasses AS Location, dbo.tblCableConstructionReferences.ReleasedDesign, 
                         dbo.tblCableTBType.TBLetter, dbo.tblCableConstructionReferences.TBType, dbo.tblCableConstructionReferences.BaseID, dbo.tblCableConstructions.Additive, 
                         dbo.tblCableTightBufferReference.TBTypeID, dbo.[Product Desrcriptions].[Level 1 Product], tblCableConstructionReferences_1.FibersPerBundle, 
                         dbo.[Product Desrcriptions].SubFiller, dbo.tblCableExtensionReference.ExtensionIndicator, dbo.tblCableTightBufferReference.TightBuffered, tblCableConstructionReferences.DesignExtension
FROM            dbo.tblCableConstructionReferences AS tblCableConstructionReferences_1 INNER JOIN
                         dbo.tblCableConstructions INNER JOIN
                         dbo.tblCableConstructionReferences INNER JOIN
                         dbo.CableRunSpeeds ON dbo.tblCableConstructionReferences.PrefixID = dbo.CableRunSpeeds.PrefixID INNER JOIN
                         dbo.[Product Desrcriptions] ON dbo.tblCableConstructionReferences.SetupID = dbo.[Product Desrcriptions].ProductID AND 
                         dbo.tblCableConstructionReferences.SetupID = dbo.[Product Desrcriptions].ProductID ON 
                         dbo.tblCableConstructions.BaseID = dbo.tblCableConstructionReferences.BaseID LEFT OUTER JOIN
                         dbo.CableUnion ON dbo.tblCableConstructionReferences.Base = dbo.CableUnion.Base INNER JOIN
                         dbo.tblCableTightBufferReference ON dbo.tblCableConstructionReferences.TBType = dbo.tblCableTightBufferReference.TBType INNER JOIN
                         dbo.tblCableTBType ON dbo.tblCableTightBufferReference.TBTypeID = dbo.tblCableTBType.TBIndicatorID ON 
                         tblCableConstructionReferences_1.Base = dbo.[Product Desrcriptions].[Level 1 Product] INNER JOIN
                         dbo.tblCableExtensionReference ON tblCableConstructionReferences_1.FibersPerBundle = dbo.tblCableExtensionReference.ExtensionNumber
--GROUP BY dbo.tblCableConstructionReferences.Base, dbo.tblCableConstructionReferences.ConstructionDescription, dbo.tblCableConstructions.NominalOD, 
--                         dbo.tblCableConstructionReferences.NumSubPositions, dbo.tblCableConstructionReferences.NumSubFillers, dbo.tblCableConstructions.JacketMaterial, 
--                         dbo.tblCableConstructionReferences.Active, dbo.tblCableConstructionReferences.DesignCode, dbo.tblCableConstructions.CablePasses, 
--                         dbo.tblCableConstructionReferences.ReleasedDesign, dbo.tblCableTBType.TBLetter, dbo.tblCableConstructionReferences.TBType, 
--                         dbo.tblCableConstructionReferences.BaseID, dbo.tblCableConstructions.Additive, dbo.tblCableTightBufferReference.TBTypeID, 
--                         dbo.tblCableConstructionReferences.FibersPerBundle, dbo.[Product Desrcriptions].[Level 1 Product], tblCableConstructionReferences_1.FibersPerBundle, 
--                         dbo.[Product Desrcriptions].SubFiller, tblCableConstructionReferences_1.Base, dbo.tblCableExtensionReference.ExtensionIndicator, 
--                         dbo.tblCableTightBufferReference.TightBuffered
WHERE        (dbo.[Product Desrcriptions].SubFiller = 0) AND (dbo.tblCableConstructionReferences.Active <> 0)



GO
PRINT N'Refreshing [dbo].[vItemSearch]'
GO
EXEC sp_refreshview N'[dbo].[vItemSearch]'
GO
PRINT N'Altering [dbo].[usp_MTY_ObsoleteComponentNotification]'
GO
-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 2/15/2017
-- Description:	Send out emails to notify approvers of constructions awaiting for approval.
-- Job has been ALTERd to run automatically with these notifications
-- =============================================
ALTER PROC [dbo].[usp_MTY_ObsoleteComponentNotification]


AS

EXECUTE AS USER = 'dbo' 

SET ANSI_NULLS OFF;
SET NOCOUNT ON;

--Run around 8:30am everyday
DECLARE @numRows int
DECLARE @Receipientlist varchar(1000)

--Check if any open item requests need commercial approval
IF OBJECT_ID(N'tempdb..#Results', N'U') IS NOT NULL
DROP TABLE #Results;

WITH cteInventory
AS(
	SELECT Item, SUM(QTY) AS Quantity, [Org Code]
	FROM dbo.AFLPRD_onhandqty_STD_81_ALL 
	GROUP BY [Org Code], Item
	HAVING [Org Code] = 'MTY'
)
SELECT DISTINCT   ComponentItemNumber,Description, AssemblyItemStatus, CompItemStatus, COALESCE(NewItem,'') NewItem, COALESCE(i.Quantity,'') QuantityOnHand, COALESCE(i.[Org Code],'') AS Org
INTO #Results
FROM AFLPRD_BOMInvComp_MTY K INNER JOIN AFLPRD_INVSysItemCost_CAB G ON K.ComponentItemNumber = G.ItemNumber
LEFT JOIN PCN_History P ON P.OldItem = ComponentItemNumber
LEFT JOIN cteInventory i ON i.Item = G.ItemNumber
WHERE Item_Status <>'active' and AssemblyItemStatus = 'active' AND NewItem IS NULL

SELECT @numRows = count(*) FROM #Results



--SET @ReceipientList = (STUFF((SELECT ';' + UserEmail FROM tblConfiguratorUser WHERE ItemBuilder <> 0 FOR XML PATH('')),1,1,''))
SET @Receipientlist = 'AFLMTYInactiveComponentAlertDL@aflglobal.com'

declare @body1 varchar(max)
declare @subject varchar(max)
declare @query varchar(max) = N'SELECT * FROM tempdb..#Results;'
set @subject = 'MTY ALERT - Inactive Components in BOM ' + CAST(GETDATE() AS NVARCHAR)
set @body1 = 'There are  ' + CAST(@numRows AS NVARCHAR) + ' inactive components in MTY BOMs.  Please review.' +char(13)+CHAR(13)

DECLARE @tableHTML  NVARCHAR(MAX) ;
if @numRows > 0
begin
	
			SET @tableHTML =
				N'<H1>MTY Inactive BOM Components</H1>' +
				N'<p>'+@body1+'</p>' +
				N'<p class=MsoNormal><span style=''font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D''>'+
				N'<table border="1">' +
				N'<tr><th>ComponentItemNumber</th><th>Description</th>' +
				N'<th>AssemblyItemStatus</th><th>CompItemStatus</th><th>NewItem</th>' +
				N'<th>Quantity On Hand</th><th>Org</th></tr>' +
				CAST ( ( SELECT		td=ComponentItemNumber,       '',
									td=Description,       '',
									td=AssemblyItemStatus, '',
									td=CompItemStatus, '',
									td=NewItem, '',
									td=QuantityOnHand, '',
									td=Org,''
							FROM #Results 
						  FOR XML PATH('tr'), TYPE 
				) AS NVARCHAR(MAX) ) +
				N'</table>' ;
			--SET @tableHTML =
			--	N'<H1>Premise Cut Sheet Approval</H1>' +
			--	N'<p>'+@body1+'</p>' +
			--	N'</table>' ;
		
			EXEC msdb.dbo.sp_send_dbmail 
			@recipients=@Receipientlist,
			--@recipients = 'Bryan.Eddy@aflglobal.com',
			@blind_copy_recipients = 'Bryan.Eddy@aflglobal.com',
			@subject = @subject,
			@body = @tableHTML,
			@body_format = 'HTML';
end

GO
PRINT N'Refreshing [Setup].[vSetupStandardOperationMismatch]'
GO
EXEC sp_refreshview N'[Setup].[vSetupStandardOperationMismatch]'
GO
PRINT N'Refreshing [Oracle].[vActiveItemsWithObsoleteComponents]'
GO
EXEC sp_refreshview N'[Oracle].[vActiveItemsWithObsoleteComponents]'
GO
PRINT N'Altering [dbo].[usp_EmailActiveItemsWithObsoleteComponents]'
GO

-- =============================================
-- Author:		Bryan Eddy
-- ALTER date:	11/6/2017
-- Desc:		Finding items with obsolete components.
-- =============================================
ALTER PROCEDURE [dbo].[usp_EmailActiveItemsWithObsoleteComponents]


AS

EXECUTE AS USER = 'dbo' 

SET ANSI_NULLS OFF;
SET NOCOUNT ON;


DECLARE @numRows int
DECLARE @Receipientlist varchar(1000)


IF OBJECT_ID(N'tempdb..#Results', N'U') IS NOT NULL
DROP TABLE #Results;
SELECT *
INTO #Results
FROM Oracle.vActiveItemsWithObsoleteComponents
WHERE (salesorder IS NULL AND subinventory IS NULL) OR AssemblyItemStatus <> 'discontd'
ORDER BY AssemblyItemNumber


SELECT * FROM #Results

SELECT @numRows = count(*) FROM #Results



SET @ReceipientList = (STUFF((SELECT ';' + UserEmail 
						FROM tblConfiguratorUser G  INNER JOIN users.UserResponsibility  K ON  G.UserID = K.UserID
  						WHERE K.ResponsibilityID IN(5) FOR XML PATH('')),1,1,''))
						--WHERE g.UserTypeID = 1 FOR XML PATH('')),1,1,''))

DECLARE @body1 VARCHAR(MAX)
DECLARE @subject VARCHAR(MAX)
DECLARE @query VARCHAR(MAX) = N'SELECT * FROM tempdb..#Results;'
SET @subject = 'Obsolete Components' 
SET @body1 = 'There are  ' + CAST(@numRows AS NVARCHAR) + ' active item(s) with obsolete components.  Please review.' +CHAR(13)+CHAR(13)

DECLARE @tableHTML  NVARCHAR(MAX) ;
IF @numRows > 0
BEGIN
	
			SET @tableHTML =
				N'<H1>Obsolete Componenet Report</H1>' +
				N'<p>'+@body1+'</p>' +
				N'<p class=MsoNormal><span style=''font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D''>'+
				N'<table border="1">' +
				N'<tr><th>Item</th><th>Item Status</th>' +
				N'<th>Obsolete Component</th>' +
				N'<th>ComponentStatus</th></tr>' +
				CAST ( ( SELECT		td=AssemblyItemNumber,       '',
									td=AssemblyItemStatus, '',
									td=ObsoleteComponent, '',
									td=Instructions,''

							FROM #Results 
						  FOR XML PATH('tr'), TYPE 
				) AS NVARCHAR(MAX) ) +
				N'</table>' ;
			--SET @tableHTML =
			--	N'<H1>Premise Cut Sheet Approval</H1>' +
			--	N'<p>'+@body1+'</p>' +
			--	N'</table>' ;
		
			EXEC msdb.dbo.sp_send_dbmail 
			@recipients=@ReceipientList,
			@blind_copy_recipients = 'Bryan.Eddy@aflglobal.com',
			@subject = @subject,
			@body = @tableHTML,
			@body_format = 'HTML';


END
GO
PRINT N'Altering [dbo].[usp_CutSheet_Email_Reminder]'
GO

/*
-- =============================================
-- Author:		Bryan Eddy
-- ALTER date:	2/15/2017
-- Description:	Send out emails to notify approvers of constructions awaiting for approval.
	Version:	2
	Update:		1. Added in a date differential to give more time before notification
				2. Put results into a table with differential of days the request has been open.
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
						 WHERE k.ResponsibilityID IN (2,3) FOR XML PATH('')),1,1,''))

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
                         dbo.tblCableConstructionReferences.ApprovedForQuoting, dbo.tblCableConstructionReferences.SetupID AS ConstructionID, ImageGroupID
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
Version:	2
Update:		1. Changed criteria to allow for more items to be viewed for cut sheets
			2. Allow for unprinted items to be in the view

*/
ALTER VIEW [dbo].[vFindCutSheet]
as
SELECT DISTINCT 
                         CableUnion.Oracle, CableUnion.Fiber, CableUnion.Color, CableUnion.Base, TopCable.StandardOperation, CableUnion.ItemNo, TopCable.CablePasses AS Location, 
                         tblCableConstructionReferences.RevisionDate, CableUnion.OracleStatus, CableUnion.PID, CableUnion.Fiber2, CableUnion.Customer, TopCable.NominalOD, CONVERT(DATE, CableUnion.[Revision Date]) 
                         AS RevDate, CableUnion.PrintSpacing, CableUnion.[Item No], TopCable.TensileApplication, tblCableConstructionReferences.DesignTypeID, TopCable.TemperatureApplication, 
                         tblDesignTypes.SalesForceDescription, CAST(SUBSTRING(CableUnion.ItemNo, 3, 3) AS INT) AS FiberCount,  tblCableConstructionReferences.NumSubPositions, K.CableType,
                         tblCableConstructionReferences.NumCopperUnits, 
                         CASE WHEN TopCable.CablePasses = 1 THEN tblCableConstructionReferences.FibersPerBundle ELSE SubReference.FibersPerBundle END AS FibersPerBundle, 
                         CASE WHEN TopCable.CablePasses = 1 THEN TopCable.NominalOD ELSE tblCableConstructions.NominalOD END AS SubOD
						 , tblCutSheetApproval.Technical_Approval, 
                         tblCutSheetApproval.Commercial_Approval, tblCutSheetApproval.Requested, 
						 CASE WHEN ((tblCutSheetApproval.Commercial_Approval = 0 OR
                         tblCutSheetApproval.Technical_Approval = 0 OR
                         COALESCE (vArmorCoreItems_Approvals.CorCommercial_Approval, 1) = 0 OR
                         COALESCE (vArmorCoreItems_Approvals.CoreTechnical_Approval, 1) = 0)) AND Requested = 1 THEN 'Requested' WHEN ((tblCutSheetApproval.Commercial_Approval = 0 OR
                         tblCutSheetApproval.Technical_Approval = 0 OR
                         COALESCE (vArmorCoreItems_Approvals.CorCommercial_Approval, 1) = 0 OR
                         COALESCE (vArmorCoreItems_Approvals.CoreTechnical_Approval, 1) = 0)) AND Requested = 0 THEN 'Not Approved' ELSE 'Approved' END AS Status
						 ,tblCableConstructionReferences.SetupID AS ConstructionID, ItemID
FROM            dbo.CableUnion INNER JOIN
                         dbo.tblCableConstructionReferences ON CableUnion.Base = tblCableConstructionReferences.Base INNER JOIN
                         dbo.tblCableConstructions AS TopCable ON tblCableConstructionReferences.BaseID = TopCable.BaseID INNER JOIN
                         tblDesignTypes ON tblCableConstructionReferences.DesignTypeID = tblDesignTypes.DesignTypeID INNER JOIN
                         tblCableTightBufferReference ON tblCableConstructionReferences.TBType = tblCableTightBufferReference.TBType INNER JOIN
                         tblCutSheetApproval ON tblCableConstructionReferences.Base = tblCutSheetApproval.Base LEFT OUTER JOIN
                         vSubunitBases RIGHT OUTER JOIN
                         tblCableConstructionReferences AS SubReference ON vSubunitBases.[Level 1 Product] = SubReference.Base ON 
                         tblCableConstructionReferences.SetupID = vSubunitBases.ProductID LEFT OUTER JOIN
                         tblCableConstructions ON SubReference.BaseID = tblCableConstructions.BaseID LEFT OUTER JOIN
                         Standards.CableConstructionStandards ON Standards.CableConstructionStandards.BaseID = TopCable.BaseID LEFT OUTER JOIN
                         vArmorCoreItems_Approvals ON vArmorCoreItems_Approvals.ArmoredItem = CableUnion.Oracle
						 INNER JOIN dbo.tblCableType K ON K.CableType = tblCableConstructionReferences.CableType
WHERE        
						(CableUnion.Customer LIKE 'AFL STANDARD%' OR
                         CableUnion.Customer LIKE 'AFL GENERIC%' OR  CableUnion.Oracle LIKE 'DN%' OR customer LIKE 'unprinted%') AND 
						 (tblCableConstructionReferences.ReleasedDesign <> 0) 
						 AND (CableUnion.Oracle NOT LIKE '%test%') AND (CableUnion.OracleStatus <> 'Obsolete') AND 
                         (CableUnion.OracleStatus <> 'Discontd') AND (ISNUMERIC(SUBSTRING(CableUnion.ItemNo, 3, 3)) = 1) AND (CableUnion.Active <> 0) AND 
                         (tblCableConstructionReferences.ReleasedDesign <> 0) AND 
                         (CableUnion.Active <> 0) AND (CableUnion.Oracle NOT LIKE '%test%') AND K.CableID = 1




GO
PRINT N'Refreshing [dbo].[FiberAllComponents]'
GO
EXEC sp_refreshview N'[dbo].[FiberAllComponents]'
GO
PRINT N'Refreshing [dbo].[vSchedulingGanttFiberPlanning]'
GO
EXEC sp_refreshview N'[dbo].[vSchedulingGanttFiberPlanning]'
GO
PRINT N'Creating [CutSheet].[vImageGroupPivotImages]'
GO
/*
Author:		Bryan Eddy
Date:		2/20/2018
Desc:		Pivot view of each image group with the isometric and crosssection imageID

*/

CREATE VIEW [CutSheet].[vImageGroupPivotImages]
as

SELECT pvt.ImageGroupID,ImageGroupName,ImageGroupDesc, pvt.Color, pvt.Armored,[2] AS IsometricImageID, Iso.ImageName AS IsometricImageName,iso.ImageFileType AS IsoImageFileType,
 [1] AS CrossSectionImageID, CrossSec.ImageName AS CrossSectionImageName, CrossSec.ImageFileType AS CrossImageFileType

FROM 
	(
	SELECT i.ImageGroupName,I.ImageGroupDesc, B.ImageTypeID, g.ImageID, g.Color, g.Armored
	,I.ImageGroupID
	FROM CutSheet.Images g INNER JOIN CutSheet.ImageGroupReference K ON K.ImageID = G.ImageID
	INNER JOIN CutSheet.ImageGroup I ON I.ImageGroupID = K.ImageGroupID 
	INNER JOIN CutSheet.ImageType B ON B.ImageTypeID = g.ImageTypeID
	) AS X
PIVOT
(
MAX(ImageID)
FOR ImageTypeID IN([1],[2]) 
) AS pvt left JOIN CutSheet.Images CrossSec ON CrossSec.ImageID = pvt.[1]
		left JOIN cutsheet.Images Iso ON Iso.ImageID = pvt.[2]
GO
PRINT N'Creating [dbo].[XXAFL_CAB_DESIGN_ITEMS_ATTR_DELETE]'
GO
CREATE TABLE [dbo].[XXAFL_CAB_DESIGN_ITEMS_ATTR_DELETE]
(
[INVENTORY_ITEM_NAME] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ORGANIZATION_ID] [int] NULL,
[PRIMARY_ALT] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PROCESS_ID] [int] NULL,
[DEPARTMENT_ID] [int] NOT NULL,
[ATTRIBUTE_ID] [int] NOT NULL,
[ATTRIBUTE_VALUE] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UNIT_ID] [int] NOT NULL,
[LAYER_ID] [int] NOT NULL,
[START_DATE] [datetime] NULL,
[END_DATE] [datetime] NULL,
[USER_NAME] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CREATED_BY] [int] NULL,
[CREATION_DATE] [datetime] NULL,
[UPDATED_BY] [int] NULL,
[UPDATE_DATE] [datetime] NULL,
[CREATE_UPDATE_FLAG] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BATCH_ID] [int] NULL
) ON [PRIMARY]
GO
PRINT N'Creating primary key [PK_XXAFL_CAB_DESIGN_ITEMS_ATTR] on [dbo].[XXAFL_CAB_DESIGN_ITEMS_ATTR_DELETE]'
GO
ALTER TABLE [dbo].[XXAFL_CAB_DESIGN_ITEMS_ATTR_DELETE] ADD CONSTRAINT [PK_XXAFL_CAB_DESIGN_ITEMS_ATTR] PRIMARY KEY CLUSTERED  ([INVENTORY_ITEM_NAME], [PRIMARY_ALT], [DEPARTMENT_ID], [ATTRIBUTE_ID], [UNIT_ID], [LAYER_ID]) ON [PRIMARY]
GO
PRINT N'Creating [dbo].[usp_SalesHistoryUpdate_BI_DELETE]'
GO
/*	Author:		Bryan Eddy
	Date:		12/11/2017
	Desc:		Procedure to update the Sales History being
	Rev:		2
	Update:		Updated to MERGE statement and added error handling
	
	 */

CREATE PROCEDURE [dbo].[usp_SalesHistoryUpdate_BI_DELETE]
as


--delete SalesHistory_BI_Data 
--FROM             sales_pivot_bi AS K INNER JOIN
--                         SalesHistory_BI_Data AS B ON K.SO_NUMBER = B.SO_NUMBER AND B.SO_LINE = K.SO_LINE 
--						 --AND COALESCE (K.SHIP_TO_POSTAL_CODE, '') = B.SHIP_TO_POSTAL_CODE AND B.SHIP_TO_STATE = COALESCE (K.SHIP_TO_STATE, '') 
--						 AND B.SHIP_TO_COUNTRY =  K.SHIP_TO_COUNTRY


SET NOCOUNT ON;

DECLARE @ErrorNumber INT = ERROR_NUMBER();
DECLARE @ErrorLine INT = ERROR_LINE();
	BEGIN TRY
		BEGIN tran
			;WITH cteSalesHistory
			AS(
			SELECT         K.BU, K.ORG, K.CALENDAR_QUARTER, K.FISCAL_QUARTER, K.Month, CAST(LEFT(K.[DATE],10) AS DATETIME) Date, K.CUSTOMER_CLUSTER, K.CUSTOMER, K.AGENT, K.CUSTOMER_CLASS, 
								 K.CUSTOMER_CATEGORY, K.TERRITORY_MARKET, K.MARKET, K.CLUSTER_ACCOUNT, COALESCE (K.SHIP_TO_STATE, '') AS SHIP_TO_STATE, 
								 COALESCE (K.SHIP_TO_COUNTRY, '') AS SHIP_TO_COUNTRY, COALESCE (K.SHIP_TO_POSTAL_CODE, '') AS SHIP_TO_POSTAL_CODE, K.ITEM_NUMBER, K.ITEM_DESCRIPTION, SUM(K.REVENUE)
								 AS REVENUE, SUM(K.QUANTITY) AS QUANTITY, K.UOM, K.PO, K.SO_NUMBER, K.SO_LINE, K.CSR, K.PRODUCT_CATEGORY--, B.ITEM_NUMBER
			--INTO #SalesHistory
			FROM            sales_pivot_bi AS K 
			GROUP BY K.BU, K.ORG, K.CALENDAR_QUARTER, K.FISCAL_QUARTER, K.Month, K.DATE, K.CUSTOMER_CLUSTER, K.CUSTOMER, K.AGENT, K.CUSTOMER_CLASS, 
									 K.CUSTOMER_CATEGORY, K.TERRITORY_MARKET, K.MARKET, K.CLUSTER_ACCOUNT, K.SHIP_TO_STATE, K.SHIP_TO_COUNTRY, K.SHIP_TO_POSTAL_CODE, 
									 K.ITEM_NUMBER, K.ITEM_DESCRIPTION, K.UOM, K.PO, K.SO_NUMBER, K.SO_LINE, K.CSR, K.PRODUCT_CATEGORY, K.ORG
			HAVING       (K.ORG = 'cab') AND (K.SO_LINE IS NOT NULL)
			)
			MERGE SalesHistory_BI_Data AS Target
			USING cteSalesHistory AS Source
			ON ( Target.SO_NUMBER = Source.SO_NUMBER AND Source.SO_LINE = Target.SO_LINE 
				AND COALESCE (Target.SHIP_TO_POSTAL_CODE, '') = Source.SHIP_TO_POSTAL_CODE AND Source.SHIP_TO_STATE = COALESCE (Target.SHIP_TO_STATE, '') 
				AND Source.SHIP_TO_COUNTRY =  Target.SHIP_TO_COUNTRY AND Source.SO_NUMBER = Target.SO_NUMBER AND TARGET.SO_LINE = SOURCE.SO_LINE
				AND Target.DATE = SOURCE.DATE AND TARGET.AGENT = Source.AGENT)
			WHEN NOT MATCHED BY TARGET THEN
				INSERT (BU, ORG, CALENDAR_QUARTER, FISCAL_QUARTER, Month, DATE, CUSTOMER_CLUSTER, CUSTOMER, AGENT, CUSTOMER_CLASS, CUSTOMER_CATEGORY, 
								 TERRITORY_MARKET, MARKET, CLUSTER_ACCOUNT, SHIP_TO_STATE, SHIP_TO_COUNTRY, SHIP_TO_POSTAL_CODE, ITEM_NUMBER, ITEM_DESCRIPTION, 
								 REVENUE, QUANTITY, UOM, PO, SO_NUMBER, SO_LINE, CSR, PRODUCT_CATEGORY)
				VALUES (BU, ORG, CALENDAR_QUARTER, FISCAL_QUARTER, Month, DATE, CUSTOMER_CLUSTER, CUSTOMER, AGENT, CUSTOMER_CLASS, CUSTOMER_CATEGORY
								, TERRITORY_MARKET, MARKET, CLUSTER_ACCOUNT, SHIP_TO_STATE ,SHIP_TO_COUNTRY, SHIP_TO_POSTAL_CODE, ITEM_NUMBER, ITEM_DESCRIPTION,
								 REVENUE, QUANTITY, UOM, PO, SO_NUMBER, SO_LINE, CSR, PRODUCT_CATEGORY)
			WHEN MATCHED THEN
			UPDATE SET target.BU = Source.BU, 
						Target.ORG  = Source.ORG ,
						Target.CALENDAR_QUARTER  = Source.CALENDAR_QUARTER ,
						Target.FISCAL_QUARTER  = Source.FISCAL_QUARTER ,
						Target.Month  = Source.Month ,
						Target.DATE  = Source.DATE ,
						Target.CUSTOMER_CLUSTER  = Source.CUSTOMER_CLUSTER ,
						Target.CUSTOMER  = Source.CUSTOMER ,
						Target.AGENT  = Source.AGENT ,
						Target.CUSTOMER_CLASS  = Source.CUSTOMER_CLASS ,
						Target.CUSTOMER_CATEGORY  = Source.CUSTOMER_CATEGORY ,
						Target.TERRITORY_MARKET  = Source.TERRITORY_MARKET ,
						Target.MARKET  = Source.MARKET ,
						Target.CLUSTER_ACCOUNT  = Source.CLUSTER_ACCOUNT ,
						Target.SHIP_TO_STATE  = Source.SHIP_TO_STATE ,
						Target.SHIP_TO_COUNTRY  = Source.SHIP_TO_COUNTRY ,
						Target.SHIP_TO_POSTAL_CODE  = Source.SHIP_TO_POSTAL_CODE ,
						Target.ITEM_NUMBER  = Source.ITEM_NUMBER ,
						Target.ITEM_DESCRIPTION  = Source.ITEM_DESCRIPTION ,
						Target.REVENUE  = Source.REVENUE ,
						Target.QUANTITY  = Source.QUANTITY ,
						Target.UOM  = Source.UOM ,
						Target.PO  = Source.PO ,
						Target.SO_NUMBER  = Source.SO_NUMBER ,
						Target.SO_LINE  = Source.SO_LINE ,
						Target.CSR  = Source.CSR ,
						Target.PRODUCT_CATEGORY = Source.PRODUCT_CATEGORY
					;
				
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;

--INSERT INTO SalesHistory_BI_Data
--                         (BU, ORG, CALENDAR_QUARTER, FISCAL_QUARTER, Month, DATE, CUSTOMER_CLUSTER, CUSTOMER, AGENT, CUSTOMER_CLASS, CUSTOMER_CATEGORY, 
--                         TERRITORY_MARKET, MARKET, CLUSTER_ACCOUNT, SHIP_TO_STATE, SHIP_TO_COUNTRY, SHIP_TO_POSTAL_CODE, ITEM_NUMBER, ITEM_DESCRIPTION, 
--                         REVENUE, QUANTITY, UOM, PO, SO_NUMBER, SO_LINE, CSR, PRODUCT_CATEGORY)
--SELECT        K.BU, K.ORG, K.CALENDAR_QUARTER, K.FISCAL_QUARTER, K.Month, CAST(LEFT(K.[DATE],10) AS DATETIME), K.CUSTOMER_CLUSTER, K.CUSTOMER, K.AGENT, K.CUSTOMER_CLASS, 
--                         K.CUSTOMER_CATEGORY, K.TERRITORY_MARKET, K.MARKET, K.CLUSTER_ACCOUNT, COALESCE (K.SHIP_TO_STATE, '') AS Expr1, 
--                         COALESCE (K.SHIP_TO_COUNTRY, '') AS Expr2, COALESCE (K.SHIP_TO_POSTAL_CODE, '') AS Expr3, K.ITEM_NUMBER, K.ITEM_DESCRIPTION, SUM(K.REVENUE) 
--                         AS REVENUE, SUM(K.QUANTITY) AS QUANTITY, K.UOM, K.PO, K.SO_NUMBER, K.SO_LINE, K.CSR, K.PRODUCT_CATEGORY--, B.ITEM_NUMBER
--FROM            sales_pivot_bi AS K LEFT OUTER JOIN
--                         SalesHistory_BI_Data AS B ON K.SO_NUMBER = B.SO_NUMBER AND B.SO_LINE = K.SO_LINE 
--						 AND COALESCE (K.SHIP_TO_POSTAL_CODE, '') = B.SHIP_TO_POSTAL_CODE AND B.SHIP_TO_STATE = COALESCE (K.SHIP_TO_STATE, '') 
--						 AND B.SHIP_TO_COUNTRY =  K.SHIP_TO_COUNTRY
--GROUP BY K.BU, K.ORG, K.CALENDAR_QUARTER, K.FISCAL_QUARTER, K.Month, K.DATE, K.CUSTOMER_CLUSTER, K.CUSTOMER, K.AGENT, K.CUSTOMER_CLASS, 
--                         K.CUSTOMER_CATEGORY, K.TERRITORY_MARKET, K.MARKET, K.CLUSTER_ACCOUNT, K.SHIP_TO_STATE, K.SHIP_TO_COUNTRY, K.SHIP_TO_POSTAL_CODE, 
--                         K.ITEM_NUMBER, K.ITEM_DESCRIPTION, K.UOM, K.PO, K.SO_NUMBER, K.SO_LINE, K.CSR, K.PRODUCT_CATEGORY, K.ORG, B.ITEM_NUMBER
--HAVING       (B.ITEM_NUMBER IS NULL) AND 
--(K.ORG = 'cab') AND (K.SO_LINE IS NOT NULL) --AND (K.SO_NUMBER =  2107871)
GO
PRINT N'Creating primary key [PK_ImageGroupReference] on [CutSheet].[ImageGroupReference]'
GO
ALTER TABLE [CutSheet].[ImageGroupReference] ADD CONSTRAINT [PK_ImageGroupReference] PRIMARY KEY CLUSTERED  ([ImageGroupID], [ImageTypeID], [Color], [Armored]) ON [PRIMARY]
GO
PRINT N'Adding constraints to [CutSheet].[ImageGroupReference]'
GO
ALTER TABLE [CutSheet].[ImageGroupReference] ADD CONSTRAINT [IX_ImageGroupReference] UNIQUE NONCLUSTERED  ([ImageID]) ON [PRIMARY]
GO
PRINT N'Creating index [BasicProdConstruction_XI] on [dbo].[Basic Product Construction]'
GO
CREATE NONCLUSTERED INDEX [BasicProdConstruction_XI] ON [dbo].[Basic Product Construction] ([Active], [OracleStatus]) INCLUDE ([Base], [Customer], [Customer Part#], [Fiber Oracle item], [FiberType2], [ID], [Item No], [Jacket Color], [New Oracle Part #], [Print Spacing], [Revision Date]) ON [PRIMARY]
GO
PRINT N'Adding foreign keys to [CutSheet].[ImageGroupReference]'
GO
ALTER TABLE [CutSheet].[ImageGroupReference] ADD CONSTRAINT [FK_ImageGroupReference_ImageGroup] FOREIGN KEY ([ImageGroupID]) REFERENCES [CutSheet].[ImageGroup] ([ImageGroupID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [CutSheet].[ImageGroupReference] ADD CONSTRAINT [FK_ImageGroupReference_Images] FOREIGN KEY ([ImageID], [ImageTypeID], [Color], [Armored]) REFERENCES [CutSheet].[Images] ([ImageID], [ImageTypeID], [Color], [Armored]) ON DELETE CASCADE ON UPDATE CASCADE
GO
PRINT N'Altering permissions on  [CutSheet].[ImageGroupReference]'
GO
GRANT DELETE ON  [CutSheet].[ImageGroupReference] TO [NAA\SPB Premise SQL RO]
GO
GRANT INSERT ON  [CutSheet].[ImageGroupReference] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ON  [CutSheet].[ImageGroupReference] TO [NAA\SPB Premise SQL RO]
GO
PRINT N'Altering permissions on  [CutSheet].[ImageGroup]'
GO
GRANT DELETE ON  [CutSheet].[ImageGroup] TO [NAA\SPB Premise SQL RO]
GO
GRANT INSERT ON  [CutSheet].[ImageGroup] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ON  [CutSheet].[ImageGroup] TO [NAA\SPB Premise SQL RO]
GO
PRINT N'Altering permissions on  [CutSheet].[Images]'
GO
GRANT DELETE ON  [CutSheet].[Images] TO [NAA\SPB Premise SQL RO]
GO
GRANT INSERT ON  [CutSheet].[Images] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ON  [CutSheet].[Images] TO [NAA\SPB Premise SQL RO]
GO
PRINT N'Altering permissions on [dbo].[Buff#1/#2 Alloc Table]'
GO
GRANT UPDATE ([Prefix]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Buffering Factor]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Special Notes]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Set-up time level 1]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Set-up time level 2]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Buff#11 Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Buff#1 Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Buff#4 Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Buff#6 Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Buff#2 Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Buff#9 Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Buff#10 Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Buff#9 Line Speed (SH)]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Buff#11 Line Speed (SH)]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([SH#3 Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([SH#4 Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([C#4 Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Armor Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([PlannedLotSize]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([shrinkage limit]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Sheathing Line]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Interlock]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([PrimaryBufferingLine]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([B18_Line_Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
PRINT N'Altering permissions on [dbo].[tblCableConstructionReferences]'
GO
GRANT UPDATE ([ImageGroupID]) ON [dbo].[tblCableConstructionReferences] TO [NAA\SPB Premise SQL RO]
GO

