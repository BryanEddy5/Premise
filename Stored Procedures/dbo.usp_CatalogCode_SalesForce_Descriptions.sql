SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 11/1/2016
-- Description:	ALTER item description for armored items, cables, and furcation tubes for the sales force quoting system
-- Update: 12/31/2017 Removed jacket color from description
-- =============================================
CREATE PROCEDURE [dbo].[usp_CatalogCode_SalesForce_Descriptions] 
	-- Add the parameters for the stored procedure here

AS
BEGIN





--ALTERs description for all basic cables (non-armored, non-furcation)
Update dbo.tblSalesForce_Catalog 
SET Product_Quote_Description__c = K.DesignTypeDesc + ', ' + 
	Case WHEN K.Jacket = 'Riser' or K.Jacket = 'Plenum' THEN k.jacket + ' Rated'
		 ELSE k.jacket 
		 END
	+ ', ' --+ K.COLOR__c +' jacket color, ' 
	+ cast(k.FiberCount as nvarchar ) + ' ' + G.FiberDescription_SalesForce 
		+ ' fibers, ' + CAST(k.UnitOD AS NVARCHAR) + ', RoHS, ' + k.TBDescription
FROM [dbo].[tblSalesForce_Catalog] K INNER JOIN dbo.tblDesignCodeFiberElementValue G ON K.FiberID = G.FiberID
WHERE k.TBType <> 'FURCATION'

--Descriptin for furcation cables
Update dbo.tblSalesForce_Catalog 
SET Product_Quote_Description__c = K.DesignTypeDesc +  ', ' --+ K.COLOR__c +' jacket color, ' 
+ (CASE WHEN  k.FurcationTube IS NOT NULL THEN K.FurcationTube ELSE 'Furcation' END)
FROM [dbo].[tblSalesForce_Catalog] K
WHERE k.TBType = 'FURCATION'

--Update armor description for armored cables
Update dbo.tblSalesForce_Catalog 
SET Product_Quote_Description__c = Product_Quote_Description__c + ', Aluminum Interlocking armor'-- with a ' + K.ArmorJacket + ' Jacket '
FROM [dbo].[tblSalesForce_Catalog] K 
WHERE k.Armored = 1

--Update ribbon description
Update dbo.tblSalesForce_Catalog 
SET Product_Quote_Description__c = K.DesignTypeDesc + ', ' + 
	Case WHEN K.Jacket = 'Riser' or K.Jacket = 'Plenum' THEN k.jacket + ' Rated'
		 ELSE k.jacket 
		 END
	+ ', ' --+ K.COLOR__c +' jacket color, ' 
	+ cast(k.FiberCount as nvarchar ) + ' ' + G.FiberDescription_SalesForce 
		+ ' fibers, ' + CAST(k.UnitOD AS NVARCHAR) + ', RoHS, ' + k.TBDescription + ', No skew testing required'
FROM [dbo].[tblSalesForce_Catalog] K INNER JOIN dbo.tblDesignCodeFiberElementValue G ON K.FiberID = G.FiberID
WHERE k.TBType = 'RIBBON'



END


GO
