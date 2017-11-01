SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [Schedule].[vInterfaceItemAttributes]
AS
SELECT g.[New Oracle Part #] AS ItemNumber, g.[Jacket Color] CableColor, p.NominalOD
FROM dbo.[Basic Product Construction] G INNER JOIN dbo.tblCableConstructionReferences K ON K.BASE = G.Base
INNER JOIN dbo.tblCableConstructions P ON P.BaseID = K.BaseID
GO
