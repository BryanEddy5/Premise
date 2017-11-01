CREATE TABLE [dbo].[AFLPRD_INVSysItemCost_CAB]
(
[ItemNumber] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Item_Type] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UOM] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Item_Status] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BaseOnRollup] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Lot_Size] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Item_Cost] [numeric] (18, 6) NULL,
[Material_Cost] [numeric] (18, 6) NULL,
[Resource_Cost] [numeric] (18, 6) NULL,
[Overhead_Cost] [numeric] (18, 6) NULL,
[Material_Overhead_Cost] [numeric] (18, 6) NULL,
[Outside_Processing_Cost] [numeric] (18, 6) NULL,
[Make_Buy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Currency_Code] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Shrinkage_rate] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Default_include_in_rollup_flag] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Product Class] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Organization Code] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Operating Unit] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Number] [int] NOT NULL IDENTITY(1, 1),
[DateInserted] [datetime] NULL CONSTRAINT [DF_AFLPRD_INVSysItemCost_CAB_DateInserted] DEFAULT (getdate())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[AFLPRD_INVSysItemCost_CAB] ADD CONSTRAINT [PK__AFLPRD_I__C28ACDB67EF6D905] PRIMARY KEY CLUSTERED  ([ItemNumber]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AFLPRD_INVSysItemCost_CAB] ON [dbo].[AFLPRD_INVSysItemCost_CAB] ([Make_Buy], [ItemNumber]) ON [PRIMARY]
GO
