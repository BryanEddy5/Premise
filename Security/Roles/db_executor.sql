CREATE ROLE [db_executor]
AUTHORIZATION [dbo]
EXEC sp_addrolemember N'db_executor', N'NAA\SPB Premise SQL RO'

EXEC sp_addrolemember N'db_executor', N'NAA\SPB spb_PREMISE_RO'

EXEC sp_addrolemember N'db_executor', N'SPB Premise SQL RW'

EXEC sp_addrolemember N'db_executor', N'SPB_Premise_RW'
GRANT EXECUTE TO [db_executor]

EXEC sp_addrolemember N'db_executor', N'SPB spb_PREMISE'


EXEC sp_addrolemember N'db_executor', N'NAA\SPB Users'


GO
EXEC sp_addrolemember N'db_executor', N'NAA\eddybc'
GO
EXEC sp_addrolemember N'db_executor', N'NAA\service_spbcable'
GO
