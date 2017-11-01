SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[vScheduling_OpenOrders_Items]
AS
SELECT DISTINCT dbo.[Cust Order Specifications].[Item No] AS Item_Number
FROM            dbo.[Cust Order Specifications] INNER JOIN
                         dbo.[Printed Labels (Data Products)] ON dbo.[Cust Order Specifications].[Reel No] = dbo.[Printed Labels (Data Products)].[Reel No] AND 
                         dbo.[Cust Order Specifications].[Order Qty] = dbo.[Printed Labels (Data Products)].[Order Qty] LEFT OUTER JOIN
                         dbo.[Open Order - with Revenue] ON dbo.[Printed Labels (Data Products)].[Reel No] = dbo.[Open Order - with Revenue].Order#
WHERE        (dbo.[Printed Labels (Data Products)].[Completed TightBuffer] = 0) AND (dbo.[Printed Labels (Data Products)].Shipped = 0)




GO
