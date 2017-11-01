CREATE TABLE [dbo].[PrintLine4]
(
[PrintLine4ID] [int] NOT NULL IDENTITY(1, 1),
[Line4PrintCode] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Line4Print] [nvarchar] (70) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Spacing] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Active] [bit] NULL CONSTRAINT [DF_PrintLine4_Active] DEFAULT ((0)),
[Priority] [smallint] NULL,
[Descripton] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PrintLine4] ADD CONSTRAINT [PK_PrintLine4] PRIMARY KEY CLUSTERED  ([Line4PrintCode], [Line4Print]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_PrintLine4] ON [dbo].[PrintLine4] ([PrintLine4ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PrintLine4] ADD CONSTRAINT [FK_PrintLine4_PrintLine4Codes] FOREIGN KEY ([Line4PrintCode]) REFERENCES [dbo].[PrintLine4Codes] ([Line4PrintCode]) ON DELETE CASCADE ON UPDATE CASCADE
GO
