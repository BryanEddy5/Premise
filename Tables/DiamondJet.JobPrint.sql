CREATE TABLE [DiamondJet].[JobPrint]
(
[JobNumber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PrintString] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreationDate] [datetime] NULL CONSTRAINT [DF_JobPrint_CreationDate] DEFAULT (getdate()),
[RevisionDate] [datetime] NULL CONSTRAINT [DF_JobPrint_RevisionDate] DEFAULT (getdate()),
[UniqueID] [uniqueidentifier] NULL CONSTRAINT [DF_JobPrint_UniqueID] DEFAULT (newid()),
[ItemNumber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TemplateID] [int] NULL,
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_JobPrint_CreatedBy] DEFAULT (suser_sname()),
[RevisedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_JobPrint_RevisedBy] DEFAULT (suser_sname()),
[VerificationPrint] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Bryan Eddy
-- Create date: 5/1/2018
-- Description:	Triger to update JobPrint table when the print string, job, or template has been updated
-- =============================================
CREATE TRIGGER [DiamondJet].[trgr_JobPrint] 
   ON  [DiamondJet].[JobPrint]
   AFTER INSERT, UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF UPDATE(JobNumber) OR UPDATE(PrintString) OR UPDATE(TemplateID) OR UPDATE(VerificationPrint)
		BEGIN
			UPDATE J
			SET RevisionDate = GETDATE(), J.RevisedBy = SUSER_SNAME()
			FROM DiamondJet.JobPrint J INNER JOIN Inserted I ON J.UniqueID = I.UniqueID


			

			
		END

		DECLARE @INS int, @DEL int
		SELECT @INS = COUNT(*) FROM INSERTED
		SELECT @DEL = COUNT(*) FROM DELETED

	IF @INS > 0 OR @DEL > 0 
		BEGIN
			INSERT INTO DiamondJet.JobPrint_Archive
			(
				JobNumber,
				PrintString,
				CreationDate,
				RevisionDate,
				UniqueID,
				ItemNumber,
				TemplateID,
				CreatedBy,
				RevisedBy,
				VerificationPrint
			)
			SELECT DISTINCT JobNumber,
				PrintString,
				CreationDate,
				RevisionDate,
				UniqueID,
				ItemNumber,
				TemplateID,
				CreatedBy,
				RevisedBy,
				VerificationPrint
			FROM Deleted 
		END
		



END
GO
ALTER TABLE [DiamondJet].[JobPrint] ADD CONSTRAINT [PK_JobPrint] PRIMARY KEY CLUSTERED  ([JobNumber]) ON [PRIMARY]
GO
ALTER TABLE [DiamondJet].[JobPrint] ADD CONSTRAINT [FK_JobPrint_Templates] FOREIGN KEY ([TemplateID]) REFERENCES [DiamondJet].[Templates] ([TemplateID]) ON UPDATE CASCADE
GO
GRANT INSERT ON  [DiamondJet].[JobPrint] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ON  [DiamondJet].[JobPrint] TO [NAA\SPB Premise SQL RO]
GO
