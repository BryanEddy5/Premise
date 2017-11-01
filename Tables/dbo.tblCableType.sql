CREATE TABLE [dbo].[tblCableType]
(
[CableType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CableID] [int] NOT NULL IDENTITY(1, 1),
[CreatedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblCableType_CreatedBy] DEFAULT (suser_sname()),
[CreationDate] [datetime] NULL CONSTRAINT [DF_tblCableType_CreationDate] DEFAULT (getdate()),
[Timestamp] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCableType] ADD CONSTRAINT [PK_tblCableType] PRIMARY KEY CLUSTERED  ([CableType]) ON [PRIMARY]
GO
