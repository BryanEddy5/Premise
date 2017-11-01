CREATE TABLE [dbo].[tblDesignCodeFiberElementValue]
(
[FiberExt] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FiberValue] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Mode] [nvarchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FiberLetter] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Active] [bit] NULL,
[PreferedCableColor] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TimeStamp] [timestamp] NULL,
[FiberDescription_SalesForce] [nvarchar] (48) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CablePrintType] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Fiber_Type__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CPQ_Fiber_Cost] [decimal] (8, 6) NULL,
[FiberID] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblDesignCodeFiberElementValue] ADD CONSTRAINT [PK_tblDesignCodeFiberElementValue] PRIMARY KEY CLUSTERED  ([FiberValue], [FiberLetter]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblDesignCodeFiberElementValue] ON [dbo].[tblDesignCodeFiberElementValue] ([FiberID]) ON [PRIMARY]
GO
