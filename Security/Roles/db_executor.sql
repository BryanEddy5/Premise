CREATE ROLE [db_executor]
AUTHORIZATION [dbo]
EXEC sp_addrolemember N'db_executor', N'NAA\SPB Users'
GRANT EXECUTE TO [db_executor]

GO
EXEC sp_addrolemember N'db_executor', N'NAA\eddybc'
GO
EXEC sp_addrolemember N'db_executor', N'NAA\service_spbcable'
GO
