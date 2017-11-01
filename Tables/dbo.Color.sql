CREATE TABLE [dbo].[Color]
(
[BUF_COLOR] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Seq No] [smallint] NULL,
[Colored] [int] NULL CONSTRAINT [DF__Color__Colored__30EE274C] DEFAULT ((0)),
[Color Change] [tinyint] NULL CONSTRAINT [DF__Color__Color Cha__31E24B85] DEFAULT ((0)),
[Print] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SM Stock Qty] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Color] ADD CONSTRAINT [SSMA_CC$Color$BUF_COLOR$disallow_zero_length] CHECK ((len([BUF_COLOR])>(0)))
GO
ALTER TABLE [dbo].[Color] ADD CONSTRAINT [SSMA_CC$Color$Print$disallow_zero_length] CHECK ((len([Print])>(0)))
GO
ALTER TABLE [dbo].[Color] ADD CONSTRAINT [Color$PrimaryKey] PRIMARY KEY CLUSTERED  ([BUF_COLOR]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Color]', 'SCHEMA', N'dbo', 'TABLE', N'Color', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Color].[BUF_COLOR]', 'SCHEMA', N'dbo', 'TABLE', N'Color', 'COLUMN', N'BUF_COLOR'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Color].[Color Change]', 'SCHEMA', N'dbo', 'TABLE', N'Color', 'COLUMN', N'Color Change'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Color].[Colored]', 'SCHEMA', N'dbo', 'TABLE', N'Color', 'COLUMN', N'Colored'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Color].[Print]', 'SCHEMA', N'dbo', 'TABLE', N'Color', 'COLUMN', N'Print'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Color].[Seq No]', 'SCHEMA', N'dbo', 'TABLE', N'Color', 'COLUMN', N'Seq No'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Color].[SM Stock Qty]', 'SCHEMA', N'dbo', 'TABLE', N'Color', 'COLUMN', N'SM Stock Qty'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Color].[PrimaryKey]', 'SCHEMA', N'dbo', 'TABLE', N'Color', 'CONSTRAINT', N'Color$PrimaryKey'
GO
