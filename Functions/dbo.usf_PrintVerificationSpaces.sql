SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:        Bryan Eddy
-- Create date:   8/30/2017
-- Description:   Puts spaces between letters. 
--                Example: "GEORGE" becomes "|G| |E| |O| |R| |G| |E| "
-- =============================================
CREATE FUNCTION [dbo].[usf_PrintVerificationSpaces]

(@String VARCHAR(1500))

RETURNS 
@Temp table
(
NewString VARCHAR(1500),
VerificationBlanks varchar(1500)
)
AS
BEGIN
   DECLARE @pos INT, @result VARCHAR(1500), @Letter varchar(2), @i INT = 1,@Blanks varchar(1500) = '';
   SET @result = @String; 
   SET @pos = 2 -- location where we want first space 
   
   WHILE @pos < LEN(@String)*5
   BEGIN 
		SET @Letter = substring(@String,@i,1)
       SET @result = STUFF( @result, @pos-@i,  1,'|' + @Letter + '|' + SPACE(1)); 
       SET @pos = @pos+5; 
	   Set @i = @i+1;
	 --  INSERT INTO @TEMP
		--VALUES (@letter)
	end

	SET @I = 1
   WHILE @i < LEN(@string) + 1 
   BEGIN
	SET @Blanks = @Blanks + '|	|	'
	Set @i = @i+1;
   END

   INSERT INTO @Temp
   VALUES (@result,@Blanks)
   RETURN  
END

GO
