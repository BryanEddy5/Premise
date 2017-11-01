SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [Setup].[TightBufferSetupRecipe]
AS
SELECT        dbo.[Basic Product Construction].[New Oracle Part #], dbo.[Basic Product Construction].[Item No], dbo.[Basic Product Construction].[Fiber Type], 
                         dbo.[Basic Product Construction].[Jacket Material], dbo.[Basic Product Construction].[EZ Strip] AS EZStrip, dbo.[Basic Product Construction].[TB Material], 
                         dbo.[Basic Product Construction].[TB Chips Type], dbo.[Basic Product Construction].[TB Nominal OD], dbo.[Basic Product Construction].[TB OD Tol  (+)], 
                         dbo.[Basic Product Construction].[TB OD Tol  (-)], dbo.[Basic Product Construction].[1st Req Freq], dbo.[Basic Product Construction].[1st Max Atten], 
                         dbo.[Basic Product Construction].[1st Min BandW], dbo.[Basic Product Construction].[2nd Req Freq], dbo.[Basic Product Construction].[2nd Max Atten], 
                         dbo.[Basic Product Construction].[2nd Min BandW], dbo.[Basic Product Construction].[SM 1300 Max Atten], dbo.[Basic Product Construction].[SM 1550 Max Atten], 
                         dbo.[Basic Product Construction].[Special Instr Product1], dbo.[Basic Product Construction].[Jacket Color], RIGHT(dbo.[Basic Product Construction].[New Oracle Part #],
                          2) AS right2, dbo.[Basic Product Construction].[Fiber Oracle item], dbo.[Basic Product Construction].[Cable Type], dbo.tblCableConstructions.StandardOperation, 
                         dbo.tblCableConstructions.JacketMaterial, dbo.tblCableConstructions.NominalOD, dbo.tblCableConstructions.ODTolPlus, dbo.tblCableConstructions.ODTolMinus, 
                         dbo.tblCableConstructions.Height, dbo.tblCableConstructions.HeightTolPlus, dbo.tblCableConstructions.HeightTolMinus, dbo.tblCableConstructions.NominalWall, 
                         dbo.tblCableConstructions.MaxAveWall, dbo.tblCableConstructions.MinAveWall, dbo.tblCableConstructions.MinSpotWall, dbo.tblCableConstructions.AramidType1, 
                         dbo.tblCableConstructions.AramidEnds1, dbo.tblCableConstructions.AramidType2, dbo.tblCableConstructions.AramidEnds2, dbo.tblCableConstructions.ChipType, 
                         dbo.tblCableConstructions.Ripcord, dbo.tblCableConstructions.LayLength, dbo.tblCableConstructions.Talc, dbo.tblCableConstructions.FRP_Dia, 
                         dbo.tblCableConstructions.CM, dbo.tblCableConstructions.CMMaterial, dbo.tblCableConstructions.CM_OD, dbo.tblCableConstructions.CMODTolPlus, 
                         dbo.tblCableConstructions.CMODTolMinus, dbo.tblCableConstructions.CMWall, dbo.tblCableConstructions.CMMinWall, dbo.tblCableConstructions.HelixFactor, 
                         dbo.tblCableConstructions.CoreWrap, dbo.tblCableConstructions.CoreDia, dbo.tblCableConstructions.Binder1, dbo.tblCableConstructions.QtyBinder1, 
                         dbo.tblCableConstructions.Binder1LayLength, dbo.tblCableConstructions.Binder2, dbo.tblCableConstructions.QtyBinder2, 
                         dbo.tblCableConstructions.Binder2LayLength, dbo.tblCableConstructions.Binder3, dbo.tblCableConstructions.QtyBinder3, 
                         dbo.tblCableConstructions.Binder3LayLength, dbo.tblCableConstructions.CablePasses, dbo.tblCableConstructions.RevisionDate, 
                         dbo.tblCableConstructions.RevisionNumber, dbo.tblCableConstructions.RevisionHistory, dbo.tblCableConstructions.Instructions2, 
                         dbo.tblCableConstructions.Instructions, dbo.tblCableConstructionReferences.Active, dbo.tblTightBufferSetup.PSS, dbo.tblTightBufferSetup.Recipe, 
                         dbo.vColor_Chip_Jacket_Material.ColorChip, dbo.tblTightBufferStripType.ID, dbo.tblTightBufferSetup.MachineGroupID, K.MachineName
FROM            dbo.tblCableConstructions INNER JOIN
                         dbo.[Basic Product Construction] INNER JOIN
                         dbo.tblCableConstructionReferences ON dbo.[Basic Product Construction].Base = dbo.tblCableConstructionReferences.Base ON 
                         dbo.tblCableConstructions.BaseID = dbo.tblCableConstructionReferences.BaseID INNER JOIN
                         dbo.tblTightBufferSetup INNER JOIN
                         dbo.tblTightBufferStripType ON dbo.tblTightBufferSetup.TightBufferStrip = dbo.tblTightBufferStripType.TightBufferStrip ON 
                         dbo.tblCableConstructions.NominalOD = dbo.tblTightBufferSetup.ZumbachLibrarySetting AND 
                         dbo.tblCableConstructions.JacketMaterial = dbo.tblTightBufferSetup.Compound AND 
                         dbo.[Basic Product Construction].[EZ Strip] = dbo.tblTightBufferStripType.TightBufferStrip INNER JOIN
                         dbo.[Product Desrcriptions] ON dbo.[Product Desrcriptions].SubFiller = dbo.tblTightBufferSetup.Filler AND 
                         dbo.tblCableConstructionReferences.SetupID = dbo.[Product Desrcriptions].ProductID INNER JOIN
                         dbo.vColor_Chip_Jacket_Material ON dbo.[Basic Product Construction].[Jacket Color] = dbo.vColor_Chip_Jacket_Material.Color AND 
                         dbo.tblCableConstructions.JacketMaterial = dbo.vColor_Chip_Jacket_Material.JacketMaterial INNER JOIN
                         dbo.tblTightBufferMachines AS K ON K.MachineGroupID = dbo.tblTightBufferSetup.MachineGroupID
GROUP BY dbo.[Basic Product Construction].[New Oracle Part #], dbo.[Basic Product Construction].[Item No], dbo.[Basic Product Construction].[Fiber Type], 
                         dbo.[Basic Product Construction].[Jacket Material], dbo.[Basic Product Construction].[EZ Strip], dbo.[Basic Product Construction].[TB Material], 
                         dbo.[Basic Product Construction].[TB Chips Type], dbo.[Basic Product Construction].[TB Nominal OD], dbo.[Basic Product Construction].[TB OD Tol  (+)], 
                         dbo.[Basic Product Construction].[TB OD Tol  (-)], dbo.[Basic Product Construction].Talc, dbo.[Basic Product Construction].[1st Req Freq], 
                         dbo.[Basic Product Construction].[1st Max Atten], dbo.[Basic Product Construction].[1st Min BandW], dbo.[Basic Product Construction].[2nd Req Freq], 
                         dbo.[Basic Product Construction].[2nd Max Atten], dbo.[Basic Product Construction].[2nd Min BandW], dbo.[Basic Product Construction].[SM 1300 Max Atten], 
                         dbo.[Basic Product Construction].[SM 1550 Max Atten], dbo.[Basic Product Construction].[Special Instr Product1], dbo.[Basic Product Construction].[Jacket Color], 
                         RIGHT(dbo.[Basic Product Construction].[New Oracle Part #], 2), dbo.[Basic Product Construction].[Fiber Oracle item], dbo.[Basic Product Construction].[Cable Type], 
                         dbo.tblCableConstructions.StandardOperation, dbo.tblCableConstructions.JacketMaterial, dbo.tblCableConstructions.NominalOD, 
                         dbo.tblCableConstructions.ODTolPlus, dbo.tblCableConstructions.ODTolMinus, dbo.tblCableConstructions.Height, dbo.tblCableConstructions.HeightTolPlus, 
                         dbo.tblCableConstructions.HeightTolMinus, dbo.tblCableConstructions.NominalWall, dbo.tblCableConstructions.MaxAveWall, dbo.tblCableConstructions.MinAveWall, 
                         dbo.tblCableConstructions.MinSpotWall, dbo.tblCableConstructions.AramidType1, dbo.tblCableConstructions.AramidEnds1, dbo.tblCableConstructions.AramidType2, 
                         dbo.tblCableConstructions.AramidEnds2, dbo.tblCableConstructions.ChipType, dbo.tblCableConstructions.Ripcord, dbo.tblCableConstructions.LayLength, 
                         dbo.tblCableConstructions.Talc, dbo.tblCableConstructions.FRP_Dia, dbo.tblCableConstructions.CM, dbo.tblCableConstructions.CMMaterial, 
                         dbo.tblCableConstructions.CM_OD, dbo.tblCableConstructions.CMODTolPlus, dbo.tblCableConstructions.CMODTolMinus, dbo.tblCableConstructions.CMWall, 
                         dbo.tblCableConstructions.CMMinWall, dbo.tblCableConstructions.HelixFactor, dbo.tblCableConstructions.CoreWrap, dbo.tblCableConstructions.CoreDia, 
                         dbo.tblCableConstructions.Binder1, dbo.tblCableConstructions.QtyBinder1, dbo.tblCableConstructions.Binder1LayLength, dbo.tblCableConstructions.Binder2, 
                         dbo.tblCableConstructions.QtyBinder2, dbo.tblCableConstructions.Binder2LayLength, dbo.tblCableConstructions.Binder3, dbo.tblCableConstructions.QtyBinder3, 
                         dbo.tblCableConstructions.Binder3LayLength, dbo.tblCableConstructions.CablePasses, dbo.tblCableConstructions.RevisionDate, 
                         dbo.tblCableConstructions.RevisionNumber, dbo.tblCableConstructions.RevisionHistory, dbo.tblCableConstructions.Instructions, 
                         dbo.tblCableConstructions.Instructions2, dbo.tblCableConstructionReferences.Active, dbo.tblTightBufferSetup.PSS, dbo.tblTightBufferSetup.Recipe, 
                         dbo.vColor_Chip_Jacket_Material.ColorChip, dbo.tblTightBufferStripType.ID, dbo.[Basic Product Construction].[1st Max Atten], 
                         dbo.[Basic Product Construction].[PSS Document #], dbo.tblCableConstructions.Instructions, dbo.tblCableConstructions.Instructions2, 
                         dbo.tblTightBufferSetup.MachineGroupID, K.MachineName
HAVING        (dbo.tblCableConstructionReferences.Active <> 0)
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
