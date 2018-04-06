CREATE TABLE [CutSheet].[Images]
(
[ImageID] [int] NOT NULL IDENTITY(1, 1),
[ImageName] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ImageTypeID] [int] NOT NULL,
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Images__CreatedB__6582B673] DEFAULT (suser_sname()),
[DateCreated] [datetime] NULL CONSTRAINT [DF__Images__DateCrea__6676DAAC] DEFAULT (getdate()),
[Color] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Armored] [bit] NOT NULL CONSTRAINT [DF_Images_Armored] DEFAULT ((0)),
[ImageFileType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [CutSheet].[Images] ADD CONSTRAINT [PK_Images_1] PRIMARY KEY CLUSTERED  ([ImageID]) ON [PRIMARY]
GO
ALTER TABLE [CutSheet].[Images] ADD CONSTRAINT [IX_Images] UNIQUE NONCLUSTERED  ([ImageID], [ImageTypeID], [Color], [Armored]) ON [PRIMARY]
GO
ALTER TABLE [CutSheet].[Images] ADD CONSTRAINT [I_Images] UNIQUE NONCLUSTERED  ([ImageName], [ImageTypeID]) ON [PRIMARY]
GO
ALTER TABLE [CutSheet].[Images] ADD CONSTRAINT [FK_Image_ImageType] FOREIGN KEY ([ImageTypeID]) REFERENCES [CutSheet].[ImageType] ([ImageTypeID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [CutSheet].[Images] ADD CONSTRAINT [FK_Images_tblColors_Available] FOREIGN KEY ([Color]) REFERENCES [dbo].[tblColors_Available] ([Color]) ON DELETE CASCADE ON UPDATE CASCADE
GO
GRANT DELETE ON  [CutSheet].[Images] TO [NAA\SPB Premise SQL RO]
GO
GRANT INSERT ON  [CutSheet].[Images] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ON  [CutSheet].[Images] TO [NAA\SPB Premise SQL RO]
GO
