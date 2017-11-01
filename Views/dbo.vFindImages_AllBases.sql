SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [dbo].[vFindImages_AllBases]
as 
SELECT  left(DesignCode,1) + 'X' + substring(DESIGNCODE,3,3) DesignCode, CablePasses, CableFamily, Base
FROM tblCableConstructionReferences K INNER JOIN tblCableConstructions G ON G.BaseID = K.BaseID
where ReleasedDesign = 1 AND ApprovedForQuoting = 1--and base like 'zp%'
--and len(designcode) < 7

GO
