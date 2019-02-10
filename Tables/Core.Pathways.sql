CREATE TABLE [Core].[Pathways]
(
[PathID] [int] NOT NULL IDENTITY(1, 1),
[PathName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Pathway] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DateCreated] [datetime] NULL CONSTRAINT [DF__Pathways__DateCr__1022FBB5] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Pathways__Create__11171FEE] DEFAULT (suser_sname())
) ON [PRIMARY]
GO
ALTER TABLE [Core].[Pathways] ADD CONSTRAINT [UQ__Pathways__1C9526054B19782E] UNIQUE NONCLUSTERED  ([PathName]) ON [PRIMARY]
GO
