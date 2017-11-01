CREATE TABLE [dbo].[tblBaseRevisionLog]
(
[Base] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[RevisionNumber] [int] NOT NULL,
[RevisionDate] [datetime] NULL,
[RevisionReason] [nchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBaseRevisionLog] ADD CONSTRAINT [PK_tblBaseRevisionLog] PRIMARY KEY CLUSTERED  ([Base], [RevisionNumber]) ON [PRIMARY]
GO
