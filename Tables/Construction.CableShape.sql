CREATE TABLE [Construction].[CableShape]
(
[CableShapeID] [int] NOT NULL IDENTITY(100, 1),
[CableShape] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CableShapeDescription] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__CableShap__Creat__0BFD6516] DEFAULT (suser_sname()),
[DateCreated] [datetime] NULL CONSTRAINT [DF__CableShap__DateC__0CF1894F] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [Construction].[CableShape] ADD CONSTRAINT [PK_CableShape] PRIMARY KEY CLUSTERED  ([CableShapeID]) ON [PRIMARY]
GO
ALTER TABLE [Construction].[CableShape] ADD CONSTRAINT [UQ__CableSha__E61A9B029117A064] UNIQUE NONCLUSTERED  ([CableShape]) ON [PRIMARY]
GO
