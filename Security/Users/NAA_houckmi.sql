IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'NAA\houckmi')
CREATE LOGIN [NAA\houckmi] FROM WINDOWS
GO
CREATE USER [NAA\houckmi] FOR LOGIN [NAA\houckmi]
GO
