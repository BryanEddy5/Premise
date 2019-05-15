CREATE TABLE [dbo].[tblCableConstructionReferences]
(
[Base] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DateCreated] [datetime2] NULL CONSTRAINT [DF_tblCableConstructionReference_DateCreated] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblCableConstructionReference_CreatedBy] DEFAULT (suser_sname()),
[RevisionDate] [datetime2] (0) NULL CONSTRAINT [DF_tblCableConstructionReference_RevisionDate] DEFAULT (getdate()),
[RevisedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblCableConstructionReference_RevisedBy] DEFAULT (suser_sname()),
[DesignCode] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DesignExtension] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ConstructionDescription] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BaseID] [int] NULL,
[NumSubFillers] [int] NULL CONSTRAINT [DF_tblCableConstructionReference_NumFillers] DEFAULT ((0)),
[Active] [bit] NULL CONSTRAINT [DF_tblCableConstructionReference_Active] DEFAULT ((1)),
[PrefixID] [int] NULL,
[ProductID] [int] NULL,
[SetupID] [int] NOT NULL IDENTITY(1, 1),
[FamilyID] [int] NULL,
[FibersPerBundle] [smallint] NULL,
[UnitIDTypeNumber] [int] NULL,
[InactiveReason] [nvarchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NumSubPositions] [int] NULL CONSTRAINT [DF_tblCableConstructionReferences_NumSubPositions] DEFAULT ((0)),
[TBType] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CableFamily] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CableLevel1] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TimeStamp] [timestamp] NULL,
[DesignTypeID] [int] NULL,
[NumCopperUnits] [int] NULL CONSTRAINT [DF_tblCableConstructionReferences_NumCopperUnits] DEFAULT ((0)),
[ReleasedDesign] [bit] NOT NULL CONSTRAINT [DF_tblCableConstructionReferences_ReleasedDesign] DEFAULT ((0)),
[ApprovedForQuoting] [bit] NULL CONSTRAINT [DF_tblCableConstructionReferences_ApprovedForQuoting] DEFAULT ((0)),
[FiberCount] [smallint] NULL,
[CableType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LeadTime_ID] [int] NULL,
[LeadTime_ID_Armored] [int] NULL,
[InactiveDate] [datetime] NULL,
[ActiveStatusChangedDate] [datetime] NULL,
[ActiveStatusChangedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ReleasedStatusChangedDate] [datetime] NULL,
[ReleasedStatusChangedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ImageGroupID] [int] NULL,
[IsCommoned] [bit] NULL CONSTRAINT [DF_tblCableConstructionReferences_IsCommoned] DEFAULT ((1)),
[NewProductCode] [nvarchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CPR_DoP] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Bryan Eddy
-- Create date: 11/10/2016
-- Description:	Add Base to Cut Sheet approval table when a new base is created.
-- =============================================
CREATE TRIGGER [dbo].[CutSheetApproval_InsertNewBase]
   ON  [dbo].[tblCableConstructionReferences]
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @Base nvarchar(50), @INS int, @DEL int

		SELECT @INS = COUNT(*) FROM INSERTED
		SELECT @DEL = COUNT(*) FROM DELETED

		IF @INS > 0 OR @DEL > 0 

    SELECT @Base=i.Base from inserted i

	INSERT INTO dbo.tblCutSheetApproval (Base)
	VALUES (@Base)

	INSERT INTO dbo.tblBurnListing (Base,ListingCompany)
	VALUES (@Base,'NONE')

END
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE TRIGGER [dbo].[trgCableConstructionReferencesUpdate] ON [dbo].[tblCableConstructionReferences]
AFTER INSERT, UPDATE 
AS

 SET NOCOUNT ON;
	BEGIN 
		IF NOT (UPDATE(RevisionDate))
			BEGIN
			  UPDATE t
			  SET t.RevisionDate = GETDATE(), t.ProductID = t.SetupID
			  FROM dbo.tblCableConstructionReferences as t
			  JOIN inserted i
			  ON i.Base = t.Base
			END
			BEGIN
			  UPDATE t
			  SET  t.ProductID = t.SetupID
			  FROM dbo.tblCableConstructionReferences as t
			  JOIN inserted i
			  ON i.Base = t.Base
			END

		BEGIN 
		IF NOT (UPDATE(RevisedBy))
			BEGIN
			  UPDATE t
			  SET t.RevisedBy = (SUSER_SNAME()) 
			  FROM dbo.tblCableConstructionReferences as t
			  JOIN inserted d
			  ON d.Base = t.Base
			END
		IF  UPDATE(Active)
			BEGIN
			  UPDATE t
			  SET t.ActiveStatusChangedDate = GETDATE() , t.ActiveStatusChangedBy = (SUSER_SNAME()) 
			  FROM dbo.tblCableConstructionReferences as t
			  JOIN inserted i
			  ON i.Base = t.Base
		END 
		IF  UPDATE(ReleasedDesign)
			BEGIN
			  UPDATE t
			  SET t.ReleasedStatusChangedDate = GETDATE() , t.ReleasedStatusChangedBy = (SUSER_SNAME()) 
			  FROM dbo.tblCableConstructionReferences as t
			  JOIN inserted i
			  ON i.Base = t.Base
		END 
		END
	END
			

