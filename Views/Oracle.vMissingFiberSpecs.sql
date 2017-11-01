SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [Oracle].[vMissingFiberSpecs]
AS

SELECT g.ItemNumber, G.Fiber, A.[Item No], A.Active, A.CreatedBy, a.DateCreated
FROM dbo.AFLPRD_INVSysItemSpec_CAB K RIGHT JOIN ORACLE.ItemFiber G ON G.fiber = K.FiberType  AND G.ItemNumber = K.ItemNumber
INNER JOIN dbo.BasicProductConstruction A ON A.[New Oracle Part #] = G.ItemNumber
WHERE K.FiberType IS NULL AND A.Active = 1 AND G.Fiber NOT IN ('NONE','fbrrd999','fbr00100') AND LEFT(G.ItemNumber,3) NOT in ('SWR','fbr') AND G.ItemNumber NOT LIKE 'RBN%-OSP'
--ORDER BY A.DateCreated desc
GO
