CREATE TABLE [dbo].[tblChangeRequestLog]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[DateCreated] [datetime2] NULL CONSTRAINT [DF_tblChangeRequestLog_DateCreated] DEFAULT (getdate()),
[Originator] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Complete] [bit] NULL CONSTRAINT [DF_tblChangeRequestLog_Complete] DEFAULT ((0)),
[TimeStamp] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblChangeRequestLog] ADD CONSTRAINT [PK_tblChangeRequestLog] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
