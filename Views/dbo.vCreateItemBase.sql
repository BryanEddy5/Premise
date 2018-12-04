SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vCreateItemBase]
AS
SELECT       DISTINCT dbo.tblCableConstructionReferences.Base, dbo.tblCableConstructionReferences.ConstructionDescription, dbo.tblCableConstructions.NominalOD AS OD, 
                         dbo.tblCableConstructionReferences.NumSubPositions AS NumPositions, dbo.tblCableConstructionReferences.NumSubFillers AS NumFillers, 
                         dbo.tblCableConstructions.JacketMaterial, '' AS CountOfBase, dbo.tblCableConstructionReferences.Active, 
                         dbo.tblCableConstructionReferences.DesignCode, dbo.tblCableConstructions.CablePasses AS Location, dbo.tblCableConstructionReferences.ReleasedDesign, 
                         dbo.tblCableTBType.TBLetter, dbo.tblCableConstructionReferences.TBType, dbo.tblCableConstructionReferences.BaseID, dbo.tblCableConstructions.Additive, 
                         dbo.tblCableTightBufferReference.TBTypeID, dbo.tblCableConstructionReferences.FibersPerBundle, dbo.tblCableTightBufferReference.TightBuffered, 
                         dbo.tblCableConstructionReferences.ProductID, dbo.tblCableConstructionReferences.DesignTypeID, dbo.tblCableConstructionReferences.CableFamily
						 ,FiberCount, dbo.tblCableConstructionReferences.SetupID, StandardOperation, DesignExtension, EngineeringAssist, EngineeringAssistReason
FROM            dbo.tblCableConstructions INNER JOIN
                         dbo.tblCableConstructionReferences INNER JOIN
                         dbo.CableRunSpeeds ON dbo.tblCableConstructionReferences.PrefixID = dbo.CableRunSpeeds.PrefixID ON 
                         dbo.tblCableConstructions.BaseID = dbo.tblCableConstructionReferences.BaseID LEFT OUTER JOIN
                         dbo.CableUnion ON dbo.tblCableConstructionReferences.Base = dbo.CableUnion.Base INNER JOIN
                         dbo.tblCableTightBufferReference ON dbo.tblCableConstructionReferences.TBType = dbo.tblCableTightBufferReference.TBType INNER JOIN
                         dbo.tblCableTBType ON dbo.tblCableTightBufferReference.TBTypeID = dbo.tblCableTBType.TBIndicatorID
WHERE        (dbo.tblCableConstructionReferences.Active <> 0)





GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[49] 4[13] 2[15] 3) )"
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
               Top = 11
               Left = 318
               Bottom = 314
               Right = 552
            End
            DisplayFlags = 280
            TopColumn = 11
         End
         Begin Table = "Buff#1/#2 Alloc Table"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 267
               Right = 270
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CableUnion"
            Begin Extent = 
               Top = 534
               Left = 38
               Bottom = 663
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCableTightBufferReference"
            Begin Extent = 
               Top = 395
               Left = 633
               Bottom = 579
               Right = 922
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCableTBType"
            Begin Extent = 
               Top = 433
               Left = 348
               Bottom = 668
               Right = 545
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWi', 'SCHEMA', N'dbo', 'VIEW', N'vCreateItemBase', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'dths = 21
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
', 'SCHEMA', N'dbo', 'VIEW', N'vCreateItemBase', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'vCreateItemBase', NULL, NULL
GO
