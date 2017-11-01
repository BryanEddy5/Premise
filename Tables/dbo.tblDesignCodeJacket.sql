CREATE TABLE [dbo].[tblDesignCodeJacket]
(
[JacketLetter] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CableLetter] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Jacket] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Active] [bit] NULL CONSTRAINT [DF_tblDesignCodeJacket_Active] DEFAULT ((1)),
[ID] [int] NOT NULL IDENTITY(1, 1),
[TimeStamp] [timestamp] NULL,
[JacketDescription_SalesForce] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblDesignCodeJacket] ADD CONSTRAINT [PK_tblDesignCodeJacket] PRIMARY KEY CLUSTERED  ([JacketLetter], [CableLetter]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblDesignCodeJacket] ON [dbo].[tblDesignCodeJacket] ([JacketLetter], [CableLetter], [Active]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblDesignCodeJacket] ADD CONSTRAINT [FK_tblDesignCodeJacket_tblSalesForce_JacketDescription] FOREIGN KEY ([JacketDescription_SalesForce]) REFERENCES [dbo].[tblSalesForce_JacketDescription] ([JacketDescription_SalesForce]) ON DELETE CASCADE ON UPDATE CASCADE
GO
