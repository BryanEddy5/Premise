CREATE TABLE [Oracle].[Machines]
(
[MachineID] [int] NOT NULL IDENTITY(100, 1),
[MachineName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Machines__Create__61D22120] DEFAULT (suser_sname()),
[DateCreated] [datetime] NULL CONSTRAINT [DF__Machines__DateCr__62C64559] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [Oracle].[Machines] ADD CONSTRAINT [PK__Machines__44EE5B58C6442E04] PRIMARY KEY CLUSTERED  ([MachineID]) ON [PRIMARY]
GO
ALTER TABLE [Oracle].[Machines] ADD CONSTRAINT [IX_Machines] UNIQUE NONCLUSTERED  ([MachineName]) ON [PRIMARY]
GO
