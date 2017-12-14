CREATE TABLE [Construction].[FiberApplication]
(
[FiberApplicationID] [int] NOT NULL IDENTITY(100, 1),
[FiberApplication] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FiberApplicationDescription] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__FiberAppl__Creat__11B63E6C] DEFAULT (suser_sname()),
[DateCreated] [datetime] NULL CONSTRAINT [DF__FiberAppl__DateC__12AA62A5] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [Construction].[FiberApplication] ADD CONSTRAINT [PK_FiberApplication] PRIMARY KEY CLUSTERED  ([FiberApplicationID]) ON [PRIMARY]
GO
ALTER TABLE [Construction].[FiberApplication] ADD CONSTRAINT [UQ__FiberApp__D141B5FCF5FB926D] UNIQUE NONCLUSTERED  ([FiberApplication]) ON [PRIMARY]
GO
