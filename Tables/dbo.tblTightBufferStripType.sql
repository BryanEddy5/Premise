CREATE TABLE [dbo].[tblTightBufferStripType]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[TightBufferStrip] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblEZStripType_CreatedBy] DEFAULT (suser_sname()),
[DateCreated] [datetime] NULL CONSTRAINT [DF_tblEZStripType_DateCreated] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblTightBufferStripType] ADD CONSTRAINT [PK_tblEZStripType] PRIMARY KEY CLUSTERED  ([TightBufferStrip]) ON [PRIMARY]
GO
