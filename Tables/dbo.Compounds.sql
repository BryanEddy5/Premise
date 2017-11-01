CREATE TABLE [dbo].[Compounds]
(
[Compound] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Process] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SG] [real] NULL,
[Oracle Part Number] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[material cost] [real] NULL,
[Short Name] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSMA_TimeStamp] [timestamp] NOT NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Compounds] ON [dbo].[Compounds] ([Compound]) ON [PRIMARY]
GO
