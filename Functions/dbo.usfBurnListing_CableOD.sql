SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 8/30/2016
-- Description:	Find the OD for cables and calculating OD for oval cables
-- =============================================
CREATE FUNCTION  [dbo].[usfBurnListing_CableOD]
(
@Item nvarchar(50)
)
returns
@OD table
(
NominalOD decimal(6,3),
OracleItem nvarchar(50)

)

AS
BEGIN
	-- Declare the return variable here
	DECLARE @NominalOD decimal(6,3)

	-- Add the T-SQL statements to compute the return value here
	INSERT INTO @OD
	SELECT X.NomOD,X.Oracle
	FROM 
	(
		SELECT g.NominalOD, g.Height, K.Oracle, 
			CASE WHEN g.height IS NOT NULL THEN  1.1284 * SQRT(g.NominalOD*g.Height)
				 WHEN g.NominalOD IS NULL THEN 0
				 ELSE g.NominalOD
			END   NomOD
		FROM dbo.CableUnion K INNER JOIN dbo.tblCableConstructionReferences E ON K.Base = E.Base
			 INNER JOIN dbo.tblCableConstructions G ON G.BaseID = E.BaseID
		--WHERE k.oracle = @Item
	) x
	RETURN


END


GO
