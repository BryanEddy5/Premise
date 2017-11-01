CREATE TABLE [dbo].[tblSalesForce_Pricing]
(
[Product_Category] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Contribution] [decimal] (8, 4) NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[CreatedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblSalesForce_Pricing_CreatedBy] DEFAULT (suser_sname()),
[CreationDate] [datetime] NULL CONSTRAINT [DF_tblSalesForce_Pricing_CreationDate] DEFAULT (getdate()),
[timestamp] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblSalesForce_Pricing] ADD CONSTRAINT [PK_tblSalesForce_Pricing] PRIMARY KEY CLUSTERED  ([Product_Category]) ON [PRIMARY]
GO
GRANT UPDATE ([Contribution]) ON [dbo].[tblSalesForce_Pricing] TO [NAA\houckmi]
GO
DENY DELETE ON  [dbo].[tblSalesForce_Pricing] TO [SPB Premise SQL RW]
GO
DENY UPDATE ON  [dbo].[tblSalesForce_Pricing] TO [SPB Premise SQL RW]
GO
