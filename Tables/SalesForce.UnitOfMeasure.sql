CREATE TABLE [SalesForce].[UnitOfMeasure]
(
[UnitOfMeasureID] [int] NOT NULL IDENTITY(1, 1),
[UnitOfMeasure] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DateCreated] [datetime] NULL CONSTRAINT [DF__UnitOfMea__DateC__5AF01967] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__UnitOfMea__Creat__5BE43DA0] DEFAULT (suser_sname())
) ON [PRIMARY]
GO
ALTER TABLE [SalesForce].[UnitOfMeasure] ADD CONSTRAINT [PK_UnitOfMeasure] PRIMARY KEY CLUSTERED  ([UnitOfMeasureID]) ON [PRIMARY]
GO
ALTER TABLE [SalesForce].[UnitOfMeasure] ADD CONSTRAINT [IX_UnitOfMeasure] UNIQUE NONCLUSTERED  ([UnitOfMeasure]) ON [PRIMARY]
GO
