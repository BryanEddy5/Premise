SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 10/5/2016
-- Description:	Generate the catalog code and attributes for Sales Force Quoting - Appends All base cables to the table
-- Update:		Added table SalesForce.FiberToFiberDescriptionQuoting to allow for fibers to have multiple Sales Force Descriptions
-- Version:		2
-- =============================================
CREATE PROCEDURE [dbo].[usp_CatalogCode_SalesForce_Cables] 

AS
BEGIN



	--EXEC [OracleExtracts].[dbo].[usp_BOMCalculator_AllCables]


DELETE FROM tblSalesForce_Catalog

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	--IF OBJECT_ID (N'dbo.tblSalesForce_Catalog_Generator', N'U') IS NOT NULL
	--DROP TABLE dbo.tblSalesForce_Catalog_Generator;


	--Code appends all non-furcation cables to tblSalesForce_Catalog

INSERT  INTO tblSalesForce_Catalog
                         (CatalogCode, Base,Weight_kg_per_m, 
                         DesignTypeDesc, Jacket, TBType, TBDescription, NominalOD, NumSubFillers, NumSubPositions
						 ,CablePasses,FiberCount,UnitOD, BaseID,DesignTypeId, Armored,Boxed, Fiber_Type__c,Print_Type__c, Min_Order_Quantity__c,FiberID,FinishedCableColor,TBLetter,SetupID
						 , Active,Non_Standard, ProdLevel3)
SELECT DISTINCT 
                         LEFT(tblCableConstructionReferences.DesignCode, 5) + tblDesignCodeFiberElementValue.FiberLetter + SUBSTRING(tblCableConstructionReferences.DesignCode, 6, 2) 
						 + tblDesignCodeFiberElementValue.CablePrintType
                         + COALESCE(tblDesignTypeS.DefaultFamilyColor,tblDesignCodeFiberElementValue.PreferedCableColor)
						 --+ FinishedColor.ColorLetter
						 + CASE WHEN tblCableConstructions.CablePasses = 1 AND tblCableConstructionReferences.TBType <> 'Ribbon' THEN '0' 
								WHEN tblCableTightBufferReference.TBTypeID = 20 THEN 'X'
							    WHEN tblCableConstructionReferences.TBType = 'Ribbon' THEN '1'
							    ELSE 
									--FinishedColor.ColorLetter
									COALESCE(tblDesignTypeS.DefaultFamilyColor,tblDesignCodeFiberElementValue.PreferedCableColor )
							END
                          + tblCableTBType.TBLetter + CASE WHEN [DesignExtension] IS NULL 
                         THEN '' ELSE [DesignExtension] END + + COALESCE(tblDesignCodeFiberElementValue.FiberExt,'') AS CatalogCode, tblCableConstructionReferences.Base, 
                          tblBOM_Base_Weight.Weight AS Weight_kg_per_m, tblDesignTypes.SalesForceDescription, 
                         JacketDescription_SalesForce, tblCableConstructionReferences.TBType, tblCableTBType.TightBufferDescription_SalesForce, 
                         tblCableConstructions.NominalOD, tblCableConstructionReferences.NumSubFillers, tblCableConstructionReferences.NumSubPositions,
                         tblCableConstructions.CablePasses, FiberCount--cast(substring(tblCableConstructionReferences.DesignCode, 3,3) as int) FiberCount
						 ,CASE WHEN tblCableConstructionReferences.TBType = 'Ribbon' THEN SUBSTRING(tblCableConstructionReferences.DesignCode, 6,2) 
						 ELSE (SUBSTRING(tblCableConstructionReferences.DesignCode, 6,1) + '.' + SUBSTRING(tblCableConstructionReferences.DesignCode, 7,1))+' mm'  END UnitOD
						 , tblCableConstructionReferences.BaseID, dbo.tblCableConstructionReferences.DesignTypeID
						 ,0 AS Armored
						 ,0 AS Boxed
						 ,Fiber_Type__c
						 ,CASE WHEN tblDesignCodeFiberElementValue.CablePrintType = 1 THEN 'AFL Standard'
							WHEN tblDesignCodeFiberElementValue.CablePrintType = 2 THEN 'Generic'
							END  AS Print_Type__c
						,tblDesignTypes.Min_Order_Quantity__c
						,tblDesignCodeFiberElementValue.FiberID
						,CASE WHEN tblDesignTypeS.DefaultFamilyColor IS NOT NULL THEN tblDesignTypeS.DefaultFamilyColor ELSE tblDesignCodeFiberElementValue.PreferedCableColor END
						,tblCableTBType.TBLetter
						,tblCableConstructionReferences.SetupID
						, tblCableConstructionReferences.ReleasedDesign
						, tblCableTBType.Non_Standard_Product
						, tblDesignTypeGroups.DesignTypeGroupDesc
