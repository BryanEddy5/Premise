SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/*	Author:	Bryan Eddy
	Date:	11/8/2017
	Desc:	Get Print String information from data loaded to Print Safe 

*/

CREATE VIEW [PrintSafe].[vGetPRINT_STRING]
AS 

	WITH ctePrintString
	AS(
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
															  ,[ITEM_NUMBER] ORDER BY UPDATE_DATE desc) RowNumber
		FROM PrintSafe.PRINT_STRING
	)
	--DELETE  G
	SELECT *
	FROM ctePrintString K 
	WHERE RowNumber = 1
	--ORDER BY G.ITEM_NUMBER, G.UPDATE_DATE desc
GO
