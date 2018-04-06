CREATE TABLE [CutSheet].[ImageGroup]
(
[ImageGroupID] [int] NOT NULL IDENTITY(1, 1),
[ImageGroupName] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ImageGroupDesc] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__ImageGrou__Creat__2938C242] DEFAULT (suser_sname()),
[DateCreated] [datetime] NULL CONSTRAINT [DF__ImageGrou__DateC__2A2CE67B] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [CutSheet].[ImageGroup] ADD CONSTRAINT [PK_ImageGroup] PRIMARY KEY CLUSTERED  ([ImageGroupID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ImageGroup] ON [CutSheet].[ImageGroup] ([ImageGroupName]) ON [PRIMARY]
GO
ALTER TABLE [CutSheet].[ImageGroup] ADD CONSTRAINT [FK_ImageGroup_ImageGroup] FOREIGN KEY ([ImageGroupID]) REFERENCES [CutSheet].[ImageGroup] ([ImageGroupID])
GO
GRANT DELETE ON  [CutSheet].[ImageGroup] TO [NAA\SPB Premise SQL RO]
GO
GRANT INSERT ON  [CutSheet].[ImageGroup] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ON  [CutSheet].[ImageGroup] TO [NAA\SPB Premise SQL RO]
GO
