SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[vScheduling_SubUnitPrintSpacing]
as
SELECT DISTINCT dbo.cableunion.oracle, 
                dbo.cableunion.customer, 
                tblunitseriestemplate.printspacing AS [print spacing], 
                [unit series].[unit color series], 
                [basic product construction].[item no] as [unit type], 
                tblunitseriestemplate.printspacing, 
                [basic product construction].[item no], 
                [basic product construction].[new oracle part #] 
FROM   [basic product construction] 
       INNER JOIN (tblunitseriestemplate 
                   RIGHT JOIN ((dbo.cableunion 
                                INNER JOIN [unit series] 
                                        ON dbo.cableunion.[unit series] = 
                                           [unit series].[unit color series]) 
                               INNER JOIN tblcableconstructionreferences 
                                       ON dbo.cableunion.base = 
                   tblcableconstructionreferences.base) 
                           ON ( tblunitseriestemplate.unitnumber = 
                                [unit series].unitnumber ) 
                              AND ( tblunitseriestemplate.unitidtypenumber = 
       tblcableconstructionreferences.unitidtypenumber )) 
               ON [basic product construction].[new oracle part #] = 
                  [unit series].oracleitem; 


GO
