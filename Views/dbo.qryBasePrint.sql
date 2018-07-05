SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/*
Author:		Bryan Eddy
Date:		1/25/2018
Desc:		View to show print for items
Version:	2
Update:		New logic for converting print line 4 to the new diamond jet syntax
*/

CREATE VIEW [dbo].[qryBasePrint]
AS
SELECT        [Print Line 1] AS PrintLine1, RTRIM([Customer]) AS Cust, [Print Line 2] AS PrintLine2, [Print Line 3] AS PrintLine3, LEFT([Item No], 2) AS CabFam, 
                         [New Oracle Part #] AS Oracle, [Print Line 4] AS PrintLine4, [Print Item No], [Print Type (base)], [Print Reel No], [Item No], OracleStatus, [NewPrintLine4]
						 , COALESCE([Print Line 1],'') + ' ' + COALESCE([print line 2],'') + ' ' + CASE WHEN [Print Item No] <> 0 THEN [Item No] + ' ' ELSE ' ' END 
						+ COALESCE([Print Line 3],'') + ' ' 
						+ CASE WHEN [Print Reel No] <> 0 THEN 'LOT ###### ' ELSE ' ' END + COALESCE([Print Line 4],'') AS ConcatPrintLine

						 , COALESCE([Print Line 1],'') + ' ' + COALESCE([print line 2],'') + ' ' + CASE WHEN [Print Item No] <> 0 THEN [Item No] + ' ' ELSE ' ' END 
						+ COALESCE([Print Line 3],'') + ' ' 
						+ CASE WHEN [Print Reel No] <> 0 THEN 'LOT ###### ' ELSE ' ' END + COALESCE(DiamondJetPrintLine4Code,'') AS ConcatPrintLineDiamondJet
						,p.DiamondJetPrintLine4Code, K.[Print Spacing] AS Spacing, c.NominalOD

FROM            [Basic Product Construction] k left JOIN dbo.PrintLine4 i ON i.Line4PrintCode = k.NewPrintLine4 AND i.Line4Print = k.[Print Line 4]
				left JOIN dbo.PrintLine4Codes p ON p.Line4PrintCode = i.Line4PrintCode
				left JOIN dbo.tblCableConstructionReferences l ON l.Base = k.Base
				left JOIN dbo.tblCableConstructions c ON c.BaseID = l.BaseID
--UNION ALL
--SELECT        [Print Line 1] AS PrintLine1, RTRIM([Customer]) AS Cust, [Print Line 2] AS PrintLine2, [Print Line 3] AS PrintLine3, LEFT([Item No], 2) AS CabFam, 
--                         [New Oracle Part Number] AS Oracle, [Print Line 4] AS PrintLine4, [Print Item No], [Print Type (base)], [Print Reel No], [Item No], OracleStatus,[NewPrintLine4]
--FROM            [Basic (Cable/Sheath)]



GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'qryBasePrint', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'qryBasePrint', NULL, NULL
GO
