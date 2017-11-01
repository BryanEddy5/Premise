CREATE TABLE [dbo].[PrintTypeBase]
(
[PrintID] [int] NOT NULL IDENTITY(1000, 1),
[PrintTypeBase] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__PrintType__Creat__33B650B5] DEFAULT (suser_name()),
[DateCreated] [datetime] NULL CONSTRAINT [DF__PrintType__DateC__34AA74EE] DEFAULT (getdate()),
[Active] [bit] NULL CONSTRAINT [DF_PrintTypeBase_Active] DEFAULT ((0)),
[Priority] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PrintTypeBase] ADD CONSTRAINT [PK_PrintTypeBase] PRIMARY KEY CLUSTERED  ([PrintTypeBase]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PrintTypeBase] ADD CONSTRAINT [IX_PrintTypeBase] UNIQUE NONCLUSTERED  ([PrintTypeBase]) ON [PRIMARY]
GO
