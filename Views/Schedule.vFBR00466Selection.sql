SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [Schedule].[vFBR00466Selection]
AS
SELECT Name, [Item Number], [Lot Number], Locator, [Box Number], [Onhand Qty]
FROM dbo.fi_fiber_length_extract_AFLPRD
WHERE ([Item Number] LIKE 'FBR00356%' OR [Item Number] LIKE 'FBR00374%') AND [MFD 1310nm] BETWEEN 8.7000 AND 9.2000
GO
