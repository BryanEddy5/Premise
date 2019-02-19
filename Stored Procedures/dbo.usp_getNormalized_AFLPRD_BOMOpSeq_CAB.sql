SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Bryan Eddy
-- Create date: 7/7/2017
-- Description:	Normalize the Operation Sequence in the routing to call for the TrueOperationCode
-- This will be used by APS
-- =============================================
CREATE PROCEDURE [dbo].[usp_getNormalized_AFLPRD_BOMOpSeq_CAB]

AS
SET NOCOUNT ON;

UPDATE AFLPRD_BOMOpSeq_CAB
SET SendtoAps = 'Y'
WHERE SendtoAps IS NULL

UPDATE AFLPRD_BOMOpSeq_CAB
SET TrueOperationCode = NULL, DummySeq = null

IF OBJECT_ID(N'tempdb..#OrderHold', N'U') IS NOT NULL
DROP TABLE #OrderHold;




CREATE TABLE #OrderHold(
 AssemblyItemNumber varchar(50),
 OperationSeqNum INT,
 SeqLayer int,
 OperationCode varchar(5),
 DummyFlag bit,
 OperationDescription varchar(300),
 AlternateRoutingDesignator varchar(50),
 SendtoAps varchar(2)
);

--Using Cursor
DECLARE @MyCursor CURSOR;
 
--sample variables to hold each row's content
DECLARE @AssemblyItemNumber varchar(50);
DECLARE @OperationSeqNum INT;
DECLARE @SeqLayer int = 10;
DECLARE @LastItem varchar(50);
DECLARE @LastOp varchar(50);
DECLARE @OperationCode VARCHAR(5);
DECLARE @LastOperationCode varchar(5);
DECLARE @SendToAPS varchar(1);
DECLARE @LastSendtoAPS varchar(2);
DECLARE @DummyFlag bit;
DECLARE @OperationDescription varchar(300);
DECLARE @AlternateRoutingDesignator varchar(50);
DECLARE @Last_Alternate varchar(100);
DECLARE @FirstTrueOp bit;
DECLARE @NextSeq bit;
DECLARE @NewItem bit;

SET @FirstTrueOp = 0;
SET @NextSeq = 0;
SET @SeqLayer = 10;
Set @NewItem = 0;

 --Iterate through table and apply Unit ID and Layer ID
 --Unit ID's are make components or units that schedule needs to schedule to make
 --Layer ID is used to identify what components are used together
BEGIN
    SET @MyCursor = CURSOR FOR
         select AssemblyItemNumber, OperationSeqNum, OperationCode,OperationDescription,AlternateRoutingDesignator,SendtoAps
		 FROM  AFLPRD_BOMOpSeq_CAB
		 WHERE SendtoAps <> 'N' --AND AssemblyItemNumber = 'DNA-28309'
		 ORDER BY AssemblyItemNumber,OperationSeqNum
 
    OPEN @MyCursor
    FETCH NEXT FROM @MyCursor
    INTO @AssemblyItemNumber,@OperationSeqNum, @OperationCode,@OperationDescription,@AlternateRoutingDesignator,@SendtoAps


    WHILE @@FETCH_STATUS = 0



    BEGIN
     --Recongizes change in Assembly item and resets indicators

	 	IF @AlternateRoutingDesignator IS NULL
		BEGIN
			SET @AlternateRoutingDesignator = 'PRIMARY'
		END


	 IF (@AssemblyItemNumber = @LastItem AND @AlternateRoutingDesignator = @Last_Alternate )
		BEGIN
			SELECT @SeqLayer = @SeqLayer, @NewItem = 0;
		END
	ELSE 
		BEGIN 
			SELECT @SeqLayer = 10, @NewItem = 1,@FirstTrueOp = 0;
		END

	--Recognizes a change in operation and assigns the appropriate layer id
	--Replace the 'D' with @SendToAPS where @SendToAPS = D 
	IF (--@OperationCode <> @LastOperationCode AND
		 (@LastSendtoAPS <> 'D' AND @SendtoAPS <>'D')
		AND @NewItem = 0) 
		BEGIN
			SET @NextSeq = 1;
		END
	ELSE
		BEGIN
			SET @NextSeq = 0;
		END
	--If the criteria is passed from the last if statment and there is no proceeding true operation code then execute
	IF  @NextSeq = 1 or (@FirstTrueOp = 1 and @LastSendtoAPS = 'D' AND @SendtoAPS ='Y')
	OR (@FirstTrueOp = 0 and @LastSendtoAPS = 'Y' AND @SendToAPS ='D') 
		BEGIN
			SET @SeqLayer = @SeqLayer + 10
		END


		
	IF @SendToAPS = 'Y' or @SendToAPS is null
		BEGIN
			SELECT @DummyFlag = 0
		END
	ELSE
		BEGIN
			SELECT @DummyFlag = 1
		END

	--Reset the FirstTrueOperation
	IF @NewItem = 1 and @SendtoAPS = 'Y'
		BEGIN
			SET @FirstTrueOp = 1
		END
		 


	 SELECT @LastItem = @AssemblyItemNumber, @LastOperationCode = @OperationCode, @LastSendtoAPS =  @SendtoAPS, @Last_Alternate = @AlternateRoutingDesignator;


  --Insert data into temp table
  INSERT INTO #OrderHold(AssemblyItemNumber,SeqLayer,OperationCode,OperationSeqNum,DummyFlag,OperationDescription,AlternateRoutingDesignator,SendtoAps)
  VALUES (@AssemblyItemNumber,@SeqLayer,@OperationCode,@OperationSeqNum,@DummyFlag,@OperationDescription,@AlternateRoutingDesignator,@SendtoAps)


  FETCH NEXT FROM @MyCursor
  INTO @AssemblyItemNumber,@OperationSeqNum, @OperationCode,@OperationDescription,@AlternateRoutingDesignator,@SendtoAps
   
    END; 
 
    CLOSE @MyCursor ;
    DEALLOCATE @MyCursor;
