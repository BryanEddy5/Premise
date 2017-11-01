SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [Setup].[usp_Line_Speed_Update]
as

UPDATE CableRunSpeeds
SET [Buff#1 Line Speed] = [New_Scheduling_Line_Speed]
--SELECT T.[Buff#1 Line Speed], [New_Scheduling_Line_Speed], Setup, Base, e.BaseID
FROM Setup.[vSetup_Cable_Machine] E INNER JOIN dbo.CableRunSpeeds T ON T.PrefixID = E.PrefixID
WHERE MachineID = 1
AND [Buff#1 Line Speed] <> [New_Scheduling_Line_Speed]

UPDATE CableRunSpeeds
SET [Buff#2 Line Speed] = [New_Scheduling_Line_Speed]
--SELECT T.[Buff#2 Line Speed], [New_Scheduling_Line_Speed], Setup, Base, e.BaseID
FROM Setup.[vSetup_Cable_Machine] E INNER JOIN dbo.CableRunSpeeds T ON T.PrefixID = E.PrefixID
WHERE MachineID = 2
AND [Buff#2 Line Speed] <> [New_Scheduling_Line_Speed]


UPDATE CableRunSpeeds
SET [Buff#4 Line Speed] = [New_Scheduling_Line_Speed]
FROM Setup.[vSetup_Cable_Machine] E INNER JOIN dbo.CableRunSpeeds T ON T.PrefixID = E.PrefixID
WHERE MachineID = 4
AND [Buff#4 Line Speed] <> [New_Scheduling_Line_Speed]


UPDATE CableRunSpeeds
SET [Buff#6 Line Speed] = [New_Scheduling_Line_Speed]
FROM Setup.[vSetup_Cable_Machine] E INNER JOIN dbo.CableRunSpeeds T ON T.PrefixID = E.PrefixID
WHERE MachineID = 6
AND [Buff#6 Line Speed] <> [New_Scheduling_Line_Speed]


UPDATE CableRunSpeeds
SET [Buff#9 Line Speed] = [New_Scheduling_Line_Speed]
FROM Setup.[vSetup_Cable_Machine] E INNER JOIN dbo.CableRunSpeeds T ON T.PrefixID = E.PrefixID
WHERE MachineID = 9 AND CablePasses = 1
AND [Buff#9 Line Speed] <> [New_Scheduling_Line_Speed]

UPDATE CableRunSpeeds
SET [Buff#10 Line Speed] = [New_Scheduling_Line_Speed]
FROM Setup.[vSetup_Cable_Machine] E INNER JOIN dbo.CableRunSpeeds T ON T.PrefixID = E.PrefixID
WHERE MachineID = 10 AND CablePasses = 1
AND [Buff#10 Line Speed] <> [New_Scheduling_Line_Speed]

UPDATE CableRunSpeeds
SET [Buff#11 Line Speed] = [New_Scheduling_Line_Speed]
--SELECT T.[Buff#11 Line Speed], [New_Scheduling_Line_Speed], Setup, Base, e.BaseID
FROM Setup.[vSetup_Cable_Machine] E INNER JOIN dbo.CableRunSpeeds T ON T.PrefixID = E.PrefixID
WHERE MachineID = 11 AND CablePasses = 1
AND [Buff#11 Line Speed] < [New_Scheduling_Line_Speed]

UPDATE CableRunSpeeds
SET [Buff#9 Line Speed (SH)] = [New_Scheduling_Line_Speed]
FROM Setup.[vSetup_Cable_Machine] E INNER JOIN dbo.CableRunSpeeds T ON T.PrefixID = E.PrefixID
WHERE MachineID = 9 AND CablePasses = 2
AND [Buff#9 Line Speed (SH)] <> [New_Scheduling_Line_Speed]


UPDATE CableRunSpeeds
SET [Buff#11 Line Speed (SH)] = [New_Scheduling_Line_Speed]
--SELECT T.[Buff#11 Line Speed (SH)], [New_Scheduling_Line_Speed], Setup, Base, e.BaseID
FROM Setup.[vSetup_Cable_Machine] E INNER JOIN dbo.CableRunSpeeds T ON T.PrefixID = E.PrefixID
WHERE MachineID = 11 AND [Buff#11 Line Speed (SH)] <> [New_Scheduling_Line_Speed]
AND CablePasses = 2

UPDATE CableRunSpeeds
SET [C#4 Line Speed] = [New_Scheduling_Line_Speed]
--SELECT T.[C#4 Line Speed], [New_Scheduling_Line_Speed], Setup, Base, e.BaseID
FROM Setup.[vSetup_Cable_Machine] E INNER JOIN dbo.CableRunSpeeds T ON T.PrefixID = E.PrefixID
WHERE MachineID = 8
AND [Buff#1 Line Speed] > [New_Scheduling_Line_Speed]


--Update subunti run speeds for subunitized cables
--SELECT  [New_Scheduling_Line_Speed], Setup, E.Base, e.BaseID, B.Base,machineID,
UPDATE CableRunSpeeds
SET
	[Buff#1 Line Speed] = (CASE WHEN MachineID = 1 THEN   [New_Scheduling_Line_Speed] ELSE [Buff#1 Line Speed] END),
	[Buff#2 Line Speed] = (CASE WHEN MachineID = 2 THEN   [New_Scheduling_Line_Speed] ELSE [Buff#2 Line Speed] END),
	[Buff#4 Line Speed] = (CASE WHEN MachineID = 4 THEN   [New_Scheduling_Line_Speed] ELSE [Buff#4 Line Speed] END),
	[Buff#6 Line Speed] = (CASE WHEN MachineID = 6 THEN   [New_Scheduling_Line_Speed] ELSE [Buff#6 Line Speed] END),
	[Buff#9 Line Speed] = (CASE WHEN MachineID = 9 THEN   [New_Scheduling_Line_Speed] ELSE [Buff#9 Line Speed] END),
	[Buff#10 Line Speed] = (CASE WHEN MachineID = 10 THEN   [New_Scheduling_Line_Speed] ELSE [Buff#10 Line Speed] END),
	[Buff#11 Line Speed] = (CASE WHEN MachineID = 11 THEN   [New_Scheduling_Line_Speed] ELSE [Buff#11 Line Speed] END)


FROM Setup.[vSetup_Cable_Machine] E 
INNER JOIN dbo.[Product Desrcriptions] G ON G.[Level 1 Product] = E.BASE 
INNER JOIN dbo.tblCableConstructionReferences B ON B.SetupID = G.ProductID
INNER JOIN dbo.CableRunSpeeds T ON T.PrefixID = B.PrefixID
WHERE  E.base like 'e%'
--AND [Buff#1 Line Speed] > [New_Scheduling_Line_Speed]





GO
