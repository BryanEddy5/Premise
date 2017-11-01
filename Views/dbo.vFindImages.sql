SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[vFindImages]
as 
SELECT DISTINCT left(DesignCode,1) + 'X' + RIGHT(DESIGNCODE,4) DesignCode, CablePasses, CableFamily, MAX(Base) AS Base
FROM tblCableConstructionReferences K INNER JOIN tblCableConstructions G ON G.BaseID = K.BaseID
GROUP BY left(DesignCode,1) + 'X' + RIGHT(DESIGNCODE,4), CablePasses, CableFamily, ReleasedDesign, ApprovedForQuoting
HAVING ReleasedDesign = 1 AND ApprovedForQuoting = 1 --and DesignCode like 'b%'
GO
