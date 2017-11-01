CREATE TABLE [dbo].[tblConfiguratorUser]
(
[User] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UserType] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UserTypeID] [int] NULL,
[CutSheetApprover] [int] NULL CONSTRAINT [DF_tblConfiguratorUser_CutSheetApprover] DEFAULT ((0)),
[UserEmail] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SQL_User] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblConfiguratorUser_CreatedBy] DEFAULT (suser_sname()),
[CreationDate] [datetime] NULL CONSTRAINT [DF_tblConfiguratorUser_RevisionDate] DEFAULT (getdate()),
[timestamp] [timestamp] NULL,
[ItemBuilder] [bit] NULL CONSTRAINT [DF_tblConfiguratorUser_ItemBuilder] DEFAULT ((0)),
[UserID] [int] NOT NULL IDENTITY(1, 1),
[LastLoginDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblConfiguratorUser] ADD CONSTRAINT [PK_tblConfiguratorUser] PRIMARY KEY CLUSTERED  ([User]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblConfiguratorUser] ON [dbo].[tblConfiguratorUser] ([UserID]) ON [PRIMARY]
GO
