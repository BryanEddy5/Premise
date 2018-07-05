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
CREATE PROC [dbo].[usp_MTY_ObsoleteComponentNotification]


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

WITH cteInventory
AS(
	SELECT Item, SUM(QTY) AS Quantity, [Org Code]
	FROM dbo.AFLPRD_onhandqty_STD_81_ALL 
	GROUP BY [Org Code], Item
	HAVING [Org Code] = 'MTY'
)
SELECT DISTINCT   ComponentItemNumber,Description, AssemblyItemStatus, CompItemStatus, COALESCE(NewItem,'') NewItem, COALESCE(i.Quantity,'') QuantityOnHand, COALESCE(i.[Org Code],'') AS Org
INTO #Results
FROM AFLPRD_BOMInvComp_MTY K INNER JOIN AFLPRD_INVSysItemCost_CAB G ON K.ComponentItemNumber = G.ItemNumber
LEFT JOIN PCN_History P ON P.OldItem = ComponentItemNumber
LEFT JOIN cteInventory i ON i.Item = G.ItemNumber
WHERE Item_Status <>'active' and AssemblyItemStatus = 'active' AND NewItem IS NULL

SELECT @numRows = COUNT(*) FROM #Results


SET @ReceipientList = (STUFF((SELECT ';' + UserEmail 
						FROM tblConfiguratorUser G  INNER JOIN users.UserResponsibility  K ON  G.UserID = K.UserID
  						WHERE K.ResponsibilityID = 20 FOR XML PATH('')),1,1,''))

DECLARE @body1 VARCHAR(MAX)
DECLARE @subject VARCHAR(MAX)
DECLARE @query VARCHAR(MAX) = N'SELECT * FROM tempdb..#Results;'
SET @subject = 'MTY ALERT - Inactive Components in BOM ' + CAST(GETDATE() AS NVARCHAR)
SET @body1 = 'There are  ' + CAST(@numRows AS NVARCHAR) + ' inactive components in MTY BOMs.  Please review.' +CHAR(13)+CHAR(13)

DECLARE @tableHTML  NVARCHAR(MAX) ;
IF @numRows > 0
BEGIN
	
			SET @tableHTML =
				N'<H1>MTY Inactive BOM Components</H1>' +
				N'<p>'+@body1+'</p>' +
				N'<p class=MsoNormal><span style=''font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D''>'+
				N'<table border="1">' +
				N'<tr><th>ComponentItemNumber</th><th>Description</th>' +
				N'<th>AssemblyItemStatus</th><th>CompItemStatus</th><th>NewItem</th>' +
				N'<th>Quantity On Hand</th><th>Org</th></tr>' +
				CAST ( ( SELECT		td=ComponentItemNumber,       '',
									td=Description,       '',
									td=AssemblyItemStatus, '',
									td=CompItemStatus, '',
									td=NewItem, '',
									td=QuantityOnHand, '',
									td=Org,''
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
			--@recipients = 'Bryan.Eddy@aflglobal.com',
			@blind_copy_recipients = 'Bryan.Eddy@aflglobal.com',
			@subject = @subject,
			@body = @tableHTML,
			@body_format = 'HTML';
END

GO
