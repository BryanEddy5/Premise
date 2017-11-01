SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/****** Object:  View [dbo].[FurcationTube_Fill_Ratio]    Script Date: 3/10/2017 2:35:37 PM ******/

CREATE VIEW [dbo].[Premise Load]
AS
SELECT DISTINCT [Cust Order Specifications].[Item No] AS Prefix, [Cust Order Specifications].Customer, [Cust Order Specifications].[Item No] AS [Item number], CASE WHEN [Order Qty] IS NULL THEN 0 ELSE [Order Qty] END AS Length, [Cust Order Specifications].[Mfg commit date], [Cust Order Specifications].[Schedule date], [Cust Order Specifications].[Co Number], [Cust Order Specifications].Units, [Cust Order Specifications].[Job#], [Cust Order Specifications].[Type Order], [Cust Order Specifications].[Shipped Qty]
FROM [Cust Order Specifications]
WHERE ((([Cust Order Specifications].[Item No])='>=[Forms]![Premise Load Report]![Start] And <=[Forms]![Premise Load Report]![End]') AND (([Cust Order Specifications].[Shipped Qty]) Is Null)) OR ((([Cust Order Specifications].[Schedule date])> '1/1/2001' ) AND (([Cust Order Specifications].[Shipped Qty]) Is Null))






GO
