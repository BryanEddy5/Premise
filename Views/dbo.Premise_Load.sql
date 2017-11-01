SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[Premise_Load]
AS
SELECT DISTINCT [Cust Order Specifications].[Item No] AS Prefix
, [Cust Order Specifications].Customer
, [Cust Order Specifications].[Item No] AS [Item number]
, CASE WHEN [Order Qty] IS NULL THEN 0 ELSE [Order Qty] END  Length
, [Cust Order Specifications].[Mfg commit date], [Cust Order Specifications].[Schedule date], [Cust Order Specifications].[Co Number], [Cust Order Specifications].Units, [Cust Order Specifications].[Job#], [Cust Order Specifications].[Type Order], [Cust Order Specifications].[Shipped Qty]
FROM [Cust Order Specifications]
WHERE ([Cust Order Specifications].[Shipped Qty] Is Null OR [Cust Order Specifications].[Schedule date] > '1/1/2001') AND [Cust Order Specifications].[Shipped Qty] Is Null AND [Schedule date] > GETDATE() - 30



GO
