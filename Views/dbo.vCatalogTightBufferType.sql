SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO








CREATE VIEW [dbo].[vCatalogTightBufferType]
as

SELECT [New Oracle Part #], [Item No], K.Base
	  ,BaseID
	  ,OracleTBDesc
	  ,TBLetter

FROM vSchedulingCableUnion INNER JOIN tblCableConstructionReferences K ON vSchedulingCableUnion.Base = K.Base 
	 INNER JOIN dbo.tblCableTightBufferReference G ON K.TBType = G.TBType
	 INNER JOIN dbo.tblCableTBType E ON G.TBTypeID = E.TBIndicatorID
	 WHERE substring([Item No],12,1) = TBLetter












GO
