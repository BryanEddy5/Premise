SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


/*
Author:		Bryan Eddy
Date:		4/2/2018
Desc:		Send list of inactive items on the schedule to premise product engineering to review
Revision:	1
Update:		n/a
*/

CREATE PROCEDURE	[Schedule].[usp_EmailInactiveItemsOnSchedule]
AS
DECLARE @html NVARCHAR(MAX),
 @ReceipientList NVARCHAR(1000),
 @sqlCommand NVARCHAR(1000),
 @Table NVARCHAR(1000),
 @Qry NVARCHAR(1000),
 @RowCount INT
 SET @Table = 'Schedule.vInactiveItems'
 SET @sqlCommand = 'SELECT @RowCount  = COUNT(*) FROM ' + @Table
EXECUTE sp_executesql @sqlCommand, N'@RowCount int OUTPUT', @RowCount=@RowCount OUTPUT
PRINT @RowCount

IF @RowCount > 0
	BEGIN
    
		SET @Qry = 'SELECT * FROM ' + @Table

		EXEC dbo.usp_QueryToHtmlTable @html = @html OUTPUT,  @query = @Qry, @orderBy = N'[Promise Date]';

		SET @ReceipientList = (STUFF((SELECT ';' + UserEmail 
								FROM tblConfiguratorUser G  INNER JOIN users.UserResponsibility  K ON  G.UserID = K.UserID
  								WHERE K.ResponsibilityID IN (5,15) FOR XML PATH('')),1,1,''))

						EXEC msdb.dbo.sp_send_dbmail 
						@recipients=@ReceipientList,
						--@recipients='bryan.eddy@aflglobal.com',
						@blind_copy_recipients = 'bryan.eddy@aflglobal.com',
						@subject = 'Inactive Items on Premise Schedule',
						@body = @html,
						@body_format = 'HTML',
						@query_no_truncate = 1,
						@attach_query_result_as_file = 0;

END

GO
