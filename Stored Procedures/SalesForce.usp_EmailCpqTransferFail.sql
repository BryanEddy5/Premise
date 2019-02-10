SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 12/7/2018
-- email to notify product engineering of an issue with CPQ data

-- =============================================
CREATE PROCEDURE [SalesForce].[usp_EmailCpqTransferFail] (@NumRecords as INT = 0)

AS

EXECUTE AS USER = 'dbo' 

SET ANSI_NULLS OFF;
SET NOCOUNT ON;

BEGIN


	DECLARE @Receipientlist varchar(1000)

	SET @ReceipientList = (STUFF((SELECT ';' + UserEmail 
							FROM tblConfiguratorUser G  INNER JOIN users.UserResponsibility  K ON  G.UserID = K.UserID
  							WHERE K.ResponsibilityID = 5 FOR XML PATH('')),1,1,''))

	DECLARE @body1 VARCHAR(MAX)
	DECLARE @subject VARCHAR(MAX)
	DECLARE @Body VARCHAR(MAX)
	SET @subject = 'CPQ Data Load Fail - ' + CAST(getdate() AS NVARCHAR)
	SET @Body = 'There are  ' + CAST(@NumRecords AS NVARCHAR) + ' CPQ records.  This data failed to load to CPQ' +CHAR(13)+CHAR(13)
		
	EXEC msdb.dbo.sp_send_dbmail 
	@recipients=@ReceipientList,
	@blind_copy_recipients = 'Bryan.Eddy@aflglobal.com',
	@subject = @subject,
	@body = @Body,
	@body_format = 'HTML';


END
GO
