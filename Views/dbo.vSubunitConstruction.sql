SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [dbo].[vSubunitConstruction]
AS

SELECT P.ProductID, K.Base, K.BaseID, NominalOD, FiberCount, FibersPerBundle, P.SubFiller
FROM [Product Desrcriptions] P INNER JOIN tblCableConstructionReferences K ON K.BASE = P.[Level 1 Product]
INNER JOIN tblCableConstructions G ON G.BaseID = K.BaseID
--WHERE SubFiller = 0


GO
