CREATE TABLE [dbo].[premise Bom]
(
[Finished good] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Component] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Raw Material] [int] NULL CONSTRAINT [DF__premise B__Raw M__45E94432] DEFAULT ((0)),
[ITEMNUM] [float] NULL,
[OPSEQ] [float] NULL,
[COMPONENT_QUANTITY] [float] NULL,
[componet cost] [money] NULL CONSTRAINT [DF__premise B__compo__46DD686B] DEFAULT ((0)),
[SSMA_TimeStamp] [timestamp] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[premise Bom] ADD CONSTRAINT [SSMA_CC$premise Bom$Component$disallow_zero_length] CHECK ((len([Component])>(0)))
GO
ALTER TABLE [dbo].[premise Bom] ADD CONSTRAINT [SSMA_CC$premise Bom$Finished good$disallow_zero_length] CHECK ((len([Finished good])>(0)))
GO
CREATE NONCLUSTERED INDEX [premise Bom$ITEMNUM] ON [dbo].[premise Bom] ([ITEMNUM]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[premise Bom]', 'SCHEMA', N'dbo', 'TABLE', N'premise Bom', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[premise Bom].[Component]', 'SCHEMA', N'dbo', 'TABLE', N'premise Bom', 'COLUMN', N'Component'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[premise Bom].[COMPONENT_QUANTITY]', 'SCHEMA', N'dbo', 'TABLE', N'premise Bom', 'COLUMN', N'COMPONENT_QUANTITY'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[premise Bom].[componet cost]', 'SCHEMA', N'dbo', 'TABLE', N'premise Bom', 'COLUMN', N'componet cost'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[premise Bom].[Finished good]', 'SCHEMA', N'dbo', 'TABLE', N'premise Bom', 'COLUMN', N'Finished good'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[premise Bom].[ITEMNUM]', 'SCHEMA', N'dbo', 'TABLE', N'premise Bom', 'COLUMN', N'ITEMNUM'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[premise Bom].[OPSEQ]', 'SCHEMA', N'dbo', 'TABLE', N'premise Bom', 'COLUMN', N'OPSEQ'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[premise Bom].[Raw Material]', 'SCHEMA', N'dbo', 'TABLE', N'premise Bom', 'COLUMN', N'Raw Material'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[premise Bom].[ITEMNUM]', 'SCHEMA', N'dbo', 'TABLE', N'premise Bom', 'INDEX', N'premise Bom$ITEMNUM'
GO
