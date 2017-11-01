SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





CREATE VIEW [dbo].[vCutSheet_Fiber2]

AS

SELECT Fiber, e.OpticalID, CodeFiberType
,e.Mode
,Attn_dbkm_850nm
,Attn_dbkm_1300nm
,Attn_dbkm_1310nm
,Attn_dbkm_1550nm
,BW_MHzkm_850nm
,BW_MHzkm_1300nm
,EMBc_MHzkm
,[1GigEthMin_LinkDist_850nm]
,[1GigEthMin_LinkDist_1300nm]
,[10GigEthMin_LinkDist_850nm]
,[10GigEthMin_LinkDist_1300nm]
,FiberLetter
,FiberExtension
FROM   dbo.tbl_Fibers C  INNER JOIN dbo.tblCutSheetOpticalFiberChart E ON C.OpticalID = E.OpticalID








GO
