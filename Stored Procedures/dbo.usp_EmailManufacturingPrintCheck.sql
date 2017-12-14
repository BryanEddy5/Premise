SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 6/12/17
-- Description: Send email to product engineering when auto-generated fiber print doesn't match the current print
-- 
-- =============================================
CREATE PROCEDURE [dbo].[usp_EmailManufacturingPrintCheck]

@ItemNumber nvarchar(50),
@NewFiberPrint nvarchar(150),
@CurrentFiberPrint NVARCHAR(150),
@OrderNumber NVARCHAR(100),
@UserName nvarchar(50)

AS


SET NOCOUNT ON;
EXECUTE AS USER = 'dbo' 

DECLARE @Receipientlist varchar(1000)
DECLARE @BlindRecipientlist varchar(1000)
--DECLARE @UserName NVARCHAR(50)

--SET @UserName = SUSER_SNAME()

INSERT INTO Schedule.PrintVerificationError(ItemNumber,PrintCheck,CurrentPrint,SoNumber,UserName)
VALUES (@ItemNumber, @NewFiberPrint, @CurrentFiberPrint,@OrderNumber,@UserName)


SET @ReceipientList = (STUFF((SELECT ';' + UserEmail 
						FROM tblConfiguratorUser G  INNER JOIN users.UserResponsibility  K ON  G.UserID = K.UserID
  						WHERE K.ResponsibilityID = 5 FOR XML PATH('')),1,1,''))
						--WHERE g.UserTypeID = 1 FOR XML PATH('')),1,1,''))

SET @BlindRecipientlist = (STUFF((SELECT ';' + UserEmail 
						FROM tblConfiguratorUser G  INNER JOIN users.UserResponsibility  K ON  G.UserID = K.UserID
  						WHERE g.UserTypeID = 1 FOR XML PATH('')),1,1,''))

declare @body1 varchar(max)
declare @subject varchar(max)
declare @query varchar(max) = N'SELECT * FROM tempdb..#Results;'
set @subject = 'Manufacturing Print Review' 
set @body1 = 'Please review the print below and determine if the print needs to be updated.  If so, aler manufacturing immediately.' +char(13)+CHAR(13)

DECLARE @tableHTML  NVARCHAR(MAX) ;
begin
	
			SET @tableHTML =
				N'<H1>Manufacturing Print Review</H1>' +
				N'<p>'+@body1+'</p>' +
				N'<p class=MsoNormal><span style=''font-size:11.0pt;font-family:Calibri,sans-serif;color:#1F497D''>'+
				N'<table border=1>' +
				N'<tr><th>ItemNumber</th><th>New Fiber Print</th>' +
				N'<th>Current Fiber Print</th><th>Sales Order Number</th><th>Date</th><th>User</th></tr>' +
				CAST ( ( SELECT		td=@ItemNumber,    '',
									td=@NewFiberPrint, '',
									td=@CurrentFiberPrint, '', 
									td=@OrderNumber, '',
									td=GETDATE(), '',
									td=@UserName, ''
						  FOR XML PATH('tr'), TYPE 
				) AS NVARCHAR(MAX) ) +
				N'</table>' ;
			--SET @tableHTML =
			--	N'<H1>Premise Cut Sheet Approval</H1>' +
			--	N'<p>'+@body1+'</p>' +
			--	N'</table>' ;
		
			EXEC msdb.dbo.sp_send_dbmail 
			@recipients=@ReceipientList,
			@blind_copy_recipients =  @BlindRecipientlist, --@ReceipientList
			@subject = @subject,
			@importance  = 'High', 
			@body = @tableHTML,
			@body_format = 'HTML';
end

GO
GRANT EXECUTE ON  [dbo].[usp_EmailManufacturingPrintCheck] TO [NAA\SPB Premise SQL RO]
GO
