CREATE TABLE [dbo].[Product Desrcriptions]
(
[Product] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Desrciprion] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RoHS-compliant] [smallint] NULL CONSTRAINT [DF__Product D__RoHS-__0EC32C7A] DEFAULT ((0)),
[RoHS restrictions] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Cabling/Sheath] [smallint] NULL CONSTRAINT [DF__Product D__Cabli__0FB750B3] DEFAULT ((0)),
[Product Compound] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Level 1 Product] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Primary Buff  Line] [tinyint] NULL CONSTRAINT [DF__Product D__Prima__10AB74EC] DEFAULT ((9)),
[Level 1 Desription] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Level 1 Product Compound] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Drawing] [varbinary] (max) NULL,
[Tolerance Code] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[App Primary Buff Line] [smallint] NULL CONSTRAINT [DF__Product D__App P__119F9925] DEFAULT ((0)),
[Buff Line Primary] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Product Cat] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TB Load] [smallint] NULL CONSTRAINT [DF__Product D__TB Lo__1293BD5E] DEFAULT ((0)),
[Buff Load] [smallint] NULL CONSTRAINT [DF__Product D__Buff __1387E197] DEFAULT ((0)),
[Sheath/Cabling Load] [smallint] NULL CONSTRAINT [DF__Product D__Sheat__147C05D0] DEFAULT ((0)),
[RevisionDate] [datetime2] (0) NULL,
[RevisedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NumSubs] [int] NULL,
[ProductID] [int] NOT NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[SubFiller] [bit] NOT NULL CONSTRAINT [DF_Product Desrcriptions_SubFiller] DEFAULT ((0)),
[TimeStamp] [timestamp] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Product Desrcriptions] ADD CONSTRAINT [SSMA_CC$Product Desrcriptions$Buff Line Primary$disallow_zero_length] CHECK ((len([Buff Line Primary])>(0)))
GO
ALTER TABLE [dbo].[Product Desrcriptions] ADD CONSTRAINT [SSMA_CC$Product Desrcriptions$Level 1 Product$disallow_zero_length] CHECK ((len([Level 1 Product])>(0)))
GO
ALTER TABLE [dbo].[Product Desrcriptions] ADD CONSTRAINT [SSMA_CC$Product Desrcriptions$Product Cat$disallow_zero_length] CHECK ((len([Product Cat])>(0)))
GO
ALTER TABLE [dbo].[Product Desrcriptions] ADD CONSTRAINT [SSMA_CC$Product Desrcriptions$Product Compound$disallow_zero_length] CHECK ((len([Product Compound])>(0)))
GO
ALTER TABLE [dbo].[Product Desrcriptions] ADD CONSTRAINT [SSMA_CC$Product Desrcriptions$RoHS restrictions$disallow_zero_length] CHECK ((len([RoHS restrictions])>(0)))
GO
ALTER TABLE [dbo].[Product Desrcriptions] ADD CONSTRAINT [SSMA_CC$Product Desrcriptions$Tolerance Code$disallow_zero_length] CHECK ((len([Tolerance Code])>(0)))
GO
ALTER TABLE [dbo].[Product Desrcriptions] ADD CONSTRAINT [Product Desrcriptions$PrimaryKey] PRIMARY KEY CLUSTERED  ([Level 1 Product], [ProductID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Product Desrcriptions] ON [dbo].[Product Desrcriptions] ([Level 1 Product]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Product Desrcriptions$Tolerance Code] ON [dbo].[Product Desrcriptions] ([SubFiller], [Product]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Product Desrcriptions] ADD CONSTRAINT [FK_Product Desrcriptions_tblCableConstructionReferences] FOREIGN KEY ([Level 1 Product]) REFERENCES [dbo].[tblCableConstructionReferences] ([Base]) ON DELETE CASCADE ON UPDATE CASCADE
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Product Desrcriptions]', 'SCHEMA', N'dbo', 'TABLE', N'Product Desrcriptions', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Product Desrcriptions].[App Primary Buff Line]', 'SCHEMA', N'dbo', 'TABLE', N'Product Desrcriptions', 'COLUMN', N'App Primary Buff Line'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Product Desrcriptions].[Buff Line Primary]', 'SCHEMA', N'dbo', 'TABLE', N'Product Desrcriptions', 'COLUMN', N'Buff Line Primary'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Product Desrcriptions].[Buff Load]', 'SCHEMA', N'dbo', 'TABLE', N'Product Desrcriptions', 'COLUMN', N'Buff Load'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Product Desrcriptions].[Cabling/Sheath]', 'SCHEMA', N'dbo', 'TABLE', N'Product Desrcriptions', 'COLUMN', N'Cabling/Sheath'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Product Desrcriptions].[Desrciprion]', 'SCHEMA', N'dbo', 'TABLE', N'Product Desrcriptions', 'COLUMN', N'Desrciprion'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Product Desrcriptions].[Drawing]', 'SCHEMA', N'dbo', 'TABLE', N'Product Desrcriptions', 'COLUMN', N'Drawing'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Product Desrcriptions].[Level 1 Desription]', 'SCHEMA', N'dbo', 'TABLE', N'Product Desrcriptions', 'COLUMN', N'Level 1 Desription'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Product Desrcriptions].[Level 1 Product]', 'SCHEMA', N'dbo', 'TABLE', N'Product Desrcriptions', 'COLUMN', N'Level 1 Product'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Product Desrcriptions].[Level 1 Product Compound]', 'SCHEMA', N'dbo', 'TABLE', N'Product Desrcriptions', 'COLUMN', N'Level 1 Product Compound'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Product Desrcriptions].[Primary Buff  Line]', 'SCHEMA', N'dbo', 'TABLE', N'Product Desrcriptions', 'COLUMN', N'Primary Buff  Line'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Product Desrcriptions].[Product]', 'SCHEMA', N'dbo', 'TABLE', N'Product Desrcriptions', 'COLUMN', N'Product'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Product Desrcriptions].[Product Cat]', 'SCHEMA', N'dbo', 'TABLE', N'Product Desrcriptions', 'COLUMN', N'Product Cat'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Product Desrcriptions].[Product Compound]', 'SCHEMA', N'dbo', 'TABLE', N'Product Desrcriptions', 'COLUMN', N'Product Compound'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Product Desrcriptions].[RoHS restrictions]', 'SCHEMA', N'dbo', 'TABLE', N'Product Desrcriptions', 'COLUMN', N'RoHS restrictions'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Product Desrcriptions].[RoHS-compliant]', 'SCHEMA', N'dbo', 'TABLE', N'Product Desrcriptions', 'COLUMN', N'RoHS-compliant'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Product Desrcriptions].[Sheath/Cabling Load]', 'SCHEMA', N'dbo', 'TABLE', N'Product Desrcriptions', 'COLUMN', N'Sheath/Cabling Load'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Product Desrcriptions].[TB Load]', 'SCHEMA', N'dbo', 'TABLE', N'Product Desrcriptions', 'COLUMN', N'TB Load'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Product Desrcriptions].[Tolerance Code]', 'SCHEMA', N'dbo', 'TABLE', N'Product Desrcriptions', 'COLUMN', N'Tolerance Code'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Product Desrcriptions].[PrimaryKey]', 'SCHEMA', N'dbo', 'TABLE', N'Product Desrcriptions', 'CONSTRAINT', N'Product Desrcriptions$PrimaryKey'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Product Desrcriptions].[Tolerance Code]', 'SCHEMA', N'dbo', 'TABLE', N'Product Desrcriptions', 'INDEX', N'Product Desrcriptions$Tolerance Code'
GO
