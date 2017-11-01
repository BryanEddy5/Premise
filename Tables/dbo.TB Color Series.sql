CREATE TABLE [dbo].[TB Color Series]
(
[TB Color Series] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [nvarchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TB Color Series] ADD CONSTRAINT [SSMA_CC$TB Color Series$Color$disallow_zero_length] CHECK ((len([Color])>(0)))
GO
ALTER TABLE [dbo].[TB Color Series] ADD CONSTRAINT [SSMA_CC$TB Color Series$Description$disallow_zero_length] CHECK ((len([Description])>(0)))
GO
ALTER TABLE [dbo].[TB Color Series] ADD CONSTRAINT [SSMA_CC$TB Color Series$TB Color Series$disallow_zero_length] CHECK ((len([TB Color Series])>(0)))
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[TB Color Series]', 'SCHEMA', N'dbo', 'TABLE', N'TB Color Series', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[TB Color Series].[Color]', 'SCHEMA', N'dbo', 'TABLE', N'TB Color Series', 'COLUMN', N'Color'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[TB Color Series].[Description]', 'SCHEMA', N'dbo', 'TABLE', N'TB Color Series', 'COLUMN', N'Description'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[TB Color Series].[TB Color Series]', 'SCHEMA', N'dbo', 'TABLE', N'TB Color Series', 'COLUMN', N'TB Color Series'
GO
