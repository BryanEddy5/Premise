SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Bryan Eddy>
-- ALTER date: <1/27/2017>
-- Description:	<Explodes all levels of BOM finds the UJCM>
-- =============================================
CREATE PROC [dbo].[usp_Scheduling_Construction_CenterMember](
@Item varchar(50)
)
as
SELECT ComponentItemNumber
FROM dbo.fn_ExplodeBOM(@Item) INNER JOIN
dbo.[Basic Product Construction] ON ComponentItemNumber = [New Oracle Part #] INNER JOIN
dbo.tblCableConstructionReferences ON tblCableConstructionReferences.Base =  [Basic Product Construction].base INNER JOIN
dbo.tblCableType ON tblCableType.CableType = tblCableConstructionReferences.CableType
WHERE CableID = 6



GO
