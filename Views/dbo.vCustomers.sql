SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW	[dbo].[vCustomers] AS

--SELECT  Customer
--FROM dbo.[Basic (Cable/Sheath)]
--WHERE active <> 0 AND Customer not like '%afl%' AND  Customer not like '%UNPRINT%'
--UNION 
SELECT   Customer, CustomerSpecialNotes, CustomerID
FROM  Customers
--WHERE Customer NOT LIKE '%UNPRINT%'







GO
