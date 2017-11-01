CREATE TABLE [dbo].[Customers]
(
[CustomerID] [int] NOT NULL IDENTITY(1, 1),
[Customer] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreationDate] [datetime] NULL CONSTRAINT [DF_Customers_CreationDate] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_Customers_CreatedBy] DEFAULT (suser_sname()),
[RevisedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_Customers_RevisedBy] DEFAULT (suser_sname()),
[RevisedDate] [datetime] NULL CONSTRAINT [DF_Customers_RevisedDate] DEFAULT (getdate()),
[Timestamp] [timestamp] NOT NULL,
[CustomerSpecialNotes] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE TRIGGER [dbo].[Customerstrgr] ON [dbo].[Customers]
AFTER INSERT, UPDATE 
AS
	BEGIN 
		IF NOT (UPDATE(RevisedDate))
			BEGIN
			  UPDATE t
			  SET t.RevisedDate = GETDATE(),t.RevisedBy = (SUSER_SNAME()) 
			  FROM dbo.Customers as t
			  JOIN inserted i
			  ON i.Customer = t.Customer
			END
	END





GO
ALTER TABLE [dbo].[Customers] ADD CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED  ([Customer]) ON [PRIMARY]
GO
