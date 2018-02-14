SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
Author:		Bryan Eddy
Desc:		Connect the Oracle Mes data to Ncmir and construction data
			Allow for process engineers to perform roote cause analysis
			Attached to excel file
Date:		1/26/2018
Version:	1
Update:		Initial creation

*/
CREATE VIEW [Oracle].[vInterFaceMesNcmirProcessData]
AS
WITH cteMesNcmir
AS (		
	SELECT DISTINCT --MachMap.NcmirMachineID,
	NCMIR.ResponsibleMachine,NCMIR.IssuingDepartment,NCMIR.Machine IssuingMachine,  NCMIR.ResponsibleDepartment
	, Mes.[Actual Machine] MesMachine
	,mes.[Sales Order Number] SalesOrder, Mes.[SO Line #] SalesOrderLine--, Mes.[Cut Number] MesCutNumber, NCMIR.CutNumber NcmirCutNumber
	,Mes.ITEM ItemNumber,Mes.JOB AS JobNumber, CAST(NCMIR.ProblemDescription AS NVARCHAR(MAX)) ProblemDescription,NCMIR.Category,NCMIR.FinalDispositions, NCMIR.CauseCategory
	, NCMIR.CurrentCableLength,NCMIR.Customer, 
	Mes.[Actual Line Speed], Mes.[Design Line Speed], Mes.[Transaction Date] + Mes.[Transaction Time] AS TransactionDate
	, ncmir.Number NcmirNumber,Mes.[NCMIR #] MesNcmirNumber, Mes.[STD Operation] SetupNumber
	,Mes.[QTS OTDR Length], Mes.[QTY Produced], Mes.[QTY Requested], Mes.[Record Entered By],CAST(NCMIR.EngineeringComments AS  NVARCHAR(MAX)) EngineeringComments,
	G.NumericValue MesCutNumber, COALESCE(K.NumericValue,0) NcmirCutNumber
	FROM  dbo.AFLPRD_COMMON_QA_PROCESS_FY_2017_todate Mes 
			LEFT JOIN Oracle.Machines OrclMach ON Mes.[Actual Machine] = OrclMach.MachineName 
			LEFT JOIN ORACLE.MachineMappingToNCMIR MachMap ON MachMap.OracleMachineID = OrclMach.MachineID
			CROSS APPLY Dbo.usf_SplitString(Mes.[NCMIR #],',')  AS MesNcmir 
			LEFT JOIN [NAAMFG-SQL01].[Ncmir].[dbo].[vInterfaceMainExtract]  NCMIR 
			ON  --LTRIM(MesNcmir.part) = CAST(NCMIR.Number AS NVARCHAR(50)) and
			Mes.JOB =  NCMIR.JobNumber
			AND ncmir.ResponsibleMachineID = MachMap.NcmirMachineID 
			CROSS APPLY dbo.NumericParser(NCMIR.CutNumber) K 
			CROSS APPLY dbo.NumericParser(Mes.[Cut Number]) G
	WHERE G.NumericValue = COALESCE(K.NumericValue,0)
	),
cteMesNcmirCount
AS(
	SELECT DISTINCT 
	CASE WHEN ProblemDescription IS NULL THEN 0 ELSE COUNT(*) OVER (PARTITION BY M.JobNumber, M.MesCutNumber, M.SetupNumber) END  AS NumNcmirsPerJobPerCut,
	CASE WHEN M.ProblemDescription IS NULL THEN 'Yes' ELSE 'No' END AS RFT
	,m.*
	FROM cteMesNcmir M 
)
SELECT DISTINCT m.*, D.SalesForceDescription, C.NominalOD, P.Base, P.[Item No] CatalogCode
FROM cteMesNcmirCount M INNER JOIN dbo.[Basic Product Construction] P ON P.[New Oracle Part #] = M.ItemNumber
						INNER JOIN dbo.tblCableConstructionReferences R ON R.BASE = P.BASE 
						INNER JOIN dbo.tblCableConstructions C ON C.BaseID = R.BaseID
						INNER JOIN dbo.tblDesignTypes D ON D.DesignTypeID = R.DesignTypeID
						--RIGHT JOIN #Temp T ON T.NmcirNumber = M.NcmirNumber
--WHERE M.JobNumber = '15955286-2049799'


GO
