SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 12/1/2016
-- Description:	Pricing Update for Sales Force Catalogs
-- =============================================

CREATE PROCEDURE [dbo].[usp_CatalogCode_SalesForce_PricingUpdate]

AS
-- Update the cost of all cables
BEGIN


--******************************
--Pricing for all typical cables.
--********************************
UPDATE tblSalesForce_Catalog
SET Price =								(CASE 
												WHEN A.Contribution <> 0 THEN ROUND((K.LoadedBaseCost + K.FiberCount * E.CPQ_Fiber_Cost + A.Contribution) / (1 - T.Multiplier), 3)
												ELSE ROUND((K.BaseCost + K.FiberCount * E.CPQ_Fiber_Cost + A.Contribution) / (1 - T.Multiplier), 3) 
										END ),
	--Price = ROUND((K.LoadedBaseCost + K.FiberCount * E.CPQ_Fiber_Cost + A.Contribution) / (1 - T.Multiplier), 3),
Loaded_Base_Cost_Fiber_Included__c =    ROUND((K.LoadedBaseCost + K.FiberCount * E.CPQ_Fiber_Cost),3)
FROM            tblSalesForce_Pricing AS A INNER JOIN
                         tblDesignTypes AS G ON A.Product_Category = G.Product_Pricing_Group INNER JOIN
                         tblSalesForce_Pricing_Multiplier AS T ON A.Product_Category = T.Product_Category INNER JOIN
                         tblSalesForce_Catalog AS K ON T.FiberID = K.FiberID INNER JOIN
                         tblDesignCodeFiberElementValue AS E ON E.FiberID = K.FiberID INNER JOIN
                         tblCableConstructionReferences AS CR ON CR.Base = K.Base AND G.DesignTypeID = CR.DesignTypeID
WHERE        CR.TBType <> 'furcation' OR CablePasses = 2


--******************************
--Pricing for furcation cables
--********************************

UPDATE       tblSalesForce_Catalog
SET    
--SELECT            catalogcode,k.base,k.BaseCost,k.loadedbasecost, e.item_cost,t.Multiplier,a.Contribution,P.FiberCount,
				Price = (CASE WHEN A.Contribution <> 0 THEN ROUND((K.LoadedBaseCost + P.FiberCount * E.Item_Cost + A.Contribution) / (1 - T .Multiplier), 3) 
                         ELSE ROUND((K.BaseCost + P.FiberCount * E.Item_Cost + A.Contribution) / (1 - T .Multiplier), 3) END)
FROM            tblSalesForce_Pricing AS A INNER JOIN
                         tblDesignTypes AS G ON A.Product_Category = G.Product_Pricing_Group INNER JOIN
                         tblSalesForce_Pricing_Multiplier AS T ON A.Product_Category = T.Product_Category INNER JOIN
                         tblSalesForce_Catalog k ON T.FiberID = k.FiberID INNER JOIN
                         tblDesignCodeFurcationTube AS B ON B.FurcationTube = k.FurcationTube INNER JOIN
                         AFLPRD_INVSysItemCost_CAB AS E ON E.ItemNumber = B.Furcation INNER JOIN
                         tblCableConstructionReferences P ON k.Base = P.Base AND 
                         G.DesignTypeID = P.DesignTypeID
WHERE        (k.TBType = 'furcation') AND (k.CablePasses = 1)
--ORDER BY price


--******************************
--Pricing for boxed cables
--********************************


-- Update the cost of boxed cables
UPDATE tblSalesForce_Catalog
SET	Price = (Price * BoxedLength_FT /3.281) + 45
FROM tblSalesForce_Catalog
WHERE boxed = 1



--******************************
--Pricing for ribbon cables
--********************************



-- Update the cost of Ribbon cables
UPDATE tblSalesForce_Catalog
SET 
	Price =								
										 (CASE 
												WHEN A.Contribution <> 0 THEN ROUND((K.LoadedBaseCost + K.FiberCount * E.CPQ_Fiber_Cost + A.Contribution + K.FiberCount*(.207 / 12) ) / (1 - T.Multiplier), 3)
												ELSE ROUND((K.BaseCost + K.FiberCount * E.CPQ_Fiber_Cost + A.Contribution + K.FiberCount*(.207 / 12)*1.02) / (1 - T.Multiplier), 3) 
										END ),
	--Price =ROUND((K.LoadedBaseCost + K.FiberCount * E.CPQ_Fiber_Cost + A.Contribution + (.207 / 12) ) / (1 - T.Multiplier), 3),
	Loaded_Base_Cost_Fiber_Included__c =    ROUND((K.LoadedBaseCost + K.FiberCount * E.CPQ_Fiber_Cost +  K.FiberCount*(.207 / 12)*1.02),3)
