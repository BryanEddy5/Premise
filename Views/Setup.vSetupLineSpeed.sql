SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO












/* View created to pull line speeds from Setup Database
	to supply to Scheduling for Run Speeds
	7/7/2017 - Bryan Eddy							*/


CREATE VIEW [Setup].[vSetupLineSpeed]
	as


 WITH cteSetupLineSpeed(OperationCode, MachineID,LineSpeed, ProcessID, MachineNumber, SetupDesc,PreactorMachineID,PlanetTogetherMachineNumber)
 as(
	 SELECT K.SetupNumber, K.MachineID,e.AttributeValue as LineSpeed, e.ProcessID, MachineNumber, k.SetupDesc,PreactorMachineID,PlanetTogetherMachineNumber
	 FROM  Setup.tblSetup K
	 INNER JOIN setup.tblSetupAttributes E ON E.SetupID = K.SetupID
	 INNER JOIN [Setup].[tblAttributes] I ON E.AttributeID = I.AttributeID
	 INNER JOIN setup.tblProcessMachines B ON B.MachineID = K.MachineID
	 AND B.ProcessID = E.ProcessID
	 WHERE I.AttributeName LIKE 'LINESPEED' 
	  --and K.IneffectiveDate > GETDATE() 
	  AND I.AttrIneffectiveDate >= GETDATE()
	 and   e.IneffectiveDate >= GETDATE()
	 AND b.Active <> 0 AND K.IneffectiveDate >= getdate()
	 and isnumeric(AttributeValue) = 1 
		),
	cteBomSetup(Item,OperationSeqNum,SetupLocation, BomSetup,Alternate,UnitId,LayerID)
	as(
		SELECT DISTINCT G.AssemblyItemNumber,OperationSeqNumber,'Bom' as SetupLocation,REPLACE(ComponentItemNumber,'SETUP ','') BomSetup
		,AlternateBOMDesignator,UnitId,LayerId
		FROM AFLPRD_BOMInvComp_CAB G
		WHERE ComponentItemNumber like 'Setup%' 

	),
	cteRoute(Item, OperationSeqNum,SetupLocation,OperationCode, ItemStatus, Alternate, SendToAPS)
	as(

		SELECT DISTINCT AssemblyItemNumber,OperationSeqNum,'Route' as SetupLocation
		,TrueOperationCode  as OperationCode
		, Item_Status, AlternateRoutingDesignator,SendToAPS
		FROM AFLPRD_BOMOpSeq_CAB K INNER JOIN AFLPRD_INVSysItemCost_CAB G ON K.AssemblyItemNumber = G.ItemNumber
		WHERE Item_Status NOT IN ('obsolete') 
	)

	SELECT DISTINCT cteRoute.Item, 
	MachineID,COALESCE(cast(LineSpeed as float),0)  as LineSpeed,ProcessID,MachineNumber,SendToAPS,PlanetTogetherMachineNumber,
	COALESCE(BomSetup,cteRoute.OperationCode) as Setup ,BomSetup
	  ,cteRoute.ItemStatus,SetupDesc, k.DESCRIPTION as Item_Description, COALESCE(cteBomSetup.OperationSeqNum,cteRoute.OperationSeqNum) OperationSeqNum
	,COALESCE(cteBomSetup.SetupLocation,cteRoute.SetupLocation) as SetupLocation
	,COALESCE(cteBomSetup.Alternate,cteRoute.Alternate,'Primary') as PrimaryAlt
	,UnitID,LayerID,PreactorMachineID
	--INTO #SetupLocation
	FROM cteRoute LEFT JOIN cteBomSetup ON cteRoute.Item = cteBomSetup.item AND cteRoute.OperationSeqNum = cteBomSetup.OperationSeqNum
	LEFT JOIN cteSetupLineSpeed ON COALESCE(BomSetup,cteRoute.OperationCode) = cteSetupLineSpeed.OperationCode
	INNER JOIN AFLPRD_INVSysItem_CAB K ON cteRoute.Item = K.ItemNumber
	AND COALESCE(cteRoute.Alternate,'Primary') = COALESCE(cteBomSetup.Alternate,'Primary')
	WHERE SendToAPS IN ('Y','D')






GO
