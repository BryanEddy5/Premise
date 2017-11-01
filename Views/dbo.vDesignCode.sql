SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


/*AND dbo.tblCableConstructionReferences.base like 'qr%'*/
CREATE VIEW [dbo].[vDesignCode]
AS
SELECT    DISTINCT    dbo.tblCableConstructionReferences.Base, SUBSTRING(dbo.tblCableConstructionReferences.DesignCode, 6, 1) 
                         + '.' + SUBSTRING(dbo.tblCableConstructionReferences.DesignCode, 7, 1) AS SubOD, SUBSTRING(dbo.[Product Desrcriptions].[Level 1 Product], 3, 3) AS SubFiber, 
                         dbo.tblCableConstructionReferences.NumSubPositions AS NumPositions, dbo.tblCableConstructionReferences.FiberCount, 
                         dbo.tblCableConstructionReferences.ConstructionDescription, dbo.tblCableConstructions.JacketMaterial AS Jacket, dbo.tblCableConstructions.NominalOD AS OD, 
                         dbo.tblCableConstructionReferences.BaseID, dbo.tblCableConstructionReferences.DesignCode, LEFT(dbo.tblCableConstructionReferences.DesignCode, 2) 
                         AS CabFam, dbo.tblCableConstructions.CablePasses, dbo.tblCableConstructionReferences.Active AS ActiveConstruction, dbo.[Product Desrcriptions].SubFiller, 
                         dbo.tblCableConstructionReferences.DesignExtension, dbo.tblCableConstructionReferences.CableFamily, dbo.tblDesignTypes.DesignTypeID, 
                         dbo.tblDesignTypeGroups.DesignTypeGroupID, dbo.tblDesignTypeGroups.DesignTypeGroupDesc, dbo.tblDesignTypes.DesignTypeDesc, 
                         dbo.tblCableConstructionReferences.CableLevel1, dbo.tblCableTightBufferReference.TBType, 
                         CASE WHEN CablePasses = 1 THEN tblCableConstructionReferences.FibersPerBundle ELSE K.FibersPerBundle END AS FibersPerBundle, 
                         '' as [Level 1 Product], 
						dbo.tblDesignTypes.SalesForceDescription, dbo.tblDesignCodeJacket.Jacket AS JacketType
FROM            dbo.tblDesignTypeGroups INNER JOIN
                         dbo.tblCableConstructions INNER JOIN
                         dbo.tblCableConstructionReferences ON dbo.tblCableConstructions.BaseID = dbo.tblCableConstructionReferences.BaseID INNER JOIN
                         dbo.[Product Desrcriptions] ON dbo.tblCableConstructionReferences.setupid = dbo.[Product Desrcriptions].ProductID INNER JOIN
                         dbo.tblDesignTypes ON dbo.tblCableConstructionReferences.DesignTypeID = dbo.tblDesignTypes.DesignTypeID ON 
                         dbo.tblDesignTypeGroups.DesignTypeGroupID = dbo.tblDesignTypes.DesignTypeGroupID INNER JOIN
                         dbo.tblCableTightBufferReference ON dbo.tblCableConstructionReferences.TBType = dbo.tblCableTightBufferReference.TBType INNER JOIN
                         dbo.tblDesignCodeJacket ON dbo.tblCableConstructionReferences.CableLevel1 = dbo.tblDesignCodeJacket.JacketLetter AND 
                         dbo.tblCableConstructionReferences.CableFamily = dbo.tblDesignCodeJacket.CableLetter LEFT OUTER JOIN
                         dbo.tblCableConstructionReferences AS K ON dbo.[Product Desrcriptions].[Level 1 Product] = K.Base
WHERE        (dbo.tblCableConstructionReferences.Active <> 0) AND (dbo.[Product Desrcriptions].SubFiller = 0) AND (dbo.tblDesignTypeGroups.Active <> 0) AND 
                         (dbo.tblDesignTypes.Active <> 0) --and tblCableConstructionReferences.base = 'rq024-3.0'




GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[25] 3) )"
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
         Begin Table = "tblDesignTypeGroups"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 118
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCableConstructions"
            Begin Extent = 
               Top = 120
               Left = 38
               Bottom = 249
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCableConstructionReferences"
            Begin Extent = 
               Top = 252
               Left = 38
               Bottom = 381
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 20
         End
         Begin Table = "Product Desrcriptions"
            Begin Extent = 
               Top = 384
               Left = 38
               Bottom = 513
               Right = 272
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblDesignTypes"
            Begin Extent = 
               Top = 339
               Left = 340
               Bottom = 468
               Right = 558
            End
            DisplayFlags = 280
            TopColumn = 11
         End
         Begin Table = "tblCableTightBufferReference"
            Begin Extent = 
               Top = 6
               Left = 285
               Bottom = 135
               Right = 455
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "K"
            Begin Extent = 
               Top = 320
               Left = 588
               Bo', 'SCHEMA', N'dbo', 'VIEW', N'vDesignCode', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'ttom = 449
               Right = 806
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblDesignCodeJacket"
            Begin Extent = 
               Top = 70
               Left = 631
               Bottom = 245
               Right = 872
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
', 'SCHEMA', N'dbo', 'VIEW', N'vDesignCode', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'vDesignCode', NULL, NULL
GO
