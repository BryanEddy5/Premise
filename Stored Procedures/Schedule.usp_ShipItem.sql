SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Bryan Eddy
-- Create date: 3/29/2017
-- Description:	Update shipped ordered stats in scheduling
-- =============================================
CREATE PROCEDURE [Schedule].[usp_ShipItem] 
	-- Add the parameters for the stored procedure here
	@Qty int = 0, 
	@Reel nvarchar(50) = '',
	@ShippedQty int = 0,
	@Shipped smallint = -1

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE dbo.[Printed Labels (Data Products)] 
	SET [Close Date] = (CASE WHEN @Shipped <> 0 THEN GETDATE() ELSE NULL END ),
		Shipped = @Shipped
	WHERE [Reel No] = @Reel AND [Order Qty] = @Qty

	UPDATE dbo.[Cust Order Specifications]
	SET [Shipped Qty] = @ShippedQty
	Where [Reel No] = @Reel and [Order Qty] = @Qty
END
GO
