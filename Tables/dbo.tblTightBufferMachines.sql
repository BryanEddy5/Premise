CREATE TABLE [dbo].[tblTightBufferMachines]
(
[MachineID] [int] NOT NULL IDENTITY(1, 1),
[MachineName] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MachineGroupID] [int] NOT NULL,
[CreationDate] [datetime] NOT NULL CONSTRAINT [DF_tblTightBufferMachine_CreationDate] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tblTightBufferMachine_CreatedBy] DEFAULT (suser_sname()),
[RevisedDate] [datetime] NOT NULL CONSTRAINT [DF_tblTightBufferMachine_RevisedDate] DEFAULT (getdate()),
[RevisedBy] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tblTightBufferMachine_RevisedBy] DEFAULT (suser_sname())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblTightBufferMachines] ADD CONSTRAINT [PK_tblTightBufferMachine] PRIMARY KEY CLUSTERED  ([MachineID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblTightBufferMachines] ADD CONSTRAINT [FK_tblTightBufferMachines_MachineName] FOREIGN KEY ([MachineGroupID]) REFERENCES [dbo].[tblTightBufferMachineGroups] ([MachineGroupID]) ON UPDATE CASCADE
GO
