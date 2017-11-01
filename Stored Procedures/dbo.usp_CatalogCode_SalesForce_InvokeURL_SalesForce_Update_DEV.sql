SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_CatalogCode_SalesForce_InvokeURL_SalesForce_Update_DEV] 


AS
BEGIN
Declare @Object as Int;
Declare @ResponseText as Varchar(8000);


Exec sp_OACreate 'MSXML2.XMLHTTP', @Object OUT;
Exec sp_OAMethod @Object, 'open', NULL, 'get',
                 'http://ci-data-dev.aflglobal.com/PRE_SF_Products', --Your Web Service Url (invoked)
                 'false'
Exec sp_OAMethod @Object, 'send'
Exec sp_OAMethod @Object, 'responseText', @ResponseText OUTPUT

Select @ResponseText

Exec sp_OADestroy @Object


END
GO
