SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/*
AUTHOR:		Bryan Eddy
Date:		4/20/2018
Desc:		View of all active fillers
Version:	1
Update:		n/a

*/

CREATE VIEW [dbo].[vFillersActive]
AS
SELECT DISTINCT K.Oracle, K.ItemNo
FROM dbo.tblCableConstructionReferences J INNER JOIN dbo.[Product Desrcriptions] I ON I.ProductID = J.ProductID
INNER JOIN dbo.CableUnion K ON K.BASE = I.[Level 1 Product]
WHERE I.SubFiller = 1 AND K.Active = 1 AND K.[Item No] LIKE '__000@%'
GO
