SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[usp_GetSalesForcePricing](
 @BASE NVARCHAR(50)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	
IF OBJECT_ID(N'tempdb..#Cost', N'U') IS NOT NULL
DROP TABLE #Cost


	SELECT DISTINCT tblCableConstructionReferences.Base,
										(CASE 
													WHEN A.Contribution <> 0 THEN ROUND((P.LoadedBaseCost + FiberCount * E.CPQ_Fiber_Cost +
														(CASE WHEN tblCableConstructionReferences.TBType = 'Ribbon' THEN FiberCount*(.207 / 12)*1.02
															ELSE 0
														END )  + A.Contribution) / (1 - Multiplier.Multiplier), 3)
													ELSE ROUND((P.BaseSkeletalCost + FiberCount * E.CPQ_Fiber_Cost +
														(CASE WHEN tblCableConstructionReferences.TBType = 'Ribbon' THEN FiberCount*(.207 / 12)*1.02
															ELSE 0
														END )+ A.Contribution) / (1 - Multiplier.Multiplier), 3) 
											END ) as Price,
	                         tblDesignCodeFiberElementValue.Fiber_Type__c, E.CPQ_Fiber_Cost, tblCableConstructionReferences.FiberCount, 
                         E.CPQ_Fiber_Cost * tblCableConstructionReferences.FiberCount AS TotalFiberCost, A.Contribution, Multiplier.Multiplier, P.LoadedBaseCost, 
                         ROUND(P.BaseSkeletalCost, 4) AS BaseSkeletalCost, A.Product_Category, Multiplier.FiberID, 
                         E.CPQ_Fiber_Cost * tblCableConstructionReferences.FiberCount + P.BaseSkeletalCost AS BaseCostFiber, G.Armor AS Armored--, Fiber
INTO #Cost
FROM            tblCableConstructionReferences INNER JOIN
                         tblDesignTypes AS G INNER JOIN
                         tblSalesForce_Pricing AS A ON A.Product_Category = G.Product_Pricing_Group INNER JOIN
                         tblSalesForce_Pricing_Multiplier AS Multiplier ON A.Product_Category = Multiplier.Product_Category ON 
                         tblCableConstructionReferences.DesignTypeID = G.DesignTypeID INNER JOIN
                         tblBase_Skeletal_Cost AS P ON tblCableConstructionReferences.Base = P.Base INNER JOIN
                         tblCableTightBufferReference ON tblCableConstructionReferences.TBType = tblCableTightBufferReference.TBType INNER JOIN
                         tblDesignCodeFiberElementValue ON Multiplier.FiberID = tblDesignCodeFiberElementValue.FiberID INNER JOIN
                         tbl_Fibers INNER JOIN
                         tblDesignCodeFiberElementValue AS E ON tbl_Fibers.FiberID = E.FiberID INNER JOIN
                         tblFiberTBIndicators ON tbl_Fibers.TBCatalogType = tblFiberTBIndicators.TBCatalogType INNER JOIN
                         tblFiberTBCatalog ON tblFiberTBIndicators.TBCatalogType = tblFiberTBCatalog.TBCatalogType ON 
                         tblDesignCodeFiberElementValue.FiberID = tbl_Fibers.FiberID INNER JOIN
                         tblCableTBType ON tblCableTightBufferReference.TBTypeID = tblCableTBType.TBIndicatorID AND 
                         tblFiberTBIndicators.TBLetter = tblCableTBType.TBLetter
WHERE        tblCableConstructionReferences.Base = @BASE

	SELECT DISTINCT C.*, CASE WHEN Armored = 1 THEN W.ArmorCostAdder + Price ELSE 0 END as ArmoredPrice, W.ArmorCostAdder, CASE WHEN Armored = 1 THEN W.Armor ELSE '0' END as Armor
	FROM #Cost C LEFT JOIN ArmorConstructionBase_TEMP A ON A.Base = C.Base LEFT JOIN tblDesignArmor W ON W.Armor = A.Armor


END


GO
