SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [Setup].[vSetup_Attributes]
AS
SELECT        Setup.tblSetup.SetupNumber, Setup.tblSetupAttributes.MachineID, Setup.tblAttributes.AttrIneffectiveDate, Setup.tblAttributes.AttributeDesc, 
                         Setup.tblAttributes.AttributeName, Setup.tblAttributes.AttributeUOM, Setup.tblSetupAttributes.AttributeValue, tblAttributes.ProcessID
						 ,I.MachineNumber, tblAttributes.AttributeID
FROM            Setup.tblAttributes INNER JOIN
                         Setup.tblSetupAttributes ON Setup.tblAttributes.AttributeID = Setup.tblSetupAttributes.AttributeID INNER JOIN
                         Setup.tblSetup ON Setup.tblAttributes.ProcessID = Setup.tblSetup.ProcessID AND Setup.tblSetupAttributes.SetupID = Setup.tblSetup.SetupID
						 INNER JOIN Setup.tblProcessMachines I ON I.MachineID = tblSetup.MachineID AND I.ProcessID = tblSetup.ProcessID
WHERE        (Setup.tblAttributes.AttrIneffectiveDate > GETDATE() AND tblSetupAttributes.IneffectiveDate > GETDATE()) --and SetupNumber = 'R834'


GO
