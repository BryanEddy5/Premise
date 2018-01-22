SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



/*
Author:		Bryan Eddy
Date:		1/11/2018
Desc:		Data provided for cut sheet report
Version:	1
Update:		Changed the temperature table to left join to allow for cut sheets to be generated missing temperatures
			The technical review will provide the necessary temperatures


*/
CREATE VIEW [dbo].[vCutSheet]
AS
SELECT        C.Oracle, C.Color, qryBasePrint.PrintLine1, qryBasePrint.PrintLine2, qryBasePrint.PrintLine3, qryBasePrint.[Print Item No], 
                         qryBasePrint.PrintLine4, C.ItemNo AS DesignCode, ROUND(tblCableConstructions.NominalOD, 1) AS NominalOD, 
                         tblCableConstructionReferences.NumSubFillers, tblCableConstructionReferences.NumSubPositions, qryBasePrint.[Print Reel No], 
                         tblCableConstructionReferences.ConstructionDescription, tblCableConstructionReferences.Base, tblCableTemperatureStandards.Operation_C, 
                         tblCableTemperatureStandards.StorageShipping_C, tblCableTemperatureStandards.Installation_C, C.Fiber, 
                         tblCableConstructions.TensileRatingLongTerm_N, tblCableConstructions.TensileRatingShortTerm_N,
                          tblCutSheetOpticalFiberChart.CodeFiberType, tblCutSheetOpticalFiberChart.Mode, 
                         tblCutSheetOpticalFiberChart.Attn_dbkm_850nm, tblCutSheetOpticalFiberChart.Attn_dbkm_1300nm, tblCutSheetOpticalFiberChart.Attn_dbkm_1310nm, 
                         tblCutSheetOpticalFiberChart.Attn_dbkm_1550nm, tblCutSheetOpticalFiberChart.BW_MHzkm_850nm, 
                         tblCutSheetOpticalFiberChart.BW_MHzkm_1300nm, tblCutSheetOpticalFiberChart.EMBc_MHzkm, 
                         tblCutSheetOpticalFiberChart.[1GigEthMin_LinkDist_850nm], tblCutSheetOpticalFiberChart.[1GigEthMin_LinkDist_1300nm], 
                         tblCutSheetOpticalFiberChart.[10GigEthMin_LinkDist_850nm], tblCutSheetOpticalFiberChart.[10GigEthMin_LinkDist_1300nm], 
                         tblCutSheetOpticalFiberChart.FiberLetter, tblCutSheetOpticalFiberChart.FiberExtension, C.Fiber2, tblDesignTypes.SalesForceDescription, 
                         tblCableConstructionReferences.FiberCount, tblCableConstructions.BaseID, tblCableConstructionReferences.CableFamily, 
                         tblCutSheetApproval.Commercial_Approval, tblCutSheetApproval.Technical_Approval, tblCableConstructions.CablePasses AS Location, 
                         tblCutSheetApproval.Requested
FROM            tblCableConstructionReferences INNER JOIN
                         tblCableConstructions ON tblCableConstructionReferences.BaseID = tblCableConstructions.BaseID INNER JOIN
                         CableUnion AS C ON tblCableConstructionReferences.Base = C.Base INNER JOIN
                         qryBasePrint ON C.Oracle = qryBasePrint.Oracle LEFT JOIN
                         tblCableTemperatureStandards ON tblCableConstructions.TemperatureApplication = tblCableTemperatureStandards.TemperatureApplication INNER JOIN
                         tbl_Fibers ON C.Fiber = tbl_Fibers.Fiber INNER JOIN
                         tblDesignTypes ON tblCableConstructionReferences.DesignTypeID = tblDesignTypes.DesignTypeID INNER JOIN
                         tblCutSheetApproval ON tblCableConstructionReferences.Base = tblCutSheetApproval.Base LEFT OUTER JOIN
                         tblCutSheetOpticalFiberChart ON tbl_Fibers.OpticalID = tblCutSheetOpticalFiberChart.OpticalID
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
