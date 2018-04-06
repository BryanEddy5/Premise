SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE VIEW [Setup].[vSetupSheet]
AS
/*and AttributeName like '%pos%'*/
SELECT        tblProcessMachines.ProcessID, tblProcessMachines.MachineID, tblProcessMachines.MachineNumber, Setup.tblAttributes.AttributeID, 
                         Setup.tblAttributes.AttributeDesc, Setup.tblAttributes.AttributeName, Setup.tblSetup.SetupID, Setup.tblSetup.SetupNumber, Setup.tblSetupAttributes.AttributeValue, 
                         Setup.tblSetupAttributes.MachineSpecific, Setup.tblSetupAttributes.MinValue, Setup.tblAttributes.Active, Setup.tblSetupAttributes.EffectiveDate, 
                         Setup.tblAttributes.AttrEffectiveDate, Setup.tblAttributes.AttributeGroupID, Setup.tblSetup.IneffectiveDate, Setup.tblAttributes.AttributeUOM
						 , Setup.tblAttributes.AttrIneffectiveDate AttributeIneffectiveDate,Setup.tblSetupAttributes.IneffectiveDate SetupAttributesIneffectiveDate
FROM            Setup.tblAttributes INNER JOIN
                         Setup.tblSetupAttributes ON Setup.tblAttributes.AttributeID = Setup.tblSetupAttributes.AttributeID INNER JOIN
                         Setup.tblSetup ON Setup.tblSetupAttributes.SetupID = Setup.tblSetup.SetupID AND Setup.tblSetupAttributes.MachineID = Setup.tblSetup.MachineID INNER JOIN
                         (Setup.tblProcessMachines INNER JOIN Setup.MachineMapping ON tblProcessMachines.processid=MachineMapping.processid AND tblProcessMachines.machineid=MachineMapping.machineid) ON Setup.tblSetup.MachineID = tblProcessMachines.MachineID AND 
                         Setup.tblSetup.ProcessID = tblProcessMachines.ProcessID
WHERE        (Setup.tblAttributes.AttrIneffectiveDate >= GETDATE()) AND (Setup.tblSetup.IneffectiveDate >= GETDATE()) and Setup.tblSetupAttributes.IneffectiveDate >=getdate() --AND (Setup.tblSetup.SetupNumber = 'M103')
AND tblProcessMachines.Active <> 0

--ORDER BY AttributeName



GO
