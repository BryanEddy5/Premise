SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





CREATE VIEW [dbo].[vSalesForce_Catalog_Price_view]
as

SELECT DISTINCT tblSalesForce_Catalog.Base,
									(CASE 
												WHEN A.Contribution <> 0 THEN ROUND((P.LoadedBaseCost + FiberCount * E.CPQ_Fiber_Cost + A.Contribution) / (1 - T.Multiplier), 3)
												ELSE ROUND((P.BaseSkeletalCost + FiberCount * E.CPQ_Fiber_Cost + A.Contribution) / (1 - T.Multiplier), 3) 
										END ) as Price
		, tblSalesForce_Catalog.Fiber_Type__c,E.CPQ_Fiber_Cost, tblSalesForce_Catalog.FiberCount, CPQ_Fiber_Cost * FiberCount as TotalFiberCost
		,A.Contribution,T.Multiplier, P.LoadedBaseCost, P.BaseSkeletalCost,T.Product_Category, T.FiberID
FROM            tblSalesForce_Catalog INNER JOIN
                         tblDesignTypes AS G ON G.SalesForceDescription = tblSalesForce_Catalog.DesignTypeDesc INNER JOIN
                         tblSalesForce_Pricing AS A ON A.Product_Category = G.Product_Pricing_Group INNER JOIN
                         tblSalesForce_Pricing_Multiplier AS T ON A.Product_Category = T.Product_Category AND tblSalesForce_Catalog.FiberID = T.FiberID INNER JOIN
                         tblDesignCodeFiberElementValue AS E ON E.FiberID = tblSalesForce_Catalog.FiberID  INNER JOIN
						 tblBase_Skeletal_Cost P ON P.SetupID = tblSalesForce_Catalog.SetupID
WHERE  Non_Standard = 0 and armored = 0  and  tblSalesForce_Catalog.BASE LIKE 'CP048-5.5I2%'
--and P.LoadedBaseCost + FiberCount*E.CPQ_Fiber_Cost > (CASE 
--												WHEN A.Contribution <> 0 THEN ROUND((P.LoadedBaseCost + FiberCount * E.CPQ_Fiber_Cost + A.Contribution) / (1 - T.Multiplier), 3)
--												ELSE ROUND((BaseCost + FiberCount * E.CPQ_Fiber_Cost + A.Contribution) / (1 - T.Multiplier), 3) 
--										END )
----ORDER BY Base






GO
