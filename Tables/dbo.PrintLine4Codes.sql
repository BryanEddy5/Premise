CREATE TABLE [dbo].[PrintLine4Codes]
(
[PrintLine4CodeID] [int] NOT NULL IDENTITY(1, 1),
[Line4PrintCode] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PrintLine4Codes] ADD CONSTRAINT [PK_PrintLine4Codes] PRIMARY KEY CLUSTERED  ([PrintLine4CodeID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_PrintLine4Codes] ON [dbo].[PrintLine4Codes] ([Line4PrintCode]) ON [PRIMARY]
GO
