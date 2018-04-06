SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/*
-- =============================================
Author:			Bryan Eddy
Date:			2/28/2018
Desc:			Get an existing items by base.  Calculations based on Oracle data must exist in the oracle information.
				This will be used to get a differing base item for BOM calculations
-- =============================================
*/
CREATE FUNCTION [dbo].[GetExistingOracleItemByBase]
(	
	-- Add the parameters for the function here
	@Item nvarchar(50)
)
returns
@ExistingItem table
(
   -- Returned table layout
   ExistingItem NVARCHAR(50)

)

AS
BEGIN
INSERT INTO @ExistingItem(ExistingItem)
SELECT DISTINCT TOP 1 Existing.Oracle--, new.Oracle, Existing.BASE, Existing.DateCreated
FROM dbo.AFLPRD_BOMInvComp_CAB k INNER JOIN dbo.CableUnion Existing ON Existing.Oracle = K.AssemblyItemNumber
INNER JOIN dbo.CableUnion New ON Existing.BASE = New.BASE
WHERE New.Oracle NOT LIKE '%OSP%' AND NEW.Oracle = @Item
ORDER BY Existing.Oracle DESC

RETURN
END
GO
