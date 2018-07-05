SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/*
-- =============================================
	Author:			Bryan Eddy
	Create date:	12/11/2017
	Description:	Invoke URL to push data to Sales Force
	Version:		2
	Update:			Added header.
-- =============================================

*/
CREATE PROCEDURE [SalesForce].[usp_CatalogCode_InvokeUrl_Update] 


AS
BEGIN
Declare @Object as Int;
Declare @ResponseText as Varchar(8000);


Exec sp_OACreate 'MSXML2.XMLHTTP', @Object OUT;
Exec sp_OAMethod @Object, 'open', NULL, 'get',
                 'http://ci-data.aflglobal.com/PRE_SF_Products', --Your Web Service Url (invoked)
                 'false'
Exec sp_OAMethod @Object, 'send'
Exec sp_OAMethod @Object, 'responseText', @ResponseText OUTPUT

Select @ResponseText

Exec sp_OADestroy @Object


END
GO