END;




IF OBJECT_ID(N'tempdb..#NormalizedRouting', N'U') IS NOT NULL
DROP TABLE #NormalizedRouting
;
SELECT *, FIRST_VALUE(OperationCode) OVER (PARTITION BY  AlternateRoutingDesignator,SeqLayer,AssemblyItemNumber ORDER BY DummyFlag,AlternateRoutingDesignator,AssemblyItemNumber,SeqLayer,OperationSeqNum) TrueOperation
INTO #NormalizedRouting
FROM #OrderHold
--WHERE AssemblyItemNumber in( 'PA00264-10')
ORDER BY AssemblyItemNumber,SeqLayer,OperationSeqNum
;

UPDATE AFLPRD_BOMOpSeq_CAB
SET TrueOperationCode = G.TrueOperation, DummySeq = SeqLayer
FROM #NormalizedRouting G INNER JOIN AFLPRD_BOMOpSeq_CAB K ON K.OperationSeqNum = G.OperationSeqNum AND K.AssemblyItemNumber = G.AssemblyItemNumber AND COALESCE(K.AlternateRoutingDesignator,'Primary') = COALESCE(G.AlternateRoutingDesignator,'Primary');


--select * FROM dbo.AFLPRD_BOMOpSeq_CAB
--WHERE AssemblyItemNumber = 'DNA-28309'


IF OBJECT_ID(N'tempdb..#SetupNormalize', N'U') IS NOT NULL
DROP TABLE #SetupNormalize;
WITH
	cteBomSetup(Item,OperationSeqNum,SetupLocation, BomSetup,Alternate,UnitId,LayerID)
	AS(
		SELECT DISTINCT G.AssemblyItemNumber,OperationSeqNumber,'Bom' AS SetupLocation,REPLACE(ComponentItemNumber,'SETUP ','') BomSetup
		,AlternateBOMDesignator,UnitId,LayerId
		FROM AFLPRD_BOMInvComp_CAB G
		WHERE ComponentItemNumber LIKE 'Setup%' --and AssemblyItemStatus NOT IN ('obsolete', 'DISCONTD')
		--AND AssemblyItemNumber = 'S-SS-3965-01'
	),
	cteRoute(Item, OperationSeqNum,SetupLocation,OperationCode, ItemStatus, Alternate,DummySeq)
	AS(

		SELECT DISTINCT AssemblyItemNumber,OperationSeqNum,'Route' AS SetupLocation
		,TrueOperationCode AS OperationCode
		, Item_Status, AlternateRoutingDesignator,DummySeq
		FROM AFLPRD_BOMOpSeq_CAB K INNER JOIN AFLPRD_INVSysItemCost_CAB G ON K.AssemblyItemNumber = G.ItemNumber

	)

	SELECT DISTINCT cteRoute.Item, dummyseq,
	COALESCE(BomSetup,cteRoute.OperationCode) AS Setup ,BomSetup,COALESCE(BomSetup,cteRoute.OperationCode) OperationCode
	  , k.DESCRIPTION AS Item_Description, COALESCE(cteBomSetup.OperationSeqNum,cteRoute.OperationSeqNum) operation_seq_num
	,COALESCE(cteBomSetup.SetupLocation,cteRoute.SetupLocation) AS SetupLocation--, cteBomSetup.Alternate as BomAlternate, cteRoute.alternate
	,COALESCE(cteBomSetup.Alternate,cteRoute.Alternate,'Primary') AS PrimaryAlt
	,UnitID,LayerID, 
	FIRST_VALUE(COALESCE(BomSetup,cteRoute.OperationCode)) OVER (PARTITION BY cteRoute.Item,dummyseq,COALESCE(cteBomSetup.Alternate,cteRoute.Alternate,'Primary') ORDER BY (CASE WHEN BomSetup IS NULL THEN 1 ELSE 0 END), cteRoute.Item) AS TrueOperation
	INTO #SetupNormalize
	FROM cteRoute LEFT JOIN cteBomSetup ON cteRoute.Item = cteBomSetup.item AND cteRoute.OperationSeqNum = cteBomSetup.OperationSeqNum
	INNER JOIN AFLPRD_INVSysItem_CAB K ON cteRoute.Item = k.ItemNumber
	AND COALESCE(cteRoute.Alternate,'Primary') = COALESCE(cteBomSetup.Alternate,'Primary')
		;


UPDATE AFLPRD_BOMOpSeq_CAB
SET TrueOperationCode = G.TrueOperation
FROM #SetupNormalize G INNER JOIN AFLPRD_BOMOpSeq_CAB K ON K.OperationSeqNum = G.operation_seq_num AND K.AssemblyItemNumber = G.Item AND COALESCE(k.AlternateRoutingDesignator,'Primary') = g.PrimaryAlt;

UPDATE AFLPRD_BOMOpSeq_CAB
SET TrueOperationCode = DepartmentCode
WHERE OperationCode IS NULL AND DepartmentCode IS NOT NULL;




GO
