SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vSchedulingCableRunSpeeds]
AS
SELECT        dbo.tblCableConstructions.CM AS CenterMember, dbo.tblCableConstructions.JacketMaterial AS [Jacket Material], dbo.CableUnion.Oracle, dbo.CableUnion.Fiber, 
                         dbo.CableUnion.Color, dbo.CableUnion.Jacket, dbo.CableUnion.Base, dbo.CableUnion.ColorChip, dbo.CableUnion.ListingCompany, dbo.CableUnion.Customer, 
                         dbo.CableUnion.PrintLine4, dbo.CableUnion.Active, dbo.CableUnion.Reason, dbo.CableUnion.[Item No], dbo.CableUnion.ItemNo, dbo.CableUnion.Fiber2, 
                         dbo.CableUnion.PID, dbo.CableUnion.OracleStatus, dbo.CableUnion.Enumber, dbo.CableUnion.Fiber3, dbo.CableUnion.CustomerRev, 
                         dbo.tblCableConstructions.CablePasses AS Location, dbo.CableUnion.[Revision Date], dbo.CableUnion.RibbonHighCure, dbo.CableUnion.PrintSpacing, 
                         dbo.CableUnion.PrintLine2, dbo.CableUnion.DateCreated, dbo.CableUnion.PrintLine3, dbo.CableUnion.PrintLine1, dbo.CableUnion.CreatedBy, 
                         dbo.CableUnion.[Unit Series], dbo.tblCableConstructions.JacketMaterial AS JacketMat, dbo.tblCableConstructionReferences.DesignCode, 
                         dbo.tblCableConstructionReferences.DesignExtension, dbo.tblCableConstructionReferences.ConstructionDescription, 
                         dbo.tblCableConstructionReferences.NumSubFillers, dbo.tblCableConstructionReferences.Active AS ActiveConstruction, 
                         dbo.tblCableConstructionReferences.ProductID, dbo.tblCableConstructionReferences.SetupID, dbo.tblCableConstructionReferences.FamilyID, 
                         dbo.tblCableConstructionReferences.FibersPerBundle, dbo.tblCableConstructionReferences.UnitIDTypeNumber, 
                         dbo.tblCableConstructionReferences.InactiveReason, dbo.tblCableConstructionReferences.NumSubPositions, dbo.tblCableConstructionReferences.TBType, 
                         dbo.tblCableConstructionReferences.CableFamily, dbo.tblCableConstructionReferences.CableLevel1, dbo.tblCableConstructionReferences.DesignTypeID, 
                         dbo.tblCableConstructionReferences.NumCopperUnits, dbo.tblCableConstructionReferences.ReleasedDesign, dbo.tblCableConstructions.CablePasses, 
                         dbo.tblCableConstructions.StandardOperation, dbo.tblCableConstructions.JacketMaterial, dbo.tblCableConstructions.NominalOD, dbo.tblCableConstructions.CM, 
                         dbo.tblCableConstructions.CMMaterial, dbo.tblCableConstructions.HelixFactor, dbo.[Buff#1/#2 Alloc Table].[Buffering Factor], 
                         dbo.[Buff#1/#2 Alloc Table].[Date Adjustments], dbo.[Buff#1/#2 Alloc Table].[Special Notes], dbo.[Buff#1/#2 Alloc Table].[Process Status], 
                         dbo.[Buff#1/#2 Alloc Table].[Set-up time level 1], dbo.[Buff#1/#2 Alloc Table].[Set-up time level 2], dbo.[Buff#1/#2 Alloc Table].[Buff#11 Line Speed], 
                         dbo.[Buff#1/#2 Alloc Table].[Buff#1 Line Speed], dbo.[Buff#1/#2 Alloc Table].[Buff#4 Line Speed], dbo.[Buff#1/#2 Alloc Table].[Buff#6 Line Speed], 
                         dbo.[Buff#1/#2 Alloc Table].[Buff#2 Line Speed], dbo.[Buff#1/#2 Alloc Table].[Buff#9 Line Speed], dbo.[Buff#1/#2 Alloc Table].[Buff#10 Line Speed], 
                         dbo.[Buff#1/#2 Alloc Table].[Buff#9 Line Speed (SH)], dbo.[Buff#1/#2 Alloc Table].[Buff#11 Line Speed (SH)], dbo.[Buff#1/#2 Alloc Table].[SH#3 Line Speed], 
                         dbo.[Buff#1/#2 Alloc Table].[SH#4 Line Speed], dbo.[Buff#1/#2 Alloc Table].[C#4 Line Speed], dbo.[Buff#1/#2 Alloc Table].[Armor Line Speed], 
                         dbo.[Buff#1/#2 Alloc Table].tbspd, dbo.[Buff#1/#2 Alloc Table].PlannedLotSize, dbo.[Buff#1/#2 Alloc Table].[shrinkage limit], 
                         dbo.[Buff#1/#2 Alloc Table].[Sheathing Line], dbo.[Buff#1/#2 Alloc Table].Interlock, dbo.[Buff#1/#2 Alloc Table].PrimaryBufferingLine, 
                         dbo.[Buff#1/#2 Alloc Table].B18_Line_Speed
FROM            dbo.CableUnion INNER JOIN
                         dbo.tblCableConstructionReferences ON dbo.CableUnion.Base = dbo.tblCableConstructionReferences.Base INNER JOIN
                         dbo.tblCableConstructions ON dbo.tblCableConstructionReferences.BaseID = dbo.tblCableConstructions.BaseID INNER JOIN
                         dbo.[Buff#1/#2 Alloc Table] ON dbo.[Buff#1/#2 Alloc Table].PrefixID = dbo.tblCableConstructionReferences.PrefixID


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
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CableUnion"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 24
         End
         Begin Table = "tblCableConstructionReferences"
            Begin Extent = 
               Top = 6
               Left = 254
               Bottom = 135
               Right = 472
            End
            DisplayFlags = 280
            TopColumn = 0
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
         Begin Table = "Buff#1/#2 Alloc Table"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 399
               Right = 254
            End
            DisplayFlags = 280
            TopColumn = 26
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
         Alias = 2820
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
', 'SCHEMA', N'dbo', 'VIEW', N'vSchedulingCableRunSpeeds', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'vSchedulingCableRunSpeeds', NULL, NULL
GO
