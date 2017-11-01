SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vDesignCodeCableRating]
AS
SELECT DISTINCT 
                         dbo.tblDesignCodeJacket.CableLetter, dbo.tblDesignCodeJacket.JacketLetter, dbo.tblDesignCodeJacket.Jacket, dbo.tblDesignTypes.DesignTypeID, 
                         dbo.tblDesignTypeGroups.DesignTypeGroupID, dbo.tblCableConstructionReferences.Active, dbo.tblDesignTypes.SalesForceDescription
FROM            dbo.tblDesignTypeGroups INNER JOIN
                         dbo.tblCableConstructionReferences INNER JOIN
                         dbo.tblCableConstructions ON dbo.tblCableConstructionReferences.BaseID = dbo.tblCableConstructions.BaseID INNER JOIN
                         dbo.tblDesignTypes ON dbo.tblCableConstructionReferences.DesignTypeID = dbo.tblDesignTypes.DesignTypeID ON 
                         dbo.tblDesignTypeGroups.DesignTypeGroupID = dbo.tblDesignTypes.DesignTypeGroupID INNER JOIN
                         dbo.tblDesignCodeJacket ON dbo.tblCableConstructionReferences.CableLevel1 = dbo.tblDesignCodeJacket.JacketLetter AND 
                         dbo.tblCableConstructionReferences.CableFamily = dbo.tblDesignCodeJacket.CableLetter
WHERE        (dbo.tblDesignCodeJacket.Active <> 0) AND (dbo.tblCableConstructionReferences.Active <> 0) AND (dbo.tblCableConstructionReferences.ReleasedDesign <> 0)


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
         Top = -288
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblDesignTypeGroups"
            Begin Extent = 
               Top = 27
               Left = 467
               Bottom = 216
               Right = 786
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCableConstructionReferences"
            Begin Extent = 
               Top = 120
               Left = 38
               Bottom = 249
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCableConstructions"
            Begin Extent = 
               Top = 252
               Left = 38
               Bottom = 381
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblDesignTypes"
            Begin Extent = 
               Top = 366
               Left = 536
               Bottom = 600
               Right = 953
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "tblDesignCodeJacket"
            Begin Extent = 
               Top = 516
               Left = 38
               Bottom = 645
               Right = 279
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
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
        ', 'SCHEMA', N'dbo', 'VIEW', N'vDesignCodeCableRating', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N' Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'vDesignCodeCableRating', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'vDesignCodeCableRating', NULL, NULL
GO
