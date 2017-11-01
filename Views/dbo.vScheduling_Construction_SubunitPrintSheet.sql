SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vScheduling_Construction_SubunitPrintSheet]
AS
SELECT        dbo.[Basic Product Construction].[New Oracle Part #] AS Oracle, [Basic Product Construction_1].[Item No], dbo.tblUnitSeriesTemplate.UnitID, 
                         dbo.[Unit Series].[Fiber Code], dbo.tblUnitSeriesTemplate.PrintSpacing, dbo.[Unit Series].[Print type], dbo.[Unit Series].OracleItem AS Oracle_Sub, 
                         dbo.[Basic Product Construction].Customer, dbo.[Basic Product Construction].[Item No] AS Finished_ItemNo
FROM            dbo.[Basic Product Construction] AS [Basic Product Construction_1] INNER JOIN
                         dbo.[Unit Series] ON [Basic Product Construction_1].[New Oracle Part #] = dbo.[Unit Series].OracleItem INNER JOIN
                         dbo.[Basic Product Construction] ON dbo.[Unit Series].[Unit Color Series] = dbo.[Basic Product Construction].[Unit Series] INNER JOIN
                         dbo.tblCableConstructionReferences ON dbo.[Basic Product Construction].Base = dbo.tblCableConstructionReferences.Base LEFT OUTER JOIN
                         dbo.tblUnitSeriesTemplate ON dbo.tblCableConstructionReferences.UnitIDTypeNumber = dbo.tblUnitSeriesTemplate.UnitIDTypeNumber AND 
                         dbo.[Unit Series].UnitNumber = dbo.tblUnitSeriesTemplate.UnitNumber


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
         Begin Table = "Basic Product Construction_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 251
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Unit Series"
            Begin Extent = 
               Top = 30
               Left = 472
               Bottom = 311
               Right = 704
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Basic Product Construction"
            Begin Extent = 
               Top = 141
               Left = 75
               Bottom = 312
               Right = 278
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "tblCableConstructionReferences"
            Begin Extent = 
               Top = 8
               Left = 756
               Bottom = 180
               Right = 1015
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblUnitSeriesTemplate"
            Begin Extent = 
               Top = 170
               Left = 1037
               Bottom = 299
               Right = 1229
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2850
         Width = 2775
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   B', 'SCHEMA', N'dbo', 'VIEW', N'vScheduling_Construction_SubunitPrintSheet', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'egin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1830
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
', 'SCHEMA', N'dbo', 'VIEW', N'vScheduling_Construction_SubunitPrintSheet', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'vScheduling_Construction_SubunitPrintSheet', NULL, NULL
GO
