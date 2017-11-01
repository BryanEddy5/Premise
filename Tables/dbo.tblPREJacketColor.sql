CREATE TABLE [dbo].[tblPREJacketColor]
(
[Jacket Color] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Stripe] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[tblPREJacketColor]', 'SCHEMA', N'dbo', 'TABLE', N'tblPREJacketColor', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[tblPREJacketColor].[Color]', 'SCHEMA', N'dbo', 'TABLE', N'tblPREJacketColor', 'COLUMN', N'Color'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[tblPREJacketColor].[Jacket Color]', 'SCHEMA', N'dbo', 'TABLE', N'tblPREJacketColor', 'COLUMN', N'Jacket Color'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[tblPREJacketColor].[Stripe]', 'SCHEMA', N'dbo', 'TABLE', N'tblPREJacketColor', 'COLUMN', N'Stripe'
GO
