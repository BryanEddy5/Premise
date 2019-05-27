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

DECLARE @FinishedCables TABLE(
ComponentItemNumber NVARCHAR(50),
AssemblyItemNumber NVARCHAR(50),
Quantity DECIMAL(18,5),
CompItemStatus NVARCHAR(50),
TableId int IDENTITY(1000,1) PRIMARY KEY,
AssemblyDescription NVARCHAR(MAX)
)


IF OBJECT_ID(N'tempdb..#ItemWhereUsed', N'U') IS NOT NULL
DROP TABLE #ItemWhereUsed;

SELECT e.ComponentItemNumber, e.AssemblyItemNumber, e.ComponentQuantity, E.CompItemStatus, AssemblyDescription
INTO #ItemWhereUsed
FROM dbo.fn_WhereUsed(@Item) E


IF OBJECT_ID(N'tempdb..#FinishedCables', N'U') IS NOT NULL 
DROP TABLE #FinishedCables;

INSERT INTO @FinishedCables(ComponentItemNumber, AssemblyItemNumber, Quantity, CompItemStatus, AssemblyDescription)
SELECT ComponentItemNumber,k.AssemblyItemNumber,  sum(k.ComponentQuantity) as Quantity, CompItemStatus, AssemblyDescription
FROM #ItemWhereUsed K 
GROUP BY K.AssemblyItemNumber,ComponentItemNumber, CompItemStatus, AssemblyDescription

SELECT * 
FROM @FinishedCables

end




GO
