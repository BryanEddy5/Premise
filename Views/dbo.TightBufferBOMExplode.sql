SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO









CREATE VIEW [dbo].[TightBufferBOMExplode]
AS
SELECT AssemblyItemNumber,  TightBuffer,SUM(ExtendedQuantityPer) AS TightBufferQTY
FROM 
	(
	SELECT 
	
	 d.AssemblyItemNumber as AssemblyItemNumber,left(e.ComponentItemNumber,7) TightBuffer, round(count(e.ExtendedQuantityPer),0) AS ExtendedQuantityPer 
	FROM  
		(
		SELECT DISTINCT [Item Number] as AssemblyItemNumber 
		FROM dbo.[Temp (Premise Load)]
		) as d 
	CROSS APPLY [dbo].[fn_ExplodeBOM](d.AssemblyItemNumber) as e 
	group by  e.ComponentItemNumber,d.AssemblyItemNumber
	HAVING e.ComponentItemNumber like 'pt%'
	) X 
GROUP BY X.AssemblyItemNumber, TightBuffer






GO
