CREATE TABLE [dbo].[tblItemInterfaceDataTypes]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[DataTypeOrg] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ItemType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DataTypeName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DataTypeOrder] [int] NULL CONSTRAINT [DF__tblItemIn__DataT__37DB1BFD] DEFAULT ((0)),
[DataTypeValue] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AppliesTo] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AllowOverride] [smallint] NULL CONSTRAINT [DF__tblItemIn__Allow__38CF4036] DEFAULT ((0)),
[DesignType] [int] NULL CONSTRAINT [DF__tblItemIn__Desig__39C3646F] DEFAULT ((0)),
[DesignSubType] [int] NULL CONSTRAINT [DF__tblItemIn__Desig__3AB788A8] DEFAULT ((0)),
[UnitTypeID] [int] NULL CONSTRAINT [DF__tblItemIn__UnitT__3BABACE1] DEFAULT ((0)),
[Qualifier1] [int] NULL CONSTRAINT [DF__tblItemIn__Quali__3C9FD11A] DEFAULT ((0)),
[Qualifier1Type] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Qualifier2] [int] NULL CONSTRAINT [DF__tblItemIn__Quali__3D93F553] DEFAULT ((0)),
[Qualifier2Type] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MfgLocation] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSMA_TimeStamp] [timestamp] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblItemInterfaceDataTypes] WITH NOCHECK ADD CONSTRAINT [SSMA_CC$tblItemInterfaceDataTypes$AppliesTo$disallow_zero_length] CHECK ((len([AppliesTo])>(0)))
GO
ALTER TABLE [dbo].[tblItemInterfaceDataTypes] WITH NOCHECK ADD CONSTRAINT [SSMA_CC$tblItemInterfaceDataTypes$DataTypeName$disallow_zero_length] CHECK ((len([DataTypeName])>(0)))
GO
ALTER TABLE [dbo].[tblItemInterfaceDataTypes] WITH NOCHECK ADD CONSTRAINT [SSMA_CC$tblItemInterfaceDataTypes$DataTypeOrg$disallow_zero_length] CHECK ((len([DataTypeOrg])>(0)))
GO
ALTER TABLE [dbo].[tblItemInterfaceDataTypes] WITH NOCHECK ADD CONSTRAINT [SSMA_CC$tblItemInterfaceDataTypes$DataTypeValue$disallow_zero_length] CHECK ((len([DataTypeValue])>(0)))
GO
ALTER TABLE [dbo].[tblItemInterfaceDataTypes] WITH NOCHECK ADD CONSTRAINT [SSMA_CC$tblItemInterfaceDataTypes$ItemType$disallow_zero_length] CHECK ((len([ItemType])>(0)))
GO
ALTER TABLE [dbo].[tblItemInterfaceDataTypes] WITH NOCHECK ADD CONSTRAINT [SSMA_CC$tblItemInterfaceDataTypes$Qualifier1Type$disallow_zero_length] CHECK ((len([Qualifier1Type])>(0)))
GO
ALTER TABLE [dbo].[tblItemInterfaceDataTypes] WITH NOCHECK ADD CONSTRAINT [SSMA_CC$tblItemInterfaceDataTypes$Qualifier2Type$disallow_zero_length] CHECK ((len([Qualifier2Type])>(0)))
GO
ALTER TABLE [dbo].[tblItemInterfaceDataTypes] ADD CONSTRAINT [tblItemInterfaceDataTypes$PrimaryKey] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [tblItemInterfaceDataTypes$ItemTypeID] ON [dbo].[tblItemInterfaceDataTypes] ([UnitTypeID], [ItemType], [DataTypeValue], [AllowOverride], [AppliesTo]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Database1.[tblItemInterfaceDataTypes]', 'SCHEMA', N'dbo', 'TABLE', N'tblItemInterfaceDataTypes', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Database1.[tblItemInterfaceDataTypes].[AllowOverride]', 'SCHEMA', N'dbo', 'TABLE', N'tblItemInterfaceDataTypes', 'COLUMN', N'AllowOverride'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Database1.[tblItemInterfaceDataTypes].[AppliesTo]', 'SCHEMA', N'dbo', 'TABLE', N'tblItemInterfaceDataTypes', 'COLUMN', N'AppliesTo'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Database1.[tblItemInterfaceDataTypes].[DataTypeName]', 'SCHEMA', N'dbo', 'TABLE', N'tblItemInterfaceDataTypes', 'COLUMN', N'DataTypeName'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Database1.[tblItemInterfaceDataTypes].[DataTypeOrder]', 'SCHEMA', N'dbo', 'TABLE', N'tblItemInterfaceDataTypes', 'COLUMN', N'DataTypeOrder'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Database1.[tblItemInterfaceDataTypes].[DataTypeOrg]', 'SCHEMA', N'dbo', 'TABLE', N'tblItemInterfaceDataTypes', 'COLUMN', N'DataTypeOrg'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Database1.[tblItemInterfaceDataTypes].[DataTypeValue]', 'SCHEMA', N'dbo', 'TABLE', N'tblItemInterfaceDataTypes', 'COLUMN', N'DataTypeValue'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Database1.[tblItemInterfaceDataTypes].[DesignSubType]', 'SCHEMA', N'dbo', 'TABLE', N'tblItemInterfaceDataTypes', 'COLUMN', N'DesignSubType'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Database1.[tblItemInterfaceDataTypes].[DesignType]', 'SCHEMA', N'dbo', 'TABLE', N'tblItemInterfaceDataTypes', 'COLUMN', N'DesignType'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Database1.[tblItemInterfaceDataTypes].[ID]', 'SCHEMA', N'dbo', 'TABLE', N'tblItemInterfaceDataTypes', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Database1.[tblItemInterfaceDataTypes].[ItemType]', 'SCHEMA', N'dbo', 'TABLE', N'tblItemInterfaceDataTypes', 'COLUMN', N'ItemType'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Database1.[tblItemInterfaceDataTypes].[MfgLocation]', 'SCHEMA', N'dbo', 'TABLE', N'tblItemInterfaceDataTypes', 'COLUMN', N'MfgLocation'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Database1.[tblItemInterfaceDataTypes].[Qualifier1]', 'SCHEMA', N'dbo', 'TABLE', N'tblItemInterfaceDataTypes', 'COLUMN', N'Qualifier1'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Database1.[tblItemInterfaceDataTypes].[Qualifier1Type]', 'SCHEMA', N'dbo', 'TABLE', N'tblItemInterfaceDataTypes', 'COLUMN', N'Qualifier1Type'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Database1.[tblItemInterfaceDataTypes].[Qualifier2]', 'SCHEMA', N'dbo', 'TABLE', N'tblItemInterfaceDataTypes', 'COLUMN', N'Qualifier2'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Database1.[tblItemInterfaceDataTypes].[Qualifier2Type]', 'SCHEMA', N'dbo', 'TABLE', N'tblItemInterfaceDataTypes', 'COLUMN', N'Qualifier2Type'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Database1.[tblItemInterfaceDataTypes].[UnitTypeID]', 'SCHEMA', N'dbo', 'TABLE', N'tblItemInterfaceDataTypes', 'COLUMN', N'UnitTypeID'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Database1.[tblItemInterfaceDataTypes].[PrimaryKey]', 'SCHEMA', N'dbo', 'TABLE', N'tblItemInterfaceDataTypes', 'CONSTRAINT', N'tblItemInterfaceDataTypes$PrimaryKey'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Database1.[tblItemInterfaceDataTypes].[ItemTypeID]', 'SCHEMA', N'dbo', 'TABLE', N'tblItemInterfaceDataTypes', 'INDEX', N'tblItemInterfaceDataTypes$ItemTypeID'
GO
