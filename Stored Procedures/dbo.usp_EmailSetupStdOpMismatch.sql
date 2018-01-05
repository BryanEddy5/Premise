SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 10/31/2017
-- automated email to notify product engineering of open orders with Standard Ops
-- that do not match the Premise Configurator program's Standard Op.

-- =============================================
CREATE PROCEDURE [dbo].[usp_EmailSetupStdOpMismatch]


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
SELECT [ItemRouting]
	  ,[DateCreated]
      ,[StdOpBOM]
      ,[OperationDescription]
      ,[StdOpConfigurator]
      ,[OracleStatus]
	  ,g.[Sales Order]
	INTO	#Results
  FROM [Premise].[Setup].[vSetupStandardOperationMismatch] K INNER JOIN
  dbo.AFLPRD_ORDDTLREPT_UPLOAD_CAB G ON G.[Item Number] = K.ItemRouting
  --WHERE StdOpBOM <> 'R204' AND StdOpConfigurator <> 'R446'
  ORDER BY DateCreated DESC, StdOpBOM
SELECT * FROM #Results

SELECT @numRows = count(*) FROM #Results



SET @ReceipientList = (STUFF((SELECT ';' + UserEmail 
						FROM tblConfiguratorUser G  INNER JOIN users.UserResponsibility  K ON  G.UserID = K.UserID
  						WHERE K.ResponsibilityID = 5 FOR XML PATH('')),1,1,''))
						--WHERE g.UserTypeID = 1 FOR XML PATH('')),1,1,''))

DECLARE @body1 VARCHAR(MAX)
DECLARE @subject VARCHAR(MAX)
DECLARE @query VARCHAR(MAX) = N'SELECT * FROM tempdb..#Results;'
SET @subject = 'Stanadard Operation Errors' 
SET @body1 = 'There are  ' + CAST(@numRows AS NVARCHAR) + ' item(s) in open orders with mismatch standard ops.  Please review.' +CHAR(13)+CHAR(13)

DECLARE @tableHTML  NVARCHAR(MAX) ;
IF @numRows > 0
BEGIN
	
			SET @tableHTML =
				N'<H1>Erroneous Standard Op Report</H1>' +
				N'<p>'+@body1+'</p>' +
				N'<p class=MsoNormal><span style=''font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D''>'+
				N'<table border="1">' +
				N'<tr><th>Item</th><th>Bom Std Op</th>' +
				N'<th>Std Op Desc</th><th>Configurator Std Op</th>'+
				N'<th>Oracle Status</th><th>Sales Order</th>'+
				N'<th>DateCreated</th></tr>' +
				CAST ( ( SELECT		td=[ItemRouting],       '',
									td=[StdOpBOM], '',
									td=[OperationDescription], '',
									td=[StdOpConfigurator], '', 
									td=[OracleStatus], '', 
									td=[Sales Order], '', 
									td=[DateCreated], ''
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
			--@recipients='Bryan.Eddy@aflglobal.com',
			@blind_copy_recipients = 'Bryan.Eddy@aflglobal.com',
			@subject = @subject,
			@body = @tableHTML,
			@body_format = 'HTML';


END
GO
