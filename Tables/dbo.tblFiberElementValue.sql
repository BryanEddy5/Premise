CREATE TABLE [dbo].[tblFiberElementValue]
(
[FiberLetter] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FiberValue] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Count] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblFiberElementValue] ADD CONSTRAINT [tblFiberElementValue$PrimaryKey] PRIMARY KEY CLUSTERED  ([FiberLetter]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premise Configurator.[tblFiberElementValue]', 'SCHEMA', N'dbo', 'TABLE', N'tblFiberElementValue', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premise Configurator.[tblFiberElementValue].[Count]', 'SCHEMA', N'dbo', 'TABLE', N'tblFiberElementValue', 'COLUMN', N'Count'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premise Configurator.[tblFiberElementValue].[FiberLetter]', 'SCHEMA', N'dbo', 'TABLE', N'tblFiberElementValue', 'COLUMN', N'FiberLetter'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premise Configurator.[tblFiberElementValue].[FiberValue]', 'SCHEMA', N'dbo', 'TABLE', N'tblFiberElementValue', 'COLUMN', N'FiberValue'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'Premise Configurator.[tblFiberElementValue].[PrimaryKey]', 'SCHEMA', N'dbo', 'TABLE', N'tblFiberElementValue', 'CONSTRAINT', N'tblFiberElementValue$PrimaryKey'
GO
