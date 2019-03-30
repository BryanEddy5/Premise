CREATE TABLE [Schedule].[OrderProcessItems]
(
[OrderProcessItemsID] [int] NOT NULL IDENTITY(1, 1),
[OrderId] [int] NOT NULL,
[ItemNumber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ParentItemNumber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[JobNumber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PromiseDate] [datetime] NULL,
[DateCreated] [datetime] NULL CONSTRAINT [DF__OrderProc__DateC__486754D8] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__OrderProc__Creat__495B7911] DEFAULT (suser_sname()),
[DateRevised] [datetime] NULL CONSTRAINT [DF__OrderProc__DateR__4A4F9D4A] DEFAULT (getdate()),
[RevisedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__OrderProc__Revis__4B43C183] DEFAULT (suser_sname()),
[BomLevel] [int] NULL,
[Stamp] [timestamp] NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [Schedule].[trgrSchedule_OrderProcessItems]
ON [Schedule].[OrderProcessItems]
AFTER INSERT, UPDATE
AS
SET NOCOUNT ON;

BEGIN
    UPDATE t
    SET t.DateRevised = GETDATE(),
        t.RevisedBy = (SUSER_SNAME())
    FROM Schedule.OrderProcessItems AS t
        JOIN inserted i
            ON i.OrderProcessItemsID = t.OrderProcessItemsID;

END;

GO
ALTER TABLE [Schedule].[OrderProcessItems] ADD CONSTRAINT [PK_OrderProcessItems] PRIMARY KEY CLUSTERED  ([OrderProcessItemsID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_OrderProcessItems] ON [Schedule].[OrderProcessItems] ([ItemNumber], [OrderId], [ParentItemNumber], [BomLevel]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OrderProcessItemsOrderId] ON [Schedule].[OrderProcessItems] ([OrderId]) INCLUDE ([OrderProcessItemsID]) ON [PRIMARY]
GO
ALTER TABLE [Schedule].[OrderProcessItems] ADD CONSTRAINT [FK__OrderProc__Order__69C848A3] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[New Orders (Premise) to Transfer to SS] ([Order ID])
GO
