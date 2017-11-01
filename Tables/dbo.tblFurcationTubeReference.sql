CREATE TABLE [dbo].[tblFurcationTubeReference]
(
[Furcation] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BaseID] [int] NOT NULL,
[CreationDate] [datetime] NULL CONSTRAINT [DF_tblFurcationTubeReference_CreationDate] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblFurcationTubeReference_CreatedBy] DEFAULT (suser_sname())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblFurcationTubeReference] ADD CONSTRAINT [PK_tblFurcationTubeReference] PRIMARY KEY CLUSTERED  ([Furcation], [BaseID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblFurcationTubeReference] ADD CONSTRAINT [FK_tblFurcationTubeReference_tblCableConstructions] FOREIGN KEY ([BaseID]) REFERENCES [dbo].[tblCableConstructions] ([BaseID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblFurcationTubeReference] ADD CONSTRAINT [FK_tblFurcationTubeReference_tblDesignCodeFurcationTube] FOREIGN KEY ([Furcation]) REFERENCES [dbo].[tblDesignCodeFurcationTube] ([Furcation]) ON DELETE CASCADE ON UPDATE CASCADE
GO
