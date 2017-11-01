SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Schedule_Build_Premise_Load_Buff_New]
AS
INSERT INTO [temp (premise load)] 
            (requireddays_orig, 
             [adj schedule date], 
             [setup buff], 
             [setup sz/sh], 
             [week ending], 
             customer, 
             [item number], 
             length, 
             [mfg commit date], 
             [schedule date], 
             [reel number], 
             [adj mfg  date], 
             [week ending-mfg], 
             factor, 
             [count], 
             ftype, 
             [type order], 
             design, 
             family, 
             [order source], 
             [jacket material], 
             [jacket color], 
             [line#], 
             sequence, 
             base,
			 CO#) 
SELECT Distinct 	
				[premise load - new orders].length / 
             (CASE WHEN [buff line #] = 4 OR [buff line #] = 6 THEN CableRunSpeeds.[buff#4 line speed]
				   WHEN  [buff line #] = 9 OR [buff line #] = 11 THEN CableRunSpeeds.[buff#9 line speed]
				   WHEN [buff line #]   = 2 THEN  CableRunSpeeds.[buff#2 line speed]
					ELSE .001 
			 END )/ 60 *  CableRunSpeeds.[buffering factor] / 0.5 / 24 / (CASE WHEN   [units] = 'feet' THEN 3.28 ELSE 1  END) +0.05 AS   [Req'd Days], 
       [schedule date] - CableRunSpeeds.[date adjustments]     AS [Adj Schedule Date], 
       0                                                                  AS Expr4, 
       0                                                                  AS Expr5, 
       DATEADD(dd, 6-(DATEPART(dw, [Schedule date])), [Schedule date])        AS [Week ending], 
       [premise load - new orders].customer, 
       [premise load - new orders].[oracle part no], 
       [premise load - new orders].length, 
       [premise load - new orders].[mfg commit date], 
       [premise load - new orders].[schedule date], 
       'new order'                                                        AS  Expr7, 
       [mfg commit date] - CableRunSpeeds.[date adjustments]   AS  [Adj Mfg Date], 
       DATEADD(dd, 6-(DATEPART(dw, [mfg commit date] - CableRunSpeeds.[date adjustments])), [mfg commit date] - CableRunSpeeds.[date adjustments])                AS  [Week ending-mfg], 
       CableRunSpeeds.[buffering factor], 
       FiberCount,                                     
       SUBSTRING([item number], 6, 1)                                           AS FiberLetter, 
       'unloaded'                                                         AS  Expr6, 
       [premise load - new orders].[item number], 
       LEFT([oracle part no], 7)                                          AS  Family, 
       [premise load - new orders].[reel number], 
       [basic product construction].[jacket material], 
       [basic product construction].[jacket color], 
       [premise load - new orders].[buff line #], 
       999                                                                AS  Expr8, 
       tblcableconstructionreferences.base,
	   [Co number]
FROM   (([premise load - new orders] 
         INNER JOIN [basic product construction] 
                 ON [premise load - new orders].prefix = 
                    [basic product construction].[new oracle part #]) 
        INNER JOIN tblcableconstructionreferences 
                ON [basic product construction].base = 
                   tblcableconstructionreferences.base) 
       INNER JOIN CableRunSpeeds 
               ON tblcableconstructionreferences.prefixid = 
                  CableRunSpeeds.prefixid; 

GO
