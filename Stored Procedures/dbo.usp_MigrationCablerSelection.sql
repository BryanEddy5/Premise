SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/*Migration to cabler selection*/

CREATE PROC [dbo].[usp_MigrationCablerSelection]
as

--Update Cust Spec Table
UPDATE C
SET Cabler = 'CL08'
FROM dbo.[Cust Order Specifications] C 
INNER JOIN dbo.[Basic Product Construction] B ON C.[Item No] = B.[New Oracle Part #]
INNER JOIN dbo.tblCableConstructionReferences R ON R.Base = B.Base
INNER JOIN dbo.tblCableConstructions i ON i.BaseID = R.BaseID
CROSS APPLY  dbo.SDF_SplitString(i.StandardOperation,'-') e 
WHERE e.part LIKE 'c%'


--Update primary cabler in configurator
UPDATE j
SET j.PrimaryCabler = 'CL08' 
FROM dbo.tblCableConstructionReferences R
INNER JOIN dbo.tblCableConstructions i ON i.BaseID = R.BaseID
CROSS APPLY  dbo.SDF_SplitString(i.StandardOperation,'-') e 
INNER JOIN dbo.[Buff#1/#2 Alloc Table] j ON j.PrefixID = R.PrefixID
WHERE e.part LIKE 'c%'
GO
