CREATE TABLE [Schedule].[OrderProcessMachines]
(
[OrderProcessMachineId] [int] NOT NULL IDENTITY(1, 1),
[OrderProcessItemId] [int] NOT NULL,
[MachineID] [int] NULL,
[MachineName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Setup] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DateCreated] [datetime] NULL CONSTRAINT [DF__OrderProc__DateC__631B4B14] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__OrderProc__Creat__640F6F4D] DEFAULT (suser_sname()),
[DateRevised] [datetime] NULL CONSTRAINT [DF__OrderProc__DateR__65039386] DEFAULT (getdate()),
[RevisedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__OrderProc__Revis__65F7B7BF] DEFAULT (suser_sname()),
[TrueOperationSequence] [float] NOT NULL,
[IsComplete] [bit] NULL CONSTRAINT [DF_OrderProcessMachines_Completed] DEFAULT ((0)),
[Stamp] [timestamp] NOT NULL,
[Quantity] [decimal] (15, 3) NULL,
[DepartmentCode] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TotalStartUpScrap] [int] NULL,
[NextSetup] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NextMachineID] [int] NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE TRIGGER [Schedule].[tgrNewOrdersUpdate]
ON [Schedule].[OrderProcessMachines]
AFTER INSERT, UPDATE
AS
SET NOCOUNT ON;
BEGIN

    UPDATE t
    SET t.DateRevised = GETDATE(),
        t.RevisedBy = (SUSER_SNAME())
    FROM Schedule.OrderProcessMachines AS t
        JOIN inserted i
            ON i.OrderProcessMachineId = t.OrderProcessMachineId;

	-- Whenever a machine record is updated then sync with Cust Order Specifications to ensure 
	-- Should show just the buffering lines.  Single Pass and Subunit cables
	IF UPDATE(MachineID)
	begin

		WITH cteItems
		AS(
		SELECT L.MachineName, ROW_NUMBER() OVER (PARTITION BY C.OrderId ORDER BY B.[New Oracle Part #]) RowNumber, C.OrderId--, B.[Item No], B.[New Oracle Part #], C.[Item No], C.Desgin,L.OrderProcessMachineId
		FROM dbo.[Cust Order Specifications] C
		INNER JOIN Schedule.OrderProcessItems M ON M.OrderId = C.OrderId
		INNER JOIN schedule.OrderProcessMachines L ON L.OrderProcessItemId = M.OrderProcessItemsID
		INNER JOIN dbo.[Basic Product Construction] B ON B.[New Oracle Part #] = M.ItemNumber
		INNER JOIN dbo.tblCableConstructionReferences R ON R.Base = B.Base
		INNER JOIN dbo.tblCableConstructions P ON P.BaseID = R.BaseID
		INNER JOIN dbo.tblCableType O ON O.CableType = R.CableType
		INNER JOIN Inserted I ON I.OrderProcessMachineId = L.OrderProcessMachineId
		WHERE  O.CableID IN (1,2) AND P.CablePasses = 1
		)
		UPDATE C
		SET C.MachineName = I.MachineName
		FROM cteItems I INNER JOIN dbo.[Cust Order Specifications] C ON C.OrderId = I.OrderId
		WHERE I.RowNumber = 1

	end

END;
GO
ALTER TABLE [Schedule].[OrderProcessMachines] ADD CONSTRAINT [PK__OrderPro__011244F7EB58E6DB] PRIMARY KEY CLUSTERED  ([OrderProcessMachineId]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_OrderProcessMachines] ON [Schedule].[OrderProcessMachines] ([OrderProcessItemId], [TrueOperationSequence], [Setup]) ON [PRIMARY]
GO
ALTER TABLE [Schedule].[OrderProcessMachines] ADD CONSTRAINT [FK__OrderProc__Order__67E00031] FOREIGN KEY ([OrderProcessItemId]) REFERENCES [Schedule].[OrderProcessItems] ([OrderProcessItemsID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
