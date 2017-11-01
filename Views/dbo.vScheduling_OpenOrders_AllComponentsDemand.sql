SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [dbo].[vScheduling_OpenOrders_AllComponentsDemand]
as

WITH cteScheduling_OpenOrders_AllComponents(Item_Number,	RawItem,	ExtendedQuantityPer,	UOM,	CategoryName,	DESCRIPTION)
AS
(
SELECT d.Item_Number
,CASE WHEN G.FiberCandidate IS NOT NULL 
	THEN G.FiberCandidate 
	ELSE E.ComponentItemNumber 
END RawItem ,sum(e.ExtendedQuantityPer) as ExtendedQuantityPer,S.UOM, P.CategoryName, Q.DESCRIPTION--,s.Make_Buy
from  [dbo].vScheduling_OpenOrders_Items as d CROSS APPLY dbo.fn_ExplodeBOM(d.Item_Number) as e 
INNER JOIN dbo.[AFLPRD_INVSysItemCost_CAB] as S ON e.ComponentItemNumber = s.ItemNumber 
LEFT JOIN dbo.tblFiber_TightTolerance_Reference G ON G.TightToleranceFiber = E.ComponentItemNumber
INNER JOIN dbo.AFLPRD_INVItmCatg_CAB P ON P.ItemNumber = e.ComponentItemNumber
INNER JOIN dbo.AFLPRD_INVSysItem_CAB Q ON Q.ItemNumber = E.ComponentItemNumber
group by  e.ComponentItemNumber,d.Item_Number,S.UOM,s.Make_Buy , G.TightToleranceFiber,g.FiberCandidate,P.CategorySetName,P.CategoryName,Q.DESCRIPTION
HAVING --s.Make_Buy ='buy'
(s.Make_Buy = 'buy' OR ComponentItemNumber like 'rbn%'  OR ComponentItemNumber like 'SWR%')
	AND ( e.ComponentItemNumber not like '%osp%' and e.ComponentItemNumber not like '%rbn%f%' ) 
	AND CategorySetName = 'PURCHASING'
)

SELECT K.Customer,K.CoNumber as OrderNo,K.Item_Number,K.CatalogCode,K.Need_Date,K.DueDate,K.Quantity,K.Units,K.Scheduled AS ScheduleApproved,K.[Promise Date], G.Description as ComponentDesc
,g.RawItem, ExtendedQuantityPer * Quantity  as Material_Demand,  G.UOM as Material_UOM,G.CategoryName
,k.TIME_Date
FROM vScheduling_OpenOrders K INNER JOIN cteScheduling_OpenOrders_AllComponents G ON K.Item_Number = G.Item_Number
WHERE ExtendedQuantityPer > 0 --AND CoNumber = '2082838-1'
--AND RawItem LIKE 'rbn%'







GO
