SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/*
Author:		Bryan Eddy
Date:		5/3/2018
Desc:		View for scheduling
Version:	2
Update:		Added coalesce statement to display a print message if jkt00106 or jkt00105
*/

CREATE VIEW [dbo].[vBasic_Prod_plus_Basic_Sheath]
AS

SELECT I.CM AS CenterMember, I.JacketMaterial AS [Jacket Material], E.[item no],
        E.[customer part#],
        E.customer,
        E.[print type (base)],
		J.PrinterNote,
        E.[new oracle part #],
        E.base,
        E.[jacket color],
        E.[print line 1],
        E.[print line 2],
        E.[print line 3],
        E.[print line 4],
        E.[print reel no],
        E.[print item no],
        E.[print spacing],
        E.[1st req freq],
        E.[2nd req freq],
        E.[Fiber Type],
        E.[Base Oracle],
        E.active,
        E.[revision date],
        E.[revision history],
        E.Fiber2,
        E.PID,
        E.oraclestatus,
        E.enumber,
        E.Fiber3,
        E.customerrev,
        E.Location,
        E.StdOp,
        E.Fiber,
        E.[1st Req Freq - A],
        E.[1st Max Atten - A],
        E.[1st Min BandW - A],
        E.[2nd Req Freq - A],
        E.[2nd Max Atten - A],
        E.[2nd Min BandW - A],
        E.[1st Req Freq - B],
        E.[1st Max Atten - B],
        E.[1st Min BandW - B],
        E.[2nd Req Freq - B],
        E.[2nd Max Atten - B],
        E.[2nd Min BandW - B],
        E.[1st Req Freq - C],
        E.[1st Max Atten - C],
        E.[1st Min BandW - C],
        E.[2nd Req Freq - C],
        E.[2nd Max Atten - C],
        E.[2nd Min BandW - C],
        E.[Print Height],
        E.[FRP Dia],
        E.[color chip id],
        E.CustomerInstructions,
        E.[tb nominal od],
        E.[tb od tol  (-)],
        E.[tb od tol  (+)],
        E.[ez strip],
        E.[tb material],
        E.[tb chips type],
        E.[unit series],
        E.SpecialInstructions1,
        E.SpecialInstructions2, I.JacketMaterial AS JacketMat
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
      ,I.[JacketMaterial]
      ,[NominalOD]
      ,[CM]
      ,[CMMaterial]
      ,[HelixFactor]
FROM (vSchedulingCableUnion E INNER JOIN tblCableConstructionReferences ON E.Base = tblCableConstructionReferences.Base) 
	INNER JOIN tblCableConstructions I ON tblCableConstructionReferences.BaseID = I.BaseID
	LEFT JOIN dbo.tblJacketMaterials J ON J.JacketMaterial = I.JacketMaterial





GO
