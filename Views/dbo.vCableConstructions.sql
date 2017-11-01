SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vCableConstructions]
AS
SELECT        dbo.tblCableConstructionReferences.Base, dbo.tblCableConstructionReferences.DesignCode, dbo.tblCableConstructionReferences.DesignExtension, 
                         dbo.tblCableConstructionReferences.ConstructionDescription, dbo.tblCableConstructionReferences.BaseID, dbo.tblCableConstructionReferences.Active, 
                         dbo.tblCableConstructionReferences.NumSubFillers, dbo.tblCableConstructionReferences.PrefixID, dbo.tblCableConstructionReferences.ProductID, 
                         dbo.tblCableConstructionReferences.SetupID, dbo.tblCableConstructionReferences.FibersPerBundle, dbo.tblCableConstructionReferences.UnitIDTypeNumber, 
                         dbo.tblCableConstructionReferences.FamilyID, dbo.tblCableConstructionReferences.InactiveReason, dbo.tblCableConstructionReferences.NumSubPositions, 
                         dbo.tblCableConstructionReferences.TBType, dbo.tblCableConstructionReferences.CableFamily, dbo.tblCableConstructionReferences.CableLevel1, 
                         dbo.tblCableConstructionReferences.DesignTypeID, dbo.tblCableConstructionReferences.NumCopperUnits, dbo.tblCableConstructionReferences.ReleasedDesign, 
                         dbo.tblCableConstructionReferences.ApprovedForQuoting, dbo.tblCableConstructionReferences.FiberCount, dbo.tblCableConstructionReferences.CableType, 
                         dbo.tblCableConstructionReferences.LeadTime_ID, dbo.tblCableConstructions.CablePasses, dbo.tblCableConstructions.StandardOperation, 
                         dbo.tblCableConstructions.JacketMaterial, dbo.tblCableConstructions.NominalOD, dbo.tblCableConstructions.ODTolMinus, dbo.tblCableConstructions.ODTolPlus, 
                         dbo.tblCableConstructions.Height, dbo.tblCableConstructions.HeightTolPlus, dbo.tblCableConstructions.HeightTolMinus, dbo.tblCableConstructions.NominalWall, 
                         dbo.tblCableConstructions.MaxAveWall, dbo.tblCableConstructions.MinAveWall, dbo.tblCableConstructions.MinSpotWall, dbo.tblCableConstructions.AramidType1, 
                         dbo.tblCableConstructions.AramidEnds1, dbo.tblCableConstructions.AramidType2, dbo.tblCableConstructions.AramidEnds2, 
                         dbo.tblCableConstructions.ColorChipPercentage, dbo.tblCableConstructions.ChipType, dbo.tblCableConstructions.Ripcord, dbo.tblCableConstructions.RipcordQty, 
                         dbo.tblCableConstructions.LayLength, dbo.tblCableConstructions.FRP_Dia, dbo.tblCableConstructions.Talc, dbo.tblCableConstructions.CM, 
                         dbo.tblCableConstructions.CMMaterial, dbo.tblCableConstructions.CM_OD, dbo.tblCableConstructions.CMODTolPlus, dbo.tblCableConstructions.CMODTolMinus, 
                         dbo.tblCableConstructions.CMWall, dbo.tblCableConstructions.CMMinWall, dbo.tblCableConstructions.HelixFactor, dbo.tblCableConstructions.CoreWrap, 
                         dbo.tblCableConstructions.CoreDia, dbo.tblCableConstructions.Binder1, dbo.tblCableConstructions.QtyBinder1, dbo.tblCableConstructions.Binder1LayLength, 
                         dbo.tblCableConstructions.Binder2, dbo.tblCableConstructions.QtyBinder2, dbo.tblCableConstructions.Binder2LayLength, dbo.tblCableConstructions.Binder3, 
                         dbo.tblCableConstructions.QtyBinder3, dbo.tblCableConstructions.Binder3LayLength, dbo.tblCableConstructions.Instructions, 
                         dbo.tblCableConstructions.Instructions2, dbo.tblCableConstructions.Additive, dbo.tblCableConstructions.AdditivePercentage, dbo.tblCableConstructions.FirstRun, 
                         dbo.tblCableConstructions.EngineeringAssist, dbo.tblCableConstructions.AramidEnds3, dbo.tblCableConstructions.TemperatureApplication, 
                         dbo.tblCableConstructions.AramidType3, dbo.tblCableConstructions.TensileApplication, dbo.tblCableConstructions.StandardsApplication
FROM            dbo.tblCableConstructionReferences INNER JOIN
                         dbo.tblCableConstructions ON dbo.tblCableConstructionReferences.BaseID = dbo.tblCableConstructions.BaseID



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
               Top = 29
               Left = 608
               Bottom = 264
               Right = 1061
            End
            DisplayFlags = 280
            TopColumn = 21
         End
         Begin Table = "tblCableConstructions"
            Begin Extent = 
               Top = 86
               Left = 143
               Bottom = 329
               Right = 464
            End
            DisplayFlags = 280
            TopColumn = 53
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
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'vCableConstructions', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'vCableConstructions', NULL, NULL
GO
