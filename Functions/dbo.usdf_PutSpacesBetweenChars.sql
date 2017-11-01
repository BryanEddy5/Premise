SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:        Bryan Eddy
-- Create date:   8/30/2017
-- Description:   Puts spaces between letters. 
--                Example: "GEORGE" becomes "G E O R G E"
-- =============================================
CREATE FUNCTION [dbo].[usdf_PutSpacesBetweenChars] 

(@String VARCHAR(300))

RETURNS 
@Temp table
(
NewString VARCHAR(300)
)
AS
BEGIN
   DECLARE @pos INT, @result VARCHAR(300); 
   SET @result = @String; 
   SET @pos = 2 -- location where we want first space 
   
   WHILE @pos < LEN(@String)*2
   BEGIN 
       SET @result = STUFF( @result, @pos,  0,SPACE(1)); 
       SET @pos = @pos+2; 
	 --  INSERT INTO @TEMP
		--VALUES (@letter)
   END 
   INSERT INTO @Temp
   VALUES (@result)
   RETURN  
END

GO
