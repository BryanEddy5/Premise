CREATE TABLE [dbo].[tblEmailOptions]
(
[EmailSubject] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailTo] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailCC] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailBCC] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProductType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailOption] [int] NOT NULL IDENTITY(1, 1),
[EmailBody] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Path] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblEmailOptions] ADD CONSTRAINT [PK_tblEmailOptions] PRIMARY KEY CLUSTERED  ([EmailOption]) ON [PRIMARY]
GO
