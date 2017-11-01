IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'NAA\meltosj')
CREATE LOGIN [NAA\meltosj] FROM WINDOWS
GO
CREATE USER [NAA\meltosj] FOR LOGIN [NAA\meltosj]
GO
