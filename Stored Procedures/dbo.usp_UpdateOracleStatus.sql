SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 11/17/2016
-- Description:	Updates the Oracle status for all premise items
-- =============================================
CREATE PROCEDURE [dbo].[usp_UpdateOracleStatus] 
as

BEGIN

UPDATE DBO.[Basic Product Construction]
SET OracleStatus = Item_Status 
FROM dbo.[Basic Product Construction] G INNER JOIN dbo.AFLPRD_INVSysItemCost_CAB K ON G.[New Oracle Part #] = K.ItemNumber
WHERE OracleStatus <> Item_Status

UPDATE DBO.[Basic Product Construction]
SET ACTIVE = 0
WHERE OracleStatus = 'Obsolete' and Active <>0

--UPDATE DBO.[Basic (Cable/Sheath)]
--SET OracleStatus = AssemblyItemStatus
--FROM dbo.[Basic (Cable/Sheath)] G INNER JOIN dbo.AFLPRD_BOMInvComp_CAB K ON G.[New Oracle Part Number] = K.AssemblyItemNumber

--UPDATE DBO.[Basic (Cable/Sheath)]
--SET ACTIVE = 0
--WHERE OracleStatus = 'Obsolete' 

END


GO
