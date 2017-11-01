CREATE TABLE [CutSheet].[ImageGroupReference]
(
[ImageGroupID] [int] NOT NULL,
[ImageID] [int] NOT NULL,
[ImageTypeID] [int] NOT NULL,
[Color] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__ImageGrou__Creat__19F67EB2] DEFAULT (suser_sname()),
[DateCreated] [datetime] NULL CONSTRAINT [DF__ImageGrou__DateC__1AEAA2EB] DEFAULT (getdate()),
[Armored] [bit] NOT NULL CONSTRAINT [DF_ImageGroupReference_Armored] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [CutSheet].[ImageGroupReference] ADD CONSTRAINT [PK_ImageGroupReference_1] PRIMARY KEY CLUSTERED  ([ImageID], [ImageTypeID], [Color], [Armored]) ON [PRIMARY]
GO
ALTER TABLE [CutSheet].[ImageGroupReference] ADD CONSTRAINT [FK_ImageGroupReference_Images] FOREIGN KEY ([ImageID], [ImageTypeID], [Color], [Armored]) REFERENCES [CutSheet].[Images] ([ImageID], [ImageTypeID], [Color], [Armored]) ON DELETE CASCADE ON UPDATE CASCADE
GO
