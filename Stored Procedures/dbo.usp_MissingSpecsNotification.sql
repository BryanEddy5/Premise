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
CREATE PROCEDURE [dbo].[usp_MissingSpecsNotification]


AS

EXECUTE AS USER = 'dbo' 

SET ANSI_NULLS OFF;
SET NOCOUNT ON;

--Run around 8:30am everyday
DECLARE @numRows int
DECLARE @Receipientlist varchar(1000)

--Check if any open item requests need commercial approval
IF OBJECT_ID(N'tempdb..#Results', N'U') IS NOT NULL
DROP TABLE #Results;
select K.[New Oracle Part #], K.[Item No], K.[Fiber Oracle item],K.FiberType2, K.FiberType3, K.DateCreated, K.CreatedBy, [Label Type], [Print Line 3], Item_Status
INTO #Results
from [Basic Product Construction] K LEFT JOIN AFLPRD_INVSysItemSpec_CAB G ON K.[New Oracle Part #] = G.ItemNumber
inner join AFLPRD_INVSysItemCost_CAB t on k.[New Oracle Part #] = t.ItemNumber
where   G.ItemNumber IS NULL AND [Fiber Oracle item] NOT IN ('NONE','FBRRD999','FBR00100' ) AND [New Oracle Part #] NOT LIKE '%OSP%' and t.Item_Status <> 'obsolete'
AND [New Oracle Part #] NOT LIKE 'FBR%' and [New Oracle Part #] not like 'rbn%' and [New Oracle Part #] not like 'swr%'

SELECT @numRows = count(*) FROM #Results




SET @ReceipientList = (STUFF((SELECT ';' + UserEmail 
						FROM tblConfiguratorUser G  INNER JOIN users.UserResponsibility  K ON  G.UserID = K.UserID
  						WHERE K.ResponsibilityID = 5 FOR XML PATH('')),1,1,''))
declare @body1 varchar(max)
declare @subject varchar(max)
declare @query varchar(max) = N'SELECT * FROM tempdb..#Results;'
set @subject = 'Missing Oracle Specs' 
set @body1 = 'There are  ' + CAST(@numRows AS NVARCHAR) + ' items are missing specs.  Please review.' +char(13)+CHAR(13)

DECLARE @tableHTML  NVARCHAR(MAX) ;
if @numRows > 0
begin
	
			SET @tableHTML =
				N'<H1>Oracle Spec Missing Report</H1>' +
				N'<p>'+@body1+'</p>' +
				N'<p class=MsoNormal><span style=''font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D''>'+
				N'<table border="1">' +
				N'<tr><th>Item</th><th>Fiber1</th>' +
				N'<th>Fiber2</th><th>Fiber3</th><th>Item No</th>' +
				N'<th>DateCreated</th><th>CreatedBy</th><th>Label Type</th></tr>' +
				CAST ( ( SELECT		td=[New Oracle Part #],       '',
									td=[Fiber Oracle item], '',
									td=FiberType2, '',
									td=FiberType3, '', 
									td=[Item No], '',
									td=DateCreated, '', 
									td=CreatedBy, '', 
									td=[Label Type], ''
							FROM #Results 
						  FOR XML PATH('tr'), TYPE 
				) AS NVARCHAR(MAX) ) +
				N'</table>' ;
			--SET @tableHTML =
			--	N'<H1>Premise Cut Sheet Approval</H1>' +
			--	N'<p>'+@body1+'</p>' +
			--	N'</table>' ;
		
			EXEC msdb.dbo.sp_send_dbmail 
			@recipients=@ReceipientList,
			@blind_copy_recipients = 'Bryan.Eddy@aflglobal.com',
			@subject = @subject,
			@body = @tableHTML,
			@body_format = 'HTML';
end

GO
