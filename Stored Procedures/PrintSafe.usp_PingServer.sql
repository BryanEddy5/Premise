SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- =============================================
-- Author:		Bryan Eddy
-- ALTER date:	12/11/2017
-- Description:	Ping camera IP addresses to see if they are connected
-- Version:		1 
-- Update:		n/a
-- =============================================
*/
CREATE PROCEDURE [PrintSafe].[usp_PingServer]
AS
DECLARE
@Cur Cursor, 
@Command varchar(100),
@ServerID int,
@ServerIP varchar(50),
@Status varchar(50),
@PingResult varchar(300),
@IpType INT
SET NOCOUNT ON

IF OBJECT_ID(N'tempdb..#tmpPingResult', N'U') IS NOT NULL
DROP TABLE #tmpPingResult;
CREATE TABLE #tmpPingResult
(
[ResultID] [int] identity NOT NULL, 
[Result] [varchar] (1000) NULL 
)

BEGIN

	Set @Cur = Cursor for (SELECT IpAddressID, IpAddress, IpType FROM PrintSafe.IpAddress  WHERE ipaddress <> 'tbd')
	Open @Cur
	FETCH NEXT FROM @Cur INTO @ServerID, @ServerIP, @IpType
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
	IF @IpType = 2 
		BEGIN
			SELECT @Command = 'ping ' + @ServerIP + ' -n 1'
			--PRINT @command
			INSERT INTO #tmpPingResult (Result)

			EXEC Master..xp_cmdShell @Command

			IF (SELECT Result FROM #tmpPingResult WHERE Result LIKE '%Unknown host%') <> ''
			UPDATE PrintSafe.IpAddress SET Status = 'Down/Does not exist' WHERE IpAddressID = @ServerID
			ELSE IF (SELECT Result FROM #tmpPingResult WHERE Result LIKE '%Request timed out%') <> ''
			UPDATE PrintSafe.IpAddress SET Status = 'No reply' WHERE IpAddressID = @ServerID
			ELSE IF (SELECT Result FROM #tmpPingResult WHERE Result LIKE '%Sent = 1, Received = 1%') <> ''
			UPDATE PrintSafe.IpAddress SET Status = 'Running' WHERE IpAddressID = @ServerID

			TRUNCATE TABLE #tmpPingResult;
		END;
	ELSE IF @IpType = 1
		BEGIN
			DECLARE @Object AS INT;
			DECLARE @ResponseText AS VARCHAR(8000);
			DECLARE @Url NVARCHAR(100);
			 
			SET @URL = 'http://' + @ServerIP +'/09Set.htm?Submit=Submit';

			EXEC sp_OACreate 'MSXML2.XMLHTTP', @Object OUT;
			EXEC sp_OAMethod @Object, 'open', NULL, 'get',
							 @URL, --Your Web Service Url (invoked)
							 'false'
			EXEC sp_OAMethod @Object, 'send'
			EXEC sp_OAMethod @Object, 'responseText', @ResponseText OUTPUT

			--Select @ResponseText

			EXEC sp_OADestroy @Object
			
			UPDATE PrintSafe.IpAddress SET Status = CASE WHEN @ResponseText = '' THEN 'No reply' ELSE 'Reset'  END
			WHERE IpAddressID = @ServerID
		END;

		FETCH NEXT FROM @Cur INTO @ServerID, @ServerIP,@IpType
	END;
		CLOSE @Cur;
		DEALLOCATE @Cur;

END;
	DROP TABLE #tmpPingResult;


GO
