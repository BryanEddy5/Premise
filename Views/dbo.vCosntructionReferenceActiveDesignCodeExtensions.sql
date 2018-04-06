SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/*
Author:		Bryan Eddy
Date:		2/28/2018
Desc:		Consolidated list of active design code extensions to check during item builds
Version:	1
Update:		Initial Creation

*/

CREATE VIEW [dbo].[vCosntructionReferenceActiveDesignCodeExtensions]
AS
SELECT  DISTINCT DesignExtension
FROM dbo.tblCableConstructionReferences
WHERE DesignExtension IS NOT NULL AND Active = 1

GO
