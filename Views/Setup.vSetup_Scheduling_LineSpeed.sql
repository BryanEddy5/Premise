SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






 CREATE VIEW [Setup].[vSetup_Scheduling_LineSpeed]
 as
 SELECT  G.OperationCode, K.MachineID,E.AttributeValue as LineSpeed, e.ProcessID
 FROM Setup.vSetup_Cable_Base G INNER JOIN Setup.tblSetup K ON G.Setup = K.SetupNumber
 INNER JOIN setup.tblSetupAttributes E ON E.SetupID = K.SetupID
 INNER JOIN [Setup].[tblAttributes] I ON E.AttributeID = I.AttributeID
 WHERE I.AttributeName LIKE 'LINESPEED' AND E.IneffectiveDate > GETDATE() AND I.AttrIneffectiveDate > GETDATE()
 and e.AttributeValue <> 'tbd' --and E.ProcessID in (510,523,615) --and base like 't%'
 --AND --fibercount <12 and 
 --(k.MachineID = 1 or k.MachineID = 2)
--and JacketMaterial = 'POL00127'







GO
