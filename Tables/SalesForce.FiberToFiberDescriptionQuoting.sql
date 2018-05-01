CREATE TABLE [SalesForce].[FiberToFiberDescriptionQuoting]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[FiberID] [int] NOT NULL,
[FiberItemID] [int] NOT NULL,
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__FiberToFi__Creat__5813ACBC] DEFAULT (suser_sname()),
[DateCreated] [datetime] NULL CONSTRAINT [DF__FiberToFi__DateC__5907D0F5] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [SalesForce].[FiberToFiberDescriptionQuoting] ADD CONSTRAINT [pk_FiberToFiberDescriptionQuoting] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
ALTER TABLE [SalesForce].[FiberToFiberDescriptionQuoting] ADD CONSTRAINT [ix_FiberToFiberDescriptionQuoting] UNIQUE NONCLUSTERED  ([FiberID], [FiberItemID]) ON [PRIMARY]
GO
ALTER TABLE [SalesForce].[FiberToFiberDescriptionQuoting] ADD CONSTRAINT [FK__FiberToFi__Fiber__571F8883] FOREIGN KEY ([FiberItemID]) REFERENCES [dbo].[tbl_Fibers] ([FiberItemID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [SalesForce].[FiberToFiberDescriptionQuoting] ADD CONSTRAINT [FK__FiberToFi__Fiber__562B644A] FOREIGN KEY ([FiberID]) REFERENCES [dbo].[tblDesignCodeFiberElementValue] ([FiberID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
