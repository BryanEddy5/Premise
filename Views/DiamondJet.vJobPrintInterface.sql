SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/*
Author:		Bryan Eddy
Desc:		View for DiamondJet to pull print information from
Date:		4/25/2018
Version:	2
Update:		Added ParentJobNumber to the view
*/

CREATE VIEW [DiamondJet].[vJobPrintInterface]
AS 
SELECT k.JobNumber,
       k.PrintString,
       k.CreationDate,
       k.RevisionDate,
       k.UniqueID,
       k.ItemNumber,
       k.TemplateID,
	   i.Template,
	   k.VerificationPrint
	   ,k.ParentJobNumber
	   ,k.RevisedBy
	   ,k.CreatedBy
FROM DiamondJet.JobPrint k INNER JOIN DiamondJet.Templates i ON i.TemplateID = k.TemplateID
GO
