SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/*WHERE FamilyID = 25
WHERE tblCableConstructionReferences.base = 'ER012-3.0-SW'*/
CREATE VIEW [dbo].[vConstructionSearch]
AS
SELECT DISTINCT 
                         dbo.tblCableConstructionReferences.Base, dbo.tblCableConstructionReferences.DesignCode, dbo.tblCableConstructionReferences.DesignExtension, 
                         dbo.tblCableConstructionReferences.ConstructionDescription, dbo.tblCableConstructionReferences.BaseID, dbo.tblCableConstructionReferences.NumSubFillers, 
                         dbo.tblCableConstructionReferences.Active, dbo.tblCableConstructionReferences.PrefixID, dbo.tblCableConstructionReferences.ProductID, 
                         dbo.tblCableConstructionReferences.SetupID, dbo.tblCableConstructionReferences.FamilyID, dbo.tblCableConstructionReferences.FibersPerBundle, 
                         dbo.tblCableConstructionReferences.UnitIDTypeNumber, dbo.tblCableConstructions.StandardOperation, dbo.tblCableConstructions.JacketMaterial, 
                         dbo.tblCableConstructions.ODTolPlus, dbo.tblCableConstructions.ODTolMinus, dbo.tblCableConstructions.Height, dbo.tblCableConstructions.HeightTolPlus, 
                         dbo.tblCableConstructions.HeightTolMinus, dbo.tblCableConstructions.NominalWall, dbo.tblCableConstructions.MaxAveWall, dbo.tblCableConstructions.MinAveWall, 
                         dbo.tblCableConstructions.MinSpotWall, dbo.tblCableConstructions.AramidType1, dbo.tblCableConstructions.AramidEnds1, dbo.tblCableConstructions.AramidType2, 
                         dbo.tblCableConstructions.AramidEnds2, dbo.tblCableConstructions.ChipType, dbo.tblCableConstructions.Ripcord, dbo.tblCableConstructions.LayLength, 
                         dbo.tblCableConstructions.Talc, dbo.tblCableConstructions.FRP_Dia, dbo.tblCableConstructions.CM, dbo.tblCableConstructions.CMMaterial, 
                         dbo.tblCableConstructions.CM_OD, dbo.tblCableConstructions.CMODTolPlus, dbo.tblCableConstructions.CMODTolMinus, dbo.tblCableConstructions.CMWall, 
                         dbo.tblCableConstructions.CMMinWall, dbo.tblCableConstructions.HelixFactor, dbo.tblCableConstructions.CoreWrap, dbo.tblCableConstructions.CoreDia, 
                         dbo.tblCableConstructions.Binder1, dbo.tblCableConstructions.QtyBinder1, dbo.tblCableConstructions.Binder1LayLength, dbo.tblCableConstructions.Binder2, 
                         dbo.tblCableConstructions.QtyBinder2, dbo.tblCableConstructions.Binder2LayLength, dbo.tblCableConstructions.Binder3, dbo.tblCableConstructions.QtyBinder3, 
                         dbo.tblCableConstructions.Binder3LayLength, CASE WHEN [CablePasses] IS NULL THEN 0 ELSE CAST(CablePasses AS int) END AS Location, 
                         dbo.tblCableConstructions.RevisionDate, dbo.tblCableConstructions.RevisionNumber, dbo.tblCableConstructions.RevisionHistory, 
                         dbo.tblCableConstructions.Instructions, dbo.tblCableConstructions.Instructions2, dbo.tblCableConstructions.SSMA_TimeStamp, 
                         dbo.tblCableConstructions.DateCreated, dbo.tblCableConstructions.CreatedBy, dbo.tblCableConstructions.RevisedBy, 
                         dbo.tblCableConstructions.ColorChipPercentage, dbo.tblCableConstructionReferences.InactiveReason, CASE WHEN CablePasses = 2 THEN SUBSTRING([Base], 7, 3) 
                         ELSE '' END AS SubOD, dbo.tblCableConstructions.NominalOD, dbo.tblCableConstructionReferences.NumSubPositions, 
                         dbo.tblCableConstructionReferences.ReleasedDesign, dbo.tblCableConstructionReferences.TBType, dbo.tblDesignTypes.SalesForceDescription, 
                         CASE WHEN CablePasses = 1 THEN '' ELSE SUBSTRING(dbo.vSubunitBases.[Level 1 Product], 3, 3) END AS SubFiberCount, 
                         dbo.tblCableConstructionReferences.FiberCount, dbo.tblDesignCodeJacket.JacketDescription_SalesForce, 
                         dbo.tblCableConstructionReferences.ApprovedForQuoting, dbo.tblCableConstructionReferences.SetupID AS ConstructionID
FROM            dbo.tblCableConstructionReferences LEFT OUTER JOIN
                         dbo.tblDesignTypes ON dbo.tblCableConstructionReferences.DesignTypeID = dbo.tblDesignTypes.DesignTypeID LEFT OUTER JOIN
                         dbo.tblDesignCodeJacket ON dbo.tblCableConstructionReferences.CableFamily = dbo.tblDesignCodeJacket.CableLetter AND 
                         dbo.tblCableConstructionReferences.CableLevel1 = dbo.tblDesignCodeJacket.JacketLetter LEFT OUTER JOIN
                         dbo.vSubunitBases ON dbo.tblCableConstructionReferences.SetupID = dbo.vSubunitBases.ProductID LEFT OUTER JOIN
                         dbo.tblCableConstructions ON dbo.tblCableConstructionReferences.BaseID = dbo.tblCableConstructions.BaseID




GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[49] 4[9] 2[7] 3) )"
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
               Top = 48
               Left = 76
               Bottom = 349
               Right = 344
            End
            DisplayFlags = 280
            TopColumn = 17
         End
         Begin Table = "tblDesignTypes"
            Begin Extent = 
               Top = 311
               Left = 440
               Bottom = 440
               Right = 789
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblDesignCodeJacket"
            Begin Extent = 
               Top = 217
               Left = 911
               Bottom = 396
               Right = 1252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vSubunitBases"
            Begin Extent = 
               Top = 64
               Left = 909
               Bottom = 271
               Right = 1127
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCableConstructions"
            Begin Extent = 
               Top = 7
               Left = 432
               Bottom = 252
               Right = 739
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
      Begin ColumnWidths = 74
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
         Width = 15', 'SCHEMA', N'dbo', 'VIEW', N'vConstructionSearch', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'00
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
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 4080
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
', 'SCHEMA', N'dbo', 'VIEW', N'vConstructionSearch', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'vConstructionSearch', NULL, NULL
GO
