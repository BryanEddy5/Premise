SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[usf_SplitString]
(
    @sString NVARCHAR(2048),
    @cDelimiter NCHAR(1)
)
RETURNS 
@tParts 
TABLE ( part NVARCHAR(2048),
		Position INT)
AS
BEGIN
    IF @sString IS NULL RETURN
    DECLARE @iStart INT,
            @iPos INT,
			@Count INT
    IF SUBSTRING( @sString, 1, 1 ) = @cDelimiter 
    BEGIN
        SET @iStart = 2
        INSERT INTO @tParts
        VALUES( NULL,NULL )
    END
    ELSE 
        SET @iStart = 1
		SET @count = 1
    WHILE 1=1
    BEGIN

        SET @iPos = CHARINDEX( @cDelimiter, @sString, @iStart )
        IF @iPos = 0
            SET @iPos = LEN( @sString )+1
        IF @iPos - @iStart > 0          
            INSERT INTO @tParts
            VALUES  ( SUBSTRING( @sString, @iStart, @iPos-@iStart ), @count)
        ELSE
            INSERT INTO @tParts
            VALUES( NULL ,NULL)
        SET @iStart = @iPos+1
        IF @iStart > LEN( @sString ) 
            BREAK
		SELECT @count = @count + 1
    END
	
    RETURN

END
GO
