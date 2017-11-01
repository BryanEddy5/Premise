SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Bryan Eddy>
-- ALTER date: <8/10/2016>
-- Description:	<The purpose of this procedure is to calulate the Tensile Strength of all Premise Cables.
--				 This was originally developed as part of the Premise Cable Spec Sheet project
--				 Note: That stranded cables are calculated with the aramid strength contribution at 50% versus non-stranded which are 100% contribution>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TensileStrengthCalculator_AllCables]

AS
BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DECLARE @FiberStrain decimal(6,4) = .006

--This query will extract the most recent item build for each Base/Construction
IF OBJECT_ID(N'tempdb..#BaseOracleBOM', N'U') IS NOT NULL
DROP TABLE #BaseOracleBOM;

SELECT T.Base,  max(Oracle) AS AssemblyItemNumber
INTO #BaseOracleBOM
FROM 
(
	SELECT E.Base, Oracle
	FROM  dbo.[AFLPRD_INVSysItemCost_CAB] K INNER JOIN dbo.CableUnion E  ON k.ItemNumber = E.Oracle
	GROUP BY E.Base,Item_Status, E.Oracle
	HAVING E.Base Not Like '%ia%'  --AND E.Oracle Not Like '%test%' 
	AND Oracle not like '%-??bx%' AND (Oracle like '%-00' OR Oracle LIKE 'DNS%' OR Oracle LIKE '%test%')
)  AS T
GROUP BY T.Base


--Runs recursive loop to pull to explode all cable BOM's and capture the materials and subcomponents
IF OBJECT_ID(N'tempdb..#BOM_Base_StengthComponents', N'U') IS NOT NULL
DROP TABLE #BOM_Base_StengthComponents;


SELECT    K.BASE, e.FinishedGood,(e.ExtendedQuantityPer) AS ExtendedQuantityPer, SUM(CAST(E.CountPerUOM as integer) ) as NumEnds, e.ComponentItemNumber,s.Make_Buy,m.density
INTO #BOM_Base_StengthComponents
FROM  #BaseOracleBOM K CROSS APPLY [dbo].[fn_ExplodeBOM](K.AssemblyItemNumber) AS e 
INNER JOIN dbo.[AFLPRD_INVSysItemCost_CAB] s ON e.ComponentItemNumber = s.ItemNumber
LEFT OUTER JOIN [dbo].[tblMaterialWeightsMetersUOM] m ON e.ComponentItemNumber = m.Material
GROUP BY e.FinishedGood,e.CountPerUOM,e.ComponentItemNumber,ExtendedQuantityPer,s.Make_Buy,m.density, K.Base





--Extracts all strength members from exploded BOM and totals the count of those materials in the cable's BOM
IF OBJECT_ID(N'tempdb..#BOM_Base_TotalEnds', N'U') IS NOT NULL
DROP TABLE #BOM_Base_TotalEnds;

SELECT Base,ComponentItemNumber, SUM(NumEnds) as QTY
INTO #BOM_Base_TotalEnds
FROM #BOM_Base_StengthComponents INNER JOIN dbo.tblStrengthMembers K ON ComponentItemNumber = k.StrengthMember
GROUP BY Base,ComponentItemNumber

SELECT * FROM #BaseOracleBOM WHERE BASE = 'AR144-7.2-SW'


--Calculates the tensile stregth of each cable
IF OBJECT_ID(N'tempdb..#BaseTensileStrength', N'U') IS NOT NULL
DROP TABLE #BaseTensileStrength;

SELECT B.Base ,ComponentItemNumber, QTY,
		CASE
				WHEN g.CablePasses = 2 AND G.StandardOperation  LIKE '%C%' THEN --Identifies single pass cables or single tube designs 
					CASE 
						WHEN ComponentItemNumber like 'ara%' OR ComponentItemNumber like 'FGL%' THEN ROUND(K.Denier * 0.00981 * K.Modulus * B.QTY *@FiberStrain* .5,0 ) --.5 for 50% contribution from Aramid for stranded cables
						ELSE ROUND(K.Modulus * 145037.7*  PI()/4*POWER( K.FRP_OD /25.4,2) * .006 * 9.81,0)
					END
				ELSE 
					CASE											--Identifies stranded cables
						WHEN ComponentItemNumber like 'ara%' THEN ROUND(K.Denier * 0.00981 * K.Modulus * B.QTY *@FiberStrain* 1,0 ) --1 for 100% contribution from Aramid for non-stranded cables
						ELSE ROUND(K.Modulus * 145037.7*  PI()/4*POWER( K.FRP_OD /25.4,2) * .006 * 9.81,0)
					END
		END as TensileStrength_Newtons,
				CASE
			WHEN g.CablePasses = 2 AND g.StandardOperation  LIKE '%C%' THEN  'Stranded'
			ELSE 'Non-Stranded'
		END as Strand

