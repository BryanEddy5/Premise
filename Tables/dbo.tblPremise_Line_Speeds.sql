CREATE TABLE [dbo].[tblPremise_Line_Speeds]
(
[PrefixID] [int] NOT NULL,
[LineSpeed] [decimal] (5, 1) NULL,
[MappedColumn] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Machine] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Setup] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblPremise_Line_Speeds] ADD CONSTRAINT [PK_tblPremise_Line_Speeds] PRIMARY KEY CLUSTERED  ([PrefixID], [Machine], [Setup]) ON [PRIMARY]
GO
