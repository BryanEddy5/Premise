SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO










/* AND TemperatureApplication IS NOT NULL*/
CREATE VIEW [dbo].[vFindCutSheet]
AS
SELECT  DISTINCT 
                         dbo.CableUnion.Oracle, dbo.CableUnion.Fiber, dbo.CableUnion.Color, dbo.CableUnion.Base, tblCableConstructions_1.StandardOperation, dbo.CableUnion.ItemNo, 
                         tblCableConstructions_1.CablePasses AS Location, dbo.tblCableConstructionReferences.RevisionDate, 
                         dbo.CableUnion.OracleStatus, dbo.CableUnion.PID, dbo.CableUnion.Fiber2,
                         dbo.CableUnion.Customer, 
                         tblCableConstructions_1.NominalOD, CONVERT(date, dbo.CableUnion.[Revision Date]) AS RevDate, dbo.CableUnion.PrintSpacing, dbo.CableUnion.[Item No], 
                         tblCableConstructions_1.TensileApplication, dbo.tblCableConstructionReferences.DesignTypeID, tblCableConstructions_1.TemperatureApplication, 
                         dbo.tblDesignTypes.SalesForceDescription,cast(substring(CableUnion.ItemNo,3,3) as int) FiberCount
						 , dbo.tblCableConstructionReferences.CableType,
                         dbo.tblCableConstructionReferences.NumSubPositions, dbo.tblCableConstructionReferences.NumCopperUnits,
						 CASE WHEN  tblCableConstructions_1.CablePasses = 1 THEN tblCableConstructionReferences.FibersPerBundle
							  ELSE tblCableConstructionReferences_1.FibersPerBundle
						 END FibersPerBundle, 
						 CASE WHEN  tblCableConstructions_1.CablePasses = 1 THEN tblCableConstructions_1.NominalOD
						 ELSE dbo.tblCableConstructions.NominalOD 
						 END AS SubOD,
                          dbo.tblCutSheetApproval.Technical_Approval, dbo.tblCutSheetApproval.Commercial_Approval, 
                         dbo.tblCutSheetApproval.Requested, 

							CASE WHEN ((dbo.tblCutSheetApproval.Commercial_Approval = 0 OR dbo.tblCutSheetApproval.Technical_Approval = 0 OR COALESCE(vArmorCoreItems_Approvals.CorCommercial_Approval,1) = 0 OR COALESCE(vArmorCoreItems_Approvals.CoreTechnical_Approval,1) = 0)) AND Requested = 1 THEN 'Requested' 
							WHEN ((dbo.tblCutSheetApproval.Commercial_Approval = 0 OR dbo.tblCutSheetApproval.Technical_Approval = 0 OR COALESCE(vArmorCoreItems_Approvals.CorCommercial_Approval,1) = 0 OR COALESCE(vArmorCoreItems_Approvals.CoreTechnical_Approval,1) = 0)) AND Requested = 0 THEN 'Not Approved' ELSE 'Approved' END
			
							 AS Status
FROM            dbo.CableUnion INNER JOIN
                         dbo.tblCableConstructionReferences ON dbo.CableUnion.Base = dbo.tblCableConstructionReferences.Base INNER JOIN
                         dbo.tblCableConstructions AS tblCableConstructions_1 ON dbo.tblCableConstructionReferences.BaseID = tblCableConstructions_1.BaseID INNER JOIN
                         dbo.tblCableTemperatureStandards ON tblCableConstructions_1.TemperatureApplication = dbo.tblCableTemperatureStandards.TemperatureApplication INNER JOIN
                         dbo.tblDesignTypes ON dbo.tblCableConstructionReferences.DesignTypeID = dbo.tblDesignTypes.DesignTypeID INNER JOIN
                         dbo.tblCableTightBufferReference ON dbo.tblCableConstructionReferences.TBType = dbo.tblCableTightBufferReference.TBType INNER JOIN
                         dbo.tblCutSheetApproval ON dbo.tblCableConstructionReferences.Base = dbo.tblCutSheetApproval.Base LEFT OUTER JOIN
                         dbo.vSubunitBases RIGHT  JOIN
                         dbo.tblCableConstructionReferences AS tblCableConstructionReferences_1 ON dbo.vSubunitBases.[Level 1 Product] = tblCableConstructionReferences_1.Base ON 
                         dbo.tblCableConstructionReferences.SetupID = dbo.vSubunitBases.ProductID LEFT OUTER JOIN
                         dbo.tblCableConstructions ON tblCableConstructionReferences_1.BaseID = dbo.tblCableConstructions.BaseID
						 INNER JOIN standards.CableConstructionStandards ON standards.CableConstructionStandards.BaseID = tblCableConstructions_1.BaseID
						 LEFT JOIN vArmorCoreItems_Approvals ON vArmorCoreItems_Approvals.ArmoredItem = dbo.CableUnion.Oracle