INTO #BaseTensileStrength
FROM  #BOM_Base_TotalEnds B 
INNER JOIN dbo.tblStrengthMembers K ON B.ComponentItemNumber = K.StrengthMember
INNER JOIN dbo.tblCableConstructionReferences E ON E.BASE = B.Base
INNER JOIN dbo.tblCableConstructions G ON G.BaseID = E.BaseID

SELECT * FROM #BaseTensileStrength



--ALTERs temp table with each cable categorized into the appropriate Application, which is inserted into the Premise Design Program
IF OBJECT_ID(N'tempdb..#Base_TensileApplication', N'U') IS NOT NULL
DROP TABLE #Base_TensileApplication;

 SELECT B.Base, b.strand ,sum(TensileStrength_Newtons) as Tensile_Newtons,
	CASE
		    WHEN sum(TensileStrength_Newtons) BETWEEN 40 AND 99 THEN 'SmallForm'
			WHEN sum(TensileStrength_Newtons) BETWEEN 100 AND 219 THEN 'LightDuty' 
			WHEN sum(TensileStrength_Newtons) BETWEEN 220 AND 439 THEN 'InterconnectStd'
			WHEN sum(TensileStrength_Newtons) BETWEEN 440 AND 659 THEN
					CASE 
						  WHEN CAST(SUBSTRING(B.BASE,3,3) AS int) < 12 THEN 'IndoorHorizontal'
						  ELSE 'IndoorDowngraded'
					END
			WHEN sum(TensileStrength_Newtons) BETWEEN 660 AND 1319 THEN 
					CASE  
						   WHEN CAST(SUBSTRING(B.BASE,3,3) AS int) < 12 and substring(b.base,2,1) in ('r','a') THEN 'IndoorBackbone'
						   ELSE 'IndoorHorizontal'
					END
			WHEN sum(TensileStrength_Newtons) BETWEEN 1320 AND 1334 THEN 'IndoorBackbone'
			WHEN sum(TensileStrength_Newtons) BETWEEN 1320 AND 2669 THEN
					CASE  
						   WHEN  substring(b.base,1,1) in ('K') AND CAST(SUBSTRING(B.BASE,3,3) AS int) < 12 THEN 'Outdoor'
						   ELSE 'IndoorBackbone'
					END
			WHEN sum(TensileStrength_Newtons) BETWEEN 2670 AND 10000 THEN 'Outdoor'
			else 'NONE' 
			END as TensileApplication
INTO #Base_TensileApplication
FROM
(
	SELECT B.Base,TensileStrength_Newtons, Strand
	FROM #BaseTensileStrength B 
	INNER JOIN dbo.tblCableConstructionReferences E ON B.Base = E.Base 
	INNER JOIN dbo.tblCableConstructions K ON E.BaseID = K.BaseID
	GROUP BY B.Base,TensileStrength_Newtons, K.CablePasses,e.NumSubPositions, Strand
	--HAVING k.CablePasses = @CablePasses OR (e.NumSubPositions < 2 AND e.NumSubPositions <> 0) --Currently filtering for 2 pass cables that are stranded
) B
GROUP BY B.Base, B.Strand
HAVING SUBSTRING(B.BASE,3,3) not like '%x%' and  SUBSTRING(B.BASE,3,3) not like '%-%' --Removes any bases that could cause an issue with cast to integer conversion
ORDER BY sum(TensileStrength_Newtons)



--UPDATE E
--Set E.TensileApplication = K.TensileApplication
SELECT k.TensileApplication as NewTensileApplication, b.TensileApplication, e.Base, K.Tensile_Newtons, B.CablePasses, NumSubPositions, Strand
FROM #Base_TensileApplication K INNER JOIN dbo.tblCableConstructionReferences E ON k.base = E.Base 
INNER JOIN dbo.tblCableConstructions b ON E.BaseID = b.BaseID
WHERE  (k.TensileApplication <> b.TensileApplication OR b.TensileApplication is null) AND k.TensileApplication <> 'NONE'
--AND ReleasedDesign = 1



SELECT Base, TensileApplication, Active, ReleasedDesign, NumSubPositions,  E.CablePasses
FROM dbo.tblCableConstructionReferences K INNER JOIN dbo.tblCableConstructions E ON K.BaseID = E.BaseID
WHERE TensileApplication is null AND ReleasedDesign = 1 --AND CablePasses = 2
ORDER BY Base


IF OBJECT_ID(N'dbo.tblCalculatedTensileStrength', N'U') IS NOT NULL
DROP TABLE dbo.tblCalculatedTensileStrength;

SELECT e.Base,k.TensileApplication,  K.Tensile_Newtons
INTO dbo.tblCalculatedTensileStrength
FROM #Base_TensileApplication K INNER JOIN dbo.tblCableConstructionReferences E ON k.base = E.Base 
INNER JOIN dbo.tblCableConstructions b ON E.BaseID = b.BaseID


END



GO
GRANT EXECUTE ON  [dbo].[usp_TensileStrengthCalculator_AllCables] TO [SPB spb_PREMISE]
GO
