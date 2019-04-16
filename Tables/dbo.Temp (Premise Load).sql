CREATE TABLE [dbo].[Temp (Premise Load)]
(
[Req'd Days (#TB or RBN)] [real] NULL,
[Req'd Days (C#4)] [real] NULL,
[Req'd Days (SH#3)] [real] NULL,
[Adj Schedule Date] [datetime] NULL,
[Setup Buff] [int] NULL CONSTRAINT [DF__Temp (Pre__Setup__32C16125] DEFAULT ((0)),
[Setup SZ/SH] [int] NULL CONSTRAINT [DF__Temp (Pre__Setup__33B5855E] DEFAULT ((0)),
[Week ending] [datetime] NULL,
[Customer] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Item number] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Length] [float] NULL,
[Mfg commit date] [datetime] NULL,
[Schedule date] [datetime] NULL,
[Reel number] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Adj Mfg  Date] [datetime] NULL,
[Week ending-mfg] [datetime] NULL,
[Factor] [decimal] (15, 3) NULL,
[Count] [int] NULL,
[Ftype] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Base] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Type Order] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Temp (Pre__Type __34A9A997] DEFAULT ('Loaded'),
[CO#] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Line#] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Design] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Complete Buff] [int] NULL CONSTRAINT [DF_Temp (Premise Load)_Complete Buff] DEFAULT ((0)),
[Family] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Job#] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Order Source] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Jacket Material] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Jacket Color] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Order Qty] [int] NULL,
[RequiredDays] [real] NULL CONSTRAINT [DF__Temp (Pre__Requi__3691F209] DEFAULT ((0)),
[Start] [datetime] NULL,
[Finish] [datetime] NULL,
[Sequence] [real] NULL CONSTRAINT [DF__Temp (Pre__Seque__37861642] DEFAULT ((0)),
[Early Start] [int] NULL CONSTRAINT [DF__Temp (Pre__Early__387A3A7B] DEFAULT ((0)),
[ID] [int] NOT NULL IDENTITY(1, 1),
[ParentID] [int] NULL,
[RequiredDays_Orig] [real] NULL CONSTRAINT [DF__Temp (Pre__Requi__396E5EB4] DEFAULT ((0)),
[Start_Split] [datetime] NULL,
[Finish_Split] [datetime] NULL,
[Type Seq] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Length Meters] [int] NULL CONSTRAINT [DF__Temp (Pre__Lengt__3A6282ED] DEFAULT ((0)),
[B1 Hrs] [int] NULL CONSTRAINT [DF__Temp (Pre__B1 Hr__3B56A726] DEFAULT ((0)),
[B4 Hrs] [int] NULL CONSTRAINT [DF__Temp (Pre__B4 Hr__3C4ACB5F] DEFAULT ((0)),
[B6 Hrs] [int] NULL CONSTRAINT [DF__Temp (Pre__B6 Hr__3D3EEF98] DEFAULT ((0)),
[B2 Hrs] [int] NULL CONSTRAINT [DF__Temp (Pre__B2 Hr__3E3313D1] DEFAULT ((0)),
[B11 Hrs] [int] NULL CONSTRAINT [DF__Temp (Pre__B11 H__3F27380A] DEFAULT ((0)),
[B9 Hrs] [int] NULL CONSTRAINT [DF__Temp (Pre__B9 Hr__401B5C43] DEFAULT ((0)),
[Setup Hrs] [int] NULL CONSTRAINT [DF__Temp (Pre__Setup__410F807C] DEFAULT ((0)),
[Promise Date] [datetime] NULL,
[CompLength] [int] NULL,
[Active] [int] NULL CONSTRAINT [DF__Temp (Pre__Activ__42F7C8EE] DEFAULT ((0)),
[B10 Hrs] [int] NULL CONSTRAINT [DF__Temp (Pre__B10 H__43EBED27] DEFAULT ((0)),
[IASeq] [smallint] NULL CONSTRAINT [DF__Temp (Pre__IASeq__44E01160] DEFAULT ((0)),
[CabSeq] [smallint] NULL CONSTRAINT [DF__Temp (Pre__CabSe__45D43599] DEFAULT ((0)),
[Sh3Seq] [smallint] NULL CONSTRAINT [DF__Temp (Pre__Sh3Se__46C859D2] DEFAULT ((0)),
[SSMA_TimeStamp] [timestamp] NOT NULL,
[B18Hrs] [int] NULL CONSTRAINT [DF_Temp (Premise Load)_B18Hrs] DEFAULT ((0)),
[Setup] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MachineId] [int] NULL,
[IsDownTime] [bit] NULL CONSTRAINT [DF_Temp (Premise Load)_IsDownTime] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Temp (Premise Load)] ADD CONSTRAINT [SSMA_CC$Temp (Premise Load)$Base$disallow_zero_length] CHECK ((len([Base])>(0)))
GO
ALTER TABLE [dbo].[Temp (Premise Load)] ADD CONSTRAINT [SSMA_CC$Temp (Premise Load)$CO#$disallow_zero_length] CHECK ((len([CO#])>(0)))
GO
ALTER TABLE [dbo].[Temp (Premise Load)] ADD CONSTRAINT [SSMA_CC$Temp (Premise Load)$Customer$disallow_zero_length] CHECK ((len([Customer])>(0)))
GO
ALTER TABLE [dbo].[Temp (Premise Load)] ADD CONSTRAINT [SSMA_CC$Temp (Premise Load)$Design$disallow_zero_length] CHECK ((len([Design])>(0)))
GO
ALTER TABLE [dbo].[Temp (Premise Load)] ADD CONSTRAINT [SSMA_CC$Temp (Premise Load)$Family$disallow_zero_length] CHECK ((len([Family])>(0)))
GO
ALTER TABLE [dbo].[Temp (Premise Load)] ADD CONSTRAINT [SSMA_CC$Temp (Premise Load)$Ftype$disallow_zero_length] CHECK ((len([Ftype])>(0)))
GO
ALTER TABLE [dbo].[Temp (Premise Load)] ADD CONSTRAINT [SSMA_CC$Temp (Premise Load)$Item number$disallow_zero_length] CHECK ((len([Item number])>(0)))
GO
ALTER TABLE [dbo].[Temp (Premise Load)] ADD CONSTRAINT [SSMA_CC$Temp (Premise Load)$Jacket Color$disallow_zero_length] CHECK ((len([Jacket Color])>(0)))
GO
ALTER TABLE [dbo].[Temp (Premise Load)] ADD CONSTRAINT [SSMA_CC$Temp (Premise Load)$Jacket Material$disallow_zero_length] CHECK ((len([Jacket Material])>(0)))
GO
ALTER TABLE [dbo].[Temp (Premise Load)] ADD CONSTRAINT [SSMA_CC$Temp (Premise Load)$Job#$disallow_zero_length] CHECK ((len([Job#])>(0)))
GO
ALTER TABLE [dbo].[Temp (Premise Load)] ADD CONSTRAINT [SSMA_CC$Temp (Premise Load)$Line#$disallow_zero_length] CHECK ((len([Line#])>(0)))
GO
ALTER TABLE [dbo].[Temp (Premise Load)] ADD CONSTRAINT [SSMA_CC$Temp (Premise Load)$Order Source$disallow_zero_length] CHECK ((len([Order Source])>(0)))
GO
ALTER TABLE [dbo].[Temp (Premise Load)] ADD CONSTRAINT [SSMA_CC$Temp (Premise Load)$Reel number$disallow_zero_length] CHECK ((len([Reel number])>(0)))
GO
ALTER TABLE [dbo].[Temp (Premise Load)] ADD CONSTRAINT [SSMA_CC$Temp (Premise Load)$Type Order$disallow_zero_length] CHECK ((len([Type Order])>(0)))
GO
ALTER TABLE [dbo].[Temp (Premise Load)] ADD CONSTRAINT [SSMA_CC$Temp (Premise Load)$Type Seq$disallow_zero_length] CHECK ((len([Type Seq])>(0)))
GO
ALTER TABLE [dbo].[Temp (Premise Load)] ADD CONSTRAINT [PK_Temp (Premise Load)] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Temp (Premise Load)] ON [dbo].[Temp (Premise Load)] ([Item number], [Customer], [Reel number], [CO#], [Complete Buff]) ON [PRIMARY]
GO
GRANT ALTER ON  [dbo].[Temp (Premise Load)] TO [db_executor]
GO
GRANT DELETE ON  [dbo].[Temp (Premise Load)] TO [NAA\SPB Premise SQL RO]
GO
GRANT INSERT ON  [dbo].[Temp (Premise Load)] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ON  [dbo].[Temp (Premise Load)] TO [NAA\SPB Premise SQL RO]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Active]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Active'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Adj Mfg  Date]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Adj Mfg  Date'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Adj Schedule Date]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Adj Schedule Date'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[B1 Hrs]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'B1 Hrs'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[B10 Hrs]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'B10 Hrs'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[B11 Hrs]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'B11 Hrs'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[B2 Hrs]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'B2 Hrs'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[B4 Hrs]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'B4 Hrs'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[B6 Hrs]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'B6 Hrs'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[B9 Hrs]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'B9 Hrs'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Base]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Base'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[CabSeq]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'CabSeq'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[CO#]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'CO#'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[CompLength]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'CompLength'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Complete Buff]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Complete Buff'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Count]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Count'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Customer]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Customer'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Design]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Design'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Early Start]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Early Start'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Factor]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Factor'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Family]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Family'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Finish]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Finish'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Finish_Split]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Finish_Split'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Ftype]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Ftype'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[IASeq]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'IASeq'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[ID]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Item number]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Item number'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Jacket Color]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Jacket Color'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Jacket Material]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Jacket Material'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Job#]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Job#'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Length]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Length'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Length Meters]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Length Meters'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Line#]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Line#'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Mfg commit date]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Mfg commit date'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Order Qty]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Order Qty'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Order Source]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Order Source'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[ParentID]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'ParentID'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Promise Date]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Promise Date'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Reel number]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Reel number'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Req''d Days (#TB or RBN)]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Req''d Days (#TB or RBN)'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Req''d Days (C#4)]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Req''d Days (C#4)'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Req''d Days (SH#3)]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Req''d Days (SH#3)'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[RequiredDays]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'RequiredDays'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[RequiredDays_Orig]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'RequiredDays_Orig'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Schedule date]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Schedule date'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Sequence]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Sequence'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Setup Buff]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Setup Buff'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Setup Hrs]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Setup Hrs'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Setup SZ/SH]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Setup SZ/SH'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Sh3Seq]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Sh3Seq'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Start]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Start'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Start_Split]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Start_Split'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Type Order]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Type Order'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Type Seq]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Type Seq'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Week ending]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Week ending'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Temp (Premise Load)].[Week ending-mfg]', 'SCHEMA', N'dbo', 'TABLE', N'Temp (Premise Load)', 'COLUMN', N'Week ending-mfg'
GO
