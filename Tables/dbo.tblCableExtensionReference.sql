CREATE TABLE [dbo].[tblCableExtensionReference]
(
[ExtensionIndicator] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ExtensionNumber] [smallint] NOT NULL,
[timestamp] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCableExtensionReference] ADD CONSTRAINT [PK_tblCableExtensionReference] PRIMARY KEY CLUSTERED  ([ExtensionNumber]) ON [PRIMARY]
GO
