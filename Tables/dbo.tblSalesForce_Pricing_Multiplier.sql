CREATE TABLE [dbo].[tblSalesForce_Pricing_Multiplier]
(
[Product_Category] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FiberID] [int] NOT NULL,
[CreatedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblSalesForce_Pricing_Margin_CreatedBy] DEFAULT (suser_sname()),
[CreationDate] [datetime] NULL CONSTRAINT [DF_tblSalesForce_Pricing_Margin_CreationDate] DEFAULT (getdate()),
[timestamp] [timestamp] NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[Multiplier] [decimal] (6, 4) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblSalesForce_Pricing_Multiplier] ADD CONSTRAINT [PK_tblSalesForce_Pricing_Margin] PRIMARY KEY CLUSTERED  ([Product_Category], [FiberID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblSalesForce_Pricing_Multiplier] ADD CONSTRAINT [FK_tblSalesForce_Pricing_Multiplier_tblDesignCodeFiberElementValue] FOREIGN KEY ([FiberID]) REFERENCES [dbo].[tblDesignCodeFiberElementValue] ([FiberID])
GO
ALTER TABLE [dbo].[tblSalesForce_Pricing_Multiplier] ADD CONSTRAINT [FK_tblSalesForce_Pricing_Multiplier_tblSalesForce_Pricing] FOREIGN KEY ([Product_Category]) REFERENCES [dbo].[tblSalesForce_Pricing] ([Product_Category]) ON DELETE CASCADE ON UPDATE CASCADE
GO
GRANT UPDATE ([Multiplier]) ON [dbo].[tblSalesForce_Pricing_Multiplier] TO [NAA\houckmi]
GO
DENY DELETE ON  [dbo].[tblSalesForce_Pricing_Multiplier] TO [SPB Premise SQL RW]
GO
DENY UPDATE ON  [dbo].[tblSalesForce_Pricing_Multiplier] TO [SPB Premise SQL RW]
GO
