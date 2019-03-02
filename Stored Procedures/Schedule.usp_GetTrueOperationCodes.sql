SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:      Bryan Eddy
-- Create date: 2/17/2019
-- Description: Update Schedule.OrderProcessMachines with setups
-- Version: 1
-- Update:	n/a
-- =============================================

CREATE PROC [Schedule].[usp_GetTrueOperationCodes]

@Item NVARCHAR(50), 
@OrderID int

AS

	SET NOCOUNT ON;
BEGIN
DECLARE @ErrorNumber INT = ERROR_NUMBER();
DECLARE @ErrorLine INT = ERROR_LINE();

BEGIN TRY
		BEGIN TRAN

		--DECLARE @ITEM NVARCHAR(50)
		--DECLARE @OrderID int
		--SET @Item = 'PB09980-01'
		--SET @OrderID = 1

			IF OBJECT_ID(N'tempdb..#TempExplode', N'U') IS NOT NULL
			DROP TABLE dbo.#TempExplode;
			SELECT *
			INTO #TempExplode
			FROM dbo.fn_ExplodeBOM(@Item) 

			IF OBJECT_ID(N'tempdb..#Results', N'U') IS NOT NULL
			DROP TABLE dbo.#Results;
			;WITH cteSubunits
			AS(
				SELECT k.AssemblyItemNumber, k.ComponentItemNumber, SUM(K.ComponentQuantity) TotalQuantity, k.BOMLevel, R.DummySeq
				FROM #TempExplode k 
				INNER JOIN dbo.AFLPRD_BOMOpSeq_CAB R ON R.AssemblyItemNumber = k.AssemblyItemNumber AND R.OperationSeqNum = K.OperationSeqNumber
				GROUP BY k.AssemblyItemNumber, k.ComponentItemNumber, k.BOMLevel, R.DummySeq
			)
			,cteSubunitSetup
			AS(
				SELECT DISTINCT 
					   r.TrueOperationCode,
					   SUM(c.TotalQuantity) TotalQuantity, R.AssemblyItemNumber, C.AssemblyItemNumber ParentItemNumber
				FROM cteSubunits c 
				INNER JOIN ( SELECT DISTINCT AssemblyItemNumber, TrueOperationCode FROM dbo.AFLPRD_BOMOpSeq_CAB) r ON r.AssemblyItemNumber = c.ComponentItemNumber
				GROUP BY r.TrueOperationCode, r.AssemblyItemNumber, C.AssemblyItemNumber
				HAVING  r.TrueOperationCode IS NOT NULL
			)
				SELECT DISTINCT @OrderID AS OrderId, i.TrueOperationCode, k.BOMLevel, i.DummySeq, i.DepartmentCode,COALESCE(c.TotalQuantity,1) TotalQuantity, i.AssemblyItemNumber, c.ParentItemNumber
				INTO #Results
				FROM dbo.AFLPRD_BOMOpSeq_CAB i 
				INNER JOIN #TempExplode k ON k.AssemblyItemNumber = i.AssemblyItemNumber AND k.OperationSeqNumber = i.OperationSeqNum
				left JOIN cteSubunitSetup c ON c.TrueOperationCode = i.TrueOperationCode AND c.AssemblyItemNumber = i.AssemblyItemNumber
				INNER JOIN Schedule.RouteDepartmentsAuthorized r ON r.DepartmentCode = i.DepartmentCode --Only pass approved Department Setups / True Operation Codes
				WHERE i.SendtoAps ='y'

			MERGE Schedule.OrderProcessMachines AS Target
			USING (
				SELECT *
				FROM #Results
			) AS Source
			ON (Target.OrderId = Source.OrderId 
			AND Target.BomLevel = Source.BOMLevel 
			AND Target.TrueOperationSequence = Source.DummySeq 
			AND Source.TrueOperationCode = Target.Setup
			AND Target.ItemNumber = Source.AssemblyItemNumber)
			WHEN MATCHED THEN
				UPDATE SET	Target.Setup = source.TrueOperationCode,
							Target.TrueOperationSequence = Source.DummySeq,
							Target.OrderId = Source.OrderId,
							Target.BomLevel = Source.BomLevel,
							Target.Quantity = Source.TotalQuantity,
							Target.DepartmentCode = Source.DepartmentCode,
							Target.ItemNumber = source.AssemblyItemNumber,
							Target.ParentItemNumber = Source.ParentItemNumber
			WHEN NOT MATCHED BY TARGET THEN
				INSERT (Orderid, Setup, BomLevel, TrueOperationSequence, Quantity, DepartmentCode, ItemNumber, ParentItemNumber)
				VALUES (Source.Orderid, Source.TrueOperationCode, Source.BomLevel, Source.DummySeq, Source.TotalQuantity, Source.DepartmentCode, Source.AssemblyItemNumber, Source.ParentItemNumber);
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
