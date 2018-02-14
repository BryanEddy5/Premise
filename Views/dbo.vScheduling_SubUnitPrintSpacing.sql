SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [dbo].[vScheduling_SubUnitPrintSpacing]
AS
SELECT DISTINCT
    dbo.CableUnion.Oracle,
    dbo.CableUnion.Customer,
    tblUnitSeriesTemplate.PrintSpacing AS [print spacing],
    [Unit Series].[Unit Color Series],
    [Basic Product Construction].[Item No] AS [unit type],
    tblUnitSeriesTemplate.PrintSpacing,
    [Basic Product Construction].[Item No],
    [Basic Product Construction].[New Oracle Part #]
	,tblUnitSeriesTemplate.UnitNumber
FROM [Basic Product Construction]
    INNER JOIN(tblUnitSeriesTemplate
    RIGHT JOIN((dbo.CableUnion
    INNER JOIN [Unit Series]
        ON dbo.CableUnion.[Unit Series] = [Unit Series].[Unit Color Series])
    INNER JOIN tblCableConstructionReferences
        ON dbo.CableUnion.Base = tblCableConstructionReferences.Base)
        ON (tblUnitSeriesTemplate.UnitNumber = [Unit Series].UnitNumber)
           AND (tblUnitSeriesTemplate.UnitIDTypeNumber = tblCableConstructionReferences.UnitIDTypeNumber))
        ON [Basic Product Construction].[New Oracle Part #] = [Unit Series].OracleItem;


GO
