CREATE TABLE [dbo].[tblCutSheetApproval]
(
[Base] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Commercial_Approval] [bit] NOT NULL CONSTRAINT [DF_tblCutSheetApproval_Commercial_Approval] DEFAULT ((0)),
[Commercial_Approver] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Commercial_Approval_Date] [datetime] NULL,
[Technical_Approval] [bit] NOT NULL CONSTRAINT [DF_tblCutSheetApproval_Technical_Approval] DEFAULT ((0)),
[Technical_Approver] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Technical_Approval_Date] [datetime] NULL,
[RecordCreationDate] [datetime] NULL CONSTRAINT [DF_tblCutSheetApproval_RecordCreationDate] DEFAULT (getdate()),
[Timestamp] [timestamp] NULL,
[Requested] [bit] NULL CONSTRAINT [DF_tblCutSheetApproval_Requested] DEFAULT ((0)),
[Requestor] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RequestedDate] [datetime] NULL,
[ItemRequested] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCutSheetApproval] ADD CONSTRAINT [PK_tblCutSheetApproval] PRIMARY KEY CLUSTERED  ([Base]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblCutSheetApproval] ON [dbo].[tblCutSheetApproval] ([Base], [Commercial_Approval], [Technical_Approval], [Requested]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCutSheetApproval] ADD CONSTRAINT [FK_tblCutSheetApproval_tblCableConstructionReferences] FOREIGN KEY ([Base]) REFERENCES [dbo].[tblCableConstructionReferences] ([Base]) ON DELETE CASCADE ON UPDATE CASCADE
GO
GRANT UPDATE ([Commercial_Approval]) ON [dbo].[tblCutSheetApproval] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Commercial_Approver]) ON [dbo].[tblCutSheetApproval] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Commercial_Approval_Date]) ON [dbo].[tblCutSheetApproval] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Technical_Approval]) ON [dbo].[tblCutSheetApproval] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Technical_Approver]) ON [dbo].[tblCutSheetApproval] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Technical_Approval_Date]) ON [dbo].[tblCutSheetApproval] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([RecordCreationDate]) ON [dbo].[tblCutSheetApproval] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Requested]) ON [dbo].[tblCutSheetApproval] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Requestor]) ON [dbo].[tblCutSheetApproval] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([RequestedDate]) ON [dbo].[tblCutSheetApproval] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Commercial_Approval]) ON [dbo].[tblCutSheetApproval] TO [SPB spb_PREMISE]
GO
GRANT UPDATE ([Commercial_Approver]) ON [dbo].[tblCutSheetApproval] TO [SPB spb_PREMISE]
GO
GRANT UPDATE ([Commercial_Approval_Date]) ON [dbo].[tblCutSheetApproval] TO [SPB spb_PREMISE]
GO
GRANT UPDATE ([Technical_Approval]) ON [dbo].[tblCutSheetApproval] TO [SPB spb_PREMISE]
GO
GRANT UPDATE ([Technical_Approver]) ON [dbo].[tblCutSheetApproval] TO [SPB spb_PREMISE]
GO
GRANT UPDATE ([Technical_Approval_Date]) ON [dbo].[tblCutSheetApproval] TO [SPB spb_PREMISE]
GO
GRANT UPDATE ([RecordCreationDate]) ON [dbo].[tblCutSheetApproval] TO [SPB spb_PREMISE]
GO
GRANT UPDATE ([Requested]) ON [dbo].[tblCutSheetApproval] TO [SPB spb_PREMISE]
GO
GRANT UPDATE ([Requestor]) ON [dbo].[tblCutSheetApproval] TO [SPB spb_PREMISE]
GO
GRANT UPDATE ([RequestedDate]) ON [dbo].[tblCutSheetApproval] TO [SPB spb_PREMISE]
GO
GRANT UPDATE ([ItemRequested]) ON [dbo].[tblCutSheetApproval] TO [SPB spb_PREMISE]
GO
