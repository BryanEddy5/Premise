SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[vCutSheet_Constructions]
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
