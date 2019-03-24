SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Bryan Eddy
-- Create date: 2/18/2019
-- Description:	Return list of make components of a cable including the cable
-- =============================================
CREATE FUNCTION [dbo].[GetUniqueComponents] 
(
	@ItemNumber nvarchar(50)
	)
RETURNS 
@Table TABLE 
(
	ItemNumber nvarchar(50), 
	DesignCode nvarchar(50),
	BomLevel int
)
AS
BEGIN
	INSERT INTO @Table
	(
	    ItemNumber,
	    DesignCode,
		BomLevel
	)
	SELECT DISTINCT K.item_number, B.[Item No], K.BOMLevel
	FROM PlanetTogether.fn_ExplodeBOM(@ItemNumber) K
	INNER JOIN dbo.[Basic Product Construction] B ON B.[New Oracle Part #] = K.item_number
	WHERE K.make_buy = 'make'
	ORDER BY K.BOMLevel
	
	RETURN 
END
GO
