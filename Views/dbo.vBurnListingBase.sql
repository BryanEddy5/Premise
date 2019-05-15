SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[vBurnListingBase]
AS
SELECT        dbo.tblBurnListing.ListingCompany, dbo.tblBurnListing.Base, dbo.tblBurnListing.ListingTab, dbo.tblBurnListing.ListingSection, 
                         dbo.tblBurnListing.ListingConstruction, C.ConstructionID, Rating.Rating, R.US, 
                         R.Canada, Priority,  D.DocumentID, R.ListingBodyID, I.Id AS ListingCompanyId, r.ID AS RatingId
FROM            dbo.tblBurnListing INNER JOIN
                         dbo.tblBurnListingConstruction C ON dbo.tblBurnListing.ListingConstruction = C.ListingConstruction AND 
                         dbo.tblBurnListing.ListingSection = C.ListingSection AND 
                         dbo.tblBurnListing.ListingTab = C.ListingDocument AND 
                         dbo.tblBurnListing.ListingCompany = C.ListingCompany 
                         INNER JOIN dbo.tblBurnListingRating Rating ON C.ConstructionID = Rating.ConstructionID 
                         INNER JOIN dbo.tblBurnListingRatingReference R ON Rating.Rating = R.Rating
						 INNER JOIN dbo.tblBurnListingDocument D ON D.ListingDocument = C.ListingDocument
						 INNER JOIN dbo.tblBurnListingCompany I ON I.ListingCompany = D.ListingCompany

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
         Begin Table = "tblBurnListing"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 231
               Right = 231
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblBurnListingConstruction"
            Begin Extent = 
               Top = 12
               Left = 447
               Bottom = 263
               Right = 640
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblBurnListingRating"
            Begin Extent = 
               Top = 111
               Left = 726
               Bottom = 294
               Right = 1017
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblBurnListingRatingReference"
            Begin Extent = 
               Top = 62
               Left = 1109
               Bottom = 241
               Right = 1295
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
      Begin ColumnWidths = 10
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
        ', 'SCHEMA', N'dbo', 'VIEW', N'vBurnListingBase', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N' Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'vBurnListingBase', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'vBurnListingBase', NULL, NULL
GO
