CREATE TABLE [dbo].[tblBase_Skeletal_Cost]
(
[Base] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BaseSkeletalCost] [decimal] (38, 10) NULL,
[AssemblyItemNumber] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LoadedBaseCost] [decimal] (38, 10) NULL,
[SetupID] [int] NOT NULL,
[TimeStamp] [timestamp] NULL,
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblBase_Skeletal_Cost_CreatedBy] DEFAULT (suser_sname()),
[DateCreated] [datetime] NULL CONSTRAINT [DF_tblBase_Skeletal_Cost_DateCreated] DEFAULT (getdate()),
[ID] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBase_Skeletal_Cost] ADD CONSTRAINT [PK_tblBase_Skeletal_Cost] PRIMARY KEY CLUSTERED  ([SetupID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBase_Skeletal_Cost] ADD CONSTRAINT [FK_tblBase_Skeletal_Cost_tblCableConstructionReferences] FOREIGN KEY ([Base]) REFERENCES [dbo].[tblCableConstructionReferences] ([Base]) ON DELETE CASCADE ON UPDATE CASCADE
GO
