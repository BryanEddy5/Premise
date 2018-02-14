SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vBurnListingInventory]
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
