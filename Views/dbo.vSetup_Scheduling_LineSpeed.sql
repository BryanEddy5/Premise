SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO







 CREATE VIEW [dbo].[vSetup_Scheduling_LineSpeed]
 as
 SELECT DISTINCT  G.OperationCode, K.MachineID,E.AttributeValue as LineSpeed, e.ProcessID, DLeft.MachineNumber
 FROM Setup.vSetup_Cable_Base G INNER JOIN Setup.tblSetup K ON G.Setup = K.SetupNumber
 INNER JOIN setup.tblSetupAttributes E ON E.SetupID = K.SetupID
 INNER JOIN [Setup].[tblAttributes] I ON E.AttributeID = I.AttributeID
 INNER JOIN (Setup.tblProcessMachines AS DLeft INNER JOIN Setup.MachineMapping AS DRight ON DLeft.processid=DRight.processid AND DLeft.machineid=DRight.machineid) ON DLeft.MachineID = K.MachineID AND DLeft.ProcessID = K.ProcessID
 WHERE I.AttributeName LIKE 'LINESPEED' AND E.IneffectiveDate > GETDATE() AND I.AttrIneffectiveDate > GETDATE()
 and e.AttributeValue <> 'tbd' AND MachineNumber  like 'sh [124]'
 and E.ProcessID in (510,523,615,850) --and base like 't%'
 --ORDER BY MachineNumber
 --AND --fibercount <12 and 
 --(k.MachineID = 1 or k.MachineID = 2)
--and JacketMaterial = 'POL00127'








GO
