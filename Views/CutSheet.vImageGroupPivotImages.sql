SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/*
Author:		Bryan Eddy
Date:		2/20/2018
Desc:		Pivot view of each image group with the isometric and crosssection imageID

*/

CREATE VIEW [CutSheet].[vImageGroupPivotImages]
as

SELECT pvt.ImageGroupID,ImageGroupName,ImageGroupDesc, pvt.Color, pvt.Armored,[2] AS IsometricImageID, Iso.ImageName AS IsometricImageName,iso.ImageFileType AS IsoImageFileType,
 [1] AS CrossSectionImageID, CrossSec.ImageName AS CrossSectionImageName, CrossSec.ImageFileType AS CrossImageFileType

FROM 
	(
	SELECT i.ImageGroupName,I.ImageGroupDesc, B.ImageTypeID, g.ImageID, g.Color, g.Armored
	,I.ImageGroupID
	FROM CutSheet.Images g INNER JOIN CutSheet.ImageGroupReference K ON K.ImageID = G.ImageID
	INNER JOIN CutSheet.ImageGroup I ON I.ImageGroupID = K.ImageGroupID 
	INNER JOIN CutSheet.ImageType B ON B.ImageTypeID = g.ImageTypeID
	) AS X
PIVOT
(
MAX(ImageID)
FOR ImageTypeID IN([1],[2]) 
) AS pvt left JOIN CutSheet.Images CrossSec ON CrossSec.ImageID = pvt.[1]
		left JOIN cutsheet.Images Iso ON Iso.ImageID = pvt.[2]
GO
