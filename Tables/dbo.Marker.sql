CREATE TABLE [dbo].[Marker]
(
[Mark] [int] NULL CONSTRAINT [DF__Marker__Mark__3A779186] DEFAULT ((0))
) ON [PRIMARY]
GO
GRANT INSERT ON  [dbo].[Marker] TO [NAA\SPB Premise SQL RO]
GO
GRANT DELETE ON  [dbo].[Marker] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ON  [dbo].[Marker] TO [NAA\SPB Premise SQL RO]
GO
GRANT SELECT ON  [dbo].[Marker] TO [SPB spb_PREMISE]
GO
GRANT INSERT ON  [dbo].[Marker] TO [SPB spb_PREMISE]
GO
GRANT DELETE ON  [dbo].[Marker] TO [SPB spb_PREMISE]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Marker]', 'SCHEMA', N'dbo', 'TABLE', N'Marker', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Marker].[Mark]', 'SCHEMA', N'dbo', 'TABLE', N'Marker', 'COLUMN', N'Mark'
GO
