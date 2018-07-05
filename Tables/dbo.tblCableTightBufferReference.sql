CREATE TABLE [dbo].[tblCableTightBufferReference]
(
[TBTypeID] [int] NOT NULL IDENTITY(1, 1),
[TBType] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TBIndicatorID] [int] NULL,
[TimeStamp] [timestamp] NOT NULL,
[DateCreated] [datetime2] NULL CONSTRAINT [DF_tblCableTightBufferReference_DateCreated] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblCableTightBufferReference_CreatedBy] DEFAULT (suser_sname()),
[TightBuffered] [bit] NULL CONSTRAINT [DF_tblCableTightBufferReference_TightBuffered] DEFAULT ((0)),
[ComponentSelection] [bit] NULL CONSTRAINT [DF_tblCableTightBufferReference_ComponentSelection] DEFAULT ((0)),
[RevisedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblCableTightBufferReference_RevisedBy] DEFAULT (suser_sname()),
[DateRevised] [datetime] NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE TRIGGER [dbo].[tblCableTightBufferReferenceUpdate] ON [dbo].[tblCableTightBufferReference]
AFTER INSERT, UPDATE 
AS
	BEGIN 
			  UPDATE t
			  SET t.TBIndicatorID = t.TBTypeID, DateRevised = getdate(), RevisedBy = suser_sname()
			  FROM dbo.tblCableTightBufferReference as t
			  JOIN inserted i
			  ON i.TBTypeID = t.TBTypeID
	END
			

GO
ALTER TABLE [dbo].[tblCableTightBufferReference] ADD CONSTRAINT [PK_tblCableTightBufferReference] PRIMARY KEY CLUSTERED  ([TBType]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblCableTightBufferReference] ON [dbo].[tblCableTightBufferReference] ([TBIndicatorID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblCableTightBufferReference_1] ON [dbo].[tblCableTightBufferReference] ([TBTypeID]) ON [PRIMARY]
GO
