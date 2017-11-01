SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 10/5/2016
-- Description:	Generate the catalog code and attributes for Sales Force Quoting - Furcation Cables
-- =============================================
CREATE PROCEDURE [dbo].[usp_CatalogCode_SalesForce_Furcation] 

AS
BEGIN



INSERT INTO tblSalesForce_Catalog
                         (CatalogCode
						 , Base
						 , Weight_kg_per_m
                         ,DesignTypeDesc
						 , Jacket
						 , TBType
						 , TBDescription
						 , NominalOD
						 , NumSubFillers
						 , NumSubPositions
						 ,CablePasses
						 ,FiberCount
						 ,UnitOD
						 ,baseid
						 ,DesignTypeID
						 ,Armored
						 ,Boxed
						 ,Fiber_Type__c
						 ,Min_Order_Quantity__c
						 ,FiberID
						 , FinishedCableColor,TBLetter
						 ,FurcationTube
						 ,SetupID
						 ,Active
						 ,Non_Standard
						 ,ProdLevel3)
SELECT DISTINCT 
                         LEFT(tblCableConstructionReferences.DesignCode, 5) + '@' + SUBSTRING(tblCableConstructionReferences.DesignCode, 6, 2) 
                         + tblDesignCodeFiberElementValue.CablePrintType +  tblDesignCodeJacketColor.ColorLetter + CASE WHEN dbo.tblFurcationTubeReference.BaseID IS NULL 
                         THEN '0' ELSE dbo.tblDesignCodeFurcationTube.FurcationLetter END + tblCableTBType.TBLetter + CASE WHEN [DesignExtension] IS NULL 
                         THEN '' ELSE [DesignExtension] END + tblDesignCodeFiberElementValue.FiberExt AS CatalogCode
						 , tblCableConstructionReferences.Base
						 , tblBOM_Base_Weight.Weight AS Weight_kg_per_m
						 , tblDesignTypes.SalesForceDescription
						 , JacketDescription_SalesForce
						 , tblCableConstructionReferences.TBType
						 , tblCableTBType.TightBufferDescription_SalesForce
                         ,tblCableConstructions.NominalOD
						 , tblCableConstructionReferences.NumSubFillers
						 , tblCableConstructionReferences.NumSubPositions 
						 , tblCableConstructions.CablePasses
						 ,NumSubPositions FiberCount
						 ,CASE WHEN tblDesignTypes.DesignTypeID = 21 THEN substring(tblCableConstructionReferences.DesignCode, 6,2) 
						 ELSE (substring(tblCableConstructionReferences.DesignCode, 6,1) + '.' + substring(tblCableConstructionReferences.DesignCode, 7,1))+' mm'  END UnitOD
						 ,tblCableConstructionReferences.BaseID
						 , dbo.tblCableConstructionReferences.DesignTypeID
						 ,0 Armored
						 ,0 Boxed
						 ,Fiber_Type__c
						 ,tblDesignTypes.Min_Order_Quantity__c
						 ,FiberID
						 ,tblDesignCodeFiberElementValue.PreferedCableColor
						,tblCableTBType.TBLetter
						,tblDesignCodeFurcationTube.FurcationTube
						,tblCableConstructionReferences.SetupID
						,tblCableConstructionReferences.Active
						,tblCableTBType.Non_Standard_Product
						,tblDesignTypeGroups.DesignTypeGroupDesc
FROM            tblDesignCodeFiberElementValue INNER JOIN
                         tblCableTBType INNER JOIN
                         tblDesignCodeJacketColor AS tblDesignCodeJacketColor_1 INNER JOIN
                         tblDesignCodeJacketColor INNER JOIN
                         tblCableConstructionReferences INNER JOIN
                         tblCableTightBufferReference ON tblCableConstructionReferences.TBType = tblCableTightBufferReference.TBType INNER JOIN
                         tblCableConstructions ON tblCableConstructionReferences.BaseID = tblCableConstructions.BaseID ON 
                         tblDesignCodeJacketColor.CablePasses = tblCableConstructions.CablePasses ON 
                         tblDesignCodeJacketColor_1.CablePasses = tblCableConstructions.CablePasses ON tblCableTBType.TBIndicatorID = tblCableTightBufferReference.TBTypeID ON 
                         tblDesignCodeFiberElementValue.PreferedCableColor = tblDesignCodeJacketColor.ColorLetter INNER JOIN
                         tblDesignTypes ON tblCableConstructionReferences.DesignTypeID = tblDesignTypes.DesignTypeID INNER JOIN
                         tblDesignTypeGroups ON tblDesignTypes.DesignTypeGroupID = tblDesignTypeGroups.DesignTypeGroupID INNER JOIN
                         tblDesignCodeJacket ON tblCableConstructionReferences.CableFamily = tblDesignCodeJacket.CableLetter AND 
                         tblCableConstructionReferences.CableLevel1 = tblDesignCodeJacket.JacketLetter LEFT OUTER JOIN
                         tblFurcationTubeReference ON tblCableConstructions.BaseID = tblFurcationTubeReference.BaseID LEFT OUTER JOIN
                         tblDesignCodeFurcationTube ON tblFurcationTubeReference.Furcation = tblDesignCodeFurcationTube.Furcation LEFT OUTER JOIN
                         tblBOM_Base_Weight ON tblCableConstructionReferences.Base = tblBOM_Base_Weight.BASE
WHERE         (tblDesignCodeFiberElementValue.Active = 1) AND tblCableConstructionReferences.ApprovedForQuoting = 1 AND
                         (tblDesignCodeJacketColor.FinsishedCableColorPosition = 1) AND (tblDesignCodeJacketColor_1.SubunitCableColorPostion = 1) AND 
                         (tblDesignCodeFiberElementValue.FiberLetter = '@') AND (tblCableConstructionReferences.DesignTypeID IS NOT NULL) AND (tblDesignTypes.Active = 1) AND 
                         (tblDesignTypeGroups.Active = 1) AND (tblCableConstructionReferences.TBType = 'Furcation') AND (tblCableConstructionReferences.ApprovedForQuoting = 1)




END



GO
