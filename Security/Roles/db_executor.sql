CREATE ROLE [db_executor]
AUTHORIZATION [dbo]
GO
EXEC sp_addrolemember N'db_executor', N'NAA\eddybc'
GO
EXEC sp_addrolemember N'db_executor', N'NAA\service_spbcable'
GO
GRANT EXECUTE TO [db_executor]
