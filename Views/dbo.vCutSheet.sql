SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/*WHERE dbo.tblCableConstructions.TemperatureApplication IS NOT NULL  AND ( Customer like 'AFL STANDARD%' OR Customer LIKE 'AFL GENERIC%')  AND ReleasedDesign <> 0
where C.Oracle = 'PS07442-01'*/
CREATE VIEW [dbo].[vCutSheet]
AS
SELECT        C.Oracle, C.Color, dbo.qryBasePrint.PrintLine1, dbo.qryBasePrint.PrintLine2, dbo.qryBasePrint.PrintLine3, dbo.qryBasePrint.[Print Item No], 
                         dbo.qryBasePrint.PrintLine4, C.ItemNo AS DesignCode, ROUND(dbo.tblCableConstructions.NominalOD, 1) AS NominalOD, 
                         dbo.tblCableConstructionReferences.NumSubFillers, dbo.tblCableConstructionReferences.NumSubPositions, dbo.qryBasePrint.[Print Reel No], 
                         dbo.tblCableConstructionReferences.ConstructionDescription, dbo.tblCableConstructionReferences.Base, dbo.tblCableTemperatureStandards.Operation_C, 
                         dbo.tblCableTemperatureStandards.StorageShipping_C, dbo.tblCableTemperatureStandards.Installation_C, C.Fiber, 
                         dbo.tblCableConstructions.TensileRatingLongTerm_N, dbo.tblCableConstructions.TensileRatingShortTerm_N, T.Tensile_LongTerm_Less_12Fiber_Newton, 
                         T.Tensile_LongTerm_GreaterEqual_12Fiber_Newton, dbo.tblCutSheetOpticalFiberChart.CodeFiberType, dbo.tblCutSheetOpticalFiberChart.Mode, 
                         dbo.tblCutSheetOpticalFiberChart.Attn_dbkm_850nm, dbo.tblCutSheetOpticalFiberChart.Attn_dbkm_1300nm, dbo.tblCutSheetOpticalFiberChart.Attn_dbkm_1310nm, 
                         dbo.tblCutSheetOpticalFiberChart.Attn_dbkm_1550nm, dbo.tblCutSheetOpticalFiberChart.BW_MHzkm_850nm, 
                         dbo.tblCutSheetOpticalFiberChart.BW_MHzkm_1300nm, dbo.tblCutSheetOpticalFiberChart.EMBc_MHzkm, 
                         dbo.tblCutSheetOpticalFiberChart.[1GigEthMin_LinkDist_850nm], dbo.tblCutSheetOpticalFiberChart.[1GigEthMin_LinkDist_1300nm], 
                         dbo.tblCutSheetOpticalFiberChart.[10GigEthMin_LinkDist_850nm], dbo.tblCutSheetOpticalFiberChart.[10GigEthMin_LinkDist_1300nm], 
                         dbo.tblCutSheetOpticalFiberChart.FiberLetter, dbo.tblCutSheetOpticalFiberChart.FiberExtension, C.Fiber2, dbo.tblDesignTypes.SalesForceDescription, 
                         dbo.tblCableConstructionReferences.FiberCount, dbo.tblCableConstructions.BaseID, dbo.tblCableConstructionReferences.CableFamily, 
                         dbo.tblCutSheetApproval.Commercial_Approval, dbo.tblCutSheetApproval.Technical_Approval, dbo.tblCableConstructions.CablePasses AS Location, 
                         dbo.tblCutSheetApproval.Requested
FROM            dbo.tblCableConstructionReferences INNER JOIN
                         dbo.tblCableConstructions ON dbo.tblCableConstructionReferences.BaseID = dbo.tblCableConstructions.BaseID INNER JOIN
                         dbo.CableUnion AS C ON dbo.tblCableConstructionReferences.Base = C.Base INNER JOIN
                         dbo.qryBasePrint ON C.Oracle = dbo.qryBasePrint.Oracle INNER JOIN
                         dbo.tblCableTensileRating AS T ON dbo.tblCableConstructions.TensileApplication = T.TensileApplication INNER JOIN
                         dbo.tblCableTemperatureStandards ON dbo.tblCableConstructions.TemperatureApplication = dbo.tblCableTemperatureStandards.TemperatureApplication INNER JOIN
                         dbo.tbl_Fibers ON C.Fiber = dbo.tbl_Fibers.Fiber INNER JOIN
                         dbo.tblDesignTypes ON dbo.tblCableConstructionReferences.DesignTypeID = dbo.tblDesignTypes.DesignTypeID INNER JOIN
                         dbo.tblCutSheetApproval ON dbo.tblCableConstructionReferences.Base = dbo.tblCutSheetApproval.Base LEFT OUTER JOIN
                         dbo.tblCutSheetOpticalFiberChart ON dbo.tbl_Fibers.OpticalID = dbo.tblCutSheetOpticalFiberChart.OpticalID
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[44] 4[17] 2[20] 3) )"
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
               Top = 4
               Left = 37
               Bottom = 128
               Right = 253
            End
            DisplayFlags = 280
            TopColumn = 26
         End
         Begin Table = "tblCableConstructions"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 267
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 203
               Left = 943
               Bottom = 332
               Right = 1121
            End
            DisplayFlags = 280
            TopColumn = 19
         End
         Begin Table = "qryBasePrint"
            Begin Extent = 
               Top = 248
               Left = 338
               Bottom = 397
               Right = 516
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "T"
            Begin Extent = 
               Top = 402
               Left = 38
               Bottom = 531
               Right = 386
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "tblCableTemperatureStandards"
            Begin Extent = 
               Top = 534
               Left = 38
               Bottom = 663
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbl_Fibers"
            Begin Extent = 
               Top = 666
               Left = 38
               Bottom = 795
               Righ', 'SCHEMA', N'dbo', 'VIEW', N'vCutSheet', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N't = 226
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblDesignTypes"
            Begin Extent = 
               Top = 5
               Left = 294
               Bottom = 130
               Right = 510
            End
            DisplayFlags = 280
            TopColumn = 11
         End
         Begin Table = "tblCutSheetApproval"
            Begin Extent = 
               Top = 51
               Left = 590
               Bottom = 284
               Right = 904
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "tblCutSheetOpticalFiberChart"
            Begin Extent = 
               Top = 798
               Left = 38
               Bottom = 927
               Right = 289
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
', 'SCHEMA', N'dbo', 'VIEW', N'vCutSheet', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'vCutSheet', NULL, NULL
GO
