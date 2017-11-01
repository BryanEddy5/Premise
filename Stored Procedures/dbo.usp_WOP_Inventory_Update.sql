SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
--Author: Bryan Eddy
-- 12/21/2016
--Procdure is run to update that status of items that are in WOP.  This is to prompt manufacturing to use the item in WOP before creating new cable



CREATE PROCEDURE [dbo].[usp_WOP_Inventory_Update]
as

UPDATE dbo.[Basic Product Construction] 
SET Reason = 'WOP Inventory', Active = 0
FROM dbo.AFLPRD_acswopattn_CAB_SNF G INNER JOIN [Basic Product Construction] K ON K.[New Oracle Part #] = G.Item
WHERE Subinv = 'WOP' AND AvailQty >= 500 AND K.OracleStatus = 'ACTIVE' AND (CUSTOMER LIKE 'AFL STANDARD%' OR CUSTOMER LIKE 'AFL GENERIC%')
AND (Reason NOT LIKE '%WOP%' OR REASON IS NULL) AND ACTIVE = 1

--UPDATE dbo.[Basic (Cable/Sheath)] 
--SET Reason = 'WOP Inventory', Active = 0
--FROM dbo.AFLPRD_acswopattn_CAB_SNF G INNER JOIN [Basic (Cable/Sheath)] K ON K.[New Oracle Part Number] = G.Item
--WHERE Subinv = 'WOP' AND AvailQty >= 500 AND K.OracleStatus = 'ACTIVE' AND (CUSTOMER LIKE 'AFL STANDARD%' OR CUSTOMER LIKE 'AFL GENERIC%')
--AND (Reason NOT LIKE '%WOP%' OR REASON IS NULL) AND ACTIVE = 1

UPDATE dbo.[Basic Product Construction] 
SET Reason = null, Active = 1
FROM [Basic Product Construction] G LEFT JOIN
(	
	SELECT DISTINCT Item
	FROM dbo.AFLPRD_acswopattn_CAB_SNF G INNER JOIN [Basic Product Construction] K ON K.[New Oracle Part #] = G.Item
	WHERE Subinv = 'WOP' AND AvailQty >= 500 AND K.OracleStatus = 'ACTIVE' AND (CUSTOMER LIKE 'AFL STANDARD%' OR CUSTOMER LIKE 'AFL GENERIC%')
	AND (Reason NOT LIKE '%WOP%' OR REASON IS NULL) AND ACTIVE = 1
) X ON G.[New Oracle Part #] = X.Item
WHERE Item IS NULL AND Reason LIKE '%WOP%' AND g.OracleStatus = 'Active' AND (CUSTOMER LIKE 'AFL STANDARD%' OR CUSTOMER LIKE 'AFL GENERIC%')


--UPDATE dbo.[Basic (Cable/Sheath)] 
--SET Reason = null, Active = 1
--FROM [Basic (Cable/Sheath)] G LEFT JOIN
--(	
--	SELECT DISTINCT Item 
--	FROM dbo.AFLPRD_acswopattn_CAB_SNF G INNER JOIN [Basic (Cable/Sheath)] K ON K.[New Oracle Part Number] = G.Item
--	WHERE Subinv = 'WOP' AND AvailQty >= 500 AND K.OracleStatus = 'ACTIVE' AND (CUSTOMER LIKE 'AFL STANDARD%' OR CUSTOMER LIKE 'AFL GENERIC%')
--	AND (Reason NOT LIKE '%WOP%' OR REASON IS NULL) AND Active = 1
--) X ON G.[New Oracle Part Number] = X.Item
--WHERE Item IS NULL AND Reason LIKE '%WOP%' AND g.OracleStatus = 'Active' AND (CUSTOMER LIKE 'AFL STANDARD%' OR CUSTOMER LIKE 'AFL GENERIC%') AND [New Oracle Part Number] = 'PC07400-01IA'


GO
