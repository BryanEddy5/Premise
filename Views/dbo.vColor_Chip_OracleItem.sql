SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vColor_Chip_OracleItem]
AS
SELECT        dbo.CableUnion.Oracle, dbo.CableUnion.ItemNo, dbo.CableUnion.Color, dbo.tblCableConstructions.JacketMaterial, dbo.tblcolor_chip_concentration.ColorChip, 
                         dbo.tblcolor_chip_concentration.Color_Chip_Concentration
FROM            dbo.tblCableConstructionReferences INNER JOIN
                         dbo.tblcolor_jacket_catalog INNER JOIN
                         dbo.tblcolor_chip_concentration ON dbo.tblcolor_jacket_catalog.Color_Chip_Catalog = dbo.tblcolor_chip_concentration.Color_Chip_Catalog INNER JOIN
                         dbo.tblCableConstructions INNER JOIN
                         dbo.tbljacketmaterials ON dbo.tblCableConstructions.JacketMaterial = dbo.tbljacketmaterials.JacketMaterial ON 
                         dbo.tblcolor_jacket_catalog.Color_Chip_Catalog = dbo.tbljacketmaterials.Color_Chip_Catalog ON 
                         dbo.tblCableConstructionReferences.BaseID = dbo.tblCableConstructions.BaseID RIGHT OUTER JOIN
                         dbo.CableUnion ON dbo.CableUnion.Color = dbo.tblcolor_chip_concentration.Color AND dbo.tblCableConstructionReferences.Base = dbo.CableUnion.Base


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
         Begin Table = "tblCableConstructionReferences"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblcolor_jacket_catalog"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 267
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblcolor_chip_concentration"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 399
               Right = 267
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCableConstructions"
            Begin Extent = 
               Top = 402
               Left = 38
               Bottom = 531
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbljacketmaterials"
            Begin Extent = 
               Top = 138
               Left = 270
               Bottom = 267
               Right = 464
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CableUnion"
            Begin Extent = 
               Top = 534
               Left = 38
               Bottom = 663
               Right = 216
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
   End
   Begin ', 'SCHEMA', N'dbo', 'VIEW', N'vColor_Chip_OracleItem', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'CriteriaPane = 
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
', 'SCHEMA', N'dbo', 'VIEW', N'vColor_Chip_OracleItem', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'vColor_Chip_OracleItem', NULL, NULL
GO
