IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'Oracle')
CREATE LOGIN [Oracle] WITH PASSWORD = 'p@ssw0rd'
GO
CREATE USER [Oracle] FOR LOGIN [Oracle]
GO
