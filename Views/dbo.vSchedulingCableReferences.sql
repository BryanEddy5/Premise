SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO







CREATE VIEW [dbo].[vSchedulingCableReferences]
AS

SELECT vSchedulingCableUnion.*
      ,[DesignCode]
      ,[DesignExtension]
      ,[ConstructionDescription]
      ,[NumSubFillers]
      ,tblCableConstructionReferences.[Active] AS ActiveConstruction
      ,[PrefixID]
      ,[ProductID]
      ,[SetupID]
      ,[FamilyID]
      ,FibersPerBundle
      ,[UnitIDTypeNumber]
      ,[InactiveReason]
      ,[NumSubPositions]
      ,K.[TBType]
      ,[CableFamily]
      ,[CableLevel1]
      ,[DesignTypeID]
      ,[NumCopperUnits]
      ,[ReleasedDesign]
	  ,BaseID
	  ,K.TBTypeID

FROM vSchedulingCableUnion INNER JOIN tblCableConstructionReferences ON vSchedulingCableUnion.Base = tblCableConstructionReferences.Base
	INNER JOIN tblCableTightBufferReference K ON K.TBType = tblCableConstructionReferences.TBType 














GO
