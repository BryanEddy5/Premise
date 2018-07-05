SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/*
Author:		Bryan Eddy
Date:		5/2/2018
Desc:		Procedure for updating/inserting print records into the db
Version:	1
Update:		n/a
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
VerificationPrint NVARCHAR(1000)
)

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


			MERGE DiamondJet.JobPrint T
			USING @Print AS S
			ON t.JobNumber = s.JobNumber
			WHEN MATCHED
				THEN UPDATE SET T.PrintString = S.PrintLine, T.VerificationPrint = S.VerificationPrint
			WHEN NOT MATCHED
				THEN INSERT (JobNumber, PrintString, ItemNumber, TemplateID,VerificationPrint)
				VALUES (S.JobNumber, S.PrintLine, S.ItemNumber, S.TemplateID,VerificationPrint);
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
