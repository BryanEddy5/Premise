SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [PrintSafe].[usp_DeleteDuplicates]
as
BEGIN

	;WITH ctePrintString
	as(
		SELECT [PRODUCTION_ORDER_NUMBER]
		  ,[MATERIAL_NUMBER]
		  ,[PRINT_STRING_NAME]
		  ,[PRINT_STRING_DESCRIPTION]
		  ,[PRINT_STRING]
		  ,[INSERT_DATE]
		  ,[UPDATE_DATE]
		  ,[ITEM_NUMBER]
		  ,[UniqueID]
		  ,DATEINSERTED, ROW_NUMBER() OVER (PARTITION BY [PRODUCTION_ORDER_NUMBER]
															  ,[MATERIAL_NUMBER]
															  ,[PRINT_STRING_NAME]
															  ,[PRINT_STRING_DESCRIPTION]
															  ,[PRINT_STRING]
															  ,[INSERT_DATE]
															  ,[UPDATE_DATE]
															  ,[ITEM_NUMBER] ORDER BY DATEINSERTED ASC) RowNumber
		FROM PrintSafe.PRINT_STRING
	)
	DELETE  G
	--SELECT *
	FROM ctePrintString K INNER JOIN PrintSafe.PRINT_STRING  G ON K.uniqueid = G.uniqueid 
	WHERE RowNumber > 1



	;WITH ctePrintString
	as(
		SELECT [DOWNLOAD_TYPE]
		  ,[PRODUCTION_ORDER_NUMBER]
		  ,[COMPUTER_NAME]
		  ,[PRINTER_NAME]
		  ,[FONT_SPEC]
		  ,[CALIBRATION_VALUE]
		  ,[PRINT_STRING]
		  ,[WHEN_RUN]
		  ,[ARCHIVED]
		  ,[UniqueID]
		  ,DATEINSERTED, ROW_NUMBER() OVER (PARTITION BY [DOWNLOAD_TYPE]
													  ,[PRODUCTION_ORDER_NUMBER]
													  ,[COMPUTER_NAME]
													  ,[PRINTER_NAME]
													  ,[FONT_SPEC]
													  ,[CALIBRATION_VALUE]
													  ,[PRINT_STRING]
													  ,[WHEN_RUN]
													  ,[ARCHIVED] ORDER BY DATEINSERTED ASC) RowNumber
		FROM PrintSafe.PS_HISTORY
	)
	DELETE  G
	--SELECT *
	FROM ctePrintString K INNER JOIN PrintSafe.PS_HISTORY  G ON K.uniqueid = G.uniqueid 
	WHERE RowNumber > 1

END



GO
