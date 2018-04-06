SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- =============================================
-- Author:		Bryan Eddy
-- ALTER date:	2/15/2017
-- Description:	Send out emails to notify approvers of constructions awaiting for approval.
	Version:	2
	Update:		1. Added in a date differential to give more time before notification
				2. Put results into a table with differential of days the request has been open.
-- =============================================
*/
CREATE PROCEDURE [dbo].[usp_CutSheet_Email_Reminder]


AS

EXECUTE AS USER = 'dbo' 

SET ANSI_NULLS OFF;
SET NOCOUNT ON;

--Run around 8:30am everyday
DECLARE @numRows int
DECLARE @Receipientlist VARCHAR(1000)


--Check if any open item requests need commercial approval
IF OBJECT_ID(N'tempdb..#Results', N'U') IS NOT NULL
DROP TABLE #Results;
SELECT ItemRequested, Base, RequestedDate, Requestor, DATEDIFF(DAY,RequestedDate,GETDATE()) DaysOpen, CASE WHEN Commercial_Approval = 1 THEN 'Yes' ELSE 'No' END ApprovedByCommercial
, CASE WHEN Technical_Approval = 1 THEN 'Yes' ELSE 'No' END	ApprovedByEngineer
INTO #Results
FROM tblCutSheetApproval
WHERE Requested = 1 AND (Technical_Approval =0 OR Commercial_Approval = 0) and DATEDIFF(DD,RecordCreationDate,GETDATE()) > 3

SET @ReceipientList = (STUFF((SELECT ';' + UserEmail FROM tblConfiguratorUser I
						INNER JOIN Users.UserResponsibility K ON K.UserID = I.UserID
						 WHERE k.ResponsibilityID IN (2,3) FOR XML PATH('')),1,1,''))

SELECT @numRows = COUNT(*) FROM #Results

DECLARE @body1 VARCHAR(MAX)
DECLARE @subject VARCHAR(MAX)
DECLARE @query VARCHAR(MAX) = N'SELECT * FROM tempdb..#Results;'
SET @subject = 'PAST DUE - Premise Cut Sheet Request ' + CAST(GETDATE() AS NVARCHAR)
SET @body1 = 'There are  ' + CAST(@numRows AS NVARCHAR) + ' constructions awaiting approval.  Please review.' +CHAR(13)+CHAR(13)



DECLARE @tableHTML  NVARCHAR(MAX) ;
IF @numRows > 0
BEGIN
	
				SET @tableHTML =
				N'<H1>Open Cut Sheet Approval Report</H1>' +
				N'<p>'+@body1+'</p>' +
				N'<p class=MsoNormal><span style=''font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D''>'+
				N'<table border="1">' +
				N'<tr><th>Base</th><th>Item</th><th>Days Open</th>' +
				N'<th>Requestor</th><th>Approved By Commercial</th>' +
				N'<th>Approved by Engineer</th></tr>' +
				CAST ( ( SELECT		td=Base,       '',
									td=ItemRequested, '',
									td=DaysOpen, '',
									td=Requestor,'',
									td=ApprovedByCommercial,'',
									td=ApprovedByEngineer,''

							FROM #Results 
							ORDER BY DaysOpen desc
						  FOR XML PATH('tr'), TYPE 
				) AS NVARCHAR(MAX) ) +
				N'</table>' ;
			--SET @tableHTML =
			--	N'<H1>Premise Cut Sheet Approval</H1>' +
			--	N'<p>'+@body1+'</p>' +
			--	N'</table>' ;
		
			EXEC msdb.dbo.sp_send_dbmail 
			@recipients=@ReceipientList,
			--@recipients = 'Bryan.Eddy@aflglobal.com',
			@blind_copy_recipients = 'Bryan.Eddy@aflglobal.com',
			@subject = @subject,
			@body = @tableHTML,
			@body_format = 'HTML';
			


END




GO
