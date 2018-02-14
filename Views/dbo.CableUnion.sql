SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[CableUnion]
AS
SELECT        [New Oracle Part #] AS Oracle, LEFT([Fiber Oracle Item], 8) AS Fiber, [Jacket Color] AS Color, 
                          I.JacketMaterial AS [Jacket], G.BASE, [Color Chip ID] AS ColorChip, [Listing Company] AS ListingCompany, [Customer], [Print Line 4] AS PrintLine4, K.Active, Reason, 
                         [Item No],[Item No] as ItemNo, FiberType2 AS Fiber2, [Customer Part#] AS PID, [OracleStatus], Enumber
						 , FiberType3 AS Fiber3, CustomerRev, 1 AS Location, [Revision Date], [RibbonHighCure], [Print Spacing] as PrintSpacing, [Print Line 2] PrintLine2
						 , K.DateCreated, [Print Line 3] PrintLine3, [Print Line 1] PrintLine1, K.CreatedBy, [Unit Series], k.ID AS ItemID
						
FROM            [Basic Product Construction] K INNER JOIN dbo.tblCableConstructionReferences G ON G.BASE = K.Base
				INNER JOIN dbo.tblCableConstructions I ON I.BaseID = G.BaseID
--UNION ALL
--SELECT        [Basic (Cable/Sheath)].[New Oracle Part Number] AS Oracle, LEFT([Basic (Cable/Sheath)].[Fiber Type A], 8) AS Fiber, [Jacket Color] AS Color, 
--                         [Jacket Material] AS [Jacket], [Base], ColorChip, [Listing Company] AS ListingCompany, [Customer], [Print Line 4] AS PrintLine4, Active, Reason, [Item No],  [Item No] as ItemNo,
--                         LEFT([Fiber Type B], 8) AS Fiber2, [Customer Part Num] AS PID, [OracleStatus], [ENumber]
--						 , [Fiber Type C] AS Fiber3, CustomerRev, 2 AS Location, [Revision Date], '' as RibbonHighCure, PrintSpacing, [Print Line 2] PrintLine2
--						 , DateCreated, [Print Line 3] PrintLine3, [Print Line 1] PrintLine1, CreatedBy,[Unit Series]
						
--FROM            [Basic (Cable/Sheath)];

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
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 21
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
', 'SCHEMA', N'dbo', 'VIEW', N'CableUnion', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'CableUnion', NULL, NULL
GO
