SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/*
Author:		Bryan Eddy
Date:		2/20/2018
Desc:		Get cable images
Version:	2
Update:		Added ImageID and ImageGroupID

*/
CREATE VIEW [CutSheet].[vImage]
AS
SELECT        Images.ImageName, ImageType.ImageTypeName, tblCableConstructionReferences.Base, ImageGroupReference.Color, 
                         ImageGroup.ImageGroupName, ImageGroupReference.ImageTypeID, ImageGroupReference.Armored, Images.ImageID, ImageGroup.ImageGroupID, images.ImageFileType
FROM            CutSheet.Images INNER JOIN
                         CutSheet.ImageType ON CutSheet.Images.ImageTypeID = CutSheet.ImageType.ImageTypeID INNER JOIN
                         CutSheet.ImageGroupReference ON CutSheet.Images.ImageID = CutSheet.ImageGroupReference.ImageID AND 
                         CutSheet.Images.ImageTypeID = CutSheet.ImageGroupReference.ImageTypeID AND CutSheet.Images.Color = CutSheet.ImageGroupReference.Color AND 
                         CutSheet.Images.Armored = CutSheet.ImageGroupReference.Armored INNER JOIN
                         dbo.tblCableConstructionReferences ON CutSheet.ImageGroupReference.ImageGroupID = tblCableConstructionReferences.ImageGroupID INNER JOIN
                         CutSheet.ImageGroup ON CutSheet.ImageGroupReference.ImageGroupID = CutSheet.ImageGroup.ImageGroupID
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
         Begin Table = "Images (CutSheet)"
            Begin Extent = 
               Top = 13
               Left = 741
               Bottom = 217
               Right = 911
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "ImageType (CutSheet)"
            Begin Extent = 
               Top = 59
               Left = 952
               Bottom = 235
               Right = 1132
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ImageGroupReference (CutSheet)"
            Begin Extent = 
               Top = 11
               Left = 544
               Bottom = 216
               Right = 714
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCableConstructionReferences"
            Begin Extent = 
               Top = 31
               Left = 114
               Bottom = 203
               Right = 353
            End
            DisplayFlags = 280
            TopColumn = 31
         End
         Begin Table = "ImageGroup (CutSheet)"
            Begin Extent = 
               Top = 218
               Left = 366
               Bottom = 347
               Right = 553
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
         Width = 2430
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = ', 'SCHEMA', N'CutSheet', 'VIEW', N'vImage', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'
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
', 'SCHEMA', N'CutSheet', 'VIEW', N'vImage', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'CutSheet', 'VIEW', N'vImage', NULL, NULL
GO
