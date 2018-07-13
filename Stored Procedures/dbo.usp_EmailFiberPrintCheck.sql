SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 2/15/2017
-- automated email to check items with possibly the wrong print

-- =============================================
CREATE PROCEDURE [dbo].[usp_EmailFiberPrintCheck]


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
SELECT k.[New Oracle Part #], k.[Item No], G.Fiber, k.[Print Line 2], k.FiberType2, k.FiberType3, G.OM#,G.[SM/MM], k.OracleStatus, k.Customer, k.DateCreated, k.CreatedBy
INTO #Results
FROM dbo.[Basic Product Construction] k INNER JOIN dbo.tbl_Fibers G ON K.[Fiber Oracle item] = G.Fiber
WHERE  (([k].[Print Line 2] NOT LIKE '%'+g.OM#+'%' and [k].[Print Line 2] NOT LIKE '%'+G.[SM/MM]+'%' ) OR k.[Print Line 2] LIKE '%om%sm%')
AND (k.Customer LIKE 'AFL STANDARD%' OR k.Customer LIKE 'AFL GENERIC%') AND k.FiberType2 = 'none'-- AND fiber <> 'none'
AND k.[New Oracle Part #] NOT LIKE '%test%' AND OracleStatus <> 'OBSOLETE' AND k.DateCreated > GETDATE() - 365 AND k.[New Oracle Part #] NOT IN ('PS09886-01')
ORDER BY k.DateCreated,G.Fiber, k.[Print Line 2]

SELECT * FROM #Results

SELECT @numRows = count(*) FROM #Results



SET @ReceipientList = (STUFF((SELECT ';' + UserEmail 
						FROM tblConfiguratorUser G  INNER JOIN users.UserResponsibility  K ON  G.UserID = K.UserID
  						WHERE K.ResponsibilityID = 5 FOR XML PATH('')),1,1,''))
						--WHERE g.UserTypeID = 1 FOR XML PATH('')),1,1,''))

DECLARE @body1 VARCHAR(MAX)
DECLARE @subject VARCHAR(MAX)
DECLARE @query VARCHAR(MAX) = N'SELECT * FROM tempdb..#Results;'
SET @subject = 'Wrong Fiber Print' 
SET @body1 = 'There are  ' + CAST(@numRows AS NVARCHAR) + ' items with incorrect fiber print.  Please review.' +CHAR(13)+CHAR(13)

DECLARE @tableHTML  NVARCHAR(MAX) ;
IF @numRows > 0
BEGIN
	
			SET @tableHTML =
				N'<H1>Erroneous Print Line 2 Report</H1>' +
				N'<p>'+@body1+'</p>' +
				N'<p class=MsoNormal><span style=''font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D''>'+
				N'<table border="1">' +
				N'<tr><th>Item</th><th>CatalogCode</th>' +
				N'<th>Fiber</th><th>Print Line 2</th>'+
				N'<th>Mode</th><th>Core</th>'+
				N'<th>DateCreated</th><th>CreatedBy</th></tr>' +
				CAST ( ( SELECT		td=[New Oracle Part #],       '',
									td=[Item No], '',
									td=Fiber, '',
									td=[Print Line 2], '', 
									td=OM#, '', 
									td=[SM/MM], '', 
									td=DateCreated, '', 
									td=CreatedBy,''
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
			--@blind_copy_recipients = 'Bryan.Eddy@aflglobal.com',
			@subject = @subject,
			@body = @tableHTML,
			@body_format = 'HTML';


END
GO
