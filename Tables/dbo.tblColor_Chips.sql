CREATE TABLE [dbo].[tblColor_Chips]
(
[ColorChip] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ColorChipType] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ColorChip_Description] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TimeStamp] [timestamp] NULL,
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblColorChips_CreatedBy_1] DEFAULT (suser_sname()),
[DateCreated] [datetime] NULL CONSTRAINT [DF_tblColorChips_DateCreated_1] DEFAULT (getdate()),
[ID] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblColor_Chips] ADD CONSTRAINT [PK_tblColorChips_1] PRIMARY KEY CLUSTERED  ([ColorChip]) ON [PRIMARY]
GO
