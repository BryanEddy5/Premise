SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW  [dbo].[FurcationTube_Fill_Ratio]

as


--SELECT Base, NominalOD,NominalWall,  AvailableArea,  StrengthMemberArea, FurcationTube,Furcation,  FurcationArea,TBNomOD,round(FurcationArea +StrengthMemberArea,4) as OccupiedArea,
-- round((StrengthMemberArea) /   AvailableArea *100,1) as FillRatio_Aramid, round((StrengthMemberArea +FurcationArea) /   AvailableArea *100,1) as FillRatio_Total
--FROM
--(
--	SELECT  Base, NominalOD,NominalWall,  round(AvailableArea,4) as AvailableArea, round(sum(StrengthMemberArea * CountPerUOM),4) as StrengthMemberArea, FurcationTube,Furcation,
--	Case WHEN BASE LIKE 'D%' THEN  2
--	ELSE 1 
--	END * round(pi()*POWER(TBNomOD,2)/4,4) as FurcationArea,
--	TBNomOD
--	FROM
--	(
--		SELECT G.Base, NominalOD,NominalWall, ComponentItemNumber, 
--		CASE WHEN G.Base like 'z%' then BOM.CountPerUOM/2
--		else BOM.CountPerUOM
--		end as CountPerUOM , pi()*POWER((NominalOD - 2*NominalWall),2)/4 AS AvailableArea
--		, SpecificGravity * 9000 * 1000 *0.0000815 as StrengthMemberArea, FurcationTube, t.TBNomOD,T.Furcation
--		FROM dbo.tblFurcationTubeReference E 
--		INNER JOIN dbo.tblCableConstructions K ON K.BaseID = E.BaseID 
--		INNER JOIN dbo.tblCableConstructionReferences G ON G.BaseID = K.BaseID
--		INNER JOIN dbo.tblDesignCodeFurcationTube T ON T.Furcation = E.Furcation
--		INNER JOIN dbo.vOracleBaseItems Q ON Q.SetupID = G.SetupID
--		INNER JOIN dbo.AFLPRD_BOMInvComp_CAB BOM ON BOM.AssemblyItemNumber = Q.AssemblyItemNumber
--		INNER JOIN dbo.tblMaterialDensity Mat ON MAT.Compound = BOM.ComponentItemNumber
--		WHERE ComponentItemNumber LIKE 'ARA%' and ReleasedDesign = 1
--	) X
--	GROUP BY Base, NominalOD,NominalWall, ComponentItemNumber, CountPerUOM,  AvailableArea, FurcationTube, TBNomOD,Furcation
--)X 
----WHERE --Furcation = 'FRC00006'
----BASE LIKE 'Sf%2.0%'

----Upper boundary fro FillRatio_Aramid < 40% and Fillratio_Total < 90%

------ 2.0 and below all should be 600

--ORDER BY FillRatio_Total desc, NominalWall 


SELECT  Base, NominalOD,NominalWall,  AvailableArea,  StrengthMemberArea--, FurcationTube,Furcation
,  FurcationArea,X.TBNomOD,round(FurcationArea +StrengthMemberArea,4) as OccupiedArea,
 round((StrengthMemberArea) /   AvailableArea *100,1) as FillRatio_Aramid, round((StrengthMemberArea +FurcationArea) /   AvailableArea *100,1) as FillRatio_Total,ComponentItemNumber,Qty
 ,dbo.usf_TensileStrengthCalculator(AssemblyItemNumber) as TensileStrength_N,JacketMaterial,SetupID as ID--, Furcation,BaseID,FurcationTube
FROM
(
	SELECT  Base, NominalOD,NominalWall,  round(AvailableArea,4) as AvailableArea, round(sum(StrengthMemberArea * CountPerUOM),4) as StrengthMemberArea,-- FurcationTube,Furcation,
	Case WHEN BASE LIKE 'D%' THEN  2
	ELSE 1 
	END * round(pi()*POWER(TBNomOD,2)/4,4) as FurcationArea,Qty,
	TBNomOD,ComponentItemNumber,AssemblyItemNumber,JacketMaterial,SetupID,BaseID
	FROM
	(
		SELECT G.Base, NominalOD,NominalWall, ComponentItemNumber, bom.CountPerUOM as Qty,g.SetupID,
		CASE WHEN G.Base like 'z%' then BOM.CountPerUOM/2
		else BOM.CountPerUOM
		end as CountPerUOM , pi()*POWER((NominalOD - 2*NominalWall),2)/4 AS AvailableArea
		, SpecificGravity * 9000 * 1000 *0.0000815 as StrengthMemberArea,t.TBNomOD, Q.AssemblyItemNumber,K.JacketMaterial, K.BaseID--, FurcationTube, T.Furcation
		FROM 
		dbo.tblCableConstructions K 
		INNER JOIN dbo.tblCableConstructionReferences G ON G.BaseID = K.BaseID
		CROSS APPLY (SELECT DISTINCT tbNomOD FROM dbo.tblDesignCodeFurcationTube WHERE FurcationLetter not in ('0','b')) T 
		INNER JOIN dbo.vOracleBaseItems Q ON Q.SetupID = G.SetupID
		INNER JOIN dbo.AFLPRD_BOMInvComp_CAB BOM ON BOM.AssemblyItemNumber = Q.AssemblyItemNumber
		INNER JOIN dbo.tblMaterialDensity Mat ON MAT.Compound = BOM.ComponentItemNumber
		WHERE ComponentItemNumber LIKE 'ARA%' and ReleasedDesign = 1 AND G.DesignTypeID IN (2,1) --and  G.base like 'Sf000-2.0C'
		 AND TBType like 'furcation%' --and CableLevel1 ='f'
		AND G.Base NOT LIKE '%MOLEX%'
	) X 
	GROUP BY Base, NominalOD,NominalWall, ComponentItemNumber, CountPerUOM,  AvailableArea, TBNomOD,ComponentItemNumber,qty,AssemblyItemNumber,JacketMaterial,SetupID,BaseID--, FurcationTube,Furcation
)X --INNER JOIN tblDesignCodeFurcationTube G ON X.TBNomOD = G.TBNomOD

WHERE round((StrengthMemberArea +FurcationArea) /   AvailableArea *100,1) < 90 AND round((StrengthMemberArea) /   AvailableArea *100,1) < 40
AND round((StrengthMemberArea +FurcationArea) /   AvailableArea *100,1) > 40 

GO
