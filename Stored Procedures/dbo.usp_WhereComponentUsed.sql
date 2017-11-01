SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Bryan Eddy>
-- ALTER date: <8/5/2016>
-- Description:	<Find where components are used in other cables>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WhereComponentUsed](
	-- Add the parameters for the stored procedure here
	@Component varchar(50),
	@Cable varchar(50) OUTPUT,
	@Qty integer OUTPUT,
	@ReturnComponent varchar(50) OUTPUT
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 	@Cable = AssemblyItemNumber, @ReturnComponent=e.Component,@Qty = sum(e.componentquantity) 
	FROM  [dbo].fn_WhereUsed(@Component) as e 
	group by  AssemblyItemNumber,e.Component
END



GO
