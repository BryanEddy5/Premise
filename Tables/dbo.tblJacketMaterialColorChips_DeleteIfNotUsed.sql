CREATE TABLE [dbo].[tblJacketMaterialColorChips_DeleteIfNotUsed]
(
[Jacket] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Color] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ColorChip] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ColorLetter] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TimeStamp] [timestamp] NULL,
[DateCreated] [datetime] NULL CONSTRAINT [DF_tblJacketMaterialColorChips_DateCreated] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblJacketMaterialColorChips_DeleteIfNotUsed] ADD CONSTRAINT [PK_tblJacketMaterialColorChips_1] PRIMARY KEY CLUSTERED  ([Jacket], [ColorLetter]) ON [PRIMARY]
GO
