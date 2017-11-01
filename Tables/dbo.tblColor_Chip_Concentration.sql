CREATE TABLE [dbo].[tblColor_Chip_Concentration]
(
[Color_Chip_Catalog] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ColorChip] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Color_Chip_Concentration] [decimal] (6, 5) NULL,
[TimeStamp] [timestamp] NULL,
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblColor_Chip_Concentration_CreatedBy] DEFAULT (suser_sname()),
[DateCreated] [datetime] NULL CONSTRAINT [DF_tblColor_Chip_Concentration_DateCreated] DEFAULT (getdate()),
[ID] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblColor_Chip_Concentration] ADD CONSTRAINT [PK_tblColor_Chip_Concentration] PRIMARY KEY CLUSTERED  ([Color_Chip_Catalog], [Color]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblColor_Chip_Concentration] ADD CONSTRAINT [FK_tblColor_Chip_Concentration_tblColor_Chips] FOREIGN KEY ([ColorChip]) REFERENCES [dbo].[tblColor_Chips] ([ColorChip]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblColor_Chip_Concentration] ADD CONSTRAINT [FK_tblColor_Chip_Concentration_tblColor_Jacket_Catalog] FOREIGN KEY ([Color_Chip_Catalog]) REFERENCES [dbo].[tblColor_Jacket_Catalog] ([Color_Chip_Catalog]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblColor_Chip_Concentration] ADD CONSTRAINT [FK_tblColor_Chip_Concentration_tblColors_Available] FOREIGN KEY ([Color]) REFERENCES [dbo].[tblColors_Available] ([Color]) ON DELETE CASCADE ON UPDATE CASCADE
GO
