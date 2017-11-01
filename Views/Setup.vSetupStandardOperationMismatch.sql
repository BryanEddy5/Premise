SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


	/****** Script for SelectTopNRows command from SSMS  ******/
	/* Bryan Eddy
		10/30/2017
	This view shows where Setups in the configurator do not match the Standard Operation in the Routing*/
	CREATE VIEW [Setup].[vSetupStandardOperationMismatch]
	AS
	WITH cteSetup
	AS(
	SELECT DISTINCT K.OperationCode, K.TrueOperationCode, K.AssemblyItemNumber, o.part AS Setup, I.OracleStatus, i.DateCreated, K.SendtoAps, k.OperationDescription, i.CreatedBy
	,i.[Item No] ItemNo
	  FROM  dbo.AFLPRD_BOMOpSeq_CAB K 
	  INNER JOIN dbo.[Basic Product Construction] i ON i.[New Oracle Part #] = K.AssemblyItemNumber
	  INNER JOIN dbo.tblCableConstructionReferences e ON e.Base = i.Base
	  INNER JOIN dbo.tblCableConstructions w ON w.BaseID = e.BaseID
	  CROSS APPLY dbo.usf_SplitString(W.StandardOperation,'-') o 
	 -- INNER JOIN dbo.AFLPRD_BOMRoutSub_CAB P ON P.AssemblyItemNumber = K.AssemblyItemNumber
	  WHERE --k.OperationCode <> o.part AND G.AssemblyItemNumber LIKE '%-00' AND 
	  K.SendtoAps NOT IN ('n','d') --AND OracleStatus <> 'Obsolete'  
	  AND LEFT(K.OperationCode,1) NOT IN ('q','k','N','E','P')  --AND P.CommonItemNumber IS NULL
	   AND LEFT(K.OperationCode,2) NOT IN ('PK','CL')
	  AND K.AssemblyItemNumber NOT LIKE '%-__BX%'

	  ),
	  cteMissingSetup
	  AS(
	  SELECT  i.DateCreated,i.OperationCode,i.OperationDescription, i.AssemblyItemNumber ItemRouting, e.Setup, e.AssemblyItemNumber ItemSetup, I.OracleStatus, e.CreatedBy
	  ,e.ItemNo
	  FROM cteSetup I FULL OUTER JOIN cteSetup e ON e.AssemblyItemNumber = i.AssemblyItemNumber AND i.OperationCode = e.Setup
	WHERE e.AssemblyItemNumber IS NULL OR i.AssemblyItemNumber IS NULL
	--ORDER BY i.DateCreated DESC, e.DateCreated desc,ItemRouting, ItemSetup
		)
	SELECT DISTINCT i.DateCreated, i.OperationCode StdOpBOM, i.OperationDescription, i.ItemRouting, e.Setup StdOpConfigurator, I.OracleStatus, E.CreatedBy, E.ItemNo
	FROM cteMissingSetup I INNER JOIN cteMissingSetup E ON I.ItemRouting = E.ItemSetup
	WHERE LEFT(E.SETUP,1) = LEFT(I.OperationCode,1)
	--ORDER BY i.DateCreated DESC, E.OperationCode


GO
