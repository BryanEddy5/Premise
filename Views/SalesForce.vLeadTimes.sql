SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/*
Author:		Bryan Eddy
Date:		5/8/2018
Desc:		Lead times names for all salesforce items
Version:	1
Update:		n/a
*/

CREATE VIEW [SalesForce].[vLeadTimes]
AS
SELECT LeadTimeID,
       LeadTimeName,
       DateCreated,
       CreatedBy
FROM SalesForce.LeadTimes
GO
