CREATE TABLE [dbo].[Printed Labels (Data Products)]
(
[Reel No] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Order Qty] [int] NOT NULL CONSTRAINT [DF__Printed L__Order__5F740C0B] DEFAULT ((0)),
[Previously Printed] [int] NULL CONSTRAINT [DF__Printed L__Previ__60683044] DEFAULT ((0)),
[Print Now] [int] NULL CONSTRAINT [DF__Printed L__Print__615C547D] DEFAULT ((0)),
[Completed Buffering] [int] NULL CONSTRAINT [DF__Printed L__Compl__625078B6] DEFAULT ((0)),
[Buff Line #] [smallint] NOT NULL CONSTRAINT [DF__Printed L__Buff __63449CEF] DEFAULT ((9)),
[TB PRIORITY] [float] NULL CONSTRAINT [DF__Printed L__TB PR__6438C128] DEFAULT ((100)),
[Setup Buff] [int] NULL CONSTRAINT [DF__Printed L__Setup__652CE561] DEFAULT ((0)),
[Setup SZ/SH] [int] NULL CONSTRAINT [DF__Printed L__Setup__6621099A] DEFAULT ((0)),
[Completed Cabling] [int] NULL CONSTRAINT [DF__Printed L__Compl__67152DD3] DEFAULT ((0)),
[Make/Ship orders] [int] NULL CONSTRAINT [DF__Printed L__Make/__6809520C] DEFAULT ((0)),
[Sheathing Line #] [smallint] NULL,
[Shipped] [int] NULL CONSTRAINT [DF__Printed L__Shipp__68FD7645] DEFAULT ((0)),
[Close Date] [datetime] NULL,
[BOM] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BOM Comments] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CM Required] [int] NULL CONSTRAINT [DF__Printed L__CM Re__69F19A7E] DEFAULT ((0)),
[Run Order] [smallint] NULL,
[Early Star Date] [int] NULL CONSTRAINT [DF__Printed L__Early__6AE5BEB7] DEFAULT ((0)),
[Completed TightBuffer] [int] NULL CONSTRAINT [DF__Printed L__Compl__6BD9E2F0] DEFAULT ((0)),
[IASeq] [smallint] NULL CONSTRAINT [DF__Printed L__IASeq__6CCE0729] DEFAULT ((9999)),
[CabSeq] [int] NULL CONSTRAINT [DF__Printed L__CabSe__6DC22B62] DEFAULT ((9999)),
[Sh3Seq] [smallint] NULL CONSTRAINT [DF__Printed L__Sh3Se__6EB64F9B] DEFAULT ((9999)),
[SSMA_TimeStamp] [timestamp] NOT NULL,
[DateCreated] [datetime] NULL CONSTRAINT [DF_Printed Labels (Data Products)_DateCreatedArchiveRecord] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_Printed Labels (Data Products)_CreatedByArchiveRecord] DEFAULT (suser_sname()),
[RevisedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_Printed Labels (Data Products)_RevisedBy] DEFAULT (suser_sname()),
[DateRevised] [datetime] NULL CONSTRAINT [DF_Printed Labels (Data Products)_DateRevised] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Bryan Eddy
-- Create date: 6/8/2018
-- Description:	Track changes in Printed Labels table
-- =============================================
CREATE TRIGGER [dbo].[PrintedLabelsArchivetrgr]
   ON  [dbo].[Printed Labels (Data Products)] 
   AFTER DELETE,UPDATE
