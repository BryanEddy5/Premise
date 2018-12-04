CREATE TABLE [dbo].[Buff#1/#2 Alloc Table]
(
[Prefix] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Buffering Factor] [smallint] NULL,
[Date Adjustments] [smallint] NULL,
[Special Notes] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Process Status] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Set-up time level 1] [decimal] (18, 3) NULL,
[Set-up time level 2] [decimal] (18, 3) NULL,
[Buff#11 Line Speed] [decimal] (18, 3) NULL,
[Buff#1 Line Speed] [decimal] (18, 3) NULL,
[Buff#4 Line Speed] [decimal] (18, 3) NULL,
[Buff#6 Line Speed] [decimal] (18, 3) NULL,
[Buff#2 Line Speed] [decimal] (18, 3) NULL,
[Buff#9 Line Speed] [decimal] (18, 3) NULL,
[Buff#10 Line Speed] [decimal] (18, 3) NULL,
[Buff#9 Line Speed (SH)] [decimal] (18, 3) NULL,
[Buff#11 Line Speed (SH)] [decimal] (18, 3) NULL,
[SH#3 Line Speed] [decimal] (18, 3) NULL,
[SH#4 Line Speed] [decimal] (18, 3) NULL,
[C#4 Line Speed] [decimal] (18, 3) NULL,
[Armor Line Speed] [decimal] (18, 3) NULL,
[tbspd] [int] NULL,
[PlannedLotSize] [int] NULL,
[shrinkage limit] [decimal] (18, 3) NULL,
[Sheathing Line] [int] NULL,
[Interlock] [int] NULL,
[ID] [int] NULL,
[PrefixID] [int] NOT NULL IDENTITY(1, 1),
[TimeStamp] [timestamp] NULL,
[PrimaryBufferingLine] [int] NULL,
[B18_Line_Speed] [decimal] (18, 3) NULL,
[B2_Second_Pass] [decimal] (18, 3) NULL,
[B18_Line_Speed_Second_Pass] [decimal] (18, 3) NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Bryan Eddy
-- Create date: 5/3/2018
-- Description:	Keep ID synced with PrefixID
-- =============================================
CREATE TRIGGER [dbo].[trgr_CableRunSpeeds] ON [dbo].[Buff#1/#2 Alloc Table]
AFTER INSERT, UPDATE 
AS
	BEGIN 
			BEGIN
			  UPDATE t
			  SET t.ID = t.PrefixID
			  FROM dbo.[Buff#1/#2 Alloc Table] as t
			  JOIN inserted i
			  ON i.PrefixID = t.PrefixID
			END
            
    -- Insert statements for trigger here

END
GO
ALTER TABLE [dbo].[Buff#1/#2 Alloc Table] ADD CONSTRAINT [Buff#1/#2 Alloc Table$PrimaryKey] PRIMARY KEY CLUSTERED  ([PrefixID]) ON [PRIMARY]
GO
GRANT UPDATE ([Prefix]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Buffering Factor]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Special Notes]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Set-up time level 1]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Set-up time level 2]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Buff#11 Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Buff#1 Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Buff#4 Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Buff#6 Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Buff#2 Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Buff#9 Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Buff#10 Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Buff#9 Line Speed (SH)]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Buff#11 Line Speed (SH)]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([SH#3 Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([SH#4 Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([C#4 Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Armor Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([PlannedLotSize]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([shrinkage limit]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Sheathing Line]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Interlock]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([PrimaryBufferingLine]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([B18_Line_Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Armor Line Speed]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Armor Line Speed'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Buff#1 Line Speed]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Buff#1 Line Speed'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Buff#10 Line Speed]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Buff#10 Line Speed'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Buff#11 Line Speed]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Buff#11 Line Speed'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Buff#11 Line Speed (SH)]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Buff#11 Line Speed (SH)'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Buff#2 Line Speed]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Buff#2 Line Speed'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Buff#4 Line Speed]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Buff#4 Line Speed'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Buff#6 Line Speed]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Buff#6 Line Speed'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Buff#9 Line Speed]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Buff#9 Line Speed'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Buff#9 Line Speed (SH)]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Buff#9 Line Speed (SH)'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Buffering Factor]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Buffering Factor'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[C#4 Line Speed]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'C#4 Line Speed'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Date Adjustments]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Date Adjustments'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Interlock]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Interlock'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[PlannedLotSize]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'PlannedLotSize'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Prefix]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Prefix'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Process Status]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Process Status'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Set-up time level 1]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Set-up time level 1'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Set-up time level 2]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Set-up time level 2'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[SH#3 Line Speed]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'SH#3 Line Speed'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[SH#4 Line Speed]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'SH#4 Line Speed'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Sheathing Line]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Sheathing Line'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[shrinkage limit]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'shrinkage limit'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Special Notes]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Special Notes'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[tbspd]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'tbspd'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[PrimaryKey]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'CONSTRAINT', N'Buff#1/#2 Alloc Table$PrimaryKey'
GO
