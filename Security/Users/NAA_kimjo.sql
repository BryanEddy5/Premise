IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'NAA\kimjo')
CREATE LOGIN [NAA\kimjo] FROM WINDOWS
GO
CREATE USER [NAA\kimjo] FOR LOGIN [NAA\kimjo]
GO
