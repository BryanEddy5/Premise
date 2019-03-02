CREATE ROLE [db_executor]
AUTHORIZATION [dbo]
EXEC sp_addrolemember N'db_executor', N'SPB spb_PREMISE'
GRANT EXECUTE TO [db_executor]

EXEC sp_addrolemember N'db_executor', N'NAA\SPB Users'


GO
EXEC sp_addrolemember N'db_executor', N'NAA\eddybc'
GO
EXEC sp_addrolemember N'db_executor', N'NAA\service_spbcable'
GO
