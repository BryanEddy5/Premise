SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
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
--WHERE e.Oracle ='PS05720-01'





GO
