SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
Author:		Bryan Eddy
Date:		2/28/2018
Desc:		Calculate Vertical Tray Test IEEE 1202 
Version:	1
Update:		Initial creation
Note:		Calculation is based on Vertical Tray Test IEEE 1202
			Length = 2.438 * N
			N = Number of Cables Per Bundle * Number of Bundles in Tray
*/


CREATE FUNCTION [dbo].[GetBurnVerticalTrayTestLength]
(	
	-- Add the parameters for the function here
	@NominalODmm DECIMAL(8,5)
)
RETURNS  
@BurnLength TABLE (
Length_Meters  INT
)
AS
BEGIN 
	INSERT INTO @BurnLength
	SELECT CEILING(2.438 * (K.NumberOfCablesPerBundles*K.NumberOfBundles)*2*1.1)
	FROM dbo.BurnTestVerticalTray K
	WHERE @NominalODmm >= K.FromNominalODmm AND @NominalODmm < K.ToNominalODmm
	RETURN
END 

GO
