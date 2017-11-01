CREATE TABLE [Users].[UserResponsibility]
(
[UserID] [int] NOT NULL,
[ResponsibilityID] [int] NOT NULL,
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_UserResponsibility_CreatedBy] DEFAULT (suser_sname()),
[CreatedDate] [datetime] NULL CONSTRAINT [DF_UserResponsibility_CreatedDate] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [Users].[UserResponsibility] ADD CONSTRAINT [PK_UserResponsibility] PRIMARY KEY CLUSTERED  ([UserID], [ResponsibilityID]) ON [PRIMARY]
GO
ALTER TABLE [Users].[UserResponsibility] ADD CONSTRAINT [FK_UserResponsibility_Responsibility] FOREIGN KEY ([ResponsibilityID]) REFERENCES [Users].[Responsibility] ([ResponsebilityID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [Users].[UserResponsibility] ADD CONSTRAINT [FK_UserResponsibility_tblConfiguratorUser] FOREIGN KEY ([UserID]) REFERENCES [dbo].[tblConfiguratorUser] ([UserID])
GO
