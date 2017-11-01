SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 2/15/2017
-- Description:	Send out emails to notify approvers of constructions awaiting for approval.
-- Job has been ALTERd to run automatically with these notifications
-- =============================================
CREATE PROCEDURE [dbo].[usp_CutSheet_Email_Reminder]

@ApproverType as tinyint
AS

EXECUTE AS USER = 'dbo' 

SET ANSI_NULLS OFF;
SET NOCOUNT ON;

--Run around 8:30am everyday
DECLARE @numRows int
DECLARE @Receipientlist varchar(1000)


--Check if any open item requests need commercial approval

IF @ApproverType = 2
BEGIN
	SELECT @numRows =count(*)
	FROM tblCutSheetApproval
	WHERE Requested = 1 AND Commercial_Approval =0 
END

IF @ApproverType = 1
BEGIN
	SELECT @numRows =count(*)
	FROM tblCutSheetApproval
	WHERE Requested = 1 AND Technical_Approval =0 
END


SET @ReceipientList = (STUFF((SELECT ';' + UserEmail FROM tblConfiguratorUser WHERE CutSheetApprover = @ApproverType AND UserTypeID = 2 FOR XML PATH('')),1,1,''))

declare @body1 varchar(max)
declare @subject varchar(max)
set @subject = 'PAST DUE - Premise Cut Sheet Request ' 
set @body1 = 'There are  ' + CAST(@numRows AS NVARCHAR) + ' constructions awaiting approval.  Please review.' +char(13)+CHAR(13)


DECLARE @tableHTML  NVARCHAR(MAX) ;
if @numRows > 0
begin
	
			SET @tableHTML =
				N'<H1>Premise Cut Sheet Approval</H1>' +
				N'<p>'+@body1+'</p>' +
				N'</table>' ;
		
			EXEC msdb.dbo.sp_send_dbmail @recipients=@ReceipientList,
			@blind_copy_recipients = 'Bryan.Eddy@aflglobal.com',
			@subject = @subject,
			@body = @tableHTML,
			@body_format = 'HTML';
			


end




GO
