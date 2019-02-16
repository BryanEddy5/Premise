CREATE TABLE [dbo].[Basic Product Construction]
(
[New Oracle Part #] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Item No] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Customer] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Customer Part#] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomerRev] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Active] [bit] NULL CONSTRAINT [DF__Basic Pro__Activ__34E8D562] DEFAULT ((0)),
[Reason] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[calculate bill?] [smallint] NULL CONSTRAINT [DF__Basic Pro__calcu__35DCF99B] DEFAULT ((0)),
[Base] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Cable Type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Revision Date] [datetime2] (0) NULL,
[Revision Letter] [int] NULL,
[Revision History] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Standard Operation] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Jacket Material] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Jacket Color] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Color Chip ID] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Nominal OD] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OD Tol  (+)] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OD Tol  (-)] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Height] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Height Tol (+)] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Height Tol (-)] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Nominal Wall] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Max Ave Wall] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Min Ave Wall] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Min Spot Wall] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Print Reel No] [smallint] NULL CONSTRAINT [DF__Basic Pro__Print__36D11DD4] DEFAULT ((0)),
[Print Item No] [smallint] NULL CONSTRAINT [DF__Basic Pro__Print__37C5420D] DEFAULT ((0)),
[Std Subunit Print] [smallint] NULL CONSTRAINT [DF__Basic Pro__Std S__38B96646] DEFAULT ((0)),
[Print Type (base)] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Print Line 1] [nvarchar] (70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Print Line 2] [nvarchar] (70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Print Line 3] [nvarchar] (78) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Print Line 4] [nvarchar] (70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NewPrintLine4] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Print Spacing] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PrintNotes] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Listing Company] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UL-ETL-Listing] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UL-ETL-Const] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UL-ETL-Section] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ENumber] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Label Type] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Aramid Type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Number of ends] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Aramid Type2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Number of ends2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Unit Chips Type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Unit Ripcord] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Unit CM] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Lay Length] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Talc] [smallint] NULL CONSTRAINT [DF__Basic Prod__Talc__39AD8A7F] DEFAULT ((0)),
[EZ Strip] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TB Material] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TB Chips Type] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TB Nominal OD] [decimal] (6, 4) NULL,
[TB OD Tol  (+)] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TB OD Tol  (-)] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TB Color Series] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Fiber Type] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Fiber Oracle item] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FiberType2] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FiberType3] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[1st Req Freq] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[1st Max Atten] [float] NULL,
[1st Min BandW] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[2nd Req Freq] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[2nd Max Atten] [float] NULL,
[2nd Min BandW] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SM 1300 Max Atten] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SM 1550 Max Atten] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Special Instr Product1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[zzSpecial Instr Product3] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[zzSpecial Instr Product4] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[zzOracle Part#] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OracleStatus] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PSS Document #] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateCreated] [datetime] NULL CONSTRAINT [DF_Basic Product Construction_DateCreated] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_Basic Product Construction_CreatedBy] DEFAULT (suser_sname()),
[RevisedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_Basic Product Construction_RevisedBy] DEFAULT (suser_sname()),
[RevisedDate] [datetime2] NULL CONSTRAINT [DF_Basic Product Construction_RevisedDate] DEFAULT (getdate()),
[BaseID] [int] NULL,
[RibbonHighCure] [bit] NULL CONSTRAINT [DF_Basic Product Construction_RibbonHighCure] DEFAULT ((0)),
[TimeStamp] [timestamp] NULL,
[Print Height] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Unit Series] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[1st Req Freq - B] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[1st Max Atten - B] [decimal] (6, 4) NULL,
[1st Min BandW - B] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[2nd Req Freq - B] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[2nd Max Atten - B] [decimal] (6, 4) NULL,
[2nd Min BandW - B] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[1st Req Freq - C] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[1st Max Atten - C] [decimal] (6, 4) NULL,
[1st Min BandW - C] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[2nd Req Freq - C] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[2nd Max Atten - C] [decimal] (6, 4) NULL,
[2nd Min BandW - C] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Colored_Fiber] [bit] NULL CONSTRAINT [DF_Basic Product Construction_Colored_Fiber] DEFAULT ((0)),
[ID] [int] NOT NULL IDENTITY(1, 1),
[ActiveStatusChangedDate] [datetime] NULL,
[ActiveStatusChangedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SafetyRatingUS] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SafetyRatingCanadian] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VendorSpecificFiber] [bit] NULL CONSTRAINT [DF_Basic Product Construction_VendorSpecificFiber] DEFAULT ((0)),
[ItemEngineeringAssist] [bit] NULL CONSTRAINT [DF_Basic Product Construction_EngineeringAssist] DEFAULT ((0)),
[ItemEngineeringAssistReason] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[BasicProdConUpdatetrgr] ON [dbo].[Basic Product Construction]
AFTER INSERT, UPDATE 
AS
	--Capture the user and time a change occured 
	BEGIN 
		IF NOT (UPDATE(RevisedDate) or UPDATE(Reason) or UPDATE(Active) or Update(OracleStatus))
			BEGIN
			  UPDATE t
			  SET t.RevisedDate = GETDATE() , t.RevisedBy = (SUSER_SNAME()) 
			  FROM dbo.[Basic Product Construction] as t
			  JOIN inserted i
			  ON i.[New Oracle Part #] = t.[New Oracle Part #]
			END
		IF  UPDATE(Active)
			BEGIN
			  UPDATE t
			  SET t.ActiveStatusChangedDate = GETDATE() , t.ActiveStatusChangedBy = (SUSER_SNAME()) 
			  FROM dbo.[Basic Product Construction] as t
			  JOIN inserted i
			  ON i.[New Oracle Part #] = t.[New Oracle Part #]
			END 


		--Trigger to keep all "Parent Items" having the same characteristics.  The only difference between a parent cable and it's children is the print.
		IF UPDATE(Base) OR UPDATE([Jacket Color]) OR UPDATE([EZ Strip]) OR UPDATE([TB Material]) OR UPDATE([TB Nominal OD]) 
		OR UPDATE([TB OD Tol  (+)]) OR UPDATE([TB OD Tol  (-)]) OR UPDATE([Fiber Oracle item]) OR UPDATE(FiberType2) 
		OR UPDATE(FiberType3) OR UPDATE(RibbonHighCure) OR UPDATE([Unit Series]) OR UPDATE(Colored_Fiber)
			BEGIN 
				UPDATE t
				SET t.Base = i.base, t.[Jacket Color] = i.[Jacket Color], t.[EZ Strip] = i.[EZ Strip], t.[TB Material] = i.[TB Material],t.[TB Nominal OD] = i.[TB Nominal OD],
				t.[TB OD Tol  (+)] = i.[TB OD Tol  (+)], t.[TB OD Tol  (-)] = i.[TB OD Tol  (-)], t.[Fiber Oracle item] = i.[Fiber Oracle item], t.[Fiber Type] = i.[Fiber Type],
				t.FiberType3 = i.FiberType3, t.RibbonHighCure = i.RibbonHighCure, t.[Unit Series] = i.[Unit Series]
				FROM dbo.BasicProductConstruction as t
				INNER JOIN inserted i 
				ON LEFT(I.[New Oracle Part #],8) = LEFT(T.[New Oracle Part #],8)
				WHERE right(T.[New Oracle Part #],2) NOT IN ('IA','SS','BB')  AND LEFT(T.[New Oracle Part #],2) not in ('PT','fb','A-','O-','WS', 'PE')
				and i.Base = t.Base
			END
	END
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[BasicProductConstructionArchivetrgr] ON [dbo].[Basic Product Construction]
AFTER INSERT, UPDATE , DELETE
AS

	BEGIN 

	
	SET NOCOUNT ON;
		IF NOT (UPDATE(RevisedDate) or UPDATE(Reason) or UPDATE(Active) or Update(OracleStatus) or Update(RevisedBy) OR UPDATE(RevisedDate) OR UPDATE(ActiveStatusChangedBy) OR UPDATE(ActiveStatusChangedDate))
			BEGIN
			  UPDATE t
			  SET t.RevisedDate = GETDATE() , t.RevisedBy = (SUSER_SNAME()) 
			  FROM dbo.[Basic Product Construction] as t
			  JOIN inserted i
			  ON i.[New Oracle Part #] = t.[New Oracle Part #]
			
			DECLARE @INS int, @DEL int

			SELECT @INS = COUNT(*) FROM INSERTED
			SELECT @DEL = COUNT(*) FROM DELETED

			IF @INS > 0 OR @DEL > 0 
		
		INSERT INTO [Basic Product Construction_Archive]
                         ([New Oracle Part #], [Item No], Customer, [Customer Part#], CustomerRev, Active, Reason, [calculate bill?], Base, [Cable Type], [Revision Date], [Revision Letter], 
                         [Revision History], [Standard Operation], [Jacket Material], [Jacket Color], [Color Chip ID], [Nominal OD], [OD Tol  (+)], [OD Tol  (-)], Height, [Height Tol (+)], 
                         [Height Tol (-)], [Nominal Wall], [Max Ave Wall], [Min Ave Wall], [Min Spot Wall], [Print Reel No], [Print Item No], [Std Subunit Print], [Print Type (base)], [Print Line 1], 
                         [Print Line 2], [Print Line 3], [Print Line 4], NewPrintLine4, [Print Spacing], PrintNotes, [Listing Company], [UL-ETL-Listing], [UL-ETL-Const], [UL-ETL-Section], ENumber, 
                         [Label Type], [Aramid Type], [Number of ends], [Aramid Type2], [Number of ends2], [Unit Chips Type], [Unit Ripcord], [Unit CM], [Lay Length], Talc, [EZ Strip], 
                         [TB Material], [TB Chips Type], [TB Nominal OD], [TB OD Tol  (+)], [TB OD Tol  (-)], [TB Color Series], [Fiber Type], [Fiber Oracle item], FiberType2, FiberType3, 
                         [1st Req Freq], [1st Max Atten], [1st Min BandW], [2nd Req Freq], [2nd Max Atten], [2nd Min BandW], [SM 1300 Max Atten], [SM 1550 Max Atten], 
                         [Special Instr Product1], [zzSpecial Instr Product3], [zzSpecial Instr Product4], [zzOracle Part#], OracleStatus, [PSS Document #], DateCreated, CreatedBy, 
                         RevisedBy, RevisedDate, BaseID, RibbonHighCure, [Print Height], [Unit Series], [1st Req Freq - B], [1st Max Atten - B], [1st Min BandW - B], [2nd Req Freq - B], 
                         [2nd Max Atten - B], [2nd Min BandW - B], [1st Req Freq - C], [1st Max Atten - C], [1st Min BandW - C], [2nd Req Freq - C], [2nd Max Atten - C], [2nd Min BandW - C],Colored_Fiber
						 , ActiveStatusChangedBy, ActiveStatusChangedDate)
		SELECT        [New Oracle Part #], [Item No], Customer, [Customer Part#], CustomerRev, Active, Reason, [calculate bill?], Base, [Cable Type], [Revision Date], [Revision Letter], 
                         [Revision History], [Standard Operation], [Jacket Material], [Jacket Color], [Color Chip ID], [Nominal OD], [OD Tol  (+)], [OD Tol  (-)], Height, [Height Tol (+)], 
                         [Height Tol (-)], [Nominal Wall], [Max Ave Wall], [Min Ave Wall], [Min Spot Wall], [Print Reel No], [Print Item No], [Std Subunit Print], [Print Type (base)], [Print Line 1], 
                         [Print Line 2], [Print Line 3], [Print Line 4], NewPrintLine4, [Print Spacing], PrintNotes, [Listing Company], [UL-ETL-Listing], [UL-ETL-Const], [UL-ETL-Section], ENumber, 
                         [Label Type], [Aramid Type], [Number of ends], [Aramid Type2], [Number of ends2], [Unit Chips Type], [Unit Ripcord], [Unit CM], [Lay Length], Talc, [EZ Strip], 
                         [TB Material], [TB Chips Type], [TB Nominal OD], [TB OD Tol  (+)], [TB OD Tol  (-)], [TB Color Series], [Fiber Type], [Fiber Oracle item], FiberType2, FiberType3, 
                         [1st Req Freq], [1st Max Atten], [1st Min BandW], [2nd Req Freq], [2nd Max Atten], [2nd Min BandW], [SM 1300 Max Atten], [SM 1550 Max Atten], 
                         [Special Instr Product1], [zzSpecial Instr Product3], [zzSpecial Instr Product4], [zzOracle Part#], OracleStatus, [PSS Document #], DateCreated, CreatedBy, 
                         RevisedBy, RevisedDate, BaseID, RibbonHighCure, [Print Height], [Unit Series], [1st Req Freq - B], [1st Max Atten - B], [1st Min BandW - B], 
                         [2nd Req Freq - B], [2nd Max Atten - B], [2nd Min BandW - B], [1st Req Freq - C], [1st Max Atten - C], [1st Min BandW - C], [2nd Req Freq - C], [2nd Max Atten - C], 
                         [2nd Min BandW - C], Colored_Fiber
						 , ActiveStatusChangedBy, ActiveStatusChangedDate
		FROM            DELETED	
		--WHERE convert(date,DateCreated) <> convert(date,getdate())


			END


	END
GO
ALTER TABLE [dbo].[Basic Product Construction] ADD CONSTRAINT [PK_Basic Product Construction] PRIMARY KEY CLUSTERED  ([New Oracle Part #]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BasicProdConstruction_IXX] ON [dbo].[Basic Product Construction] ([Active], [OracleStatus]) INCLUDE ([Base], [Customer], [Customer Part#], [Fiber Oracle item], [FiberType2], [Item No], [Jacket Color], [New Oracle Part #], [Print Spacing], [Revision Date]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BasicProdConstruction_XI] ON [dbo].[Basic Product Construction] ([Active], [OracleStatus]) INCLUDE ([Base], [Customer], [Customer Part#], [Fiber Oracle item], [FiberType2], [ID], [Item No], [Jacket Color], [New Oracle Part #], [Print Spacing], [Revision Date]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Basic Product Construction] ON [dbo].[Basic Product Construction] ([Customer], [Customer Part#], [Item No], [EZ Strip], [Jacket Color], [Jacket Material], [Base], [OracleStatus], [Fiber Oracle item], [Active]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IXI_BasicProdConstruction] ON [dbo].[Basic Product Construction] ([Customer], [OracleStatus]) INCLUDE ([Base], [Customer Part#], [Fiber Oracle item], [FiberType2], [Item No], [Jacket Color], [New Oracle Part #], [Print Spacing], [Revision Date]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Basic Product Construction_1] ON [dbo].[Basic Product Construction] ([New Oracle Part #]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Basic Product Construction] ADD CONSTRAINT [FK_Basic Product Construction_Customers] FOREIGN KEY ([Customer]) REFERENCES [dbo].[Customers] ([Customer]) ON DELETE SET NULL ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Basic Product Construction] ADD CONSTRAINT [FK_Basic Product Construction_PrintLine4Codes] FOREIGN KEY ([NewPrintLine4], [Print Line 4]) REFERENCES [dbo].[PrintLine4] ([Line4PrintCode], [Line4Print]) ON DELETE SET NULL ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Basic Product Construction] ADD CONSTRAINT [FK_Basic Product Construction_tbl_Fibers] FOREIGN KEY ([Fiber Oracle item]) REFERENCES [dbo].[tbl_Fibers] ([Fiber]) ON DELETE SET NULL ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Basic Product Construction] ADD CONSTRAINT [FK_Basic Product Construction_tbl_Fibers1] FOREIGN KEY ([FiberType2]) REFERENCES [dbo].[tbl_Fibers] ([Fiber])
GO
ALTER TABLE [dbo].[Basic Product Construction] ADD CONSTRAINT [FK_Basic Product Construction_tbl_Fibers2] FOREIGN KEY ([FiberType3]) REFERENCES [dbo].[tbl_Fibers] ([Fiber])
GO
ALTER TABLE [dbo].[Basic Product Construction] ADD CONSTRAINT [FK_Basic Product Construction_tblCableConstructionReferences1] FOREIGN KEY ([Base]) REFERENCES [dbo].[tblCableConstructionReferences] ([Base]) ON DELETE SET NULL ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Basic Product Construction] ADD CONSTRAINT [FK_Basic Product Construction_tblColors_Available] FOREIGN KEY ([Jacket Color]) REFERENCES [dbo].[tblColors_Available] ([Color]) ON DELETE SET NULL ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Basic Product Construction] ADD CONSTRAINT [FK_Basic Product Construction_tblTightBufferStripType] FOREIGN KEY ([EZ Strip]) REFERENCES [dbo].[tblTightBufferStripType] ([TightBufferStrip]) ON DELETE SET NULL ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Basic Product Construction] ADD CONSTRAINT [FK_PrintTypeBase_BasicConstruction] FOREIGN KEY ([Print Type (base)]) REFERENCES [dbo].[PrintTypeBase] ([PrintTypeBase]) ON DELETE SET NULL ON UPDATE CASCADE
GO
GRANT UPDATE ([Active]) ON [dbo].[Basic Product Construction] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Reason]) ON [dbo].[Basic Product Construction] TO [NAA\SPB Premise SQL RO]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[1st Max Atten]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'1st Max Atten'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[1st Min BandW]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'1st Min BandW'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[1st Req Freq]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'1st Req Freq'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[2nd Max Atten]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'2nd Max Atten'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[2nd Min BandW]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'2nd Min BandW'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[2nd Req Freq]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'2nd Req Freq'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Active]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Active'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Aramid Type]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Aramid Type'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Aramid Type2]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Aramid Type2'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Base]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Base'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Cable Type]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Cable Type'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[calculate bill?]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'calculate bill?'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Color Chip ID]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Color Chip ID'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Customer]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Customer'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Customer Part#]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Customer Part#'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[CustomerRev]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'CustomerRev'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[ENumber]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'ENumber'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[EZ Strip]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'EZ Strip'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Fiber Oracle item]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Fiber Oracle item'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Fiber Type]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Fiber Type'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[FiberType2]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'FiberType2'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[FiberType3]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'FiberType3'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Height]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Height'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Height Tol (-)]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Height Tol (-)'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Height Tol (+)]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Height Tol (+)'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Item No]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Item No'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Jacket Color]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Jacket Color'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Jacket Material]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Jacket Material'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Label Type]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Label Type'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Lay Length]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Lay Length'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Listing Company]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Listing Company'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Max Ave Wall]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Max Ave Wall'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Min Ave Wall]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Min Ave Wall'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Min Spot Wall]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Min Spot Wall'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[New Oracle Part #]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'New Oracle Part #'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[NewPrintLine4]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'NewPrintLine4'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Nominal OD]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Nominal OD'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Nominal Wall]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Nominal Wall'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Number of ends]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Number of ends'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Number of ends2]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Number of ends2'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[OD Tol  (-)]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'OD Tol  (-)'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[OD Tol  (+)]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'OD Tol  (+)'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[OracleStatus]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'OracleStatus'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Print Item No]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Print Item No'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Print Line 1]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Print Line 1'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Print Line 2]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Print Line 2'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Print Line 3]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Print Line 3'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Print Line 4]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Print Line 4'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Print Reel No]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Print Reel No'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Print Spacing]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Print Spacing'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Print Type (base)]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Print Type (base)'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[PrintNotes]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'PrintNotes'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[PSS Document #]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'PSS Document #'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Reason]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Reason'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Revision Date]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Revision Date'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Revision History]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Revision History'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Revision Letter]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Revision Letter'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[SM 1300 Max Atten]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'SM 1300 Max Atten'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[SM 1550 Max Atten]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'SM 1550 Max Atten'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Special Instr Product1]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Special Instr Product1'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Standard Operation]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Standard Operation'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Std Subunit Print]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Std Subunit Print'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Talc]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Talc'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[TB Chips Type]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'TB Chips Type'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[TB Color Series]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'TB Color Series'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[TB Material]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'TB Material'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[TB Nominal OD]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'TB Nominal OD'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[TB OD Tol  (-)]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'TB OD Tol  (-)'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[TB OD Tol  (+)]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'TB OD Tol  (+)'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[UL-ETL-Const]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'UL-ETL-Const'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[UL-ETL-Listing]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'UL-ETL-Listing'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[UL-ETL-Section]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'UL-ETL-Section'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Unit Chips Type]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Unit Chips Type'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Unit CM]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Unit CM'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[Unit Ripcord]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'Unit Ripcord'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[zzOracle Part#]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'zzOracle Part#'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[zzSpecial Instr Product3]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'zzSpecial Instr Product3'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Basic Product Construction].[zzSpecial Instr Product4]', 'SCHEMA', N'dbo', 'TABLE', N'Basic Product Construction', 'COLUMN', N'zzSpecial Instr Product4'
GO
