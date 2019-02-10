SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [Setup].[TightBufferSetupRecipe]
AS
SELECT B.[New Oracle Part #],
       B.[Item No],
       B.[Fiber Type],
       B.[Jacket Material],
       B.[EZ Strip] AS EZStrip,
       B.[TB Material],
       B.[TB Chips Type],
       B.[TB Nominal OD],
       B.[TB OD Tol  (+)],
       B.[TB OD Tol  (-)],
       B.[1st Req Freq],
       B.[1st Max Atten],
       B.[1st Min BandW],
       B.[2nd Req Freq],
       B.[2nd Max Atten],
       B.[2nd Min BandW],
       B.[SM 1300 Max Atten],
       B.[SM 1550 Max Atten],
       B.[Special Instr Product1],
       B.[Jacket Color],
       RIGHT(B.[New Oracle Part #], 2) AS right2,
       B.[Fiber Oracle item],
       B.[Cable Type],
       C.StandardOperation,
       C.JacketMaterial,
       C.NominalOD,
       C.ODTolPlus,
       C.ODTolMinus,
       C.Height,
       C.HeightTolPlus,
       C.HeightTolMinus,
       C.NominalWall,
       C.MaxAveWall,
       C.MinAveWall,
       C.MinSpotWall,
       C.AramidType1,
       C.AramidEnds1,
       C.AramidType2,
       C.AramidEnds2,
       C.ChipType,
       C.Ripcord,
       C.LayLength,
       C.Talc,
       C.FRP_Dia,
       C.CM,
       C.CMMaterial,
       C.CM_OD,
       C.CMODTolPlus,
       C.CMODTolMinus,
       C.CMWall,
       C.CMMinWall,
       C.HelixFactor,
       C.CoreWrap,
       C.CoreDia,
       C.Binder1,
       C.QtyBinder1,
       C.Binder1LayLength,
       C.Binder2,
       C.QtyBinder2,
       C.Binder2LayLength,
       C.Binder3,
       C.QtyBinder3,
       C.Binder3LayLength,
       C.CablePasses,
       C.RevisionDate,
       C.RevisionNumber,
       C.RevisionHistory,
       C.Instructions2,
       C.Instructions,
       R.Active,
       T.PSS,
       T.Recipe,
       vColor_Chip_Jacket_Material.ColorChip,
       tblTightBufferStripType.ID,
       T.MachineGroupID,
       K.MachineName,
       B.Base,
       Filler,
       TBType
	   , r.CableType
FROM dbo.tblCableConstructions C
    INNER JOIN dbo.BasicProductConstruction B
        INNER JOIN tblCableConstructionReferences R
            ON B.Base = R.Base
        ON C.BaseID = R.BaseID
    INNER JOIN tblTightBufferSetup T ON T.CableType = R.CableType AND T.ZumbachLibrarySetting = C.NominalOD
        INNER JOIN tblTightBufferStripType
            ON T.TightBufferStrip = tblTightBufferStripType.TightBufferStrip
           AND C.JacketMaterial = T.Compound
           AND B.[EZ Strip] = tblTightBufferStripType.TightBufferStrip
    INNER JOIN vColor_Chip_Jacket_Material
        ON B.[Jacket Color] = vColor_Chip_Jacket_Material.Color
           AND C.JacketMaterial = vColor_Chip_Jacket_Material.JacketMaterial
    INNER JOIN tblTightBufferMachines AS K
        ON K.MachineGroupID = T.MachineGroupID
WHERE R.Active <> 0 AND B.Active <> 0 
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
