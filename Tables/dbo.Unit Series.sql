CREATE TABLE [dbo].[Unit Series]
(
[Unit Color Series] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Unit ID] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TB Color Series] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Unit Type] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Print type] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Fiber Code] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Print Spacing] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[verified] [smallint] NULL CONSTRAINT [DF__Unit Seri__verif__1E05700A] DEFAULT ((0)),
[Number] [int] NOT NULL IDENTITY(1, 1),
[Timestamp] [timestamp] NULL,
[OracleItem] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UnitNumber] [int] NULL,
[CreationDate] [datetime] NULL CONSTRAINT [DF_Unit Series_CreationDate] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_Unit Series_CreatedBy1] DEFAULT (suser_sname()),
[RevisedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_Unit Series_RevisedBy] DEFAULT (suser_sname()),
[RevisedDate] [datetime] NULL CONSTRAINT [DF_Unit Series_RevisedDate] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


create TRIGGER [dbo].[UnitSeriestrgr] ON [dbo].[Unit Series]
AFTER INSERT, UPDATE 
AS
	BEGIN 
		IF NOT (UPDATE(RevisedDate))
			BEGIN
			  UPDATE t
			  SET t.RevisedDate = GETDATE(),t.RevisedBy = (SUSER_SNAME()) 
			  FROM dbo.[Unit Series] as t
			  JOIN inserted i
			  ON i.Number = t.Number
			END
	END





GO
ALTER TABLE [dbo].[Unit Series] ADD CONSTRAINT [SSMA_CC$Unit Series$Description$disallow_zero_length] CHECK ((len([Description])>(0)))
GO
ALTER TABLE [dbo].[Unit Series] ADD CONSTRAINT [SSMA_CC$Unit Series$Fiber Code$disallow_zero_length] CHECK ((len([Fiber Code])>(0)))
GO
ALTER TABLE [dbo].[Unit Series] ADD CONSTRAINT [SSMA_CC$Unit Series$Print Spacing$disallow_zero_length] CHECK ((len([Print Spacing])>(0)))
GO
ALTER TABLE [dbo].[Unit Series] ADD CONSTRAINT [SSMA_CC$Unit Series$Print type$disallow_zero_length] CHECK ((len([Print type])>(0)))
GO
ALTER TABLE [dbo].[Unit Series] ADD CONSTRAINT [SSMA_CC$Unit Series$TB Color Series$disallow_zero_length] CHECK ((len([TB Color Series])>(0)))
GO
ALTER TABLE [dbo].[Unit Series] ADD CONSTRAINT [SSMA_CC$Unit Series$Unit Color Series$disallow_zero_length] CHECK ((len([Unit Color Series])>(0)))
GO
ALTER TABLE [dbo].[Unit Series] ADD CONSTRAINT [SSMA_CC$Unit Series$Unit ID$disallow_zero_length] CHECK ((len([Unit ID])>(0)))
GO
ALTER TABLE [dbo].[Unit Series] ADD CONSTRAINT [SSMA_CC$Unit Series$Unit Type$disallow_zero_length] CHECK ((len([Unit Type])>(0)))
GO
ALTER TABLE [dbo].[Unit Series] ADD CONSTRAINT [PK_Unit Series] PRIMARY KEY CLUSTERED  ([Number]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Unit Series$Fiber Code] ON [dbo].[Unit Series] ([Fiber Code], [Unit Color Series], [Unit Type], [Unit ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Unit Series] ADD CONSTRAINT [FK_Unit Series_Basic Product Construction] FOREIGN KEY ([OracleItem]) REFERENCES [dbo].[Basic Product Construction] ([New Oracle Part #]) ON DELETE SET NULL ON UPDATE CASCADE
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Unit Series]', 'SCHEMA', N'dbo', 'TABLE', N'Unit Series', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Unit Series].[Description]', 'SCHEMA', N'dbo', 'TABLE', N'Unit Series', 'COLUMN', N'Description'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Unit Series].[Fiber Code]', 'SCHEMA', N'dbo', 'TABLE', N'Unit Series', 'COLUMN', N'Fiber Code'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Unit Series].[Print Spacing]', 'SCHEMA', N'dbo', 'TABLE', N'Unit Series', 'COLUMN', N'Print Spacing'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Unit Series].[Print type]', 'SCHEMA', N'dbo', 'TABLE', N'Unit Series', 'COLUMN', N'Print type'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Unit Series].[TB Color Series]', 'SCHEMA', N'dbo', 'TABLE', N'Unit Series', 'COLUMN', N'TB Color Series'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Unit Series].[Unit Color Series]', 'SCHEMA', N'dbo', 'TABLE', N'Unit Series', 'COLUMN', N'Unit Color Series'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Unit Series].[Unit ID]', 'SCHEMA', N'dbo', 'TABLE', N'Unit Series', 'COLUMN', N'Unit ID'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Unit Series].[Unit Type]', 'SCHEMA', N'dbo', 'TABLE', N'Unit Series', 'COLUMN', N'Unit Type'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Unit Series].[verified]', 'SCHEMA', N'dbo', 'TABLE', N'Unit Series', 'COLUMN', N'verified'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Unit Series].[Fiber Code]', 'SCHEMA', N'dbo', 'TABLE', N'Unit Series', 'INDEX', N'Unit Series$Fiber Code'
GO
