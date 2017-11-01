SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO









CREATE VIEW [dbo].[vScheduling_OpenOrders]
as

SELECT        [Cust Order Specifications].Customer, [Cust Order Specifications].[Co Number] AS CoNumber, [Cust Order Specifications].[Item No] AS Item_Number, 
                         [Cust Order Specifications].Desgin AS CatalogCode,
						 [Cust Order Specifications].[Mfg commit date] - (CASE WHEN CablePasses = 1 THEN  7  ELSE 14 END) AS Need_Date, [Cust Order Specifications].[Mfg commit date] as DueDate,
                         CASE WHEN [cust order specifications].Units = 'feet' THEN [cust order specifications].[order qty] / 3.281 ELSE [cust order specifications].[order qty] END AS Quantity, 
                         'Meter' as Units, A.Sch as Scheduled, A.[Promise Date],(SELECT DATEADD(DAY, 1-DATEPART(WEEKDAY, [Cust Order Specifications].[Mfg commit date] - (CASE WHEN CablePasses = 1 THEN  7  ELSE 14 END)), [Cust Order Specifications].[Mfg commit date] - (CASE WHEN CablePasses = 1 THEN  7  ELSE 14 END))) as Time_DATE
FROM            [Cust Order Specifications] INNER JOIN
                         [Printed Labels (Data Products)] ON [Cust Order Specifications].[Reel No] = [Printed Labels (Data Products)].[Reel No] AND 
                         [Cust Order Specifications].[Order Qty] = [Printed Labels (Data Products)].[Order Qty] LEFT OUTER JOIN
                         [Open Order - with Revenue] ON [Printed Labels (Data Products)].[Reel No] = [Open Order - with Revenue].Order#
						 INNER JOIN  [Basic Product Construction] K ON [Cust Order Specifications].[Item No] = K.[New Oracle Part #]
						 INNER JOIN vCableConstructions G ON G.Base = K.Base
						 INNER JOIN dbo.[New Orders Spreadsheet] A ON A.[Order #] = [Cust Order Specifications].[Co Number]
WHERE        --([Cust Order Specifications].[Item No] NOT LIKE 'pw%') AND ([Cust Order Specifications].[Item No] NOT LIKE 'frc%') AND 
--                         ([Cust Order Specifications].[Item No] NOT LIKE '%cut%') AND ([Cust Order Specifications].Desgin NOT LIKE 'buff%') AND 
                         ([Printed Labels (Data Products)].[Completed TightBuffer] = 0) AND ([Printed Labels (Data Products)].Shipped = 0) --AND ([Cust Order Specifications].[Type Order] = 'new')
						--and [Item No] = 'PW00288-19'










GO
