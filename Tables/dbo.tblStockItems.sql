CREATE TABLE [dbo].[tblStockItems]
(
[ItemNo] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblStockItems_CreatedBy] DEFAULT (suser_sname()),
[CreationDate] [datetime] NULL CONSTRAINT [DF_tblStockItems_CreationDate] DEFAULT (getdate()),
[timestamp] [timestamp] NULL,
[Min_Order_Quantity] [int] NULL,
[Price_feet] [decimal] (18, 6) NULL,
[RevisedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblStockItems_RevisedBy] DEFAULT (suser_sname()),
[RevisionDate] [datetime] NULL CONSTRAINT [DF_tblStockItems_RevisionDate] DEFAULT (getdate()),
[LeadTime_ID] [int] NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Bryan Eddy
-- Create date: 1/24/2018
-- Description:	Update the fields for who made a revision to the record
-- =============================================
CREATE TRIGGER [dbo].[StockItemsUpdate_trgr] 
   ON  [dbo].[tblStockItems] 
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF UPDATE(Min_Order_Quantity) OR UPDATE(ItemNo) OR UPDATE(Price_feet)
		BEGIN
			UPDATE T
			SET RevisedBy = SUSER_SNAME(), RevisionDate = GETDATE()
			FROM dbo.tblStockItems T INNER JOIN Inserted I ON T.ItemNo = I.ItemNo
		END;

END
GO
ALTER TABLE [dbo].[tblStockItems] ADD CONSTRAINT [PK_tblStockItems] PRIMARY KEY CLUSTERED  ([ItemNo]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[tblStockItems] TO [NAA\houckmi]
GO
GRANT INSERT ON  [dbo].[tblStockItems] TO [NAA\houckmi]
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
