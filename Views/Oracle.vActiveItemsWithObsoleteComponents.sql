SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/*	Author: Bryan Eddy
	date: 11/6/2017
	Description: Finding items with obsolete components.
															*/


  --Items with no open orders or inventory
 CREATE VIEW [Oracle].[vActiveItemsWithObsoleteComponents]
 as
WITH cteItemsObsoleteComp
AS(
	SELECT  DISTINCT AssemblyItemNumber, AssemblyItemStatus--, 'Obsolete - ' + K.AssemblyDescription, 'Obsolete' Status, '10/31/2017 - Obsolete due to obsolete component BCE' LongDesc
	,ComponentItemNumber, CompItemStatus, FIRST_VALUE(K.ComponentItemNumber) OVER (PARTITION BY K.AssemblyItemNumber ORDER BY K.AssemblyItemNumber, K.ComponentItemNumber) ObsoleteComponent
	  FROM [Premise].[dbo].[AFLPRD_BOMInvComp_CAB] K left JOIN dbo.AFLPRD_onhandqty_STD_81_ALL g ON g.Item = k.AssemblyItemNumber
	  LEFT JOIN dbo.AFLPRD_ORDDTLREPT_UPLOAD_CAB I ON I.[Item Number] = k.AssemblyItemNumber
	  WHERE CompItemStatus = 'OBSOLETE' 
	  AND AssemblyItemStatus NOT IN  
	  ('Pending',
	'ENG BOM',
	'Freight',
	'OBS RMA',
	'On Hold',
	'PROTOBUILD',
	'PROTODESIG',
	'Prototype',
	'SAMPLSHIP',
	'SemiFinish',
	'CAB REVIEW',
	'CAS ITEM',
	'Obsolete') AND g.Item IS NULL AND I.[Item Number] IS NULL
	  --AND AssemblyItemNumber NOT LIKE 'P%' --AND (AssemblyItemNumber LIKE '%test%' OR AssemblyItemStatus = 'discontd')

)
SELECT DISTINCT AssemblyItemNumber, AssemblyItemStatus,ObsoleteComponent
FROM cteItemsObsoleteComp
--ORDER BY AssemblyItemNumber 
GO
