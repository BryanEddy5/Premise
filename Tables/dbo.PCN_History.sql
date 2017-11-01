CREATE TABLE [dbo].[PCN_History]
(
[PCN] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Customer] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[OldItem] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NewItem] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreationDate] [datetime] NULL CONSTRAINT [DF_PCN_History_CreationDate] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_PCN_History_CreatedBy] DEFAULT (suser_sname())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PCN_History] ADD CONSTRAINT [PK_PCN_History] PRIMARY KEY CLUSTERED  ([Customer], [OldItem], [NewItem]) ON [PRIMARY]
GO