AS 
BEGIN

			  UPDATE t
			  SET t.DateRevised = GETDATE(),
			  t.RevisedBy = (SUSER_SNAME())
			  FROM dbo.[Printed Labels (Data Products)] as t
			  JOIN inserted i
			  ON i.[Reel No] = t.[Reel No] AND i.[Order Qty] = t.[Order Qty]
			

	
	SET NOCOUNT ON;
		IF UPDATE ([Close Date])
		BEGIN	
			DECLARE @INS int, @DEL int

			SELECT @INS = COUNT(*) FROM INSERTED
			SELECT @DEL = COUNT(*) FROM DELETED

			IF @INS > 0 OR @DEL > 0 
		

				INSERT INTO DBO.PrintedLabelsArchive
				(
				    [Reel No],
				    [Order Qty],
				    [Previously Printed],
				    [Print Now],
				    [Completed Buffering],
				    [Buff Line #],
				    [TB PRIORITY],
				    [Setup Buff],
				    [Setup SZ/SH],
				    [Completed Cabling],
				    [Make/Ship orders],
				    [Sheathing Line #],
				    Shipped,
				    [Close Date],
				    BOM,
				    [BOM Comments],
				    [CM Required],
				    [Run Order],
				    [Early Star Date],
				    [Completed TightBuffer],
				    IASeq,
				    CabSeq,
				    Sh3Seq,
					DateCreated,
					DateRevised,
					RevisedBy,
					CreatedBy

				)

					SELECT d.[Reel No],
                           d.[Order Qty],
                           d.[Previously Printed],
                           d.[Print Now],
                           d.[Completed Buffering],
                           d.[Buff Line #],
                           d.[TB PRIORITY],
                           d.[Setup Buff],
                           d.[Setup SZ/SH],
                           d.[Completed Cabling],
                           d.[Make/Ship orders],
                           d.[Sheathing Line #],
                           d.Shipped,
                           d.[Close Date],
                           d.BOM,
                           d.[BOM Comments],
                           d.[CM Required],
                           d.[Run Order],
                           d.[Early Star Date],
                           d.[Completed TightBuffer],
                           d.IASeq,
                           d.CabSeq,
                           d.Sh3Seq,
						   d.DateCreated,
					d.DateRevised,
					d.RevisedBy,
					d.CreatedBy

				FROM DELETED d

				

			END



END
GO
ALTER TABLE [dbo].[Printed Labels (Data Products)] ADD CONSTRAINT [SSMA_CC$Printed Labels (Data Products)$BOM Comments$disallow_zero_length] CHECK ((len([BOM Comments])>(0)))
GO
ALTER TABLE [dbo].[Printed Labels (Data Products)] ADD CONSTRAINT [SSMA_CC$Printed Labels (Data Products)$BOM$disallow_zero_length] CHECK ((len([BOM])>(0)))
GO
ALTER TABLE [dbo].[Printed Labels (Data Products)] ADD CONSTRAINT [SSMA_CC$Printed Labels (Data Products)$Reel No$disallow_zero_length] CHECK ((len([Reel No])>(0)))
GO
ALTER TABLE [dbo].[Printed Labels (Data Products)] ADD CONSTRAINT [PK_Printed Labels (Data Products)] PRIMARY KEY CLUSTERED  ([Reel No], [Order Qty], [Buff Line #]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Printed Labels (Data Products)] ON [dbo].[Printed Labels (Data Products)] ([Shipped], [Completed TightBuffer], [Reel No], [Order Qty]) ON [PRIMARY]
GO
GRANT DELETE ON  [dbo].[Printed Labels (Data Products)] TO [NAA\SPB Premise SQL RO]
GO
GRANT INSERT ON  [dbo].[Printed Labels (Data Products)] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ON  [dbo].[Printed Labels (Data Products)] TO [NAA\SPB Premise SQL RO]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[Printed Labels (Data Products)]', 'SCHEMA', N'dbo', 'TABLE', N'Printed Labels (Data Products)', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[Printed Labels (Data Products)].[BOM]', 'SCHEMA', N'dbo', 'TABLE', N'Printed Labels (Data Products)', 'COLUMN', N'BOM'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[Printed Labels (Data Products)].[BOM Comments]', 'SCHEMA', N'dbo', 'TABLE', N'Printed Labels (Data Products)', 'COLUMN', N'BOM Comments'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[Printed Labels (Data Products)].[Buff Line #]', 'SCHEMA', N'dbo', 'TABLE', N'Printed Labels (Data Products)', 'COLUMN', N'Buff Line #'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[Printed Labels (Data Products)].[CabSeq]', 'SCHEMA', N'dbo', 'TABLE', N'Printed Labels (Data Products)', 'COLUMN', N'CabSeq'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[Printed Labels (Data Products)].[Close Date]', 'SCHEMA', N'dbo', 'TABLE', N'Printed Labels (Data Products)', 'COLUMN', N'Close Date'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[Printed Labels (Data Products)].[CM Required]', 'SCHEMA', N'dbo', 'TABLE', N'Printed Labels (Data Products)', 'COLUMN', N'CM Required'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[Printed Labels (Data Products)].[Completed Buffering]', 'SCHEMA', N'dbo', 'TABLE', N'Printed Labels (Data Products)', 'COLUMN', N'Completed Buffering'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[Printed Labels (Data Products)].[Completed Cabling]', 'SCHEMA', N'dbo', 'TABLE', N'Printed Labels (Data Products)', 'COLUMN', N'Completed Cabling'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[Printed Labels (Data Products)].[Completed TightBuffer]', 'SCHEMA', N'dbo', 'TABLE', N'Printed Labels (Data Products)', 'COLUMN', N'Completed TightBuffer'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[Printed Labels (Data Products)].[Early Star Date]', 'SCHEMA', N'dbo', 'TABLE', N'Printed Labels (Data Products)', 'COLUMN', N'Early Star Date'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[Printed Labels (Data Products)].[IASeq]', 'SCHEMA', N'dbo', 'TABLE', N'Printed Labels (Data Products)', 'COLUMN', N'IASeq'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[Printed Labels (Data Products)].[Make/Ship orders]', 'SCHEMA', N'dbo', 'TABLE', N'Printed Labels (Data Products)', 'COLUMN', N'Make/Ship orders'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[Printed Labels (Data Products)].[Order Qty]', 'SCHEMA', N'dbo', 'TABLE', N'Printed Labels (Data Products)', 'COLUMN', N'Order Qty'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[Printed Labels (Data Products)].[Previously Printed]', 'SCHEMA', N'dbo', 'TABLE', N'Printed Labels (Data Products)', 'COLUMN', N'Previously Printed'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[Printed Labels (Data Products)].[Print Now]', 'SCHEMA', N'dbo', 'TABLE', N'Printed Labels (Data Products)', 'COLUMN', N'Print Now'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[Printed Labels (Data Products)].[Reel No]', 'SCHEMA', N'dbo', 'TABLE', N'Printed Labels (Data Products)', 'COLUMN', N'Reel No'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[Printed Labels (Data Products)].[Run Order]', 'SCHEMA', N'dbo', 'TABLE', N'Printed Labels (Data Products)', 'COLUMN', N'Run Order'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[Printed Labels (Data Products)].[Setup Buff]', 'SCHEMA', N'dbo', 'TABLE', N'Printed Labels (Data Products)', 'COLUMN', N'Setup Buff'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[Printed Labels (Data Products)].[Setup SZ/SH]', 'SCHEMA', N'dbo', 'TABLE', N'Printed Labels (Data Products)', 'COLUMN', N'Setup SZ/SH'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[Printed Labels (Data Products)].[Sh3Seq]', 'SCHEMA', N'dbo', 'TABLE', N'Printed Labels (Data Products)', 'COLUMN', N'Sh3Seq'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[Printed Labels (Data Products)].[Sheathing Line #]', 'SCHEMA', N'dbo', 'TABLE', N'Printed Labels (Data Products)', 'COLUMN', N'Sheathing Line #'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[Printed Labels (Data Products)].[Shipped]', 'SCHEMA', N'dbo', 'TABLE', N'Printed Labels (Data Products)', 'COLUMN', N'Shipped'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport2.[Printed Labels (Data Products)].[TB PRIORITY]', 'SCHEMA', N'dbo', 'TABLE', N'Printed Labels (Data Products)', 'COLUMN', N'TB PRIORITY'
GO
