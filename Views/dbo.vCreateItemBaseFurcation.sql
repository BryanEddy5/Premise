SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [dbo].[vCreateItemBaseFurcation]
AS
SELECT        dbo.tblCableConstructionReferences.Base, dbo.tblCableConstructionReferences.ConstructionDescription, dbo.tblCableConstructions.NominalOD AS OD, 
                         dbo.tblCableConstructionReferences.NumSubPositions AS NumPositions, dbo.tblCableConstructionReferences.NumSubFillers AS NumFillers, 
                         dbo.tblCableConstructions.JacketMaterial, COUNT(dbo.CableUnion.Base) AS CountOfBase, dbo.tblCableConstructionReferences.Active, 
                         dbo.tblCableConstructionReferences.DesignCode, dbo.tblCableConstructions.CablePasses AS Location, dbo.tblCableConstructionReferences.ReleasedDesign, 
                         dbo.tblCableTBType.TBLetter, dbo.tblCableConstructionReferences.TBType, dbo.tblCableConstructionReferences.BaseID, 
                         dbo.tblDesignCodeFurcationTube.FurcationLetter, dbo.tblDesignCodeFurcationTube.Furcation, dbo.tblCableTightBufferReference.TBTypeID, 
                         dbo.tblCableTightBufferReference.TightBuffered
FROM            dbo.tblCableConstructions INNER JOIN
                         dbo.tblCableConstructionReferences INNER JOIN
                         dbo.CableRunSpeeds ON dbo.tblCableConstructionReferences.PrefixID = dbo.CableRunSpeeds.PrefixID ON 
                         dbo.tblCableConstructions.BaseID = dbo.tblCableConstructionReferences.BaseID LEFT OUTER JOIN
                         dbo.CableUnion ON dbo.tblCableConstructionReferences.Base = dbo.CableUnion.Base INNER JOIN
                         dbo.tblCableTightBufferReference ON dbo.tblCableConstructionReferences.TBType = dbo.tblCableTightBufferReference.TBType INNER JOIN
                         dbo.tblCableTBType ON dbo.tblCableTightBufferReference.TBtypeID = dbo.tblCableTBType.TBIndicatorID INNER JOIN
                         dbo.tblFurcationTubeReference ON dbo.tblFurcationTubeReference.BaseID = dbo.tblCableConstructionReferences.BaseID INNER JOIN
                         dbo.tblDesignCodeFurcationTube ON dbo.tblDesignCodeFurcationTube.Furcation = dbo.tblFurcationTubeReference.Furcation
GROUP BY dbo.tblCableConstructionReferences.Base, dbo.tblCableConstructionReferences.ConstructionDescription, dbo.tblCableConstructions.NominalOD, 
                         dbo.tblCableConstructionReferences.NumSubPositions, dbo.tblCableConstructionReferences.NumSubFillers, dbo.tblCableConstructions.JacketMaterial, 
                         dbo.tblCableConstructionReferences.Active, dbo.tblCableConstructionReferences.DesignCode, dbo.tblCableConstructions.CablePasses, 
                         dbo.tblCableConstructionReferences.ReleasedDesign, dbo.tblCableTBType.TBLetter, dbo.tblCableConstructionReferences.TBType, 
                         dbo.tblCableConstructionReferences.BaseID, dbo.tblDesignCodeFurcationTube.FurcationLetter, dbo.tblDesignCodeFurcationTube.Furcation, 
                         dbo.tblCableTightBufferReference.TBTypeID, dbo.tblCableTightBufferReference.TightBuffered




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
         Top = -192
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblCableConstructions"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCableConstructionReferences"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 267
               Right = 272
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Buff#1/#2 Alloc Table"
            Begin Extent = 
               Top = 486
               Left = 38
               Bottom = 615
               Right = 270
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CableUnion"
            Begin Extent = 
               Top = 372
               Left = 38
               Bottom = 561
               Right = 276
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCableTightBufferReference"
            Begin Extent = 
               Top = 312
               Left = 448
               Bottom = 441
               Right = 748
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "tblCableTBType"
            Begin Extent = 
               Top = 666
               Left = 38
               Bottom = 795
               Right = 234
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "tblFurcationTubeReference"
            Begin Extent = 
               Top = 582
               Left = 703
  ', 'SCHEMA', N'dbo', 'VIEW', N'vCreateItemBaseFurcation', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'             Bottom = 770
               Right = 889
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblDesignCodeFurcationTube"
            Begin Extent = 
               Top = 628
               Left = 414
               Bottom = 757
               Right = 600
            End
            DisplayFlags = 280
            TopColumn = 3
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
      Begin ColumnWidths = 12
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
', 'SCHEMA', N'dbo', 'VIEW', N'vCreateItemBaseFurcation', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'vCreateItemBaseFurcation', NULL, NULL
GO
