SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vColor_Chip_Jacket_Material]
AS
SELECT        dbo.tblColor_Chip_Concentration.ColorChip, dbo.tblColor_Chip_Concentration.Color_Chip_Concentration, dbo.tblJacketMaterials.JacketMaterial, 
                         dbo.tblColor_Chip_Concentration.Color, dbo.tblColor_Chips.ColorChipType
FROM            dbo.tblColor_Jacket_Catalog INNER JOIN
                         dbo.tblColor_Chip_Concentration ON dbo.tblColor_Jacket_Catalog.Color_Chip_Catalog = dbo.tblColor_Chip_Concentration.Color_Chip_Catalog INNER JOIN
                         dbo.tblJacketMaterials ON dbo.tblColor_Jacket_Catalog.Color_Chip_Catalog = dbo.tblJacketMaterials.Color_Chip_Catalog INNER JOIN
                         dbo.tblColor_Chips ON dbo.tblColor_Chip_Concentration.ColorChip = dbo.tblColor_Chips.ColorChip



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
         Begin Table = "tblColor_Jacket_Catalog"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 268
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblColor_Chip_Concentration"
            Begin Extent = 
               Top = 28
               Left = 526
               Bottom = 249
               Right = 755
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblJacketMaterials"
            Begin Extent = 
               Top = 6
               Left = 270
               Bottom = 269
               Right = 464
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblColor_Chips"
            Begin Extent = 
               Top = 113
               Left = 935
               Bottom = 324
               Right = 1143
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
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 4065
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
', 'SCHEMA', N'dbo', 'VIEW', N'vColor_Chip_Jacket_Material', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'vColor_Chip_Jacket_Material', NULL, NULL
GO
