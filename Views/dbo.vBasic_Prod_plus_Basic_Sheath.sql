SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [dbo].[vBasic_Prod_plus_Basic_Sheath]
as

SELECT tblCableConstructions.CM AS CenterMember, tblCableConstructions.JacketMaterial AS [Jacket Material], vSchedulingCableUnion.*, tblCableConstructions.JacketMaterial AS JacketMat
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
      ,[TBType]
      ,[CableFamily]
      ,[CableLevel1]
      ,[DesignTypeID]
      ,[NumCopperUnits]
      ,[ReleasedDesign]
      ,[TemperatureApplication]
      ,[TensileApplication]
	  ,[CablePasses]
      ,[StandardOperation]
      ,[JacketMaterial]
      ,[NominalOD]
      ,[CM]
      ,[CMMaterial]
      ,[HelixFactor]
FROM (vSchedulingCableUnion INNER JOIN tblCableConstructionReferences ON vSchedulingCableUnion.Base = tblCableConstructionReferences.Base) INNER JOIN tblCableConstructions ON tblCableConstructionReferences.BaseID = tblCableConstructions.BaseID;





GO
