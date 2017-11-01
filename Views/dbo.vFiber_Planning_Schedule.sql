SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[vFiber_Planning_Schedule]
AS
SELECT        CAST(DATEADD(dd, - (DATEPART(dw, dbo.[Temp (Premise Load)].[Schedule date]) - 1), dbo.[Temp (Premise Load)].[Schedule date]) AS DATE) AS WeekStart, CAST(DATEADD(dd, 
                         7 - DATEPART(dw, dbo.[Temp (Premise Load)].[Schedule date]), dbo.[Temp (Premise Load)].[Schedule date]) AS DATE) AS WeekEnd, dbo.[Temp (Premise Load)].[Item number], 
                         dbo.[Temp (Premise Load)].CO#, dbo.[Temp (Premise Load)].Line#, dbo.[Temp (Premise Load)].Job#, dbo.tblCableConstructions.NominalOD, dbo.CableUnion.Fiber, 
                         dbo.CableUnion.Fiber2, dbo.CableUnion.Fiber3, dbo.[Temp (Premise Load)].[Order Source], dbo.[Temp (Premise Load)].Start, 
                         dbo.[Temp (Premise Load)].[Promise Date], dbo.[Temp (Premise Load)].Length, dbo.[Temp (Premise Load)].Customer, dbo.[Temp (Premise Load)].[Type Order], 
                         dbo.[Temp (Premise Load)].[Complete Buff], dbo.CableUnion.ItemNo, dbo.tblCableConstructions.JacketMaterial, dbo.CableUnion.Color, 
                         dbo.[Temp (Premise Load)].Count
FROM            dbo.tblCableConstructionReferences INNER JOIN
                         dbo.tblCableConstructions ON dbo.tblCableConstructionReferences.BaseID = dbo.tblCableConstructions.BaseID INNER JOIN
                         dbo.CableUnion ON dbo.tblCableConstructionReferences.Base = dbo.CableUnion.Base INNER JOIN
                         dbo.[Temp (Premise Load)] ON dbo.CableUnion.Oracle = dbo.[Temp (Premise Load)].[Item number]
WHERE        (dbo.[Temp (Premise Load)].[Order Source] = N'New') AND (dbo.[Temp (Premise Load)].[Complete Buff] = 0) AND (dbo.[Temp (Premise Load)].[Type Order] = N'Loaded') 
                         AND (dbo.[Temp (Premise Load)].[Promise Date] < GETDATE() + 63)



GO
GRANT SELECT ON  [dbo].[vFiber_Planning_Schedule] TO [Oracle]
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
               Top = 22
               Left = 642
               Bottom = 260
               Right = 879
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCableConstructions"
            Begin Extent = 
               Top = 28
               Left = 946
               Bottom = 275
               Right = 1164
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CableUnion"
            Begin Extent = 
               Top = 18
               Left = 377
               Bottom = 230
               Right = 582
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Temp (Premise Load)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 275
               Right = 296
            End
            DisplayFlags = 280
            TopColumn = 5
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 16
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
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         A', 'SCHEMA', N'dbo', 'VIEW', N'vFiber_Planning_Schedule', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'ppend = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 4170
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'vFiber_Planning_Schedule', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'vFiber_Planning_Schedule', NULL, NULL
GO