FROM            tbl_Fibers INNER JOIN SalesForce.FiberToFiberDescriptionQuoting FiberLink ON FiberLink.FiberItemID = tbl_Fibers.FiberItemID
                         INNER JOIN tblDesignCodeFiberElementValue ON tblDesignCodeFiberElementValue.FiberID = FiberLink.FiberID
                         INNER JOIN tblFiberTBCatalog ON tbl_Fibers.TBCatalogType = tblFiberTBCatalog.TBCatalogType INNER JOIN
                         tblFiberTBIndicators ON tblFiberTBCatalog.TBCatalogType = tblFiberTBIndicators.TBCatalogType INNER JOIN
                         tblBOM_Base_Weight INNER JOIN
                         tblCableTBType INNER JOIN
                         tblCableConstructionReferences INNER JOIN
                         tblCableTightBufferReference ON tblCableConstructionReferences.TBType = tblCableTightBufferReference.TBType INNER JOIN
                         tblCableConstructions ON tblCableConstructionReferences.BaseID = tblCableConstructions.BaseID ON 
                         tblCableTBType.TBIndicatorID = tblCableTightBufferReference.TBTypeID ON tblBOM_Base_Weight.BASE = tblCableConstructionReferences.Base INNER JOIN
                         tblDesignTypes ON tblCableConstructionReferences.DesignTypeID = tblDesignTypes.DesignTypeID INNER JOIN
                         tblDesignTypeGroups ON tblDesignTypes.DesignTypeGroupID = tblDesignTypeGroups.DesignTypeGroupID INNER JOIN
                         tblDesignCodeJacket ON tblCableConstructionReferences.CableFamily = tblDesignCodeJacket.CableLetter AND 
                         tblCableConstructionReferences.CableLevel1 = tblDesignCodeJacket.JacketLetter ON tblFiberTBIndicators.TBLetter = tblCableTBType.TBLetter 
						 --INNER JOIN
						 --tblDesignCodeJacketColor FinishedColor ON FinishedColor.CablePasses = tblCableConstructions.CablePasses --
						 --INNER JOIN tblDesignCodeJacketColor SubColor ON SubColor.CablePasses = tblCableConstructions.CablePasses
WHERE          (tblDesignCodeFiberElementValue.Active = 1) AND tblCableConstructionReferences.ApprovedForQuoting = 1 AND
                         (tblDesignCodeFiberElementValue.FiberLetter NOT LIKE '%@%') AND (tblCableConstructionReferences.DesignTypeID IS NOT NULL) AND (tblDesignTypes.Active = 1) 
                        AND (tblDesignTypeGroups.Active = 1) 
						 AND (tblCableConstructionReferences.TBType <> 'Furcation' ) AND (tblCableConstructionReferences.ApprovedForQuoting = 1) 
                         AND (tbl_Fibers.Active = 1) AND dbo.tblCableTBType.Active = 1
						 --and tblCableConstructionReferences.Base like 'GQ144-2.0%'





END




GO
