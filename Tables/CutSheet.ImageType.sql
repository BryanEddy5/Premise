CREATE TABLE [CutSheet].[ImageType]
(
[ImageTypeID] [int] NOT NULL IDENTITY(1, 1),
[ImageTypeName] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__ImageType__Creat__60BE0156] DEFAULT (suser_sname()),
[DateCreated] [datetime] NULL CONSTRAINT [DF__ImageType__DateC__61B2258F] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [CutSheet].[ImageType] ADD CONSTRAINT [PK_ImageType] PRIMARY KEY CLUSTERED  ([ImageTypeID]) ON [PRIMARY]
GO
ALTER TABLE [CutSheet].[ImageType] ADD CONSTRAINT [I_ImageType] UNIQUE NONCLUSTERED  ([ImageTypeName], [ImageTypeID]) ON [PRIMARY]
GO
