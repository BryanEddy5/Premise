SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[Build CM Base]
AS

SELECT DISTINCT dbo.vschedulingcablereferences.[new oracle part #] AS ItemNumber 
                , 
                dbo.vschedulingcableunion.base 
                AS [CM Base], 
                tblcableconstructions.cm                           AS [CM Type], 
                dbo.vschedulingcableunion.*, 
                tblcableconstructions.jacketmaterial 
FROM   (tblcableconstructions 
        INNER JOIN dbo.vschedulingcablereferences 
                ON tblcableconstructions.baseid = 
       dbo.vschedulingcablereferences.baseid) 
       INNER JOIN dbo.vschedulingcableunion 
               ON tblcableconstructions.cm = dbo.vschedulingcableunion.[item no] 
WHERE  ( ( ( tblcableconstructions.cm ) IS NOT NULL ) 
         AND ( ( dbo.vschedulingcableunion.[new oracle part #] ) LIKE '%-01' ) ) 
; 

GO
