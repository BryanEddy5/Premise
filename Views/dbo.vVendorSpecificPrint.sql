SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/*
Author:		Bryan Eddy
Date:		5/8/2018
Desc:		Show print for vedor specific fiber items.  Replace vCorningPrintFiberExtension
Version:	1
Update:		n/a
*/

CREATE VIEW [dbo].[vVendorSpecificPrint]
AS
SELECT        DISTINCT i.FiberExtensions, i.CorningPrint VendorSpecificPrint, i.FiberLetter
			,v.VendorName
FROM            dbo.tblFiberExtensions k  RIGHT JOIN
                         dbo.tbl_Fibers j  ON k.Fiber = j.Fiber RIGHT JOIN
                         dbo.tblCorningPrint i ON k.FiberExtension = i.FiberExtensions
				INNER JOIN dbo.Vendors v ON v.VendorGUID = i.VendorGUID
GO
