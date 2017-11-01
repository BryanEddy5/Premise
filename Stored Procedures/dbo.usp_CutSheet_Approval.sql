SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 11/7/2016
-- Description:	Approve construction for Spec Sheet printing.  Once the approver has acknolwedged they approve fo the spec sheet, 
--  the bit field will store a 1 and the approver and date will be captured.
-- =============================================
CREATE PROCEDURE [dbo].[usp_CutSheet_Approval] 
(
	-- Add the parameters for the stored procedure here
	@Base as nvarchar(50),
	@Procedure as int,
	@Item as nvarchar(50) = null

)
AS
BEGIN

	SET NOCOUNT ON;

		--Technical associate approves of requested design
		IF  @Procedure = 1 
			
				UPDATE dbo.tblCutSheetApproval 
				Set Technical_Approval = 1, Technical_Approval_Date = getdate(), Technical_Approver = SUSER_SNAME()
				WHERE Base = @Base AND Technical_Approval = 0
		--Commercial associate approves of requested design	
		ELSE IF @Procedure = 2 
			
				UPDATE dbo.tblCutSheetApproval 
				Set Commercial_Approval = 1, Commercial_Approval_Date = getdate(), Commercial_Approver = SUSER_SNAME()
				WHERE Base = @Base AND Commercial_Approval = 0
		--
		ELSE IF @Procedure = 3
			
				UPDATE dbo.tblCutSheetApproval 
				Set Requested = 1, RequestedDate = getdate(), Requestor = SUSER_SNAME(), ItemRequested = @Item
				WHERE Base = @Base 

		ELSE IF @Procedure = 4
				UPDATE dbo.tblCutSheetApproval 
				Set Technical_Approval = 1, Technical_Approval_Date = getdate(), Technical_Approver = SUSER_SNAME()
				FROM dbo.tblCutSheetApproval B INNER JOIN [dbo].[tblCutSheet_QueuedForApproval] K ON B.Base = K.BASE

		ELSE IF @Procedure = 5
				UPDATE dbo.tblCutSheetApproval 
				Set Commercial_Approval = 1, Commercial_Approval_Date = getdate(), Commercial_Approver = SUSER_SNAME()
				FROM dbo.tblCutSheetApproval B INNER JOIN [dbo].[tblCutSheet_QueuedForApproval] K ON B.Base = K.BASE


END


GO
GRANT EXECUTE ON  [dbo].[usp_CutSheet_Approval] TO [NAA\SPB Premise SQL RO]
GO
GRANT EXECUTE ON  [dbo].[usp_CutSheet_Approval] TO [SPB spb_PREMISE]
GO
