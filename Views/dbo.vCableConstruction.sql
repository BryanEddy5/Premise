SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vCableConstruction]
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
