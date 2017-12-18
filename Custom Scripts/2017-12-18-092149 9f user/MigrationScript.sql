/*
This migration script replaces uncommitted changes made to these objects:
Color
Compounds
tblJacketMaterialColorChips_DeleteIfNotUsed
tblNames_Test

Use this script to make necessary schema and data changes for these objects only. Schema changes to any other objects won't be deployed.

Schema changes and migration scripts are deployed in the order they're committed.

Migration scripts must not reference static data. When you deploy migration scripts alongside static data 
changes, the migration scripts will run first. This can cause the deployment to fail. 
Read more at https://documentation.red-gate.com/display/SOC6/Static+data+and+migrations.
*/

SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Dropping constraints from [dbo].[Color]'
GO
ALTER TABLE [dbo].[Color] DROP CONSTRAINT [SSMA_CC$Color$BUF_COLOR$disallow_zero_length]
GO
PRINT N'Dropping constraints from [dbo].[Color]'
GO
ALTER TABLE [dbo].[Color] DROP CONSTRAINT [SSMA_CC$Color$Print$disallow_zero_length]
GO
PRINT N'Dropping constraints from [dbo].[Color]'
GO
ALTER TABLE [dbo].[Color] DROP CONSTRAINT [Color$PrimaryKey]
GO
PRINT N'Dropping constraints from [dbo].[Color]'
GO
ALTER TABLE [dbo].[Color] DROP CONSTRAINT [DF__Color__Colored__30EE274C]
GO
PRINT N'Dropping constraints from [dbo].[Color]'
GO
ALTER TABLE [dbo].[Color] DROP CONSTRAINT [DF__Color__Color Cha__31E24B85]
GO
PRINT N'Dropping constraints from [dbo].[tblJacketMaterialColorChips_DeleteIfNotUsed]'
GO
ALTER TABLE [dbo].[tblJacketMaterialColorChips_DeleteIfNotUsed] DROP CONSTRAINT [PK_tblJacketMaterialColorChips_1]
GO
PRINT N'Dropping constraints from [dbo].[tblJacketMaterialColorChips_DeleteIfNotUsed]'
GO
ALTER TABLE [dbo].[tblJacketMaterialColorChips_DeleteIfNotUsed] DROP CONSTRAINT [DF_tblJacketMaterialColorChips_DateCreated]
GO
PRINT N'Dropping constraints from [dbo].[tblNames_Test]'
GO
ALTER TABLE [dbo].[tblNames_Test] DROP CONSTRAINT [PK_tblNames_Test]
GO
PRINT N'Dropping index [IX_Compounds] from [dbo].[Compounds]'
GO
DROP INDEX [IX_Compounds] ON [dbo].[Compounds]
GO
PRINT N'Dropping [dbo].[tblNames_Test]'
GO
DROP TABLE [dbo].[tblNames_Test]
GO
PRINT N'Dropping [dbo].[Compounds]'
GO
DROP TABLE [dbo].[Compounds]
GO
PRINT N'Dropping [dbo].[tblJacketMaterialColorChips_DeleteIfNotUsed]'
GO
DROP TABLE [dbo].[tblJacketMaterialColorChips_DeleteIfNotUsed]
GO
PRINT N'Dropping [dbo].[Color]'
GO
DROP TABLE [dbo].[Color]
GO

