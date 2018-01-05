SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*	Author:		Bryan Eddy
	date:		11/6/2017
	Description: Finding items with obsolete components.
	Version:	2
	Update:		Updated query to iterate up and find all items/components affected by obsolete material/components
															*/


  --Items with no open orders or inventory
 CREATE VIEW [Oracle].[vActiveItemsWithObsoleteComponents]
 AS
WITH cteObsoleteComponents
AS(
SELECT DISTINCT  G.AssemblyItemNumber,K.Item_Status AssemblyItemStatus, g.Component, e.CompItemStatus, k.Description
FROM ( SELECT DISTINCT ComponentItemNumber,  CompItemStatus FROM [dbo].[AFLPRD_BOMInvComp_CAB] WHERE CompItemStatus = 'OBSOLETE' AND AssemblyItemStatus NOT in ('OBSOLETE','CAB REVIEW')) e 
CROSS APPLY dbo.fn_WhereUsed(E.ComponentItemNumber) g 
INNER JOIN dbo.AFLPRD_INVSysItemCost_CAB k ON k.ItemNumber = G.AssemblyItemNumber
WHERE  k.Item_Status NOT IN ('OBSOLETE','CAB REVIEW')

),
cteItemsObsoleteComp
AS(
	SELECT  DISTINCT AssemblyItemNumber, AssemblyItemStatus, Component, g.[Sub-inventory] SubInventory, g.QTY , g.[Matl Value] MaterialValue, g.[Org Code] OrgCode, K.Description, I.[Sales Order] SalesOrder
	--, 'Obsolete - ' + K.AssemblyDescription, 'Obsolete' Status, '10/31/2017 - Obsolete due to obsolete component BCE' LongDesc
	, CompItemStatus, FIRST_VALUE(K.Component) OVER (PARTITION BY K.AssemblyItemNumber ORDER BY K.AssemblyItemNumber, K.Component) ObsoleteComponent
	,CASE 
		WHEN i.[Item Number] IS NULL AND g.Item IS NULL THEN 'No open orders or inventory.  Obsolete finished cable.'
		WHEN i.[Item Number] IS NULL THEN 'Inventory on hand.  Cannot be obsoelete until inventory is scrapped.'
		WHEN G.Item IS NULL THEN 'Open order for item.  If not a stock order, then the component needs to be changed or order placed against a different finished item.' 
		ELSE 'Open order and inventory on hand.'
		END AS Instructions
	  FROM   cteObsoleteComponents K LEFT JOIN dbo.AFLPRD_onhandqty_STD_81_ALL g ON g.Item = k.AssemblyItemNumber
	  LEFT JOIN dbo.AFLPRD_ORDDTLREPT_UPLOAD_CAB I ON I.[Item Number] = k.AssemblyItemNumber
	 -- WHERE g.Item IS NULL AND I.[Item Number] IS NULL
	 

)
SELECT DISTINCT AssemblyItemNumber, AssemblyItemStatus,cteItemsObsoleteComp.Description, cteItemsObsoleteComp.ObsoleteComponent
	, cteItemsObsoleteComp.Instructions,SubInventory, QTY, MaterialValue, cteItemsObsoleteComp.OrgCode,SalesOrder--,Component,CompItemStatus
FROM cteItemsObsoleteComp
--WHERE component NOT LIKE 'glu%'-- AND cteItemsObsoleteComp.[Org Code] = 'cab'
--ORDER BY AssemblyItemNumber 
GO
