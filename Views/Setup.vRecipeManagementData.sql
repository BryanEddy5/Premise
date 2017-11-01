SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*View for MES to ge tthe latest data from the setupd db*/


CREATE VIEW [Setup].[vRecipeManagementData]
as


SELECT DISTINCT       tblSetupAttributes.ProcessID,
B.ProcessDesc,
tblAttributesGroup.AttributeGroupID,
tblAttributesGroup.AttributeGroupDesc,
tblAttributesGroup.GroupViewOrder,
AttributeViewOrder,
tblSetupAttributes.AttributeID,
AttrIneffectiveDate,
AttrEffectiveDate,
AttributeDesc,
AttributeName,
AttributeUOM,
B.Active,
LimitToList,
ListSource,
ListSourceColumnCount,
AttributeDataType,
AttributeComments,
ToleranceReq,
ToleranceUOM,
ToleranceType,
DefaultValue,
DefaultMinTol,
DefaultMaxTol,
DefaultMinValue,
DefaultMaxValue,
DefaultMinValueTol,
DefaultMaxValueTol,
DefaultPrintOnSetup,
AddToDesc,
ApprovalReq,
ScheduleNotice,
OracleNotice,
EditAllowed,
RecordResults,
SigDigits,
ReferenceOnly,
FormulaBased
FROM            Setup.tblAttributes INNER JOIN
                         Setup.tblSetupAttributes ON Setup.tblAttributes.AttributeID = Setup.tblSetupAttributes.AttributeID INNER JOIN
                         [NAASPB-PREACT01].PreactorProdr12.Interface.tblProcess AS B ON B.ProcessID = Setup.tblAttributes.ProcessID INNER JOIN
                         Setup.tblAttributesGroup ON Setup.tblAttributesGroup.AttributeGroupID = Setup.tblAttributes.AttributeGroupID AND 
                         Setup.tblAttributes.ProcessID = Setup.tblAttributesGroup.AttributeGroupProcess
WHERE        (Setup.tblAttributes.AttrIneffectiveDate >= GETDATE()) AND (Setup.tblSetupAttributes.IneffectiveDate >= GETDATE())


--ORDER BY AttributeName




GO
