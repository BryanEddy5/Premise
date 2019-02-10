CREATE TABLE [Users].[LoginHistory]
(
[UserId] [int] NULL,
[UserName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LoginDate] [datetime] NULL,
[Id] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY]
GO
ALTER TABLE [Users].[LoginHistory] ADD CONSTRAINT [PK__LoginHis__3214EC07311CAD57] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [Users].[LoginHistory] ADD CONSTRAINT [FK__LoginHist__UserI__13F38C99] FOREIGN KEY ([UserId]) REFERENCES [dbo].[tblConfiguratorUser] ([UserID])
GO
