SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/*
Author:		Bryan Eddy
Date:		5/2/2018
Desc:		Procedure for updating/inserting print records into the db
Version:	2
Update:		Added ItemNumber and TemplateID to the Update procedure
			& subunit print
*/


CREATE PROC [DiamondJet].[usp_SetJobPrint]
	@Item NVARCHAR(100),
	@LotNumber NVARCHAR(100),
	@JobNumber NVARCHAR(100)
AS

SET NOCOUNT ON;

DECLARE @Print TABLE(
PrintLine NVARCHAR(1000),
ItemNumber NVARCHAR(100),
TemplateID INT,
JobNumber NVARCHAR(100),
VerificationPrint NVARCHAR(1000),
ParentJobNumber NVARCHAR(100)
)
DECLARE @CenterMember NVARCHAR(50)
DECLARE @CmTable TABLE(CenterMember NVARCHAR(50))

BEGIN

DECLARE @ErrorNumber INT = ERROR_NUMBER();
DECLARE @ErrorLine INT = ERROR_LINE();

	BEGIN TRY
		BEGIN TRAN
				
			;WITH ctePrint
			AS(
				SELECT i.Oracle, t.Template, t.TemplateID
				,ROW_NUMBER() OVER (PARTITION BY i.Oracle ORDER BY t.MinOD desc) RowNumber
				,@JobNumber AS JobNumber
				,COALESCE(i.PrintLine1,'') + ' ' + COALESCE(i.PrintLine2,'') + ' ' + CASE WHEN [Print Item No] <> 0 THEN [Item No] + ' ' ELSE ' ' END 
									+ COALESCE(i.PrintLine3,'') + ' ' 
									+ CASE WHEN [Print Reel No] <> 0 THEN ' LOT NO. '+ @LotNumber + ' '  ELSE ' ' END + COALESCE(DiamondJetPrintLine4Code,'') AS ConcatPrintLineDiamondJet

				,COALESCE(i.PrintLine1,'') + ' ' + COALESCE(i.PrintLine2,'') + ' ' + CASE WHEN [Print Item No] <> 0 THEN [Item No] + ' ' ELSE ' ' END 
									+ COALESCE(i.PrintLine3,'') + ' ' 
									+ CASE WHEN [Print Reel No] <> 0 THEN ' LOT NO. '+ @LotNumber + ' '  ELSE ' ' END + COALESCE(i.PrintLine4,'') AS VerificationPrint
				FROM DBO.qryBasePrint i left JOIN DiamondJet.MarkingIntervals k ON I.Spacing = k.MarkingInterval
				left JOIN DiamondJet.Templates t ON t.MarkingIntervalID = k.MarkingIntervalID
				WHERE t.MinOD <= i.NominalOD
			) 
			INSERT INTO @Print
			(
				PrintLine,
				ItemNumber,
				TemplateID,
				JobNumber,
				VerificationPrint
			)
			SELECT  k.ConcatPrintLineDiamondJet, k.Oracle, k.TemplateID, JobNumber, k.VerificationPrint
			FROM ctePrint k
			WHERE k.RowNumber = 1 AND k.Oracle = @ITEM

			----Get center member print for the item in the job
			INSERT INTO
			@CmTable
			EXEC dbo.usp_Scheduling_Construction_CenterMember @Item

			SELECT @CenterMember = CenterMember
			FROM @CmTable

			;WITH cteCenterMemberPrint
			AS(
				SELECT i.Oracle, t.Template, t.TemplateID
				,ROW_NUMBER() OVER (PARTITION BY i.Oracle ORDER BY t.MinOD desc) RowNumber
				,@JobNumber + '-CM' AS JobNumber
				,COALESCE(i.PrintLine1,'') + ' ' + COALESCE(i.PrintLine2,'') + ' '+ COALESCE(i.PrintLine3,'') + ' ' + COALESCE(DiamondJetPrintLine4Code,'') AS ConcatPrintLineDiamondJet
				,COALESCE(i.PrintLine1,'') + ' ' + COALESCE(i.PrintLine2,'') + ' ' + COALESCE(i.PrintLine3,'') + ' ' + COALESCE(i.PrintLine4,'') AS VerificationPrint
				,@JobNumber AS ParentJobNumber
				FROM DBO.qryBasePrint i left JOIN DiamondJet.MarkingIntervals k ON I.Spacing = k.MarkingInterval
				left JOIN DiamondJet.Templates t ON t.MarkingIntervalID = k.MarkingIntervalID
				WHERE t.MinOD <= i.NominalOD
			) 
			INSERT INTO @Print
			(
				PrintLine,
				ItemNumber,
				TemplateID,
				JobNumber,
				VerificationPrint,
				ParentJobNumber
			)
			SELECT  k.ConcatPrintLineDiamondJet, k.Oracle, k.TemplateID, JobNumber, k.VerificationPrint, ParentJobNumber
			FROM cteCenterMemberPrint k
			WHERE k.RowNumber = 1 AND k.Oracle = @CenterMember

			--Add Premise Subunits to the temp table
			;WITH cteSubunitPrint(PrintLine, ItemNumber,TemplateID, JobNumber, VerificationPrint, ParentJobNumber, RowNumber)
			AS(
				SELECT COALESCE(S.PrintUomMarking,S.UnitID) + '  ' + COALESCE(s.[Fiber Code],''),	--Print with syntax to pass to printer 
						s.Oracle_Sub,																--ItemNumber of the subunit
						S.PrintTemplateId,															--Print Template ID (Subunit, MeterSmall, ect)
						p.JobNumber + '-' + CAST(COALESCE(S.UnitNumber,'') AS NVARCHAR),			--Unique Job number
						COALESCE(S.UnitID,'') + '  ' + COALESCE(S.[Fiber Code],''),					--Print for the verification form
						P.JobNumber																	--Links to the parent job
						,ROW_NUMBER() OVER (PARTITION BY s.Finished_ItemNo, S.UnitNumber ORDER BY S.Finished_ItemNo, s.UnitNumber)
				FROM @Print P 
				INNER JOIN [vScheduling_Construction_SubunitPrintSheet] S ON S.Oracle = P.ItemNumber
				WHERE S.UnitNumber <> 100															--UnitNumber 100 items have not print so do not pass them
			)
			INSERT INTO @Print
			(
			    PrintLine,
			    ItemNumber,
			    TemplateID,
			    JobNumber,
			    VerificationPrint,
				ParentJobNumber
			)
			SELECT s.PrintLine,
                   s.ItemNumber,
                   s.TemplateID,
                   s.JobNumber,
                   s.VerificationPrint,
                   s.ParentJobNumber
			FROM cteSubunitPrint s
			WHERE RowNumber = 1					

			MERGE DiamondJet.JobPrint T
			USING @Print AS S
			ON t.JobNumber = s.JobNumber
			WHEN MATCHED
				THEN UPDATE SET T.PrintString =			S.PrintLine, 
								T.VerificationPrint =	S.VerificationPrint, 
								t.ItemNumber =			S.ItemNumber, 
								T.TemplateID =			S.TemplateID,
								T.ParentJobNumber =		S.ParentJobNumber
			WHEN NOT MATCHED
				THEN INSERT (JobNumber, PrintString, ItemNumber, TemplateID,VerificationPrint, ParentJobNumber)
				VALUES (S.JobNumber, S.PrintLine, S.ItemNumber, S.TemplateID,VerificationPrint, s.ParentJobNumber);
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;
END
GO
