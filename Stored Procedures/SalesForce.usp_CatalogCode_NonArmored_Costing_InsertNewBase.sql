SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 12/2/2016
-- Description:	Insert new base costs into tblBase_Skeletal_Cost
-- Version:		1 
-- Update:		refactored into a merge statement
--				added error handling
-- =============================================
CREATE PROCEDURE [SalesForce].[usp_CatalogCode_NonArmored_Costing_InsertNewBase]
AS

BEGIN

SET NOCOUNT ON;

DECLARE @ErrorNumber INT = ERROR_NUMBER();
DECLARE @ErrorLine INT = ERROR_LINE();
	BEGIN TRY
		BEGIN tran

			INSERT INTO  dbo.tblBase_Skeletal_Cost( Base, BaseSkeletalCost, AssemblyItemNumber, LoadedBaseCost, SetupID)

			SELECT Base, SUM(MaterialCost) AS BaseSkeletalCost, AssemblyItemNumber, SUM(MaterialCost) AS LoadedBaseCost, SetupID

			FROM
			(
				SELECT d.AssemblyItemNumber,e.ComponentItemNumber,SUM(e.ExtendedQuantityPer*S.Material_Cost) AS MaterialCost,e.[PrimaryUOM],s.Make_Buy , SUM(e.UnitCost) AS UnitCost,  d.base, D.SetupID
				FROM  [dbo].vOracleBaseItems AS d CROSS APPLY [dbo].[fn_ExplodeBOM](D.AssemblyItemNumber) AS e 
				INNER JOIN [dbo].[AFLPRD_INVSysItemCost_CAB] AS S ON e.ComponentItemNumber = s.ItemNumber LEFT JOIN dbo.tblBase_Skeletal_Cost G ON G.SetupID = D.SetupID
				GROUP BY  e.ComponentItemNumber,d.AssemblyItemNumber,e.[PrimaryUOM],s.Make_Buy , e.UnitCost, d.base, D.SetupID,G.SetupID
				HAVING s.Make_Buy = 'buy' AND NOT (e.ComponentItemNumber LIKE 'fbr%' OR e.ComponentItemNumber LIKE 'rbn%' OR e.ComponentItemNumber LIKE 'swr%' OR e.ComponentItemNumber LIKE 'frc%') 
				--AND d.Base = 'GQ072-2.0A' 
						AND G.SetupID IS NULL
						--(e.ComponentItemNumber  like 'rbn%' AND e.ComponentItemNumber  like '%osp%' and e.ComponentItemNumber  like '%rbn%f%')))
						--OR  (e.ComponentItemNumber like 'swr%' AND e.ComponentItemNumber  LIKE  '%osp%'))
				--having s.make_buy = 'buy' and base = 'GQ048-3.0-SW'
			)X 
			GROUP BY X.BASE, x.AssemblyItemNumber, X.SetupID 

		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;

	BEGIN TRY
		BEGIN tran

			UPDATE dbo.tblBase_Skeletal_Cost
			SET LoadedBaseCost = g.Resource_Cost + g.Overhead_Cost + BaseSkeletalCost
			FROM dbo.tblBase_Skeletal_Cost X INNER JOIN  dbo.AFLPRD_INVSysItemCost_CAB G ON G.ItemNumber = X.AssemblyItemNumber

		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;


END


GO
