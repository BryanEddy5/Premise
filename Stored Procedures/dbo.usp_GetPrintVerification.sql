SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Bryan Eddy
-- Create date: 8/31/2017
-- Description:	get and format print for verificatino form
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetPrintVerification]
	-- Add the parameters for the stored procedure here
@Item varchar(40),
@Lot varchar(40)
AS
BEGIN
	DECLARE @PrintLine1 varchar(300),@PrintLine2 varchar(300),@PrintLine3 varchar(300),@PrintLine4 varchar(300);
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;

		-- Insert statements for procedure here
	SELECT @PrintLine1 = K.[Print Line 1], @PrintLine2 = K.[Print Line 2] + (CASE WHEN K.[Print Item No] <> 0 THEN  SPACE(1) + K.[Item No] ELSE '' END)
	, @PrintLine3 = K.[Print Line 3] + (CASE WHEN K.[Print Reel No]<>0 THEN ' LOT NO. ' + @Lot ELSE '' END), @PrintLine4 = K.[Print Line 4]
	FROM [Basic Product Construction] K 
	WHERE [New Oracle Part #] = @Item;

	--SELECT @PrintLine1 = K.NewString FROM [usdf_PutCommasChars](@PrintLine1) K 
	--SELECT @PrintLine2 = K.NewString FROM [usdf_PutCommasChars](@PrintLine2) K 
	--SELECT @PrintLine3 = K.NewString FROM [usdf_PutCommasChars](@PrintLine3) K 
	--SELECT @PrintLine4 = K.NewString FROM [usdf_PutCommasChars](@PrintLine4) K 
	SELECT @PrintLine1 ,@PrintLine2,@PrintLine3, @PrintLine4;
END

GO
