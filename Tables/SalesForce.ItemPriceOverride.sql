CREATE TABLE [SalesForce].[ItemPriceOverride]
(
[ItemNo] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Price] [decimal] (18, 6) NULL,
[CreatedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbleABF_Pricing_CreatedBy] DEFAULT (suser_sname()),
[CreationDate] [datetime] NULL CONSTRAINT [DF_tbleABF_Pricing_CreationDate] DEFAULT (getdate()),
[timestamp] [timestamp] NULL,
[UnitOfMeasureID] [int] NULL CONSTRAINT [DF_ItemPriceOverride_UnitOfMeasureID] DEFAULT ((1)),
[ItemID] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY]
GO
ALTER TABLE [SalesForce].[ItemPriceOverride] ADD CONSTRAINT [PK_ItemPriceOverride] PRIMARY KEY CLUSTERED  ([ItemNo]) ON [PRIMARY]
GO
ALTER TABLE [SalesForce].[ItemPriceOverride] ADD CONSTRAINT [FK_ItemPriceOverride_UnitOfMeasure] FOREIGN KEY ([UnitOfMeasureID]) REFERENCES [SalesForce].[UnitOfMeasure] ([UnitOfMeasureID]) ON DELETE SET NULL ON UPDATE CASCADE
GO
