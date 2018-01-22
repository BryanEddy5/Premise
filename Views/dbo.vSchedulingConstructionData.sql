SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/*
Author:		Bryan Eddy
Date:		1/18/2018
Desc:		Construction data for Scheduling Construction sheet reports
Version:	1
Update:		Updated construction description to pull the SalesForce description from the DesignType table.  This will remove
			erroneous description information from the construction sheet reports

*/

CREATE VIEW [dbo].[vSchedulingConstructionData]
AS
SELECT        tblCableConstructions.CM AS CenterMember, tblCableConstructions.JacketMaterial AS [Jacket Material], vSchedulingCableUnion.[item no], 
                         vSchedulingCableUnion.[customer part#], vSchedulingCableUnion.customer, vSchedulingCableUnion.[print type (base)], 
                         vSchedulingCableUnion.[new oracle part #], vSchedulingCableUnion.base, vSchedulingCableUnion.[jacket color], 
                         vSchedulingCableUnion.[print line 1], vSchedulingCableUnion.[print line 2], vSchedulingCableUnion.[print line 3], 
                         vSchedulingCableUnion.[print line 4], vSchedulingCableUnion.[print reel no], vSchedulingCableUnion.[print item no], 
                         vSchedulingCableUnion.[print spacing], vSchedulingCableUnion.[1st req freq], vSchedulingCableUnion.[2nd req freq], 
                         vSchedulingCableUnion.[Fiber Type], vSchedulingCableUnion.[Base Oracle], vSchedulingCableUnion.active, 
                         vSchedulingCableUnion.[revision date], vSchedulingCableUnion.[revision history], vSchedulingCableUnion.Fiber2, vSchedulingCableUnion.PID, 
                         vSchedulingCableUnion.oraclestatus, vSchedulingCableUnion.enumber, vSchedulingCableUnion.Fiber3, vSchedulingCableUnion.customerrev, 
                         vSchedulingCableUnion.Location, vSchedulingCableUnion.StdOp, vSchedulingCableUnion.Fiber, vSchedulingCableUnion.[1st Req Freq - A], 
                         vSchedulingCableUnion.[1st Max Atten - A], vSchedulingCableUnion.[1st Min BandW - A], vSchedulingCableUnion.[2nd Req Freq - A], 
                         vSchedulingCableUnion.[2nd Max Atten - A], vSchedulingCableUnion.[2nd Min BandW - A], vSchedulingCableUnion.[1st Req Freq - B], 
                         vSchedulingCableUnion.[1st Max Atten - B], vSchedulingCableUnion.[1st Min BandW - B], vSchedulingCableUnion.[2nd Req Freq - B], 
                         vSchedulingCableUnion.[2nd Max Atten - B], vSchedulingCableUnion.[2nd Min BandW - B], vSchedulingCableUnion.[1st Req Freq - C], 
                         vSchedulingCableUnion.[1st Max Atten - C], vSchedulingCableUnion.[1st Min BandW - C], vSchedulingCableUnion.[2nd Req Freq - C], 
                         vSchedulingCableUnion.[2nd Max Atten - C], vSchedulingCableUnion.[2nd Min BandW - C], vSchedulingCableUnion.[Print Height], 
                         vSchedulingCableUnion.[FRP Dia], vSchedulingCableUnion.CustomerInstructions, vSchedulingCableUnion.[tb nominal od], 
                         vSchedulingCableUnion.[tb od tol  (-)], vSchedulingCableUnion.[tb od tol  (+)], vSchedulingCableUnion.[ez strip], 
                         vSchedulingCableUnion.[tb material], vSchedulingCableUnion.[tb chips type], vSchedulingCableUnion.[unit series], 
                         vSchedulingCableUnion.SpecialInstructions1, vSchedulingCableUnion.SpecialInstructions2, tblCableConstructions.JacketMaterial AS JacketMat, 
                         tblCableConstructionReferences.DesignCode, tblCableConstructionReferences.DesignExtension 
                         --tblCableConstructionReferences.ConstructionDescription
						 , tblCableConstructionReferences.NumSubFillers, 
                         tblCableConstructionReferences.Active AS ActiveConstruction, tblCableConstructionReferences.PrefixID, tblCableConstructionReferences.ProductID, 
                         tblCableConstructionReferences.SetupID, tblCableConstructionReferences.FamilyID, tblCableConstructionReferences.FibersPerBundle, 
                         tblCableConstructionReferences.UnitIDTypeNumber, tblCableConstructionReferences.InactiveReason, 
                         tblCableConstructionReferences.NumSubPositions, tblCableConstructionReferences.TBType, tblCableConstructionReferences.CableFamily, 
                         tblCableConstructionReferences.CableLevel1, tblCableConstructionReferences.DesignTypeID, tblCableConstructionReferences.NumCopperUnits, 
                         tblCableConstructionReferences.ReleasedDesign, tblCableConstructions.TemperatureApplication, tblCableConstructions.TensileApplication, 
                         tblCableConstructions.CablePasses, tblCableConstructions.StandardOperation, tblCableConstructions.JacketMaterial, 
                         tblCableConstructions.NominalOD, tblCableConstructions.ODTolPlus, tblCableConstructions.ODTolMinus, tblCableConstructions.Height, 
                         tblCableConstructions.HeightTolPlus, tblCableConstructions.HeightTolMinus, tblCableConstructions.NominalWall, 
                         tblCableConstructions.MaxAveWall, tblCableConstructions.MinAveWall, tblCableConstructions.MinSpotWall, tblCableConstructions.AramidType1, 
                         tblCableConstructions.AramidEnds1, tblCableConstructions.AramidType2, tblCableConstructions.AramidEnds2, tblCableConstructions.Ripcord, 
                         tblCableConstructions.RipcordQty, tblCableConstructions.LayLength, tblCableConstructions.Talc, tblCableConstructions.FRP_Dia, 
                         tblCableConstructions.CM, tblCableConstructions.CMMaterial, tblCableConstructions.CM_OD, tblCableConstructions.CMODTolPlus, 
                         tblCableConstructions.CMODTolMinus, tblCableConstructions.CMWall, tblCableConstructions.CMMinWall, tblCableConstructions.HelixFactor, 
                         tblCableConstructions.CoreWrap, tblCableConstructions.CoreDia, tblCableConstructions.Binder1, tblCableConstructions.QtyBinder1, 
                         tblCableConstructions.Binder1LayLength, tblCableConstructions.Binder2, tblCableConstructions.QtyBinder2, 
                         tblCableConstructions.Binder2LayLength, tblCableConstructions.Binder3, tblCableConstructions.QtyBinder3, 
                         tblCableConstructions.Binder3LayLength, tblCableConstructions.RevisionNumber, tblCableConstructions.RevisionHistory, 
                         tblCableConstructions.Instructions, tblCableConstructions.Instructions2, tblCableConstructions.Additive, tblCableConstructions.AdditivePercentage, 
                         tblCableConstructions.FirstRun, tblCableConstructions.EngineeringAssist, tblCableConstructions.AramidType3, tblCableConstructions.AramidEnds3, 
                         vColor_Chip_Jacket_Material.Color_Chip_Concentration AS ColorChipPercentage, vColor_Chip_Jacket_Material.ColorChip AS [Color Chip ID], 
                         vColor_Chip_Jacket_Material.ColorChipType AS ChipType,
						 customers.CustomerSpecialNotes,Design.SalesForceDescription AS ConstructionDescription
FROM            vSchedulingCableUnion INNER JOIN
                         tblCableConstructionReferences ON vSchedulingCableUnion.base = tblCableConstructionReferences.Base INNER JOIN
                         tblCableConstructions ON tblCableConstructionReferences.BaseID = tblCableConstructions.BaseID INNER JOIN
                         vColor_Chip_Jacket_Material ON tblCableConstructions.JacketMaterial = vColor_Chip_Jacket_Material.JacketMaterial AND 
                         vSchedulingCableUnion.[jacket color] = vColor_Chip_Jacket_Material.Color
						 INNER JOIN Customers  ON Customers.Customer = vSchedulingCableUnion.customer 
						 left JOIN dbo.tblDesignTypes Design ON Design.DesignTypeID = tblCableConstructionReferences.DesignTypeID




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
