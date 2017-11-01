SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[vArmorCoreItems_Approvals]
as
SELECT AssemblyItemNumber as ArmoredItem, ComponentItemNumber as CoreItem, Technical_Approval as CoreTechnical_Approval, Commercial_Approval as CorCommercial_Approval
FROM AFLPRD_BOMInvComp_CAB K INNER JOIN AFLPRD_INVSysItemCost_CAB G ON K.ComponentItemNumber = G.ItemNumber
INNER JOIN [Basic Product Construction] B ON B.[New Oracle Part #] = K.AssemblyItemNumber
INNER JOIN tblCableConstructionReferences C ON C.BASE = B.Base
INNER JOIN tblDesignTypes D ON D.DesignTypeID = C.DesignTypeID
INNER JOIN tblCutSheetApproval V ON V.Base = C.Base
WHERE Make_Buy = 'MAKE' AND D.DesignTypeID = 30
GO
