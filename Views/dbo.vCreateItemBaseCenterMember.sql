SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vCreateItemBaseCenterMember]
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
