SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_WhereUsed](

	 @Item varchar(50)

	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


IF OBJECT_ID(N'tempdb..#ItemWhereUsed', N'U') IS NOT NULL
DROP TABLE #ItemWhereUsed;

SELECT e.ComponentItemNumber, e.AssemblyItemNumber, e.ComponentQuantity
INTO #ItemWhereUsed
FROM dbo.fn_WhereUsed(@Item) E


IF OBJECT_ID(N'tempdb..#FinishedCables', N'U') IS NOT NULL 
DROP TABLE #FinishedCables;

SELECT ComponentItemNumber,k.AssemblyItemNumber,  sum(k.ComponentQuantity) as Quantity
INTO #FinishedCables
FROM #ItemWhereUsed K 
GROUP BY K.AssemblyItemNumber,ComponentItemNumber

SELECT * 
FROM #FinishedCables

end




GO
