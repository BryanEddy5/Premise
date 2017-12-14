CREATE TABLE [dbo].[tblCableConstructions]
(
[ID] [int] NULL,
[CablePasses] [tinyint] NULL,
[StandardOperation] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[JacketMaterial] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NominalOD] [decimal] (6, 3) NULL,
[ODTolPlus] [decimal] (6, 3) NULL,
[ODTolMinus] [decimal] (6, 3) NULL,
[Height] [decimal] (6, 3) NULL CONSTRAINT [DF_tblCableConstructions_Height] DEFAULT ((0)),
[HeightTolPlus] [decimal] (6, 3) NULL,
[HeightTolMinus] [decimal] (6, 3) NULL,
[NominalWall] [decimal] (6, 3) NULL,
[MaxAveWall] [decimal] (6, 3) NULL,
[MinAveWall] [decimal] (6, 3) NULL,
[MinSpotWall] [decimal] (6, 3) NULL,
[AramidType1] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AramidEnds1] [tinyint] NULL,
[AramidType2] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AramidEnds2] [tinyint] NULL,
[ChipType] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ColorChipPercentage] [numeric] (7, 5) NULL CONSTRAINT [DF_tblCableConstructions_ColorChipPercentage] DEFAULT ((0)),
[Ripcord] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RipcordQty] [tinyint] NULL,
[LayLength] [decimal] (6, 3) NULL,
[Talc] [bit] NULL CONSTRAINT [DF_tblCableConstructionsTEST_Talc] DEFAULT ((0)),
[FRP_Dia] [decimal] (6, 3) NULL,
[CM] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CMMaterial] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CM_OD] [decimal] (6, 3) NULL,
[CMODTolPlus] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CMODTolMinus] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CMWall] [decimal] (6, 3) NULL,
[CMMinWall] [decimal] (6, 3) NULL,
[HelixFactor] [decimal] (16, 8) NULL,
[CoreWrap] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CoreDia] [decimal] (6, 3) NULL,
[Binder1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QtyBinder1] [tinyint] NULL,
[Binder1LayLength] [tinyint] NULL,
[Binder2] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QtyBinder2] [tinyint] NULL,
[Binder2LayLength] [tinyint] NULL,
[Binder3] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QtyBinder3] [tinyint] NULL,
[Binder3LayLength] [tinyint] NULL,
[RevisionDate] [datetime2] (0) NULL CONSTRAINT [DF_tblCableConstructionsTEST_RevisionDate] DEFAULT (getdate()),
[RevisionNumber] [smallint] NULL CONSTRAINT [DF_tblCableConstructionsTEST_RevisionNumber] DEFAULT ((0)),
[RevisionHistory] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Instructions] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Instructions2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSMA_TimeStamp] [timestamp] NOT NULL,
[DateCreated] [datetime] NULL CONSTRAINT [DF_tblCableConstructionsTEST_DateCreated2] DEFAULT (getdate()),
[CreatedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblCableConstructionsTEST_CreatedBy2] DEFAULT (suser_sname()),
[RevisedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblCableConstructionsTEST_RevisedBy2] DEFAULT (suser_sname()),
[BaseID] [int] NOT NULL IDENTITY(1, 1),
[Additive] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AdditivePercentage] [numeric] (7, 5) NULL CONSTRAINT [DF_tblCableConstructions_AdditivePercentage] DEFAULT ((0)),
[FirstRun] [bit] NULL CONSTRAINT [DF_tblCableConstructions_FirstRun] DEFAULT ((1)),
[EngineeringAssist] [bit] NULL CONSTRAINT [DF_tblCableConstructions_EngineeringAssist] DEFAULT ((0)),
[AramidType3] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AramidEnds3] [tinyint] NULL,
[TemperatureApplication] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TensileApplication] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StandardsApplication] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Additive2] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AdditivePercentage2] [numeric] (7, 5) NULL CONSTRAINT [DF_tblCableConstructions_AdditivePercentage1] DEFAULT ((0)),
[TensileRatingShortTerm_N] [smallint] NULL,
[TensileRatingLongTerm_N] [smallint] NULL,
[EngineeringAssistReason] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CableShapeID] [int] NULL,
[FiberApplicationID] [int] NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[CableConstructionsUpdatetrgr2] ON [dbo].[tblCableConstructions]
AFTER INSERT, UPDATE , DELETE
AS

	BEGIN 

	
	SET NOCOUNT ON;
		IF NOT (UPDATE(RevisionDate) OR UPDATE(EngineeringAssist) OR UPDATE(EngineeringAssistReason) OR UPDATE(FirstRun) OR UPDATE(TemperatureApplication) OR UPDATE(TensileApplication) OR UPDATE(StandardsApplication))

		
		
			BEGIN
			  UPDATE t
			  SET t.RevisionDate = GETDATE(),
			  t.RevisedBy = (SUSER_SNAME()),
			  t.RevisionNumber = (t.RevisionNumber + 1) 
			  FROM dbo.tblCableConstructions as t
			  JOIN inserted i
			  ON i.baseid = t.baseid
			
			DECLARE @INS int, @DEL int

			SELECT @INS = COUNT(*) FROM INSERTED
			SELECT @DEL = COUNT(*) FROM DELETED

			IF @INS > 0 OR @DEL > 0 
		

				INSERT INTO DBO.tblCableConstructionsARCHIVE(
					[StandardOperation],[JacketMaterial],[NominalOD],[ODTolPlus],[ODTolMinus],[Height],[HeightTolPlus],[HeightTolMinus],[NominalWall],[MaxAveWall],[MinAveWall],[MinSpotWall],[AramidType1]
			,[AramidEnds1],[AramidType2],[AramidEnds2],[ChipType],[Ripcord],[LayLength],[Talc],[FRP_Dia],[CM],[CMMaterial],[CM_OD],[CMODTolPlus],[CMODTolMinus],[CMWall],[CMMinWall],[HelixFactor],[CoreWrap]
			,[CoreDia],[Binder1],[QtyBinder1],[Binder1LayLength],[Binder2],[QtyBinder2],[Binder2LayLength],[Binder3],[QtyBinder3],[Binder3LayLength],[CablePasses],[RevisionDate],[RevisionNumber]
			,[RevisionHistory],[Instructions],[Instructions2],[BaseID],[ColorChipPercentage],[ID], RipcordQty,  RevisedBy, Additive, EngineeringAssist, FirstRun,TemperatureApplication, TensileApplication
			,StandardsApplication) 
	  
					SELECT
					[StandardOperation],[JacketMaterial],[NominalOD],[ODTolPlus],[ODTolMinus],[Height],[HeightTolPlus],[HeightTolMinus],[NominalWall],[MaxAveWall],[MinAveWall],[MinSpotWall],[AramidType1]
			,[AramidEnds1],[AramidType2],[AramidEnds2],[ChipType],[Ripcord],[LayLength],[Talc],[FRP_Dia],[CM],[CMMaterial],[CM_OD],[CMODTolPlus],[CMODTolMinus],[CMWall],[CMMinWall],[HelixFactor],[CoreWrap]
			,[CoreDia],[Binder1],[QtyBinder1],[Binder1LayLength],[Binder2],[QtyBinder2],[Binder2LayLength],[Binder3],[QtyBinder3],[Binder3LayLength],[CablePasses],[RevisionDate],[RevisionNumber]
			,[RevisionHistory],[Instructions],[Instructions2],[BaseID],[ColorChipPercentage],[ID] ,RipcordQty,  RevisedBy, Additive, EngineeringAssist, FirstRun,TemperatureApplication, TensileApplication
			,StandardsApplication
				FROM DELETED 
			WHERE convert(date,DateCreated) <> convert(date,getdate())
				
				--the DELETED table contains the OLD values

			/*	  SELECT
					[StandardOperation],[JacketMaterial],[NominalOD],[ODTolPlus],[ODTolMinus],[Height],[HeightTolPlus],[HeightTolMinus],[NominalWall],[MaxAveWall],[MinAveWall],[MinSpotWall],[AramidType1]
			,[AramidEnds1],[AramidType2],[AramidEnds2],[ChipType],[Ripcord],[LayLength],[Talc],[FRP_Dia],[CM],[CMMaterial],[CM_OD],[CMODTolPlus],[CMODTolMinus],[CMWall],[CMMinWall],[HelixFactor],[CoreWrap]
			,[CoreDia],[Binder1],[QtyBinder1],[Binder1LayLength],[Binder2],[QtyBinder2],[Binder2LayLength],[Binder3],[QtyBinder3],[Binder3LayLength],[CablePasses],[RevisionDate],[RevisionNumber]
							FROM INSERTED  --the INSERTED table contains the NEW values*/
			END


	END
