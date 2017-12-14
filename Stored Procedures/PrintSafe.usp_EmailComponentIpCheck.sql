SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 2/15/2017
-- automated email to check items with possibly the wrong print

-- =============================================
CREATE PROCEDURE [PrintSafe].[usp_EmailComponentIpCheck]


AS

--EXECUTE AS USER = 'dbo' 

SET ANSI_NULLS ON;
SET ANSI_WARNINGS ON;
SET NOCOUNT ON;

EXEC PrintSafe.usp_PingServer

DECLARE @numRows int
DECLARE @Receipientlist varchar(1000)

--Check for any IP Addreesses that have 'No Reply' as the status to see if there is no connection.
IF OBJECT_ID(N'tempdb..#Results', N'U') IS NOT NULL
DROP TABLE #Results;
SELECT MachineName, IpAddress, CASE WHEN IpType = 2 THEN 'Camera' ELSE 'Printer' END AS Component, Status, LastRan, I.MachineID
INTO #Results
FROM Printsafe.IpAddress K INNER JOIN [NAACAB-SCH01].PlanetTogether_Data_Prod.setup.MachineNames I ON I.MachineID = K.MACHineID
WHERE (STATUS = 'NO REPLY') OR (LastRan < DateAdd(Hour, DateDiff(Hour, 0, GetDate())-12, 0) AND  LastRan >=  DateAdd(Hour, DateDiff(Hour, 0, GetDate())-12, 0))

--SELECT * FROM #Results

SELECT @numRows = count(*) FROM #Results



SET @ReceipientList = (STUFF((SELECT ';' + UserEmail 
						FROM tblConfiguratorUser G  INNER JOIN users.UserResponsibility  K ON  G.UserID = K.UserID
  						WHERE K.ResponsibilityID = 8 FOR XML PATH('')),1,1,''))
						--WHERE g.UserTypeID = 1 FOR XML PATH('')),1,1,''))

declare @body1 varchar(max)
declare @subject varchar(max)
declare @query varchar(max) = N'SELECT * FROM tempdb..#Results;'
set @subject = 'Machine Camera and Printer IP Check' 
set @body1 = 'There are  ' + CAST(@numRows AS NVARCHAR) + ' component(s) that have no connection.' +char(13)+CHAR(13)

DECLARE @tableHTML  NVARCHAR(MAX) ;
if @numRows > 0
begin
	
			SET @tableHTML =
				N'<H1>Machine resource component IP address alert.</H1>' +
				N'<p>'+@body1+'</p>' +
				N'<p class=MsoNormal><span style=''font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D''>'+
				N'<table border="1">' +
				N'<tr><th>Machine</th><th>IpAddress</th>' +
				N'<th>Component</th><th>Status</th><th>Last Ran</th></tr>' +
				CAST ( ( SELECT		td=machinename,       '',
									td=IpAddress, '',
									td=Component, '',
									td=Status, '', 
									td=LastRan, ''
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
