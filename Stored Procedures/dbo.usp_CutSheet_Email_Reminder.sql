SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/*
-- =============================================
-- Author:		Bryan Eddy
-- ALTER date:	2/15/2017
-- Description:	Send out emails to notify approvers of constructions awaiting for approval.
	Version:	1
	Update:		Added in a date differential to give more time before notification
-- =============================================
*/
CREATE PROCEDURE [dbo].[usp_CutSheet_Email_Reminder]

@ApproverType AS TINYINT
AS

EXECUTE AS USER = 'dbo' 

SET ANSI_NULLS OFF;
SET NOCOUNT ON;

--Run around 8:30am everyday
DECLARE @numRows int
DECLARE @Receipientlist VARCHAR(1000)


--Check if any open item requests need commercial approval

IF @ApproverType = 2
BEGIN
	SELECT @numRows =COUNT(*)
	FROM tblCutSheetApproval
	WHERE Requested = 1 AND Commercial_Approval =0 AND DATEDIFF(DD,RecordCreationDate,GETDATE()) > 3
END

IF @ApproverType = 1
BEGIN
	SELECT @numRows =COUNT(*)
	FROM tblCutSheetApproval
	WHERE Requested = 1 AND Technical_Approval =0 AND DATEDIFF(DD,RecordCreationDate,GETDATE()) > 3
END


SET @ReceipientList = (STUFF((SELECT ';' + UserEmail FROM tblConfiguratorUser WHERE CutSheetApprover = @ApproverType AND UserTypeID = 2 FOR XML PATH('')),1,1,''))

DECLARE @body1 VARCHAR(MAX)
DECLARE @subject VARCHAR(MAX)
SET @subject = 'PAST DUE - Premise Cut Sheet Request ' 
SET @body1 = 'There are  ' + CAST(@numRows AS NVARCHAR) + ' constructions awaiting approval.  Please review.' +CHAR(13)+CHAR(13)


DECLARE @tableHTML  NVARCHAR(MAX) ;
IF @numRows > 0
BEGIN
	
			SET @tableHTML =
				N'<H1>Premise Cut Sheet Approval</H1>' +
				N'<p>'+@body1+'</p>' +
				N'</table>' ;
		
			EXEC msdb.dbo.sp_send_dbmail @recipients=@ReceipientList,
			@blind_copy_recipients = 'Bryan.Eddy@aflglobal.com',
			@subject = @subject,
			@body = @tableHTML,
			@body_format = 'HTML';
			


END




GO
