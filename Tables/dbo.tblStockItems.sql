CREATE TABLE [dbo].[tblStockItems]
(
[ItemNo] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblStockItems_CreatedBy] DEFAULT (suser_sname()),
[CreationDate] [datetime] NULL CONSTRAINT [DF_tblStockItems_CreationDate] DEFAULT (getdate()),
[timestamp] [timestamp] NULL,
[Min_Order_Quantity] [int] NULL,
[Price_feet] [decimal] (18, 6) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblStockItems] ADD CONSTRAINT [PK_tblStockItems] PRIMARY KEY CLUSTERED  ([ItemNo]) ON [PRIMARY]
GO
GRANT INSERT ON  [dbo].[tblStockItems] TO [NAA\houckmi]
GO
GRANT DELETE ON  [dbo].[tblStockItems] TO [NAA\houckmi]
GO
GRANT UPDATE ([ItemNo]) ON [dbo].[tblStockItems] TO [NAA\houckmi]
GO
GRANT UPDATE ([Min_Order_Quantity]) ON [dbo].[tblStockItems] TO [NAA\houckmi]
GO
GRANT UPDATE ([Price_feet]) ON [dbo].[tblStockItems] TO [NAA\houckmi]
GO
DENY DELETE ON  [dbo].[tblStockItems] TO [SPB Premise SQL RW]
GO
DENY UPDATE ON  [dbo].[tblStockItems] TO [SPB Premise SQL RW]
GO
