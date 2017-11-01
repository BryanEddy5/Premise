CREATE TABLE [dbo].[tblCableConstructionsOLD]
(
[StandardOperation] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[JacketMaterial] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NominalOD] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ODTolPlus] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ODTolMinus] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Height] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HeightTolPlus] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HeightTolMinus] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NominalWall] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MaxAveWall] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MinAveWall] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MinSpotWall] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AramidType1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AramidEnds1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AramidType2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AramidEnds2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ChipType] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Ripcord] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LayLength] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Talc] [smallint] NULL,
[FRP_Dia] [real] NULL,
[CM] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CMMaterial] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CM_OD] [real] NULL,
[CMODTolPlus] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CMODTolMinus] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CMWall] [real] NULL,
[CMMinWall] [real] NULL,
[HelixFactor] [real] NULL,
[CoreWrap] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CoreDia] [real] NULL,
[Binder1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QtyBinder1] [tinyint] NULL,
[Binder1LayLength] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Binder2] [nvarchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QtyBinder2] [tinyint] NULL,
[Binder2LayLength] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Binder3] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QtyBinder3] [tinyint] NULL,
[Binder3LayLength] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CablePasses] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblCableConstructions_CablePasses] DEFAULT ((1)),
[RevisionDate] [datetime2] (0) NULL CONSTRAINT [DF_tblCableConstructions_RevisionDate2] DEFAULT (getdate()),
[RevisionNumber] [smallint] NULL CONSTRAINT [DF__tblCableC__Revis__017F0B4C] DEFAULT ((0)),
[RevisionHistory] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Instructions] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Instructions2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSMA_TimeStamp] [timestamp] NOT NULL,
[DateCreated] [datetime2] NULL CONSTRAINT [DF_tblCableConstructions_DateCreated2] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblCableConstructions_CreatedBy2] DEFAULT (suser_sname()),
[BaseID] [int] NOT NULL,
[RevisedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblCableConstructions_RevisedBy2] DEFAULT (suser_sname()),
[ColorChipPercentage] [numeric] (5, 5) NULL,
[ID] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE TRIGGER [dbo].[CableConstructionsUpdatetrgr] ON [dbo].[tblCableConstructionsOLD]
AFTER INSERT, UPDATE 
AS
	BEGIN 
		IF NOT (UPDATE(RevisionDate))
			BEGIN
			  UPDATE t
			  SET t.RevisionDate = GETDATE(),
			  t.RevisedBy = (SUSER_SNAME()),
			  t.RevisionNumber = (t.RevisionNumber + 1) 
			  FROM dbo.tblCableConstructions as t
			  JOIN inserted i
			  ON i.baseid = t.baseid
			END
		DECLARE @INS int, @DEL int

		SELECT @INS = COUNT(*) FROM INSERTED
		SELECT @DEL = COUNT(*) FROM DELETED

		IF @INS > 0 AND @DEL > 0 
		BEGIN

		  INSERT INTO DBO.tblCableConstructionsARCHIVE(
			 [StandardOperation],[JacketMaterial],[NominalOD],[ODTolPlus],[ODTolMinus],[Height],[HeightTolPlus],[HeightTolMinus],[NominalWall],[MaxAveWall],[MinAveWall],[MinSpotWall],[AramidType1]
		,[AramidEnds1],[AramidType2],[AramidEnds2],[ChipType],[Ripcord],[LayLength],[Talc],[FRP_Dia],[CM],[CMMaterial],[CM_OD],[CMODTolPlus],[CMODTolMinus],[CMWall],[CMMinWall],[HelixFactor],[CoreWrap]
		,[CoreDia],[Binder1],[QtyBinder1],[Binder1LayLength],[Binder2],[QtyBinder2],[Binder2LayLength],[Binder3],[QtyBinder3],[Binder3LayLength],[CablePasses],[RevisionDate],[RevisionNumber]
		,[RevisionHistory],[Instructions],[Instructions2],[BaseID],[ColorChipPercentage],[ID]) 
	  
			  SELECT
			 [StandardOperation],[JacketMaterial],[NominalOD],[ODTolPlus],[ODTolMinus],[Height],[HeightTolPlus],[HeightTolMinus],[NominalWall],[MaxAveWall],[MinAveWall],[MinSpotWall],[AramidType1]
		,[AramidEnds1],[AramidType2],[AramidEnds2],[ChipType],[Ripcord],[LayLength],[Talc],[FRP_Dia],[CM],[CMMaterial],[CM_OD],[CMODTolPlus],[CMODTolMinus],[CMWall],[CMMinWall],[HelixFactor],[CoreWrap]
		,[CoreDia],[Binder1],[QtyBinder1],[Binder1LayLength],[Binder2],[QtyBinder2],[Binder2LayLength],[Binder3],[QtyBinder3],[Binder3LayLength],[CablePasses],[RevisionDate],[RevisionNumber]
		,[RevisionHistory],[Instructions],[Instructions2],[BaseID],[ColorChipPercentage],[ID] 
			FROM DELETED --the DELETED table contains the OLD values

		/*	  SELECT
			 [StandardOperation],[JacketMaterial],[NominalOD],[ODTolPlus],[ODTolMinus],[Height],[HeightTolPlus],[HeightTolMinus],[NominalWall],[MaxAveWall],[MinAveWall],[MinSpotWall],[AramidType1]
		,[AramidEnds1],[AramidType2],[AramidEnds2],[ChipType],[Ripcord],[LayLength],[Talc],[FRP_Dia],[CM],[CMMaterial],[CM_OD],[CMODTolPlus],[CMODTolMinus],[CMWall],[CMMinWall],[HelixFactor],[CoreWrap]
		,[CoreDia],[Binder1],[QtyBinder1],[Binder1LayLength],[Binder2],[QtyBinder2],[Binder2LayLength],[Binder3],[QtyBinder3],[Binder3LayLength],[CablePasses],[RevisionDate],[RevisionNumber]
		,[RevisionHistory],[Instructions],[Instructions2],[BaseID],[ColorChipPercentage],[ID] 
			 FROM INSERTED  --the INSERTED table contains the NEW values*/
		END


	END
			
GO
ALTER TABLE [dbo].[tblCableConstructionsOLD] ADD CONSTRAINT [PK_tblCableConstructions2] PRIMARY KEY CLUSTERED  ([BaseID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblCableConstructions_9] ON [dbo].[tblCableConstructionsOLD] ([CablePasses]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblCableConstructions_7] ON [dbo].[tblCableConstructionsOLD] ([JacketMaterial]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblCableConstructions_8] ON [dbo].[tblCableConstructionsOLD] ([StandardOperation]) ON [PRIMARY]
GO
