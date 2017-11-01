SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- ALTER date: <ALTER Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[usf_TensileStrengthCalculator]
(
	-- Add the parameters for the function here
@Item nvarchar(50)

)
RETURNS int

AS
BEGIN

DECLARE @TensileStrength_Newtons int
DECLARE @FiberStraing decimal(6,4) = .006

SELECT  @TensileStrength_Newtons = sum(TensileStrength_Newtons)
	FROM (
	SELECT 		b.ComponentItemNumber,
		CASE
				WHEN g.CablePasses = 2 AND G.StandardOperation  LIKE '%C%' THEN --Identifies single pass cables or single tube designs 
					CASE 
						WHEN ComponentItemNumber like 'ara%' OR ComponentItemNumber like 'FGL%' THEN ROUND(K.Denier * 0.00981 * K.Modulus * B.QTY *@FiberStraing* .5,0 ) --.5 for 50% contribution from Aramid for stranded cables
						ELSE ROUND(K.Modulus * 145037.7*  PI()/4*POWER( K.FRP_OD /25.4,2) * .006 * 9.81,0)
					END
				ELSE 
					CASE											--Identifies stranded cables
						WHEN ComponentItemNumber like 'ara%' THEN ROUND(K.Denier * 0.00981 * K.Modulus * B.QTY *@FiberStraing* 1,0 ) --1 for 100% contribution from Aramid for non-stranded cables
						ELSE ROUND(K.Modulus * 145037.7*  PI()/4*POWER( K.FRP_OD /25.4,2) * .006 * 9.81,0)
					END
			END as TensileStrength_Newtons, G.CablePasses, G.StandardOperation

	FROM  (
			SELECT ComponentItemNumber, SUM(NumEnds) as QTY, Base
			FROM 
			(
				SELECT   g.base,e.FinishedGood,(e.ExtendedQuantityPer) AS ExtendedQuantityPer, SUM(CAST(E.CountPerUOM as integer) ) as NumEnds, e.ComponentItemNumber,s.Make_Buy,m.density
				FROM   [dbo].[fn_ExplodeBOM](@Item) AS e 
				INNER JOIN dbo.[AFLPRD_INVSysItemCost_CAB] s ON e.ComponentItemNumber = s.ItemNumber
				INNER JOIN dbo.CableUnion G ON e.FinishedGood = G.Oracle
				LEFT OUTER JOIN [dbo].[tblMaterialWeightsMetersUOM] m ON e.ComponentItemNumber = m.Material
				GROUP BY e.FinishedGood,e.CountPerUOM,e.ComponentItemNumber,ExtendedQuantityPer,s.Make_Buy,m.density,g.Base
				) B

			INNER JOIN dbo.tblStrengthMembers K ON ComponentItemNumber = k.StrengthMember
			GROUP BY ComponentItemNumber, Base
			) B

	INNER JOIN dbo.tblStrengthMembers K ON B.ComponentItemNumber = K.StrengthMember
	INNER JOIN dbo.tblCableConstructionReferences E ON E.BASE = B.Base
	INNER JOIN dbo.tblCableConstructions G ON G.BaseID = E.BaseID
) X 


return @TensileStrength_Newtons


end







GO
