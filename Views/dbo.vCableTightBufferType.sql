SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vCableTightBufferType]
AS
SELECT        dbo.[Basic Product Construction].[New Oracle Part #], dbo.tblCableConstructionReferences.Base, dbo.tblCableConstructionReferences.DesignCode, 
                         dbo.[Basic Product Construction].[EZ Strip], dbo.[Basic Product Construction].[TB Material], dbo.[Basic Product Construction].[TB Nominal OD], 
                         dbo.[Basic Product Construction].[Fiber Oracle item], dbo.tblCableConstructionReferences.BaseID, dbo.tblCableConstructionReferences.NumSubFillers, 
                         dbo.tblCableConstructionReferences.Active, dbo.tblCableConstructionReferences.PrefixID, dbo.tblCableConstructionReferences.ProductID, 
                         dbo.tblCableConstructionReferences.NumSubPositions, dbo.tblCableConstructionReferences.TBType, dbo.tblCableTightBufferReference.TBTypeID
FROM            dbo.tblCableConstructionReferences INNER JOIN
                         dbo.[Basic Product Construction] ON dbo.tblCableConstructionReferences.Base = dbo.[Basic Product Construction].Base INNER JOIN
                         dbo.tblCableTightBufferReference ON dbo.tblCableConstructionReferences.TBType = dbo.tblCableTightBufferReference.TBType


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
               Top = 8
               Left = 362
               Bottom = 316
               Right = 743
            End
            DisplayFlags = 280
            TopColumn = 14
         End
         Begin Table = "Basic Product Construction"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 251
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCableTightBufferReference"
            Begin Extent = 
               Top = 16
               Left = 795
               Bottom = 285
               Right = 1025
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
      Begin ColumnWidths = 20
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
         Or = 135', 'SCHEMA', N'dbo', 'VIEW', N'vCableTightBufferType', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'0
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'vCableTightBufferType', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'vCableTightBufferType', NULL, NULL
GO
