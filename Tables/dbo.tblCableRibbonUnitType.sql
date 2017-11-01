CREATE TABLE [dbo].[tblCableRibbonUnitType]
(
[FiberCount] [smallint] NOT NULL,
[RibbonUnitType] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Ribbon_Description] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TimeStamp] [timestamp] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCableRibbonUnitType] ADD CONSTRAINT [PK_tblCableRibbonUnitType] PRIMARY KEY CLUSTERED  ([FiberCount], [RibbonUnitType]) ON [PRIMARY]
GO
