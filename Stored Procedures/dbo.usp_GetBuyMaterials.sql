SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Bryan Eddy>
-- ALTER date: <6/7/2017>
-- Description:	<Explodes BOM to find buy materials for all items in temp table
--				 Tem table is created in the Premise Configurator>
--			NEED TO WORK ON STARTUP SCRAP ROLL UP -- MISSING QC OPERATIONS
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetBuyMaterials]


	-- Add the parameters for the stored procedure here

AS
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;

		IF OBJECT_ID(N'tempdb..#BOMExplode', N'U') IS NOT NULL
		drop table #BOMExplode
		SELECT *
		INTO #BOMExplode
		FROM ##ItemPassToSQL G CROSS APPLY fn_ExplodeBOM(G.OracleItem) K;

	IF OBJECT_ID(N'tempdb..##MaterialUsage', N'U') IS NOT NULL
	drop table ##MaterialUsage;

	WITH --cteMaterialUsage calculates the usage rate for each component
		cteMaterialUsage (OracleItem, Quantity, ComponentItemNumber, ComponentQuantity_PerQty,TotalCost,PrimaryUOM,ComponentQuantity_M)
		AS
		(
			SELECT OracleItem, Quantity,ComponentItemNumber,  sum(ComponentQuantity_PerQty) ComponentQuantity_PerQty, sum(TotalCost) TotalCost
			, PrimaryUOM,sum(ComponenetQuantity_m) as ComponenetQuantity_M
			FROM 
				(
				SELECT G.OracleItem, G.Quantity,ComponentItemNumber, round(sum(ExtendedQuantityPer)*Quantity,6) ComponentQuantity_PerQty
				, PrimaryUOM, round(sum(ExtendedQuantityPer),6) as ComponenetQuantity_m, round(k.Material_Cost * Quantity,3) TotalCost
				FROM #BOMExplode G INNER JOIN AFLPRD_INVSysItemCost_CAB K ON K.ItemNumber = G.ComponentItemNumber 
				GROUP BY G.OracleItem, G.Quantity,ComponentItemNumber, PrimaryUOM,Make_Buy,Material_Cost
				HAVING K.Make_Buy = 'BUY'
				) X
			GROUP BY OracleItem, Quantity,ComponentItemNumber, PrimaryUOM
		), --cteStartUpScrap rolls up the scrap requirements from each operation from the Exploded BOM
		cteStartUpScrap (OracleItem, StartUpScrap)
		AS 
		(
			SELECT OracleItem, sum(StartupScrap)
			FROM 
			(
				SELECT DISTINCT G.OracleItem, BOMLevel, OperationCode, CAST(COALESCE(StartupScrap,0) AS INT) StartupScrap
				FROM #BOMExplode G INNER JOIN AFLPRD_BOMOpSeq_CAB OP ON OP.AssemblyItemNumber = G.AssemblyItemNumber AND OP.OperationSeqNum >= G.OperationSeqNumber
				WHERE StartupScrap IS NOT NULL
			) StartupScrap
			GROUP BY OracleItem

		)
	SELECT M.*, StartUpScrap
	INTO ##MaterialUsage
	FROM cteStartUpScrap S INNER JOIN cteMaterialUsage M ON S.OracleItem = M.OracleItem
	ORDER BY OracleItem, ComponentItemNumber

	SELECT * FROM ##MaterialUsage

END
GO
