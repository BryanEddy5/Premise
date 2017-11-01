SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO







CREATE VIEW [dbo].[vSchedulingCableUnion]
AS

SELECT [item no], 
       [customer part#], 
       [customer], 
       [print type (base)], 
       [new oracle part #], 
       [base], 
       [jacket color], 
       [print line 1], 
       [print line 2], 
       [print line 3], 
       [print line 4], 
       [print reel no], 
       [print item no], 
       [print spacing], 
       [1st req freq], 
       [2nd req freq], 
       [fiber oracle item]           AS [Fiber Type], 
       LEFT([new oracle part #], 7)  AS [Base Oracle], 
       [active], 
       [revision date], 
       [revision history], 
       fibertype2                    AS Fiber2, 
       [customer part#]              AS PID, 
       [oraclestatus], 
       enumber, 
       fibertype3                    AS Fiber3, 
       customerrev, 
       1                             AS Location, 
       [standard operation]          AS StdOp, 
       [fiber oracle item]           AS Fiber, 
       [1st req freq]                AS [1st Req Freq - A], 
       [1st max atten]               AS [1st Max Atten - A], 
       [1st min bandw]               AS [1st Min BandW - A], 
       [2nd req freq]                AS [2nd Req Freq - A], 
       [2nd max atten]               AS [2nd Max Atten - A], 
       [2nd min bandw]               AS [2nd Min BandW - A], 
       [sm 1300 max atten]           AS [1st Req Freq - B], 
       [sm 1550 max atten]           AS [1st Max Atten - B], 
       [1st Min BandW - B], 
       [2nd Req Freq - B], 
       [2nd Max Atten - B], 
       [2nd Min BandW - B], 
       [1st Req Freq - C], 
       [1st Max Atten - C], 
       [1st Min BandW - C], 
       [2nd Req Freq - C], 
       [2nd Max Atten - C], 
       [2nd Min BandW - C], 
       [Print Height], 
       NULL                          AS [FRP Dia], 
       ''								AS [color chip id], 
       [special instr product1]      AS CustomerInstructions, 
       [tb nominal od], 
       [tb od tol  (-)], 
       [tb od tol  (+)], 
       [ez strip], 
       [tb material], 
       [tb chips type], 
       [unit series], 
       [special instr product1]      SpecialInstructions1, 
       [zzspecial instr product3]    SpecialInstructions2 
FROM   [basic product construction] 










GO
