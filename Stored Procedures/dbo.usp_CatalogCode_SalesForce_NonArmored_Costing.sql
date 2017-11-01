SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 10/19/2016
-- Description:	Costing Update for Sales Force Catalogs
-- =============================================
CREATE PROCEDURE [dbo].[usp_CatalogCode_SalesForce_NonArmored_Costing]
AS
BEGIN


-- Updates Base item's material cost (minus the fiber)

UPDATE dbo.tblSalesForce_Catalog
SET BaseCost = BaseSkeletalCost, OracleItem = AssemblyItemNumber, LoadedBaseCost = x.LoadedBaseCost
FROM dbo.tblBase_Skeletal_Cost X INNER JOIN dbo.tblSalesForce_Catalog G ON G.SetupID = X.SetupID



END


GO
