SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [Setup].[vSetup_Attributes]
AS
SELECT        Setup.tblSetup.SetupNumber, Setup.tblSetupAttributes.MachineID, Setup.tblAttributes.AttrIneffectiveDate, Setup.tblAttributes.AttributeDesc, 
                         Setup.tblAttributes.AttributeName, Setup.tblAttributes.AttributeUOM, Setup.tblSetupAttributes.AttributeValue
FROM            Setup.tblAttributes INNER JOIN
                         Setup.tblSetupAttributes ON Setup.tblAttributes.AttributeID = Setup.tblSetupAttributes.AttributeID INNER JOIN
                         Setup.tblSetup ON Setup.tblAttributes.ProcessID = Setup.tblSetup.ProcessID AND Setup.tblSetupAttributes.SetupID = Setup.tblSetup.SetupID
WHERE        (Setup.tblAttributes.AttrIneffectiveDate > GETDATE() and tblSetupAttributes.IneffectiveDate > getdate()) --and SetupNumber = 'R834'


GO
