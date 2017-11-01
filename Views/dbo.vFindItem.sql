SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE VIEW [dbo].[vFindItem]
AS
SELECT        [New Oracle Part #] Oracle
			,[Item No] as ItemNo
			, convert(date, dbo.BasicProductConstruction.DateCreated) as CreationDate
			,Customer
			,[Customer Part#] as PID
			, CustomerRev
			, [Fiber Oracle item] Fiber
			, FiberType2
			, FiberType3
			,dbo.tblCableConstructions.JacketMaterial
			,dbo.tblCableConstructions.NominalOD
			, [Jacket Color] Color
			, BasicProductConstruction.Base
			, dbo.tblCableConstructions.StandardOperation
			, [Print Spacing] PrintSpacing 
			,dbo.tblCableConstructions.CablePasses
			,OracleStatus
FROM            dbo.BasicProductConstruction INNER JOIN
                         dbo.tblCableConstructionReferences ON dbo.BasicProductConstruction.Base = dbo.tblCableConstructionReferences.Base INNER JOIN
                         dbo.tblCableConstructions ON dbo.tblCableConstructionReferences.BaseID = dbo.tblCableConstructions.BaseID






GO
