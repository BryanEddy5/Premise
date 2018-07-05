SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [Setup].[TightBufferSetupRecipe]
AS
SELECT        BasicProductConstruction.[New Oracle Part #], BasicProductConstruction.[Item No], BasicProductConstruction.[Fiber Type], BasicProductConstruction.[Jacket Material], BasicProductConstruction.[EZ Strip] AS EZStrip, 
                         BasicProductConstruction.[TB Material], BasicProductConstruction.[TB Chips Type], BasicProductConstruction.[TB Nominal OD], BasicProductConstruction.[TB OD Tol  (+)], BasicProductConstruction.[TB OD Tol  (-)], 
                         BasicProductConstruction.[1st Req Freq], BasicProductConstruction.[1st Max Atten], BasicProductConstruction.[1st Min BandW], BasicProductConstruction.[2nd Req Freq], BasicProductConstruction.[2nd Max Atten], 
                         BasicProductConstruction.[2nd Min BandW], BasicProductConstruction.[SM 1300 Max Atten], BasicProductConstruction.[SM 1550 Max Atten], BasicProductConstruction.[Special Instr Product1], 
                         BasicProductConstruction.[Jacket Color], RIGHT(BasicProductConstruction.[New Oracle Part #], 2) AS right2, BasicProductConstruction.[Fiber Oracle item], BasicProductConstruction.[Cable Type], 
                         tblCableConstructions.StandardOperation, tblCableConstructions.JacketMaterial, tblCableConstructions.NominalOD, tblCableConstructions.ODTolPlus, tblCableConstructions.ODTolMinus, tblCableConstructions.Height, 
                         tblCableConstructions.HeightTolPlus, tblCableConstructions.HeightTolMinus, tblCableConstructions.NominalWall, tblCableConstructions.MaxAveWall, tblCableConstructions.MinAveWall, tblCableConstructions.MinSpotWall, 
                         tblCableConstructions.AramidType1, tblCableConstructions.AramidEnds1, tblCableConstructions.AramidType2, tblCableConstructions.AramidEnds2, tblCableConstructions.ChipType, tblCableConstructions.Ripcord, 
                         tblCableConstructions.LayLength, tblCableConstructions.Talc, tblCableConstructions.FRP_Dia, tblCableConstructions.CM, tblCableConstructions.CMMaterial, tblCableConstructions.CM_OD, tblCableConstructions.CMODTolPlus, 
                         tblCableConstructions.CMODTolMinus, tblCableConstructions.CMWall, tblCableConstructions.CMMinWall, tblCableConstructions.HelixFactor, tblCableConstructions.CoreWrap, tblCableConstructions.CoreDia, 
                         tblCableConstructions.Binder1, tblCableConstructions.QtyBinder1, tblCableConstructions.Binder1LayLength, tblCableConstructions.Binder2, tblCableConstructions.QtyBinder2, tblCableConstructions.Binder2LayLength, 
                         tblCableConstructions.Binder3, tblCableConstructions.QtyBinder3, tblCableConstructions.Binder3LayLength, tblCableConstructions.CablePasses, tblCableConstructions.RevisionDate, tblCableConstructions.RevisionNumber, 
                         tblCableConstructions.RevisionHistory, tblCableConstructions.Instructions2, tblCableConstructions.Instructions, tblCableConstructionReferences.Active, tblTightBufferSetup.PSS, tblTightBufferSetup.Recipe, 
                         vColor_Chip_Jacket_Material.ColorChip, tblTightBufferStripType.ID, tblTightBufferSetup.MachineGroupID, K.MachineName, BasicProductConstruction.Base, Filler, TBType
FROM            tblCableConstructions INNER JOIN
                         dbo.BasicProductConstruction INNER JOIN
                         tblCableConstructionReferences ON BasicProductConstruction.Base = tblCableConstructionReferences.Base ON tblCableConstructions.BaseID = tblCableConstructionReferences.BaseID INNER JOIN
                         tblTightBufferSetup INNER JOIN
                         tblTightBufferStripType ON tblTightBufferSetup.TightBufferStrip = tblTightBufferStripType.TightBufferStrip ON tblCableConstructions.NominalOD = tblTightBufferSetup.ZumbachLibrarySetting AND 
                         tblCableConstructions.JacketMaterial = tblTightBufferSetup.Compound AND BasicProductConstruction.[EZ Strip] = tblTightBufferStripType.TightBufferStrip INNER JOIN
                         [Product Desrcriptions] ON [Product Desrcriptions].SubFiller = tblTightBufferSetup.Filler AND tblCableConstructionReferences.SetupID = [Product Desrcriptions].ProductID INNER JOIN
                         vColor_Chip_Jacket_Material ON BasicProductConstruction.[Jacket Color] = vColor_Chip_Jacket_Material.Color AND tblCableConstructions.JacketMaterial = vColor_Chip_Jacket_Material.JacketMaterial INNER JOIN
                         tblTightBufferMachines AS K ON K.MachineGroupID = tblTightBufferSetup.MachineGroupID
WHERE        (tblCableConstructionReferences.Active <> 0)
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
         Begin Table = "tblCableConstructions"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 284
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Basic Product Construction"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 267
               Right = 280
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCableConstructionReferences"
            Begin Extent = 
               Top = 18
               Left = 415
               Bottom = 262
               Right = 670
            End
            DisplayFlags = 280
            TopColumn = 8
         End
         Begin Table = "tblTightBufferSetup"
            Begin Extent = 
               Top = 294
               Left = 857
               Bottom = 594
               Right = 1086
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblTightBufferStripType"
            Begin Extent = 
               Top = 349
               Left = 84
               Bottom = 478
               Right = 273
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Product Desrcriptions"
            Begin Extent = 
               Top = 14
               Left = 800
               Bottom = 259
               Right = 1050
            End
            DisplayFlags = 280
            TopColumn = 15
         End
         Begin Table = "vColor_Chip_Jacket_Material"
            Begin Extent = 
               Top = 667
           ', 'SCHEMA', N'Setup', 'VIEW', N'TightBufferSetupRecipe', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'    Left = 638
               Bottom = 796
               Right = 883
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "K"
            Begin Extent = 
               Top = 348
               Left = 767
               Bottom = 477
               Right = 962
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
', 'SCHEMA', N'Setup', 'VIEW', N'TightBufferSetupRecipe', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'Setup', 'VIEW', N'TightBufferSetupRecipe', NULL, NULL
GO
