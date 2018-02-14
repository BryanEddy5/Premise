SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- =============================================
-- Author:		Bryan Eddy
-- ALTER date:	1/29/2018
-- Description:	Back up defective camera images for each line
-- Version:		1 
-- Update:		n/a
-- =============================================
*/
create PROCEDURE [PrintSafe].[usp_PrintDefectImageBackup]
AS
DECLARE
@Cur Cursor, 
@Command1 varchar(200),
@Command2 varchar(200),
@Command3 VARCHAR(200),
@Command4 varchar(200),
@Command5 varchar(200),
@Command6 varchar(200),
@Command7 varchar(200),
@Command8 varchar(200),
@Machine VARCHAR(50),
@Dir NVARCHAR(100),
@File nvarchar(100),
@FileDir nvarchar(200)
SET @File = 'ImageFailBackup.bat'
SET @Dir = '\\naa.fujikurausa.com\dfs\SPB\MFGSHARE\'
SET @FileDir = @Dir + @File
SET NOCOUNT ON


IF OBJECT_ID(N'tempdb..#Machines', N'U') IS NOT NULL
DROP TABLE #Machines;
CREATE TABLE #Machines(
Machine  nvarchar(20)
)
INSERT INTO #Machines
(
    Machine
)
VALUES
('lineb1'),
('lineB2'),
('lineb4'),
('lineb6'),
('lineb9'),
('lineb10'),
('blineb11'),
('lineb18');

BEGIN
    SET @Cur = CURSOR FOR SELECT Machine FROM #Machines
    OPEN @Cur
    FETCH NEXT FROM @Cur INTO @Machine
    WHILE (@@FETCH_STATUS = 0)
    BEGIN
	
	SET @Command1 = 'echo echo on > ' + @FileDir + 'NO_OUTPUT'
	SET @Command2 = 'echo SET Today=%Date:~10,4%_%Date:~4,2%_%Date:~7,2% >> ' + @FileDir + 'NO_OUTPUT'
	SET @Command3 =	'echo echo %Today=% >> '  + @FileDir + 'NO_OUTPUT'
	SET @Command4 =	'echo SET Source=' + @Dir + @Machine + '\Fails >> ' + @FileDir + 'NO_OUTPUT'
	SET @Command5 =	'echo SET Target=' + @Dir + @Machine + '\BackupFails\%Today% >> ' + @FileDir + 'NO_OUTPUT'
	SET @Command6 =	'echo REM mkdir %Today% >> ' + @FileDir + 'NO_OUTPUT'
	SET @Command7 =	'echo if not exist %Target% mkdir %Target% >> ' + @FileDir + 'NO_OUTPUT'
	SET @Command8 =	'echo robocopy %Source% %Target% /MOV /njh /njs /ndl /nc /ns /np /nfl >> '  + @FileDir + 'NO_OUTPUT'


       EXEC master..xp_cmdshell @Command1 
	   EXEC master..xp_cmdshell @Command2;
	   EXEC master..xp_cmdshell @Command3;
	   EXEC master..xp_cmdshell @Command4;
	   EXEC master..xp_cmdshell @Command5;
	   EXEC master..xp_cmdshell @Command6;
	   EXEC master..xp_cmdshell @Command7;
	   EXEC master..xp_cmdshell @Command8;


	   EXEC xp_cmdshell @FileDir

	    FETCH NEXT FROM @Cur
		INTO @Machine
    END;

	CLOSE @Cur
	DEALLOCATE @Cur

END;

DROP TABLE #Machines


GO