FROM            tblSalesForce_Pricing AS A INNER JOIN
                         tblDesignTypes AS G ON A.Product_Category = G.Product_Pricing_Group INNER JOIN
                         tblSalesForce_Pricing_Multiplier AS T ON A.Product_Category = T.Product_Category INNER JOIN
                         tblSalesForce_Catalog AS K ON T.FiberID = K.FiberID INNER JOIN
                         tblDesignCodeFiberElementValue AS E ON E.FiberID = K.FiberID INNER JOIN
                         tblCableConstructionReferences AS CR ON CR.Base = K.Base AND G.DesignTypeID = CR.DesignTypeID
WHERE cr.TBType = 'Ribbon' 



--******************************
--Pricing for SWR Cables
--********************************

UPDATE tblSalesForce_Catalog
SET 
	Price =				
										(CASE 
												WHEN A.Contribution <> 0 THEN ROUND((K.LoadedBaseCost + K.FiberCount * E.CPQ_Fiber_Cost + A.Contribution +  K.FiberCount*(.10800 / 12) ) / (1 - T.Multiplier), 3)
												ELSE ROUND((K.BaseCost + K.FiberCount * E.CPQ_Fiber_Cost + A.Contribution + K.FiberCount*(.10800 / 12)) / (1 - T.Multiplier), 3) 
										END ),
	--Price = ROUND((K.LoadedBaseCost + K.FiberCount * E.CPQ_Fiber_Cost + A.Contribution + (.10800 / 12) ) / (1 - T.Multiplier), 3),
	Loaded_Base_Cost_Fiber_Included__c =    ROUND((K.LoadedBaseCost + K.FiberCount * E.CPQ_Fiber_Cost + K.FiberCount *(.10800 / 12)),3)
FROM            tblSalesForce_Pricing AS A INNER JOIN
                         tblDesignTypes AS G ON A.Product_Category = G.Product_Pricing_Group INNER JOIN
                         tblSalesForce_Pricing_Multiplier AS T ON A.Product_Category = T.Product_Category INNER JOIN
                         tblSalesForce_Catalog AS K ON T.FiberID = K.FiberID INNER JOIN
                         tblDesignCodeFiberElementValue AS E ON E.FiberID = K.FiberID INNER JOIN
                         tblCableConstructionReferences AS CR ON CR.Base = K.Base AND G.DesignTypeID = CR.DesignTypeID
WHERE TBLetter IN( 'r', 's' )




--UPDATE tblSalesForce_Catalog
--SET Price =						   (CASE 
--										WHEN tbtype ='furcation' and cablepasses = 1 THEN	ROUND((K.LoadedBaseCost + K.FiberCount * E.Item_Cost + A.Contribution) / (1 - T.Multiplier), 3)
--										WHEN TBLetter = 'r' or TBLetter = 's' THEN ROUND((K.LoadedBaseCost + K.FiberCount * D.CPQ_Fiber_Cost + (0.10800 / 12) + A.Contribution) / (1 - T.Multiplier), 3)
--										WHEN  TBType = 'Ribbon' THEN ROUND((K.LoadedBaseCost + K.FiberCount * D.CPQ_Fiber_Cost + (.207 / 12) + A.Contribution) / (1 - T.Multiplier), 3)
--										ELSE ROUND((K.LoadedBaseCost + K.FiberCount * D.CPQ_Fiber_Cost + A.Contribution) / (1 - T.Multiplier), 3)
--									END )
--FROM            tblSalesForce_Catalog AS K INNER JOIN
--                         tblDesignTypes AS G ON G.SalesForceDescription = K.DesignTypeDesc INNER JOIN
--                         tblSalesForce_Pricing AS A ON A.Product_Category = G.Product_Pricing_Group INNER JOIN
--                         tblSalesForce_Pricing_Multiplier AS T ON A.Product_Category = T.Product_Category AND K.FiberID = T.FiberID LEFT JOIN
--						 tblDesignCodeFurcationTube B ON B.FurcationTube = k.FurcationTube LEFT JOIN
--                         dbo.AFLPRD_INVSysItemCost_CAB E ON E.ItemNumber = b.furcation INNER JOIN
--						 tblDesignCodeFiberElementValue AS D ON D.FiberID = K.FiberID

--******************************
--Pricing for armored cables
--********************************

UPDATE tblSalesForce_Catalog
SET Price =	Price + G.ArmorCostAdder, LoadedBaseCost = LoadedBaseCost + ArmorLoadedCost, BaseCost = AmorMaterialCost + BaseCost
FROM            tblSalesForce_Catalog AS K INNER JOIN ArmorConstructionBase_TEMP G ON K.Base = G.Base
WHERE armored = 1
			

--******************************
--Pricing for mixed fiber cables
--********************************

UPDATE dbo.tblSalesForce_Catalog 
SET Loaded_Base_Cost_Fiber_Included__c   = NULL
WHERE Fiber_Type_Config__c like '%mixed%'


end



GO
