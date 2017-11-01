SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[vSchedulingGanttFiberPlanning]
AS

	WITH ceJob as 
	(
		SELECT        --k.Start,K.Finish,K.RequiredDays, K.Sequence,K.[Item number],K.Job#,K.Line#,
					K.*, G.[Fiber Oracle item],
								 G.[Fiber Type], G.FiberType2, FIRST_VALUE(Start) OVER (PARTITION BY Line# ORDER BY Line#,ISNULL(Job#,0),Sequence) NextEmptyJobTime,ISNULL(Job#,0) NextEmptyJobFlag --, CASE WHEN Job# IS NULL AND (lag(Job#) OVER  (PARTITION BY Line# ORDER BY Line#, Sequence)) IS NOT NULL THEN 0 ELSE 1 END NextTimeFlag

		FROM            dbo.[Temp (Premise Load)] K LEFT JOIN
								 dbo.[Basic Product Construction] G ON K.[Item number] = G.[New Oracle Part #]
		where K.Start IS NOT NULL and [Item number] not like 'buff%'
		--ORDER BY Line#,Sequence
	) 
	SELECT *,CONVERT(VARCHAR(10),(datediff(SECOND,getdate(),NextEmptyJobTime)/86400)) + ':' +
		convert(varchar(10),(((datediff(SECOND,getdate(),NextEmptyJobTime)%86400)/3600))) + ':' +
			convert(varchar(10),(((datediff(SECOND,getdate(),NextEmptyJobTime)%86400%3600)/60)))   'DD:HH:MM' 
	from ceJob
	--ORDER BY LINE#, Sequence 
	--Where NextTime is null


GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[21] 2[20] 3) )"
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
         Top = -384
         Left = -4358
      End
      Begin Tables = 
         Begin Table = "Temp (Premise Load)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 287
               Right = 384
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Basic Product Construction"
            Begin Extent = 
               Top = 14
               Left = 461
               Bottom = 281
               Right = 729
            End
            DisplayFlags = 280
            TopColumn = 57
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 62
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
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
   ', 'SCHEMA', N'dbo', 'VIEW', N'vSchedulingGanttFiberPlanning', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'      Width = 1500
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
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'vSchedulingGanttFiberPlanning', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'vSchedulingGanttFiberPlanning', NULL, NULL
GO
