SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/*
Author:		Bryan Eddy
Date:		5/21/2018
Desc:		Produre to get the furcation tube
Version:	1
Update:		n/a
*/
CREATE PROCEDURE [Schedule].[usp_GetFurcationTube] 
(
@Item NVARCHAR(100)
)
AS
BEGIN
	WITH cteFurcation
	AS(
	SELECT AssemblyItemNumber, ComponentItemNumber,SUM(CAST(ComponentQuantity AS INT)) AS ComponentQuantity--, SUM(CAST(CountPerUOM AS INT)) AS CountPerUOM
	FROM dbo.AFLPRD_BOMInvComp_CAB
	GROUP BY AssemblyItemNumber, ComponentItemNumber
	HAVING ComponentItemNumber LIKE 'frc%'
	)
	SELECT e.AssemblyItemNumber,
		   e.ComponentItemNumber,
		   e.ComponentQuantity
	FROM cteFurcation e
	WHERE e.AssemblyItemNumber = @Item
	ORDER BY e.AssemblyItemNumber

END

GO
