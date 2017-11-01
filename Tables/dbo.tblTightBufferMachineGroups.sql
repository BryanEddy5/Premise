CREATE TABLE [dbo].[tblTightBufferMachineGroups]
(
[MachineGroupID] [int] NOT NULL IDENTITY(1, 1),
[MachineGroupName] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreationDate] [datetime] NOT NULL CONSTRAINT [DF_tblTightBufferMachineGroups_CreationDate] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tblTightBufferMachineGroups_CreatedBy] DEFAULT (suser_sname()),
[RevisedDate] [datetime] NOT NULL CONSTRAINT [DF_tblTightBufferMachineGroups_RevisedDate] DEFAULT (getdate()),
[RevisedBy] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tblTightBufferMachineGroups_RevisedBy] DEFAULT (suser_sname())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblTightBufferMachineGroups] ADD CONSTRAINT [PK_tblTightBufferMachineGroups] PRIMARY KEY CLUSTERED  ([MachineGroupID]) ON [PRIMARY]
GO
