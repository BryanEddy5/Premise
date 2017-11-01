SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [dbo].[vItemRunSpeedSelectViewFormulaNoVars_TEST_PREACTOR]
AS


--SELECT DISTINCT Setup, SetupLocation, OperationDescription
--FROM #SetupLocation K INNER JOIN AFLPRD_BOMOpSeq_CAB G ON G.OperationCode = K.Setup
--WHERE LEFT(SETUP,1)   in ('d','q','t','k','m','n','O','P')  OR left(SETUP,2)  in ('JS','AS','SK','sb','sx')


/*******************************************************************
Format information to push into preactor table
tblItemRunSpeedSelectViewFormulaNoVars
*********************************************************************
**********************************************************************/



WITH cteItemRunSpeed(ItemNumber,AssemblyItemNumber, Setup, SetupLocation,ProcessDesc, MachineID,  RunSpeed, ProcessID,TotalRunSpeed
					, PrimaryAlt,UnitID,LayerID,MachineNumber,DepartmentID,PreactorMachineID)
AS(
	SELECT DISTINCT K.FinishedGood,K.AssemblyItemNumber, Setup, SetupLocation,B.ProcessDesc, G.MachineID, LineSpeed AS RunSpeed, G.ProcessID
	,LineSpeed as TotalRunSpeed, PrimaryAlt,G.UnitID, G.LayerID,MachineNumber,B.DepartmentID,PreactorMachineID
	FROM (	SELECT DISTINCT [Item Number]
			FROM [AFLPRD_preorders_PREACTOR_SNF] 
			WHERE [Product Group] not in ('pre','wtc') ) X CROSS APPLY fn_ExplodeBOM([Item Number]) k 
			INNER JOIN  Setup.vSetupLineSpeed G ON G.ITEM = K.AssemblyItemNumber
	--INNER JOIN AFLPRD_INVSysItemCost_CAB C ON C.ItemNumber = K.ComponentItemNumber
	 left JOIN [NAASPB-PREACT01].[PreactorProdr12].[Interface].[tblProcess] B ON B.ProcessID = G.ProcessID
	
	),
cteBomUnitLayer(ItemNumber,AssemblyItemNumber,UnitId,LayerId)
AS
	(
		SELECT AssemblyItemNumber, G.ComponentItemNumber, UnitId, LayerId
		FROM AFLPRD_BOMInvComp_CAB G
	)
SELECT DISTINCT 
Setup,ProcessDesc, MachineNumber, ProcessID, cteItemRunSpeed.ItemNumber, COALESCE(cteItemRunSpeed.UnitID,cteBomUnitLayer.UnitID,1) as UnitID
,COALESCE(cteItemRunSpeed.LayerID,cteBomUnitLayer.LayerID,1) as LayerID,MachineID, 1 as CountofAttribute, 1 as RunSpeedID, RunSpeed,  DepartmentID 
,1 as RunSpeedMultiplier , RunSpeed as TotalRunSpeed, cast(DepartmentID as nvarchar(5)) + cast(PreactorMachineID as nvarchar(10)) ResourceID, -1 MachinePriority
, PrimaryAlt
FROM cteItemRunSpeed LEFT JOIN cteBomUnitLayer ON cteItemRunSpeed.ItemNumber = cteBomUnitLayer.ItemNumber
AND cteItemRunSpeed.AssemblyItemNumber = cteBomUnitLayer.AssemblyItemNumber






GO
