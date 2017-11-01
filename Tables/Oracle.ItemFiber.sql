CREATE TABLE [Oracle].[ItemFiber]
(
[ItemNumber] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Fiber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FiberCount] [int] NULL,
[FiberMeters] [float] NULL,
[DateCreated] [datetime] NULL CONSTRAINT [DF__ItemAttri__DateC__1387E197] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__ItemAttri__Creat__147C05D0] DEFAULT (suser_sname()),
[DateRevised] [datetime] NULL CONSTRAINT [DF_ItemAttributes_DateRevised] DEFAULT (getdate()),
[RevisedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [Oracle].[ItemFiber] ADD CONSTRAINT [PK__ItemAttr__C28ACDB61FFC0AE3] PRIMARY KEY CLUSTERED  ([ItemNumber], [Fiber]) ON [PRIMARY]
GO
