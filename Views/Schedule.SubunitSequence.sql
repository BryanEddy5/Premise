SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [Schedule].[SubunitSequence]
AS
SELECT b.[New Oracle Part #] ParentItemNumber, k.OracleItem AS ItemNumber, k.[Unit ID], k.UnitNumber
FROM dbo.[Basic Product Construction] b
INNER JOIN dbo.[Unit Series] k ON k.[Unit Color Series] = b.[Unit Series]
GO
