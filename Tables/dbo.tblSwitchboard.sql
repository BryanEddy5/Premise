CREATE TABLE [dbo].[tblSwitchboard]
(
[SwitchboardID] [smallint] NOT NULL,
[ItemNumber] [smallint] NOT NULL,
[ItemText] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Command] [smallint] NULL,
[Argument] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ID] [uniqueidentifier] NULL,
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblSwitchboard_CreatedBy] DEFAULT (suser_sname()),
[CreationDate] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblSwitchboard_CreationDate] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblSwitchboard] ADD CONSTRAINT [PK_tblSwitchboard] PRIMARY KEY CLUSTERED  ([SwitchboardID], [ItemNumber]) ON [PRIMARY]
GO
