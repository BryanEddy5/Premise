SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[vSchedulingConstructionData]
AS
SELECT        dbo.tblCableConstructions.CM AS CenterMember, dbo.tblCableConstructions.JacketMaterial AS [Jacket Material], dbo.vSchedulingCableUnion.[item no], 
                         dbo.vSchedulingCableUnion.[customer part#], dbo.vSchedulingCableUnion.customer, dbo.vSchedulingCableUnion.[print type (base)], 
                         dbo.vSchedulingCableUnion.[new oracle part #], dbo.vSchedulingCableUnion.base, dbo.vSchedulingCableUnion.[jacket color], 
                         dbo.vSchedulingCableUnion.[print line 1], dbo.vSchedulingCableUnion.[print line 2], dbo.vSchedulingCableUnion.[print line 3], 
                         dbo.vSchedulingCableUnion.[print line 4], dbo.vSchedulingCableUnion.[print reel no], dbo.vSchedulingCableUnion.[print item no], 
                         dbo.vSchedulingCableUnion.[print spacing], dbo.vSchedulingCableUnion.[1st req freq], dbo.vSchedulingCableUnion.[2nd req freq], 
                         dbo.vSchedulingCableUnion.[Fiber Type], dbo.vSchedulingCableUnion.[Base Oracle], dbo.vSchedulingCableUnion.active, 
                         dbo.vSchedulingCableUnion.[revision date], dbo.vSchedulingCableUnion.[revision history], dbo.vSchedulingCableUnion.Fiber2, dbo.vSchedulingCableUnion.PID, 
                         dbo.vSchedulingCableUnion.oraclestatus, dbo.vSchedulingCableUnion.enumber, dbo.vSchedulingCableUnion.Fiber3, dbo.vSchedulingCableUnion.customerrev, 
                         dbo.vSchedulingCableUnion.Location, dbo.vSchedulingCableUnion.StdOp, dbo.vSchedulingCableUnion.Fiber, dbo.vSchedulingCableUnion.[1st Req Freq - A], 
                         dbo.vSchedulingCableUnion.[1st Max Atten - A], dbo.vSchedulingCableUnion.[1st Min BandW - A], dbo.vSchedulingCableUnion.[2nd Req Freq - A], 
                         dbo.vSchedulingCableUnion.[2nd Max Atten - A], dbo.vSchedulingCableUnion.[2nd Min BandW - A], dbo.vSchedulingCableUnion.[1st Req Freq - B], 
                         dbo.vSchedulingCableUnion.[1st Max Atten - B], dbo.vSchedulingCableUnion.[1st Min BandW - B], dbo.vSchedulingCableUnion.[2nd Req Freq - B], 
                         dbo.vSchedulingCableUnion.[2nd Max Atten - B], dbo.vSchedulingCableUnion.[2nd Min BandW - B], dbo.vSchedulingCableUnion.[1st Req Freq - C], 
                         dbo.vSchedulingCableUnion.[1st Max Atten - C], dbo.vSchedulingCableUnion.[1st Min BandW - C], dbo.vSchedulingCableUnion.[2nd Req Freq - C], 
                         dbo.vSchedulingCableUnion.[2nd Max Atten - C], dbo.vSchedulingCableUnion.[2nd Min BandW - C], dbo.vSchedulingCableUnion.[Print Height], 
                         dbo.vSchedulingCableUnion.[FRP Dia], dbo.vSchedulingCableUnion.CustomerInstructions, dbo.vSchedulingCableUnion.[tb nominal od], 
                         dbo.vSchedulingCableUnion.[tb od tol  (-)], dbo.vSchedulingCableUnion.[tb od tol  (+)], dbo.vSchedulingCableUnion.[ez strip], 
                         dbo.vSchedulingCableUnion.[tb material], dbo.vSchedulingCableUnion.[tb chips type], dbo.vSchedulingCableUnion.[unit series], 
                         dbo.vSchedulingCableUnion.SpecialInstructions1, dbo.vSchedulingCableUnion.SpecialInstructions2, dbo.tblCableConstructions.JacketMaterial AS JacketMat, 
                         dbo.tblCableConstructionReferences.DesignCode, dbo.tblCableConstructionReferences.DesignExtension, 
                         dbo.tblCableConstructionReferences.ConstructionDescription, dbo.tblCableConstructionReferences.NumSubFillers, 
                         dbo.tblCableConstructionReferences.Active AS ActiveConstruction, dbo.tblCableConstructionReferences.PrefixID, dbo.tblCableConstructionReferences.ProductID, 
                         dbo.tblCableConstructionReferences.SetupID, dbo.tblCableConstructionReferences.FamilyID, dbo.tblCableConstructionReferences.FibersPerBundle, 
                         dbo.tblCableConstructionReferences.UnitIDTypeNumber, dbo.tblCableConstructionReferences.InactiveReason, 
                         dbo.tblCableConstructionReferences.NumSubPositions, dbo.tblCableConstructionReferences.TBType, dbo.tblCableConstructionReferences.CableFamily, 
                         dbo.tblCableConstructionReferences.CableLevel1, dbo.tblCableConstructionReferences.DesignTypeID, dbo.tblCableConstructionReferences.NumCopperUnits, 
                         dbo.tblCableConstructionReferences.ReleasedDesign, dbo.tblCableConstructions.TemperatureApplication, dbo.tblCableConstructions.TensileApplication, 
                         dbo.tblCableConstructions.CablePasses, dbo.tblCableConstructions.StandardOperation, dbo.tblCableConstructions.JacketMaterial, 
                         dbo.tblCableConstructions.NominalOD, dbo.tblCableConstructions.ODTolPlus, dbo.tblCableConstructions.ODTolMinus, dbo.tblCableConstructions.Height, 
                         dbo.tblCableConstructions.HeightTolPlus, dbo.tblCableConstructions.HeightTolMinus, dbo.tblCableConstructions.NominalWall, 
                         dbo.tblCableConstructions.MaxAveWall, dbo.tblCableConstructions.MinAveWall, dbo.tblCableConstructions.MinSpotWall, dbo.tblCableConstructions.AramidType1, 
                         dbo.tblCableConstructions.AramidEnds1, dbo.tblCableConstructions.AramidType2, dbo.tblCableConstructions.AramidEnds2, dbo.tblCableConstructions.Ripcord, 
                         dbo.tblCableConstructions.RipcordQty, dbo.tblCableConstructions.LayLength, dbo.tblCableConstructions.Talc, dbo.tblCableConstructions.FRP_Dia, 
                         dbo.tblCableConstructions.CM, dbo.tblCableConstructions.CMMaterial, dbo.tblCableConstructions.CM_OD, dbo.tblCableConstructions.CMODTolPlus, 
                         dbo.tblCableConstructions.CMODTolMinus, dbo.tblCableConstructions.CMWall, dbo.tblCableConstructions.CMMinWall, dbo.tblCableConstructions.HelixFactor, 
                         dbo.tblCableConstructions.CoreWrap, dbo.tblCableConstructions.CoreDia, dbo.tblCableConstructions.Binder1, dbo.tblCableConstructions.QtyBinder1, 
                         dbo.tblCableConstructions.Binder1LayLength, dbo.tblCableConstructions.Binder2, dbo.tblCableConstructions.QtyBinder2, 
                         dbo.tblCableConstructions.Binder2LayLength, dbo.tblCableConstructions.Binder3, dbo.tblCableConstructions.QtyBinder3, 
                         dbo.tblCableConstructions.Binder3LayLength, dbo.tblCableConstructions.RevisionNumber, dbo.tblCableConstructions.RevisionHistory, 
                         dbo.tblCableConstructions.Instructions, dbo.tblCableConstructions.Instructions2, dbo.tblCableConstructions.Additive, dbo.tblCableConstructions.AdditivePercentage, 
                         dbo.tblCableConstructions.FirstRun, dbo.tblCableConstructions.EngineeringAssist, dbo.tblCableConstructions.AramidType3, dbo.tblCableConstructions.AramidEnds3, 
                         dbo.vColor_Chip_Jacket_Material.Color_Chip_Concentration AS ColorChipPercentage, dbo.vColor_Chip_Jacket_Material.ColorChip AS [Color Chip ID], 
                         dbo.vColor_Chip_Jacket_Material.ColorChipType AS ChipType,
						 dbo.customers.CustomerSpecialNotes
FROM            dbo.vSchedulingCableUnion INNER JOIN
                         dbo.tblCableConstructionReferences ON dbo.vSchedulingCableUnion.base = dbo.tblCableConstructionReferences.Base INNER JOIN
                         dbo.tblCableConstructions ON dbo.tblCableConstructionReferences.BaseID = dbo.tblCableConstructions.BaseID INNER JOIN
                         dbo.vColor_Chip_Jacket_Material ON dbo.tblCableConstructions.JacketMaterial = dbo.vColor_Chip_Jacket_Material.JacketMaterial AND 
                         dbo.vSchedulingCableUnion.[jacket color] = dbo.vColor_Chip_Jacket_Material.Color
						 INNER JOIN dbo.Customers  ON Customers.Customer = dbo.vSchedulingCableUnion.customer




GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[20] 2[22] 3) )"
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
         Begin Table = "vSchedulingCableUnion"
            Begin Extent = 
               Top = 35
               Left = 54
               Bottom = 336
               Right = 283
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "tblCableConstructionReferences"
            Begin Extent = 
               Top = 0
               Left = 385
               Bottom = 129
               Right = 603
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCableConstructions"
            Begin Extent = 
               Top = 24
               Left = 824
               Bottom = 281
               Right = 1120
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vColor_Chip_Jacket_Material"
            Begin Extent = 
               Top = 139
               Left = 371
               Bottom = 268
               Right = 600
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
      Begin ColumnWidths = 14
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
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 5040
         Alias = 3720
         Table = 2760
         Output = 720
         Append = 1400
         Ne', 'SCHEMA', N'dbo', 'VIEW', N'vSchedulingConstructionData', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'wValue = 1170
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
', 'SCHEMA', N'dbo', 'VIEW', N'vSchedulingConstructionData', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'vSchedulingConstructionData', NULL, NULL
GO
