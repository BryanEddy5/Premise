CREATE TABLE [dbo].[Production and Process Data]
(
[Reel No] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Productio__Reel __7EECB764] DEFAULT ((0)),
[Cut No] [nvarchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Item #] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RFT] [smallint] NULL CONSTRAINT [DF__Production __RFT__7FE0DB9D] DEFAULT ((0)),
[OTDR Length] [int] NULL,
[ISE Mark] [int] NULL,
[OSE Mark] [int] NULL,
[Unit] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ID] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Buffer Line] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Ave Wall (OSE)] [real] NULL,
[Min Wall Spot (OSE)] [real] NULL,
[Associates Comments] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Entry Date] [datetime] NULL,
[Comments] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NCMIR #] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Record Create Date] [datetime] NULL CONSTRAINT [DF__Productio__Recor__00D4FFD6] DEFAULT (getdate()),
[Record ID] [int] NOT NULL IDENTITY(1, 1),
[SSMA_TimeStamp] [timestamp] NOT NULL,
[Cut Scrapped] [bit] NULL CONSTRAINT [DF_Production and Process Data_Cut Scrapped] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Production and Process Data] ADD CONSTRAINT [SSMA_CC$Production and Process Data$Ave Wall (OSE)$validation_rule] CHECK (([Ave Wall (OSE)]<(6) OR [Ave Wall (OSE)] IS NULL))
GO
ALTER TABLE [dbo].[Production and Process Data] ADD CONSTRAINT [SSMA_CC$Production and Process Data$Min Wall Spot (OSE)$validation_rule] CHECK (([Min Wall Spot (OSE)]<(6) OR [Min Wall Spot (OSE)] IS NULL))
GO
ALTER TABLE [dbo].[Production and Process Data] ADD CONSTRAINT [SSMA_CC$Production and Process Data$Associates Comments$disallow_zero_length] CHECK ((len([Associates Comments])>(0)))
GO
ALTER TABLE [dbo].[Production and Process Data] ADD CONSTRAINT [SSMA_CC$Production and Process Data$Buffer Line$disallow_zero_length] CHECK ((len([Buffer Line])>(0)))
GO
ALTER TABLE [dbo].[Production and Process Data] ADD CONSTRAINT [SSMA_CC$Production and Process Data$Comments$disallow_zero_length] CHECK ((len([Comments])>(0)))
GO
ALTER TABLE [dbo].[Production and Process Data] ADD CONSTRAINT [SSMA_CC$Production and Process Data$Cut No$disallow_zero_length] CHECK ((len([Cut No])>(0)))
GO
ALTER TABLE [dbo].[Production and Process Data] ADD CONSTRAINT [SSMA_CC$Production and Process Data$ID$disallow_zero_length] CHECK ((len([ID])>(0)))
GO
ALTER TABLE [dbo].[Production and Process Data] ADD CONSTRAINT [SSMA_CC$Production and Process Data$Item #$disallow_zero_length] CHECK ((len([Item #])>(0)))
GO
ALTER TABLE [dbo].[Production and Process Data] ADD CONSTRAINT [SSMA_CC$Production and Process Data$NCMIR #$disallow_zero_length] CHECK ((len([NCMIR #])>(0)))
GO
ALTER TABLE [dbo].[Production and Process Data] ADD CONSTRAINT [SSMA_CC$Production and Process Data$Reel No$disallow_zero_length] CHECK ((len([Reel No])>(0)))
GO
ALTER TABLE [dbo].[Production and Process Data] ADD CONSTRAINT [SSMA_CC$Production and Process Data$Unit$disallow_zero_length] CHECK ((len([Unit])>(0)))
GO
ALTER TABLE [dbo].[Production and Process Data] ADD CONSTRAINT [Production and Process Data$PrimaryKey] PRIMARY KEY CLUSTERED  ([Reel No], [Cut No]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Production and Process Data$Record ID] ON [dbo].[Production and Process Data] ([Record ID]) ON [PRIMARY]
GO
GRANT ALTER ON  [dbo].[Production and Process Data] TO [NAA\SPB Premise SQL RO]
GO
GRANT INSERT ON  [dbo].[Production and Process Data] TO [NAA\SPB Premise SQL RO]
GO
GRANT DELETE ON  [dbo].[Production and Process Data] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ON  [dbo].[Production and Process Data] TO [NAA\SPB Premise SQL RO]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration4.[Production and Process Data]', 'SCHEMA', N'dbo', 'TABLE', N'Production and Process Data', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration4.[Production and Process Data].[Associates Comments]', 'SCHEMA', N'dbo', 'TABLE', N'Production and Process Data', 'COLUMN', N'Associates Comments'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration4.[Production and Process Data].[Ave Wall (OSE)]', 'SCHEMA', N'dbo', 'TABLE', N'Production and Process Data', 'COLUMN', N'Ave Wall (OSE)'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration4.[Production and Process Data].[Buffer Line]', 'SCHEMA', N'dbo', 'TABLE', N'Production and Process Data', 'COLUMN', N'Buffer Line'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration4.[Production and Process Data].[Comments]', 'SCHEMA', N'dbo', 'TABLE', N'Production and Process Data', 'COLUMN', N'Comments'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration4.[Production and Process Data].[Cut No]', 'SCHEMA', N'dbo', 'TABLE', N'Production and Process Data', 'COLUMN', N'Cut No'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration4.[Production and Process Data].[Entry Date]', 'SCHEMA', N'dbo', 'TABLE', N'Production and Process Data', 'COLUMN', N'Entry Date'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration4.[Production and Process Data].[ID]', 'SCHEMA', N'dbo', 'TABLE', N'Production and Process Data', 'COLUMN', N'ID'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration4.[Production and Process Data].[ISE Mark]', 'SCHEMA', N'dbo', 'TABLE', N'Production and Process Data', 'COLUMN', N'ISE Mark'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration4.[Production and Process Data].[Item #]', 'SCHEMA', N'dbo', 'TABLE', N'Production and Process Data', 'COLUMN', N'Item #'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration4.[Production and Process Data].[Min Wall Spot (OSE)]', 'SCHEMA', N'dbo', 'TABLE', N'Production and Process Data', 'COLUMN', N'Min Wall Spot (OSE)'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration4.[Production and Process Data].[NCMIR #]', 'SCHEMA', N'dbo', 'TABLE', N'Production and Process Data', 'COLUMN', N'NCMIR #'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration4.[Production and Process Data].[OSE Mark]', 'SCHEMA', N'dbo', 'TABLE', N'Production and Process Data', 'COLUMN', N'OSE Mark'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration4.[Production and Process Data].[OTDR Length]', 'SCHEMA', N'dbo', 'TABLE', N'Production and Process Data', 'COLUMN', N'OTDR Length'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration4.[Production and Process Data].[Record Create Date]', 'SCHEMA', N'dbo', 'TABLE', N'Production and Process Data', 'COLUMN', N'Record Create Date'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration4.[Production and Process Data].[Record ID]', 'SCHEMA', N'dbo', 'TABLE', N'Production and Process Data', 'COLUMN', N'Record ID'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration4.[Production and Process Data].[Reel No]', 'SCHEMA', N'dbo', 'TABLE', N'Production and Process Data', 'COLUMN', N'Reel No'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration4.[Production and Process Data].[RFT]', 'SCHEMA', N'dbo', 'TABLE', N'Production and Process Data', 'COLUMN', N'RFT'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration4.[Production and Process Data].[Unit]', 'SCHEMA', N'dbo', 'TABLE', N'Production and Process Data', 'COLUMN', N'Unit'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration4.[Production and Process Data].[PrimaryKey]', 'SCHEMA', N'dbo', 'TABLE', N'Production and Process Data', 'CONSTRAINT', N'Production and Process Data$PrimaryKey'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration4.[Production and Process Data].[Record ID]', 'SCHEMA', N'dbo', 'TABLE', N'Production and Process Data', 'INDEX', N'Production and Process Data$Record ID'
GO