GO
ALTER TABLE [dbo].[tblCableConstructions] ADD CONSTRAINT [PK_tblCableConstructions] PRIMARY KEY CLUSTERED  ([BaseID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblCableConstructions_4] ON [dbo].[tblCableConstructions] ([BaseID], [CablePasses], [StandardOperation]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblCableConstructions_3] ON [dbo].[tblCableConstructions] ([CablePasses], [StandardOperation]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblCableConstructions_1] ON [dbo].[tblCableConstructions] ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblCableConstructions_2] ON [dbo].[tblCableConstructions] ([ID], [NominalOD], [JacketMaterial], [StandardOperation]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblCableConstructions] ON [dbo].[tblCableConstructions] ([StandardOperation], [CablePasses]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCableConstructions] ADD CONSTRAINT [FK_CableShape_Cable] FOREIGN KEY ([CableShapeID]) REFERENCES [Construction].[CableShape] ([CableShapeID]) ON DELETE SET NULL ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblCableConstructions] ADD CONSTRAINT [FK_FiberApplication_Cable] FOREIGN KEY ([FiberApplicationID]) REFERENCES [Construction].[FiberApplication] ([FiberApplicationID]) ON DELETE SET NULL ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblCableConstructions] ADD CONSTRAINT [FK_tblCableConstructions_tblCableTemperatureStandards] FOREIGN KEY ([TemperatureApplication]) REFERENCES [dbo].[tblCableTemperatureStandards] ([TemperatureApplication]) ON DELETE SET NULL ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblCableConstructions] ADD CONSTRAINT [FK_tblCableConstructions_tblCableTensileRating] FOREIGN KEY ([TensileApplication]) REFERENCES [dbo].[tblCableTensileRating] ([TensileApplication])
GO
ALTER TABLE [dbo].[tblCableConstructions] ADD CONSTRAINT [FK_tblCableConstructions_tblJacketMaterials] FOREIGN KEY ([JacketMaterial]) REFERENCES [dbo].[tblJacketMaterials] ([JacketMaterial]) ON DELETE SET NULL ON UPDATE CASCADE
GO
