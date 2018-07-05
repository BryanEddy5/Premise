CREATE TABLE [dbo].[tblCableTBType]
(
[TBLetterIndicator] [int] NOT NULL IDENTITY(1, 1),
[TBLetter] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TBDescription] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Active] [bit] NOT NULL CONSTRAINT [DF_tblCableTBType_Active] DEFAULT ((0)),
[PreferenceOrder] [int] NULL,
[TBIndicatorID] [int] NULL,
[TimeStamp] [timestamp] NOT NULL,
[OracleTBDesc] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TightBufferDescription_SalesForce] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Non_Standard_Product] [bit] NULL CONSTRAINT [DF_tblCableTBType_Non_Standard_Product] DEFAULT ((0)),
[ColoredFiber] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCableTBType] ADD CONSTRAINT [PK_tblCableTBType] PRIMARY KEY CLUSTERED  ([TBLetterIndicator]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblCableTBType] ON [dbo].[tblCableTBType] ([TBIndicatorID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblCableTBType_1] ON [dbo].[tblCableTBType] ([TBIndicatorID], [TBLetter]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCableTBType] ADD CONSTRAINT [FK_tblCableTBType_tblCableTightBufferReference] FOREIGN KEY ([TBIndicatorID]) REFERENCES [dbo].[tblCableTightBufferReference] ([TBTypeID]) ON DELETE SET NULL ON UPDATE CASCADE
GO
