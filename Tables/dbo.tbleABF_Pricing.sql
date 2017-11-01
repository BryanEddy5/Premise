CREATE TABLE [dbo].[tbleABF_Pricing]
(
[ItemNo] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Price_feet] [decimal] (18, 6) NULL,
[CreatedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbleABF_Pricing_CreatedBy] DEFAULT (suser_sname()),
[CreationDate] [datetime] NULL CONSTRAINT [DF_tbleABF_Pricing_CreationDate] DEFAULT (getdate()),
[timestamp] [timestamp] NULL
) ON [PRIMARY]
GO
