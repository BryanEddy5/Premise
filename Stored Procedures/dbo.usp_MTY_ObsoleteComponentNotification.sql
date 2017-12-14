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
CREATE PROCEDURE [dbo].[usp_MTY_ObsoleteComponentNotification]


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

SELECT DISTINCT   ComponentItemNumber,Description, AssemblyItemStatus, CompItemStatus, NewItem--, AssemblyItemNumber
INTO #Results
FROM AFLPRD_BOMInvComp_MTY K INNER JOIN AFLPRD_INVSysItemCost_CAB G ON K.ComponentItemNumber = G.ItemNumber
LEFT JOIN PCN_History P ON P.OldItem = ComponentItemNumber
WHERE Item_Status <>'active' and AssemblyItemStatus = 'active' AND NewItem IS NULL

SELECT @numRows = count(*) FROM #Results



--SET @ReceipientList = (STUFF((SELECT ';' + UserEmail FROM tblConfiguratorUser WHERE ItemBuilder <> 0 FOR XML PATH('')),1,1,''))
SET @Receipientlist = 'AFLMTYInactiveComponentAlertDL@aflglobal.com'

declare @body1 varchar(max)
declare @subject varchar(max)
declare @query varchar(max) = N'SELECT * FROM tempdb..#Results;'
set @subject = 'MTY ALERT - Inactive Components in BOM' 
set @body1 = 'There are  ' + CAST(@numRows AS NVARCHAR) + ' inactive components in MTY BOMs.  Please review.' +char(13)+CHAR(13)

DECLARE @tableHTML  NVARCHAR(MAX) ;
if @numRows > 0
begin
	
			SET @tableHTML =
				N'<H1>MTY Inactive BOM Components</H1>' +
				N'<p>'+@body1+'</p>' +
				N'<p class=MsoNormal><span style=''font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D''>'+
				N'<table border="1">' +
				N'<tr><th>ComponentItemNumber</th><th>Description</th>' +
				N'<th>AssemblyItemStatus</th><th>CompItemStatus</th><th>NewItem</th></tr>' +
				CAST ( ( SELECT		td=ComponentItemNumber,       '',
									td=Description,       '',
									td=AssemblyItemStatus, '',
									td=CompItemStatus, '',
									td=NewItem, ''
							FROM #Results 
						  FOR XML PATH('tr'), TYPE 
				) AS NVARCHAR(MAX) ) +
				N'</table>' ;
			--SET @tableHTML =
			--	N'<H1>Premise Cut Sheet Approval</H1>' +
			--	N'<p>'+@body1+'</p>' +
			--	N'</table>' ;
		
			EXEC msdb.dbo.sp_send_dbmail 
			@recipients=@Receipientlist,
			@blind_copy_recipients = 'Bryan.Eddy@aflglobal.com',
			@subject = @subject,
			@body = @tableHTML,
			@body_format = 'HTML';
end

GO
