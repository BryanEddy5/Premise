SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 2/15/2017
-- Description:	Sends out email notifying of open orders where the BOM Fiber is not present in the Oracle Fiber Specs
-- =============================================
CREATE PROCEDURE [dbo].[usp_EmailOrdersMissingFiberSpecs]


AS

EXECUTE AS USER = 'dbo' 

SET ANSI_NULLS OFF;
SET NOCOUNT ON;

--Run around 8:30am everyday
DECLARE @numRows int
DECLARE @Receipientlist varchar(1000)

--Check if any open item requests need commercial approval
IF OBJECT_ID(N'tempdb..#Hold', N'U') IS NOT NULL
DROP TABLE #Hold;
SELECT distinct K.[Item Number] ItemNumber
INTO #Hold
FROM dbo.AFLPRD_ORDDTLREPT_UPLOAD_CAB K

INSERT INTO #Hold
SELECT DISTINCT e.ComponentItemNumber
FROM #Hold K CROSS APPLY dbo.fn_ExplodeBOM(K.ItemNumber) e

IF OBJECT_ID(N'tempdb..#Results', N'U') IS NOT NULL
DROP TABLE #Results;
SELECT DISTINCT g.ItemNumber,Fiber, [Item No] CatalogCode, Active, CreatedBy, DateCreated
INTO #Results
FROM #Hold K INNER JOIN Oracle.vMissingFiberSpecs G ON G.ItemNumber = k.ItemNumber

SELECT * 
FROM #Results

SELECT @numRows = count(*) FROM #Results



SET @ReceipientList = (STUFF((SELECT ';' + UserEmail 
						FROM tblConfiguratorUser G  INNER JOIN users.UserResponsibility  K ON  G.UserID = K.UserID
  						WHERE K.ResponsibilityID = 5 FOR XML PATH('')),1,1,''))

declare @body1 varchar(max)
declare @subject varchar(max)
declare @query varchar(max) = N'SELECT * FROM tempdb..#Results;'
set @subject = 'Orders Missing Oracle Fiber Specs' 
set @body1 = 'There are  ' + CAST(@numRows AS NVARCHAR) + ' item(s) are missing specs.  Please review.' +char(13)+CHAR(13)

DECLARE @tableHTML  NVARCHAR(MAX) ;
if @numRows > 0
begin
	
			SET @tableHTML =
				N'<H1>Order Missing Fiber Spec Report</H1>' +
				N'<p>'+@body1+'</p>' +
				N'<p class=MsoNormal><span style=''font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D''>'+
				N'<table border="1">' +
				N'<tr><th>Item</th><th>Fiber</th>' +
				N'<th>CatalogCode</th><th>Active</th>' +
				N'<th>DateCreated</th><th>CreatedBy</th></tr>' +
				CAST ( ( SELECT		td=ItemNumber,       '',
									td=Fiber, '',
									td=CatalogCode, '',
									td=Active, '', 
									td=DateCreated, '', 
									td=CreatedBy, ''
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
