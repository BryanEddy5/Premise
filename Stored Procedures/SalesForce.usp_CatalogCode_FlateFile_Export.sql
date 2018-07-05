SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [SalesForce].[usp_CatalogCode_FlateFile_Export]
as


BEGIN
EXEC msdb.dbo.sp_start_job  
    @job_name = N'SalesForce_Catalog_Export'
END


GO
