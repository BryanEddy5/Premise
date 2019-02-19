SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROC [Schedule].[usp_UpdateLotNumber]
@LotNumber NVARCHAR(50), 
@RecordId int

as
	UPDATE  c
	SET c.Job# = @LotNumber
	FROM dbo.[Cust Order Specifications] c
	WHERE c.[Seq NO] = @RecordId
GO
