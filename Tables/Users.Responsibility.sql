CREATE TABLE [Users].[Responsibility]
(
[ResponsebilityID] [int] NOT NULL IDENTITY(1, 1),
[ResponsibilityName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ResponsibilityDescription] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_Responsibility_CreatedBy] DEFAULT (suser_sname()),
[CreatedDate] [datetime] NULL CONSTRAINT [DF_Responsibility_CreatedDate] DEFAULT (getdate()),
[StartUpForm] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Users].[Responsibility] ADD CONSTRAINT [PK_Responsibility] PRIMARY KEY CLUSTERED  ([ResponsebilityID]) ON [PRIMARY]
GO
