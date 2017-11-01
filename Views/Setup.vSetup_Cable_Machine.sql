SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO








 CREATE VIEW [Setup].[vSetup_Cable_Machine]
 as
 SELECT  [SalesForceDescription]
      ,[Base]
      ,[BaseID]
      ,[OperationCode]
      ,[Setup]
      ,[PrefixID]
      ,[CablePasses]
      ,[FiberCount]
      ,[NominalOD]
      ,[Height]
      ,[JacketMaterial], K.MachineID, E.AttributeValue, I.AttributeName, E.AttributeValue AS [New_Scheduling_Line_Speed],E.AttributeValue as LineSpeed, e.ProcessID, MachineSpecific, B.MachineNumber
 FROM Setup.vSetup_Cable_Base G INNER JOIN Setup.tblSetup K ON G.Setup = K.SetupNumber
 INNER JOIN setup.tblSetupAttributes E ON E.SetupID = K.SetupID
 INNER JOIN [Setup].[tblAttributes] I ON E.AttributeID = I.AttributeID
 INNER JOIN setup.tblProcessMachines B ON B.ProcessID = E.ProcessID AND B.MachineID = K.MachineID
 WHERE I.AttributeName LIKE 'LINESPEED' AND E.IneffectiveDate > GETDATE() AND I.AttrIneffectiveDate > GETDATE()
 and e.AttributeValue <> 'tbd' and E.ProcessID in (510,523,615) --and base like 't%'
 --AND --fibercount <12 and 
 --(k.MachineID = 1 or k.MachineID = 2)
--and JacketMaterial = 'POL00127'









GO
