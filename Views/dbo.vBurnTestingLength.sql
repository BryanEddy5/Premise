SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [dbo].[vBurnTestingLength]
as

SELECT DISTINCT dbo.CableUnion.Oracle
, dbo.CableUnion.[Item No] as ItemNo
, CableUnion.ListingCompany as ListingCompanyPrint
, round([NominalOD]*0.03936996,4)AS NomODInches
,NominalOD NomOD_M
, cast(Round((12/([NominalOD]*0.03936996))*24*1.1/3.281,0) as int)AS BurnLengthFT_OFNP_ETL
, cast(Round((12/([NominalOD]*0.03936996))*16.5*1.1/3.281,0) as int) AS BurnLengthFT_OFNR_ETL
, cast(Round((900/([NominalOD]*0.03936996))*1.1/3/3.281,0) as int) AS BurnLengthFT_OFNP_UL
, B.Item_Status
, B.Item_Cost
, tblBurnListing.ListingTab
, tblBurnListing.ListingSection
, tblBurnListing.ListingConstruction
, tblBurnListing.ListingCompany
,printline2 + ' ' + printline3 as CablePrint
,tblCableConstructions.CablePasses
--,substring( PrintLine3, charindex('OF', PrintLine3),CHARINDEX(' ',PrintLine3,CHARINDEX('OF',PrintLine3))-CHARINDEX('OF',PrintLine3)) as BurnPrint 
, cast(Round((12/([NominalOD]*0.03936996))*24*1.1* Item_Cost/3.21,0) as int)AS BurnLength_OFNP_ETL_Cost
, cast(Round((12/([NominalOD]*0.03936996))*16.5*1.1* Item_Cost/3.21,0) as int) AS BurnLength_OFNR_ETL_Cost
, cast(Round((900/([NominalOD]*0.03936996))*1.1/3* Item_Cost/3.21,0) as int) AS BurnLength_OFNP_UL_Cost


FROM dbo.CableUnion 
INNER JOIN tblCableConstructionReferences ON tblCableConstructionReferences.Base = dbo.CableUnion.Base
INNER JOIN tblCableConstructions ON tblCableConstructionReferences.BaseID = tblCableConstructions.BaseID
INNER JOIN tblBurnListing ON dbo.CableUnion.Base = tblBurnListing.base AND CableUnion.ListingCompany = tblBurnListing.ListingCompany
INNER JOIN dbo.AFLPRD_INVSysItemCost_CAB B ON dbo.CableUnion.Oracle = B.ItemNumber
--WHERE tblBurnListing.ListingCompany IN ('etl', 'ul')
WHERE NominalOD <>0 and CableUnion.ItemNo like 'dr002928%' and CableUnion.ListingCompany = 'ul'



GO
