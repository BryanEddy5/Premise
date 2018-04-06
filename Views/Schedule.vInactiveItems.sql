SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [Schedule].[vInactiveItems]
as
SELECT K.[New Oracle Part #],K.Reason,k.Customer, I.[Reel No], I.[Order Qty], I.Customer CustomerOrder, P.[Buff Line #], I.[Schedule date], I.Desgin, I.Job#, O.[Promise Date], I.[Shipped Qty]
, P.Shipped, I.[Type Order], k.Active
FROM dbo.[Basic Product Construction] K INNER JOIN dbo.[Cust Order Specifications] I ON I.[Item No] = K.[New Oracle Part #]
INNER JOIN dbo.[Printed Labels (Data Products)] P ON  P.[Order Qty] = I.[Order Qty] AND p.[Reel No] = i.[Co Number]
INNER JOIN dbo.[New Orders Spreadsheet] O ON O.[Order #] = I.[Reel No]
INNER JOIN dbo.tblCableConstructionReferences R ON R.BASE = K.Base
WHERE (K.Active = 0 or r.active = 0)  AND P.Shipped = 0 AND I.[Type Order] IN ('new' , 'sset') 
and LEFT(K.[New Oracle Part #],2) NOT IN ('bu','rb','fb','cu')
GO
