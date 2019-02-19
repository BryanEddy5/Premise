CREATE TABLE [Schedule].[OrderProcessMachines]
(
[OrderProcessMachineId] [int] NOT NULL IDENTITY(1, 1),
[OrderId] [int] NULL,
[MachineID] [int] NULL,
[MachineName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Setup] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DateCreated] [datetime] NULL CONSTRAINT [DF__OrderProc__DateC__1C88D29A] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__OrderProc__Creat__1D7CF6D3] DEFAULT (suser_sname()),
[DateRevised] [datetime] NULL CONSTRAINT [DF__OrderProc__DateR__1E711B0C] DEFAULT (getdate()),
[RevisedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__OrderProc__Revis__1F653F45] DEFAULT (suser_sname()),
[BomLevel] [int] NOT NULL,
[TrueOperationSequence] [float] NOT NULL,
[IsComplete] [bit] NULL CONSTRAINT [DF_OrderProcessMachines_Completed] DEFAULT ((0)),
[Stamp] [timestamp] NOT NULL,
[Quantity] [decimal] (15, 3) NULL,
[DepartmentCode] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [Schedule].[tgrNewOrdersUpdate] ON [Schedule].[OrderProcessMachines]
AFTER INSERT, UPDATE 
AS
	--Capture the user and time a change occured 
	BEGIN 

	UPDATE t
	SET t.DateRevised = GETDATE() , t.RevisedBy = (SUSER_SNAME()) 
	FROM Schedule.OrderProcessMachines as t
	JOIN inserted i
	ON i.OrderProcessMachineId = t.OrderProcessMachineId

	END
GO
ALTER TABLE [Schedule].[OrderProcessMachines] ADD CONSTRAINT [PK__OrderPro__011244F7110EADDF] PRIMARY KEY CLUSTERED  ([OrderProcessMachineId]) ON [PRIMARY]
GO
ALTER TABLE [Schedule].[OrderProcessMachines] ADD CONSTRAINT [IX_OrderProcessMachines] UNIQUE NONCLUSTERED  ([BomLevel], [TrueOperationSequence], [OrderId], [Setup]) ON [PRIMARY]
GO
ALTER TABLE [Schedule].[OrderProcessMachines] ADD CONSTRAINT [FK__OrderProc__Order__1B94AE61] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[New Orders (Premise) to Transfer to SS] ([Order ID])
GO
