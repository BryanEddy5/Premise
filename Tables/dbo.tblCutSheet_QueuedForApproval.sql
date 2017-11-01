CREATE TABLE [dbo].[tblCutSheet_QueuedForApproval]
(
[Base] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Timestamp] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCutSheet_QueuedForApproval] ADD CONSTRAINT [PK_tblCutSheet_QueuedForApproval] PRIMARY KEY CLUSTERED  ([Base]) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblCutSheet_QueuedForApproval] TO [NAA\SPB Premise SQL RO]
GO
GRANT INSERT ON  [dbo].[tblCutSheet_QueuedForApproval] TO [NAA\SPB Premise SQL RO]
GO
GRANT DELETE ON  [dbo].[tblCutSheet_QueuedForApproval] TO [NAA\SPB Premise SQL RO]
GO
GRANT SELECT ON  [dbo].[tblCutSheet_QueuedForApproval] TO [SPB spb_PREMISE]
GO
GRANT INSERT ON  [dbo].[tblCutSheet_QueuedForApproval] TO [SPB spb_PREMISE]
GO
GRANT DELETE ON  [dbo].[tblCutSheet_QueuedForApproval] TO [SPB spb_PREMISE]
GO
