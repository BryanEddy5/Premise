CREATE TABLE [dbo].[tblDesignArmor]
(
[Armor] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ArmorUsage] [decimal] (7, 6) NULL,
[MaxArmorOD] [decimal] (6, 4) NULL,
[MaxCoreOD] [decimal] (6, 4) NULL,
[OracleArmor] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ArmorSize] [smallint] NULL,
[ArmorCostAdder] [decimal] (6, 4) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblDesignArmor] ADD CONSTRAINT [PK_tblDesignArmor] PRIMARY KEY CLUSTERED  ([Armor]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblDesignArmor] ON [dbo].[tblDesignArmor] ([MaxCoreOD], [ArmorSize]) ON [PRIMARY]
GO
