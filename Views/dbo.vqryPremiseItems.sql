SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[vqryPremiseItems]
as

Select [New Oracle Part #] as OracleItemNumber, [Item No] as CatalogNumber, Customer, Active, CustomerRev, Enumber, base from [Basic Product Construction]
--UNION Select  [New Oracle Part Number] as OracleItemNumber, [Item No] as CatalogNumber, Customer, Active, CustomerRev, Enumber, base from [Basic (Cable/Sheath)];



GO
