SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [Schedule].[vCableDesignType]
as

SELECT B.[New Oracle Part #] AS ItemNumber,B.[Item No] AS CatalogCode,g.DesignTypeGroupDesc, d.DesignTypeGroupID,T.CableType, T.CableID, C.CablePasses
FROM dbo.tblCableConstructionReferences r
INNER JOIN dbo.[Basic Product Construction] B ON B.Base = r.Base
INNER JOIN dbo.tblCableConstructions C ON C.BaseID = r.BaseID
INNER JOIN dbo.tblCableType T ON T.CableType = r.CableType
INNER JOIN dbo.tblDesignTypes d ON d.DesignTypeID = r.DesignTypeID
INNER JOIN dbo.tblDesignTypeGroups g ON g.DesignTypeGroupID = d.DesignTypeGroupID 
GO
