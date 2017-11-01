SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_Line_Speed_Pivot]
as
DELETE FROM dbo.tblPremise_Line_Speeds


INSERT INTO dbo.tblPremise_Line_Speeds (PrefixID, LineSpeed, MappedColumn, Machine, Setup)
Select DISTINCT K.PrefixID,[Buff#1 Line Speed] as LineSpeed, 'Buff#1 Line Speed' as 'MappedColumn','B01' as Machine, SUBSTRING(B.StandardOperation,CHARINDEX('r',B.StandardOperation),4) as Setup
FROM dbo.CableRunSpeeds K INNER JOIN dbo.tblCableConstructionReferences G ON K.PrefixID = G.PrefixID INNER JOIN dbo.tblCableConstructions B ON G.BaseID = B.BaseID
WHERE StandardOperation like  '%r%'



INSERT INTO tblPremise_Line_Speeds (PrefixID, LineSpeed, MappedColumn, Machine, Setup)
Select DISTINCT K.PrefixID,[Buff#10 Line Speed], 'Buff#10 Line Speed' as 'MappedColumn','B10' as Machine, SUBSTRING(B.StandardOperation,CHARINDEX('r',B.StandardOperation),4) as Setup
FROM CableRunSpeeds K INNER JOIN dbo.tblCableConstructionReferences G ON K.PrefixID = G.PrefixID INNER JOIN dbo.tblCableConstructions B ON G.BaseID = B.BaseID
WHERE StandardOperation like  '%r%'



INSERT INTO tblPremise_Line_Speeds (PrefixID, LineSpeed, MappedColumn, Machine, Setup)
Select DISTINCT K.PrefixID,[Buff#2 Line Speed], 'Buff#2 Line Speed' as 'MappedColumn','B02' as Machine, SUBSTRING(B.StandardOperation,CHARINDEX('r',B.StandardOperation),4) as Setup
FROM CableRunSpeeds K INNER JOIN dbo.tblCableConstructionReferences G ON K.PrefixID = G.PrefixID INNER JOIN dbo.tblCableConstructions B ON G.BaseID = B.BaseID
WHERE StandardOperation like  '%r%'


INSERT INTO tblPremise_Line_Speeds (PrefixID, LineSpeed, MappedColumn, Machine, Setup)
Select DISTINCT K.PrefixID,[Buff#11 Line Speed], 'Buff#11 Line Speed' as 'MappedColumn','B11' as Machine, SUBSTRING(B.StandardOperation,CHARINDEX('r',B.StandardOperation),4) as Setup
FROM CableRunSpeeds K INNER JOIN dbo.tblCableConstructionReferences G ON K.PrefixID = G.PrefixID INNER JOIN dbo.tblCableConstructions B ON G.BaseID = B.BaseID
WHERE StandardOperation like  '%r%'


INSERT INTO tblPremise_Line_Speeds (PrefixID, LineSpeed, MappedColumn, Machine, Setup)
Select DISTINCT K.PrefixID,[Buff#4 Line Speed], 'Buff#4 Line Speed' as 'MappedColumn','B04' as Machine, SUBSTRING(B.StandardOperation,CHARINDEX('r',B.StandardOperation),4) as Setup
FROM CableRunSpeeds K INNER JOIN dbo.tblCableConstructionReferences G ON K.PrefixID = G.PrefixID INNER JOIN dbo.tblCableConstructions B ON G.BaseID = B.BaseID
WHERE StandardOperation like  '%r%'


INSERT INTO tblPremise_Line_Speeds (PrefixID, LineSpeed, MappedColumn, Machine, Setup)
Select DISTINCT K.PrefixID,[Buff#6 Line Speed], 'Buff#6 Line Speed' as 'MappedColumn','B06' as Machine, SUBSTRING(B.StandardOperation,CHARINDEX('r',B.StandardOperation),4) as Setup
FROM CableRunSpeeds K INNER JOIN dbo.tblCableConstructionReferences G ON K.PrefixID = G.PrefixID INNER JOIN dbo.tblCableConstructions B ON G.BaseID = B.BaseID
WHERE StandardOperation like  '%r%'

INSERT INTO tblPremise_Line_Speeds (PrefixID, LineSpeed, MappedColumn, Machine, Setup)
Select DISTINCT K.PrefixID,[Buff#9 Line Speed], 'Buff#9 Line Speed' as 'MappedColumn','B09' as Machine, SUBSTRING(B.StandardOperation,CHARINDEX('r',B.StandardOperation),4) as Setup
FROM CableRunSpeeds K INNER JOIN dbo.tblCableConstructionReferences G ON K.PrefixID = G.PrefixID INNER JOIN dbo.tblCableConstructions B ON G.BaseID = B.BaseID
WHERE StandardOperation like  '%r%'

SELECT * FROM tblPremise_Line_Speeds
GO
