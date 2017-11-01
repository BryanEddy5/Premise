CREATE TABLE [dbo].[ApplicationDirectory]
(
[ApplicationName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ApplicationID] [int] NOT NULL IDENTITY(1, 1),
[ApplicationDirectory] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreationDate] [datetime] NULL CONSTRAINT [DF_ApplicationLocation_CreationDate] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_ApplicationLocation_CreatedBy] DEFAULT (suser_sname()),
[RevisedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_ApplicationLocation_RevisedBy] DEFAULT (suser_sname()),
[RevisedDate] [datetime] NULL CONSTRAINT [DF_ApplicationLocation_RevisedDate] DEFAULT (getdate()),
[Timestamp] [timestamp] NOT NULL,
[ClientDirectory] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ApplicationDirectory] ADD CONSTRAINT [PK_ApplicationLocation] PRIMARY KEY CLUSTERED  ([ApplicationName]) ON [PRIMARY]
GO
