SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 12/1/2016
-- Description:	Pricing Update for Sales Force Catalogs
-- =============================================

CREATE PROCEDURE [SalesForce].[usp_CatalogCode_PricingUpdate]

AS
-- Update the cost of all cables
BEGIN

DECLARE @ErrorNumber INT = ERROR_NUMBER();
DECLARE @ErrorLine INT = ERROR_LINE();




--******************************
--Pricing for all typical cables.
--********************************
	BEGIN TRY
		BEGIN TRAN
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


		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;

--******************************
--Pricing for furcation cables
--********************************
	BEGIN TRY
		BEGIN TRAN
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
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;

--******************************
--Pricing for boxed cables
--********************************

	BEGIN TRY
		BEGIN TRAN
		-- Update the cost of boxed cables
		UPDATE tblSalesForce_Catalog
		SET	Price = (Price * BoxedLength_FT /3.281) + 45
		FROM tblSalesForce_Catalog
		WHERE boxed = 1

		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;

--******************************
--Pricing for ribbon cables
--********************************

	BEGIN TRY
		BEGIN TRAN

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
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;



--******************************
--Pricing for SWR Cables
--********************************
	BEGIN TRY
		BEGIN TRAN

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
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;


--******************************
--Pricing for armored cables
--********************************
	BEGIN TRY
		BEGIN TRAN
		UPDATE tblSalesForce_Catalog
		SET Price =	Price + G.ArmorCostAdder, LoadedBaseCost = LoadedBaseCost + ArmorLoadedCost, BaseCost = AmorMaterialCost + BaseCost
		FROM            tblSalesForce_Catalog AS K INNER JOIN ArmorConstructionBase_TEMP G ON K.Base = G.Base
		WHERE armored = 1
			
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;
--******************************
--Pricing for mixed fiber cables
--********************************
	BEGIN TRY
		BEGIN TRAN
		UPDATE dbo.tblSalesForce_Catalog 
		SET Loaded_Base_Cost_Fiber_Included__c   = NULL
		WHERE Fiber_Type_Config__c like '%mixed%'

		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;
end



GO