WHERE        (dbo.CableUnion.Customer LIKE 'AFL STANDARD%' OR
                         dbo.CableUnion.Customer LIKE 'AFL GENERIC%') AND (dbo.tblCableConstructionReferences.ReleasedDesign <> 0) AND 
                         (tblCableConstructions_1.TensileApplication IS NOT NULL) AND (dbo.CableUnion.Oracle NOT LIKE '%test%') AND (dbo.CableUnion.OracleStatus <> 'Obsolete') AND 
                         (dbo.CableUnion.OracleStatus <> 'Discontd') AND (tblCableConstructions_1.TensileRatingLongTerm_N IS NOT NULL OR dbo.CableUnion.Oracle like '%ia')
					 and isnumeric(substring(ItemNo,3,3) ) = 1












GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[56] 4[10] 2[17] 3) )"
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
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CableUnion"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 264
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCableConstructionReferences"
            Begin Extent = 
               Top = 22
               Left = 432
               Bottom = 251
               Right = 679
            End
            DisplayFlags = 280
            TopColumn = 22
         End
         Begin Table = "tblCableConstructions_1"
            Begin Extent = 
               Top = 25
               Left = 756
               Bottom = 274
               Right = 1025
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCableTensileRating"
            Begin Extent = 
               Top = 177
               Left = 1130
               Bottom = 306
               Right = 1478
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCableStandardsApplicationReference"
            Begin Extent = 
               Top = 30
               Left = 1154
               Bottom = 159
               Right = 1356
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCableTemperatureStandards"
            Begin Extent = 
               Top = 382
               Left = 1208
               Bottom = 511
               Right = 1426
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "tblDesignTypes"
            Begin Extent = 
               Top = 115
       ', 'SCHEMA', N'dbo', 'VIEW', N'vFindCutSheet', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'        Left = 184
               Bottom = 244
               Right = 402
            End
            DisplayFlags = 280
            TopColumn = 11
         End
         Begin Table = "tblCableTightBufferReference"
            Begin Extent = 
               Top = 290
               Left = 325
               Bottom = 532
               Right = 503
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCutSheetApproval"
            Begin Extent = 
               Top = 332
               Left = 58
               Bottom = 461
               Right = 294
            End
            DisplayFlags = 280
            TopColumn = 8
         End
         Begin Table = "vSubunitBases"
            Begin Extent = 
               Top = 320
               Left = 700
               Bottom = 523
               Right = 918
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCableConstructionReferences_1"
            Begin Extent = 
               Top = 277
               Left = 885
               Bottom = 446
               Right = 1103
            End
            DisplayFlags = 280
            TopColumn = 11
         End
         Begin Table = "tblCableConstructions"
            Begin Extent = 
               Top = 336
               Left = 968
               Bottom = 510
               Right = 1196
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
      Begin ColumnWidths = 9
         Width = 284
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
', 'SCHEMA', N'dbo', 'VIEW', N'vFindCutSheet', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'vFindCutSheet', NULL, NULL
GO
