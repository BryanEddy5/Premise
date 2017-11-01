CREATE TABLE [dbo].[tblColor_Jacket_Catalog]
(
[Color_Chip_Catalog] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TimeStamp] [timestamp] NULL,
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblColor_Jacket_Catalog_CreatedBy] DEFAULT (suser_sname()),
[DateCreated] [datetime] NULL CONSTRAINT [DF_tblColor_Jacket_Catalog_DateCreated] DEFAULT (getdate()),
[ID] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblColor_Jacket_Catalog] ADD CONSTRAINT [PK_tblColor_Jacket_Catalog] PRIMARY KEY CLUSTERED  ([Color_Chip_Catalog]) ON [PRIMARY]
GO
