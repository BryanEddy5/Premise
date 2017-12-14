SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Bryan Eddy
-- ALTER date:	11/6/2017
-- Desc:		Finding items with obsolete components.

-- =============================================
CREATE PROCEDURE [dbo].[usp_EmailActiveItemsWithObsoleteComponents]


AS

EXECUTE AS USER = 'dbo' 

SET ANSI_NULLS OFF;
SET NOCOUNT ON;


DECLARE @numRows int
DECLARE @Receipientlist varchar(1000)


IF OBJECT_ID(N'tempdb..#Results', N'U') IS NOT NULL
DROP TABLE #Results;
SELECT *
INTO #Results
FROM Oracle.vActiveItemsWithObsoleteComponents
ORDER BY AssemblyItemNumber


--SELECT * FROM #Results

SELECT @numRows = count(*) FROM #Results



SET @ReceipientList = (STUFF((SELECT ';' + UserEmail 
						FROM tblConfiguratorUser G  INNER JOIN users.UserResponsibility  K ON  G.UserID = K.UserID
  						WHERE K.ResponsibilityID = 5 FOR XML PATH('')),1,1,''))
						--WHERE g.UserTypeID = 1 FOR XML PATH('')),1,1,''))

DECLARE @body1 VARCHAR(MAX)
DECLARE @subject VARCHAR(MAX)
DECLARE @query VARCHAR(MAX) = N'SELECT * FROM tempdb..#Results;'
SET @subject = 'Obsolete Components' 
SET @body1 = 'There are  ' + CAST(@numRows AS NVARCHAR) + ' active item(s) with obsolete components.  Please review.' +CHAR(13)+CHAR(13)

DECLARE @tableHTML  NVARCHAR(MAX) ;
IF @numRows > 0
BEGIN
	
			SET @tableHTML =
				N'<H1>Obsolete Componenet Report</H1>' +
				N'<p>'+@body1+'</p>' +
				N'<p class=MsoNormal><span style=''font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D''>'+
				N'<table border="1">' +
				N'<tr><th>Item</th><th>Item Status</th>' +
				N'<th>Obsolete Component</th></tr>' +
				CAST ( ( SELECT		td=AssemblyItemNumber,       '',
									td=AssemblyItemStatus, '',
									td=ObsoleteComponent, ''
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


END
GO