GO
ALTER TABLE [dbo].[tblCableConstructionReferences] ADD CONSTRAINT [PK_tblCableConstructionReferences] PRIMARY KEY CLUSTERED  ([Base]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblCableConstructionReferences_2] ON [dbo].[tblCableConstructionReferences] ([Active], [ReleasedDesign], [ApprovedForQuoting], [TBType], [DesignTypeID], [Base], [DesignCode], [NumSubFillers], [FamilyID], [NumSubPositions], [CableFamily], [CableLevel1]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblCableConstructionReferences] ON [dbo].[tblCableConstructionReferences] ([BaseID], [Base], [Active], [ApprovedForQuoting], [TBType], [ReleasedDesign], [DesignTypeID], [DesignCode], [DesignExtension], [CableLevel1], [CableFamily]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblCableConstructionReferences_1] ON [dbo].[tblCableConstructionReferences] ([SetupID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCableConstructionReferences] ADD CONSTRAINT [FK_tblCableConstructionReferences_Buff#1/#2 Alloc Table] FOREIGN KEY ([PrefixID]) REFERENCES [dbo].[Buff#1/#2 Alloc Table] ([PrefixID]) ON DELETE SET NULL ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblCableConstructionReferences] ADD CONSTRAINT [FK_tblCableConstructionReferences_ImageGroup] FOREIGN KEY ([ImageGroupID]) REFERENCES [CutSheet].[ImageGroup] ([ImageGroupID]) ON DELETE SET NULL ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblCableConstructionReferences] ADD CONSTRAINT [FK_tblCableConstructionReferences_tblCableConstructions] FOREIGN KEY ([BaseID]) REFERENCES [dbo].[tblCableConstructions] ([BaseID]) ON DELETE SET NULL ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblCableConstructionReferences] ADD CONSTRAINT [FK_tblCableConstructionReferences_tblCableExtensionReference] FOREIGN KEY ([FibersPerBundle]) REFERENCES [dbo].[tblCableExtensionReference] ([ExtensionNumber])
GO
ALTER TABLE [dbo].[tblCableConstructionReferences] ADD CONSTRAINT [FK_tblCableConstructionReferences_tblCableFamily] FOREIGN KEY ([FamilyID]) REFERENCES [dbo].[tblCableFamily] ([FamilyID]) ON DELETE SET NULL ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblCableConstructionReferences] ADD CONSTRAINT [FK_tblCableConstructionReferences_tblCableTightBufferReference] FOREIGN KEY ([TBType]) REFERENCES [dbo].[tblCableTightBufferReference] ([TBType]) ON DELETE SET NULL ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblCableConstructionReferences] ADD CONSTRAINT [FK_tblCableConstructionReferences_tblCableType] FOREIGN KEY ([CableType]) REFERENCES [dbo].[tblCableType] ([CableType]) ON DELETE SET NULL ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblCableConstructionReferences] ADD CONSTRAINT [FK_tblCableConstructionReferences_tblDesignTypes] FOREIGN KEY ([DesignTypeID]) REFERENCES [dbo].[tblDesignTypes] ([DesignTypeID]) ON DELETE SET NULL ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblCableConstructionReferences] ADD CONSTRAINT [FK_tblCableConstructionReferences_tblUnitSeriesTemplateCatalog] FOREIGN KEY ([UnitIDTypeNumber]) REFERENCES [dbo].[tblUnitSeriesTemplateCatalog] ([ID])
GO
GRANT UPDATE ([ImageGroupID]) ON [dbo].[tblCableConstructionReferences] TO [NAA\SPB Premise SQL RO]
GO
