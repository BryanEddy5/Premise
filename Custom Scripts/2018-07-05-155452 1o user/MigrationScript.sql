/*
This migration script replaces uncommitted changes made to these objects:
ImageGroup
JobPrint
JobPrint_Archive
MarkingIntervals
Templates
LeadTimes
AFL_SHP_Shipments_Value_Report_260418
Basic Product Construction
Buff#1/#2 Alloc Table
PorductionAndProcessData_Archive
PrintLine4Codes
Printed Labels (Data Products)
PrintedLabelsArchive
Unit Series
Vendors
XXAFL_CAB_DESIGN_ITEMS_ATTR_DELETE
tblBurnListingDocument
tblCableConstructionReferences
tblCableConstructionsOLD
tblCableConstructions
tblCableFamilyDocs
tblCableTBType
tblCableTightBufferReference
tblCorningPrint
tblDesignCodeFurcationTube
tblEmailOptions
tblEmailOptions_DELETE
tblItemBuildDescrepancyLog
tblJacketMaterials
tblLeadTime
tblMasterSchedule
tblMaterialDensity
tblMaterialWeightsMetersUOM
tblSalesForce_Pricing
tblSalesForce_Pricing_Multiplier
tblStockItems
tblTightBufferStripType
usp_SetJobPrint
usp_CatalogCode_Armor_Cost_Weight
usp_CatalogCode_Armor_Cost_Weight_Create_Table
usp_CatalogCode_Boxed_Items
usp_CatalogCode_Cables
usp_CatalogCode_Descriptions
usp_CatalogCode_FlateFile_Export
usp_CatalogCode_Furcation
usp_CatalogCode_Generator
usp_CatalogCode_InvokeUrl_Update
usp_CatalogCode_InvokeUrl_Update_DEV
usp_CatalogCode_NonArmored_Costing
usp_CatalogCode_NonArmored_Costing_InsertNewBase
usp_CatalogCode_PricingUpdate
usp_CatalogCode_RemoveDuplicates
usp_CatalogCode_Special_Subunit
usp_CatalogCode_UpdateStage
usp_GetFurcationTube
usp_CatalogCode_SalesForce_Armor_Cost_Weight
usp_CatalogCode_SalesForce_Armor_Cost_Weight_Create_Table
usp_CatalogCode_SalesForce_Boxed_Items
usp_CatalogCode_SalesForce_Cables
usp_CatalogCode_SalesForce_Descriptions
usp_CatalogCode_SalesForce_FlateFile_Export
usp_CatalogCode_SalesForce_Furcation
usp_CatalogCode_SalesForce_Generator
usp_CatalogCode_SalesForce_InvokeURL_SalesForce_Update
usp_CatalogCode_SalesForce_InvokeURL_SalesForce_Update_DEV
usp_CatalogCode_SalesForce_NonArmored_Costing
usp_CatalogCode_SalesForce_NonArmored_Costing_InsertNewBase
usp_CatalogCode_SalesForce_PricingUpdate
usp_CatalogCode_SalesForce_RemoveDuplicates
usp_CatalogCode_SalesForce_Special_Subunit
usp_CatalogCode_SalesForce_UpdateStage
usp_EmailSetupStdOpMismatch
usp_MTY_ObsoleteComponentNotification
usp_Order_History_Update_Premise_Cable_Shipments
usp_SalesHistoryUpdate_BI_DELETE
usp_Scheduling_Construction_CenterMember
vJobPrintInterface
vLeadTimes
vFBR00466Selection
vInactiveItems
TightBufferSetupRecipe
qryBasePrint
vBasic_Prod_plus_Basic_Sheath
vBurnListingBase
vCosntructionReferenceActiveDesignCodeExtensions
vFiber
vVendorSpecificPrint
db_datareader
db_ddladmin
NAA\SPB spb_PREMISE_RO
DiamondJet

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
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'NAA\SPB spb_PREMISE_RO')
CREATE LOGIN [NAA\SPB spb_PREMISE_RO] FROM WINDOWS
GO
CREATE USER [NAA\SPB spb_PREMISE_RO] FOR LOGIN [NAA\SPB spb_PREMISE_RO]
GO
PRINT N'Altering members of role db_datareader'
GO
EXEC sp_addrolemember N'db_datareader', N'NAA\SPB spb_PREMISE_RO'
GO
PRINT N'Altering members of role db_ddladmin'
GO
EXEC sp_addrolemember N'db_ddladmin', N'NAA\kimjo'
GO
PRINT N'Creating schemas'
GO
CREATE SCHEMA [DiamondJet]
AUTHORIZATION [dbo]
GO
PRINT N'Dropping extended properties'
GO
EXEC sp_dropextendedproperty N'MS_SSMA_SOURCE', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', NULL, NULL
GO
EXEC sp_dropextendedproperty N'MS_SSMA_SOURCE', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Armor Line Speed'
GO
EXEC sp_dropextendedproperty N'MS_SSMA_SOURCE', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Buff#1 Line Speed'
GO
EXEC sp_dropextendedproperty N'MS_SSMA_SOURCE', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Buff#10 Line Speed'
GO
EXEC sp_dropextendedproperty N'MS_SSMA_SOURCE', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Buff#11 Line Speed'
GO
EXEC sp_dropextendedproperty N'MS_SSMA_SOURCE', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Buff#11 Line Speed (SH)'
GO
EXEC sp_dropextendedproperty N'MS_SSMA_SOURCE', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Buff#2 Line Speed'
GO
EXEC sp_dropextendedproperty N'MS_SSMA_SOURCE', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Buff#4 Line Speed'
GO
EXEC sp_dropextendedproperty N'MS_SSMA_SOURCE', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Buff#6 Line Speed'
GO
EXEC sp_dropextendedproperty N'MS_SSMA_SOURCE', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Buff#9 Line Speed'
GO
EXEC sp_dropextendedproperty N'MS_SSMA_SOURCE', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Buff#9 Line Speed (SH)'
GO
EXEC sp_dropextendedproperty N'MS_SSMA_SOURCE', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Buffering Factor'
GO
EXEC sp_dropextendedproperty N'MS_SSMA_SOURCE', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'C#4 Line Speed'
GO
EXEC sp_dropextendedproperty N'MS_SSMA_SOURCE', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Date Adjustments'
GO
EXEC sp_dropextendedproperty N'MS_SSMA_SOURCE', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Interlock'
GO
EXEC sp_dropextendedproperty N'MS_SSMA_SOURCE', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'PlannedLotSize'
GO
EXEC sp_dropextendedproperty N'MS_SSMA_SOURCE', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Prefix'
GO
EXEC sp_dropextendedproperty N'MS_SSMA_SOURCE', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Process Status'
GO
EXEC sp_dropextendedproperty N'MS_SSMA_SOURCE', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Set-up time level 1'
GO
EXEC sp_dropextendedproperty N'MS_SSMA_SOURCE', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Set-up time level 2'
GO
EXEC sp_dropextendedproperty N'MS_SSMA_SOURCE', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'SH#3 Line Speed'
GO
EXEC sp_dropextendedproperty N'MS_SSMA_SOURCE', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'SH#4 Line Speed'
GO
EXEC sp_dropextendedproperty N'MS_SSMA_SOURCE', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Sheathing Line'
GO
EXEC sp_dropextendedproperty N'MS_SSMA_SOURCE', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'shrinkage limit'
GO
EXEC sp_dropextendedproperty N'MS_SSMA_SOURCE', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Special Notes'
GO
EXEC sp_dropextendedproperty N'MS_SSMA_SOURCE', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'tbspd'
GO
EXEC sp_dropextendedproperty N'MS_SSMA_SOURCE', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'CONSTRAINT', N'Buff#1/#2 Alloc Table$PrimaryKey'
GO
PRINT N'Dropping foreign keys from [CutSheet].[ImageGroup]'
GO
ALTER TABLE [CutSheet].[ImageGroup] DROP CONSTRAINT [FK_ImageGroup_ImageGroup]
GO
PRINT N'Dropping foreign keys from [dbo].[tblCableConstructionReferences]'
GO
ALTER TABLE [dbo].[tblCableConstructionReferences] DROP CONSTRAINT [FK_tblCableConstructionReferences_Buff#1/#2 Alloc Table]
GO
PRINT N'Dropping foreign keys from [dbo].[tblCableFamilyDocs]'
GO
ALTER TABLE [dbo].[tblCableFamilyDocs] DROP CONSTRAINT [FK_tblCableFamilyDocs_tblCableFamily]
GO
PRINT N'Dropping constraints from [dbo].[Unit Series]'
GO
ALTER TABLE [dbo].[Unit Series] DROP CONSTRAINT [SSMA_CC$Unit Series$Unit Color Series$disallow_zero_length]
GO
PRINT N'Dropping constraints from [dbo].[Buff#1/#2 Alloc Table]'
GO
ALTER TABLE [dbo].[Buff#1/#2 Alloc Table] DROP CONSTRAINT [Buff#1/#2 Alloc Table$PrimaryKey]
GO
PRINT N'Dropping constraints from [dbo].[XXAFL_CAB_DESIGN_ITEMS_ATTR_DELETE]'
GO
ALTER TABLE [dbo].[XXAFL_CAB_DESIGN_ITEMS_ATTR_DELETE] DROP CONSTRAINT [PK_XXAFL_CAB_DESIGN_ITEMS_ATTR]
GO
PRINT N'Dropping constraints from [dbo].[tblCableConstructionsOLD]'
GO
ALTER TABLE [dbo].[tblCableConstructionsOLD] DROP CONSTRAINT [PK_tblCableConstructions2]
GO
PRINT N'Dropping constraints from [dbo].[tblCableConstructionsOLD]'
GO
ALTER TABLE [dbo].[tblCableConstructionsOLD] DROP CONSTRAINT [DF_tblCableConstructions_CablePasses]
GO
PRINT N'Dropping constraints from [dbo].[tblCableConstructionsOLD]'
GO
ALTER TABLE [dbo].[tblCableConstructionsOLD] DROP CONSTRAINT [DF_tblCableConstructions_RevisionDate2]
GO
PRINT N'Dropping constraints from [dbo].[tblCableConstructionsOLD]'
GO
ALTER TABLE [dbo].[tblCableConstructionsOLD] DROP CONSTRAINT [DF__tblCableC__Revis__017F0B4C]
GO
PRINT N'Dropping constraints from [dbo].[tblCableConstructionsOLD]'
GO
ALTER TABLE [dbo].[tblCableConstructionsOLD] DROP CONSTRAINT [DF_tblCableConstructions_DateCreated2]
GO
PRINT N'Dropping constraints from [dbo].[tblCableConstructionsOLD]'
GO
ALTER TABLE [dbo].[tblCableConstructionsOLD] DROP CONSTRAINT [DF_tblCableConstructions_CreatedBy2]
GO
PRINT N'Dropping constraints from [dbo].[tblCableConstructionsOLD]'
GO
ALTER TABLE [dbo].[tblCableConstructionsOLD] DROP CONSTRAINT [DF_tblCableConstructions_RevisedBy2]
GO
PRINT N'Dropping constraints from [dbo].[tblCableTBType]'
GO
ALTER TABLE [dbo].[tblCableTBType] DROP CONSTRAINT [PK_tblCableTBType]
GO
PRINT N'Dropping constraints from [dbo].[tblEmailOptions]'
GO
ALTER TABLE [dbo].[tblEmailOptions] DROP CONSTRAINT [PK_tblEmailOptions]
GO
PRINT N'Dropping constraints from [dbo].[tblItemBuildDescrepancyLog]'
GO
ALTER TABLE [dbo].[tblItemBuildDescrepancyLog] DROP CONSTRAINT [PK_tblItemBuildDescrepancyLog]
GO
PRINT N'Dropping index [Unit Series$Fiber Code] from [dbo].[Unit Series]'
GO
DROP INDEX [Unit Series$Fiber Code] ON [dbo].[Unit Series]
GO
PRINT N'Dropping index [IX_tblCableConstructions_8] from [dbo].[tblCableConstructionsOLD]'
GO
DROP INDEX [IX_tblCableConstructions_8] ON [dbo].[tblCableConstructionsOLD]
GO
PRINT N'Dropping index [IX_tblCableConstructions_7] from [dbo].[tblCableConstructionsOLD]'
GO
DROP INDEX [IX_tblCableConstructions_7] ON [dbo].[tblCableConstructionsOLD]
GO
PRINT N'Dropping index [IX_tblCableConstructions_9] from [dbo].[tblCableConstructionsOLD]'
GO
DROP INDEX [IX_tblCableConstructions_9] ON [dbo].[tblCableConstructionsOLD]
GO
PRINT N'Dropping index [IX_tblCableTightBufferReference] from [dbo].[tblCableTightBufferReference]'
GO
DROP INDEX [IX_tblCableTightBufferReference] ON [dbo].[tblCableTightBufferReference]
GO
PRINT N'Dropping trigger [dbo].[CableConstructionsUpdatetrgr] from [dbo].[tblCableConstructionsOLD]'
GO
DROP TRIGGER [dbo].[CableConstructionsUpdatetrgr]
GO
PRINT N'Dropping [dbo].[usp_SalesHistoryUpdate_BI_DELETE]'
GO
DROP PROCEDURE [dbo].[usp_SalesHistoryUpdate_BI_DELETE]
GO
PRINT N'Dropping [dbo].[usp_CatalogCode_SalesForce_InvokeURL_SalesForce_Update_DEV]'
GO
DROP PROCEDURE [dbo].[usp_CatalogCode_SalesForce_InvokeURL_SalesForce_Update_DEV]
GO
PRINT N'Dropping [dbo].[tblMasterSchedule]'
GO
DROP TABLE [dbo].[tblMasterSchedule]
GO
PRINT N'Dropping [dbo].[tblLeadTime]'
GO
DROP TABLE [dbo].[tblLeadTime]
GO
PRINT N'Dropping [dbo].[tblEmailOptions]'
GO
DROP TABLE [dbo].[tblEmailOptions]
GO
PRINT N'Dropping [dbo].[XXAFL_CAB_DESIGN_ITEMS_ATTR_DELETE]'
GO
DROP TABLE [dbo].[XXAFL_CAB_DESIGN_ITEMS_ATTR_DELETE]
GO
PRINT N'Dropping [dbo].[usp_CatalogCode_SalesForce_UpdateStage]'
GO
DROP PROCEDURE [dbo].[usp_CatalogCode_SalesForce_UpdateStage]
GO
PRINT N'Dropping [dbo].[usp_CatalogCode_SalesForce_NonArmored_Costing_InsertNewBase]'
GO
DROP PROCEDURE [dbo].[usp_CatalogCode_SalesForce_NonArmored_Costing_InsertNewBase]
GO
PRINT N'Dropping [dbo].[usp_CatalogCode_SalesForce_Generator]'
GO
DROP PROCEDURE [dbo].[usp_CatalogCode_SalesForce_Generator]
GO
PRINT N'Dropping [dbo].[usp_CatalogCode_SalesForce_Special_Subunit]'
GO
DROP PROCEDURE [dbo].[usp_CatalogCode_SalesForce_Special_Subunit]
GO
PRINT N'Dropping [dbo].[usp_CatalogCode_SalesForce_NonArmored_Costing]'
GO
DROP PROCEDURE [dbo].[usp_CatalogCode_SalesForce_NonArmored_Costing]
GO
PRINT N'Dropping [dbo].[usp_CatalogCode_SalesForce_PricingUpdate]'
GO
DROP PROCEDURE [dbo].[usp_CatalogCode_SalesForce_PricingUpdate]
GO
PRINT N'Dropping [dbo].[usp_CatalogCode_SalesForce_RemoveDuplicates]'
GO
DROP PROCEDURE [dbo].[usp_CatalogCode_SalesForce_RemoveDuplicates]
GO
PRINT N'Dropping [dbo].[usp_CatalogCode_SalesForce_FlateFile_Export]'
GO
DROP PROCEDURE [dbo].[usp_CatalogCode_SalesForce_FlateFile_Export]
GO
PRINT N'Dropping [dbo].[usp_CatalogCode_SalesForce_InvokeURL_SalesForce_Update]'
GO
DROP PROCEDURE [dbo].[usp_CatalogCode_SalesForce_InvokeURL_SalesForce_Update]
GO
PRINT N'Dropping [dbo].[usp_CatalogCode_SalesForce_Furcation]'
GO
DROP PROCEDURE [dbo].[usp_CatalogCode_SalesForce_Furcation]
GO
PRINT N'Dropping [dbo].[usp_CatalogCode_SalesForce_Descriptions]'
GO
DROP PROCEDURE [dbo].[usp_CatalogCode_SalesForce_Descriptions]
GO
PRINT N'Dropping [dbo].[usp_CatalogCode_SalesForce_Cables]'
GO
DROP PROCEDURE [dbo].[usp_CatalogCode_SalesForce_Cables]
GO
PRINT N'Dropping [dbo].[usp_CatalogCode_SalesForce_Boxed_Items]'
GO
DROP PROCEDURE [dbo].[usp_CatalogCode_SalesForce_Boxed_Items]
GO
PRINT N'Dropping [dbo].[usp_CatalogCode_SalesForce_Armor_Cost_Weight_Create_Table]'
GO
DROP PROCEDURE [dbo].[usp_CatalogCode_SalesForce_Armor_Cost_Weight_Create_Table]
GO
PRINT N'Dropping [dbo].[usp_CatalogCode_SalesForce_Armor_Cost_Weight]'
GO
DROP PROCEDURE [dbo].[usp_CatalogCode_SalesForce_Armor_Cost_Weight]
GO
PRINT N'Dropping [dbo].[tblCableConstructionsOLD]'
GO
DROP TABLE [dbo].[tblCableConstructionsOLD]
GO
PRINT N'Altering [dbo].[tblCableConstructions]'
GO
ALTER TABLE [dbo].[tblCableConstructions] ADD
[JacketStripID] [int] NULL
GO
PRINT N'Altering [dbo].[Basic Product Construction]'
GO
ALTER TABLE [dbo].[Basic Product Construction] ADD
[VendorSpecificFiber] [bit] NULL CONSTRAINT [DF_Basic Product Construction_VendorSpecificFiber] DEFAULT ((0))
GO
PRINT N'Refreshing [dbo].[CableUnion]'
GO
EXEC sp_refreshview N'[dbo].[CableUnion]'
GO
PRINT N'Altering [dbo].[Unit Series]'
GO
ALTER TABLE [dbo].[Unit Series] ALTER COLUMN [Unit Color Series] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
GO
PRINT N'Creating index [Unit Series$Fiber Code] on [dbo].[Unit Series]'
GO
CREATE NONCLUSTERED INDEX [Unit Series$Fiber Code] ON [dbo].[Unit Series] ([Fiber Code], [Unit Color Series], [Unit Type], [Unit ID]) ON [PRIMARY]
GO
PRINT N'Refreshing [dbo].[vScheduling_Construction_SubunitPrintSheet]'
GO
EXEC sp_refreshview N'[dbo].[vScheduling_Construction_SubunitPrintSheet]'
GO
PRINT N'Refreshing [dbo].[vSchedulingCableUnion]'
GO
EXEC sp_refreshview N'[dbo].[vSchedulingCableUnion]'
GO
PRINT N'Altering [dbo].[tblJacketMaterials]'
GO
ALTER TABLE [dbo].[tblJacketMaterials] ADD
[PrinterNote] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO
PRINT N'Altering [dbo].[vBasic_Prod_plus_Basic_Sheath]'
GO
/*
Author:		Bryan Eddy
Date:		5/3/2018
Desc:		View for scheduling
Version:	2
Update:		Added coalesce statement to display a print message if jkt00106 or jkt00105
*/

ALTER VIEW [dbo].[vBasic_Prod_plus_Basic_Sheath]
AS

SELECT I.CM AS CenterMember, I.JacketMaterial AS [Jacket Material], E.[item no],
        E.[customer part#],
        E.customer,
        E.[print type (base)],
		J.PrinterNote,
        E.[new oracle part #],
        E.base,
        E.[jacket color],
        E.[print line 1],
        E.[print line 2],
        E.[print line 3],
        E.[print line 4],
        E.[print reel no],
        E.[print item no],
        E.[print spacing],
        E.[1st req freq],
        E.[2nd req freq],
        E.[Fiber Type],
        E.[Base Oracle],
        E.active,
        E.[revision date],
        E.[revision history],
        E.Fiber2,
        E.PID,
        E.oraclestatus,
        E.enumber,
        E.Fiber3,
        E.customerrev,
        E.Location,
        E.StdOp,
        E.Fiber,
        E.[1st Req Freq - A],
        E.[1st Max Atten - A],
        E.[1st Min BandW - A],
        E.[2nd Req Freq - A],
        E.[2nd Max Atten - A],
        E.[2nd Min BandW - A],
        E.[1st Req Freq - B],
        E.[1st Max Atten - B],
        E.[1st Min BandW - B],
        E.[2nd Req Freq - B],
        E.[2nd Max Atten - B],
        E.[2nd Min BandW - B],
        E.[1st Req Freq - C],
        E.[1st Max Atten - C],
        E.[1st Min BandW - C],
        E.[2nd Req Freq - C],
        E.[2nd Max Atten - C],
        E.[2nd Min BandW - C],
        E.[Print Height],
        E.[FRP Dia],
        E.[color chip id],
        E.CustomerInstructions,
        E.[tb nominal od],
        E.[tb od tol  (-)],
        E.[tb od tol  (+)],
        E.[ez strip],
        E.[tb material],
        E.[tb chips type],
        E.[unit series],
        E.SpecialInstructions1,
        E.SpecialInstructions2, I.JacketMaterial AS JacketMat
      ,[DesignCode]
      ,[DesignExtension]
      ,[ConstructionDescription]
      ,[NumSubFillers]
      ,tblCableConstructionReferences.[Active] AS ActiveConstruction
      ,[PrefixID]
      ,[ProductID]
      ,[SetupID]
      ,[FamilyID]
      ,FibersPerBundle
      ,[UnitIDTypeNumber]
      ,[InactiveReason]
      ,[NumSubPositions]
      ,[TBType]
      ,[CableFamily]
      ,[CableLevel1]
      ,[DesignTypeID]
      ,[NumCopperUnits]
      ,[ReleasedDesign]
      ,[TemperatureApplication]
      ,[TensileApplication]
	  ,[CablePasses]
      ,[StandardOperation]
      ,I.[JacketMaterial]
      ,[NominalOD]
      ,[CM]
      ,[CMMaterial]
      ,[HelixFactor]
FROM (vSchedulingCableUnion E INNER JOIN tblCableConstructionReferences ON E.Base = tblCableConstructionReferences.Base) 
	INNER JOIN tblCableConstructions I ON tblCableConstructionReferences.BaseID = I.BaseID
	LEFT JOIN dbo.tblJacketMaterials J ON J.JacketMaterial = I.JacketMaterial





GO
PRINT N'Refreshing [Setup].[vSetup_Cable_Base]'
GO
EXEC sp_refreshview N'[Setup].[vSetup_Cable_Base]'
GO
PRINT N'Refreshing [dbo].[vSetup_Scheduling_LineSpeed]'
GO
EXEC sp_refreshview N'[dbo].[vSetup_Scheduling_LineSpeed]'
GO
PRINT N'Refreshing [dbo].[vSchedulingConstructionData]'
GO
EXEC sp_refreshview N'[dbo].[vSchedulingConstructionData]'
GO
PRINT N'Rebuilding [dbo].[Buff#1/#2 Alloc Table]'
GO
CREATE TABLE [dbo].[RG_Recovery_1_Buff#1/#2 Alloc Table]
(
[Prefix] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Buffering Factor] [smallint] NULL,
[Date Adjustments] [smallint] NULL,
[Special Notes] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Process Status] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Set-up time level 1] [decimal] (18, 3) NULL,
[Set-up time level 2] [decimal] (18, 3) NULL,
[Buff#11 Line Speed] [decimal] (18, 3) NULL,
[Buff#1 Line Speed] [decimal] (18, 3) NULL,
[Buff#4 Line Speed] [decimal] (18, 3) NULL,
[Buff#6 Line Speed] [decimal] (18, 3) NULL,
[Buff#2 Line Speed] [decimal] (18, 3) NULL,
[Buff#9 Line Speed] [decimal] (18, 3) NULL,
[Buff#10 Line Speed] [decimal] (18, 3) NULL,
[Buff#9 Line Speed (SH)] [decimal] (18, 3) NULL,
[Buff#11 Line Speed (SH)] [decimal] (18, 3) NULL,
[SH#3 Line Speed] [decimal] (18, 3) NULL,
[SH#4 Line Speed] [decimal] (18, 3) NULL,
[C#4 Line Speed] [decimal] (18, 3) NULL,
[Armor Line Speed] [decimal] (18, 3) NULL,
[tbspd] [int] NULL,
[PlannedLotSize] [int] NULL,
[shrinkage limit] [decimal] (18, 3) NULL,
[Sheathing Line] [int] NULL,
[Interlock] [int] NULL,
[ID] [int] NULL,
[PrefixID] [int] NOT NULL IDENTITY(1, 1),
[TimeStamp] [timestamp] NULL,
[PrimaryBufferingLine] [int] NULL,
[B18_Line_Speed] [decimal] (18, 3) NULL,
[B2_Second_Pass] [decimal] (18, 3) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_1_Buff#1/#2 Alloc Table] ON
GO
INSERT INTO [dbo].[RG_Recovery_1_Buff#1/#2 Alloc Table]([Prefix], [Buffering Factor], [Date Adjustments], [Special Notes], [Process Status], [Set-up time level 1], [Set-up time level 2], [Buff#11 Line Speed], [Buff#1 Line Speed], [Buff#4 Line Speed], [Buff#6 Line Speed], [Buff#2 Line Speed], [Buff#9 Line Speed], [Buff#10 Line Speed], [Buff#9 Line Speed (SH)], [Buff#11 Line Speed (SH)], [SH#3 Line Speed], [SH#4 Line Speed], [C#4 Line Speed], [Armor Line Speed], [tbspd], [PlannedLotSize], [shrinkage limit], [Sheathing Line], [Interlock], [ID], [PrefixID], [PrimaryBufferingLine], [B18_Line_Speed], [B2_Second_Pass]) SELECT [Prefix], [Buffering Factor], [Date Adjustments], [Special Notes], [Process Status], [Set-up time level 1], [Set-up time level 2], [Buff#11 Line Speed], [Buff#1 Line Speed], [Buff#4 Line Speed], [Buff#6 Line Speed], [Buff#2 Line Speed], [Buff#9 Line Speed], [Buff#10 Line Speed], [Buff#9 Line Speed (SH)], [Buff#11 Line Speed (SH)], [SH#3 Line Speed], [SH#4 Line Speed], [C#4 Line Speed], [Armor Line Speed], [tbspd], [PlannedLotSize], [shrinkage limit], [Sheathing Line], [Interlock], [ID], [PrefixID], [PrimaryBufferingLine], [B18_Line_Speed], [B2_Second_Pass] FROM [dbo].[Buff#1/#2 Alloc Table]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_1_Buff#1/#2 Alloc Table] OFF
GO
DROP TABLE [dbo].[Buff#1/#2 Alloc Table]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_1_Buff#1/#2 Alloc Table]', N'Buff#1/#2 Alloc Table', N'OBJECT'
GO
PRINT N'Creating primary key [Buff#1/#2 Alloc Table$PrimaryKey] on [dbo].[Buff#1/#2 Alloc Table]'
GO
ALTER TABLE [dbo].[Buff#1/#2 Alloc Table] ADD CONSTRAINT [Buff#1/#2 Alloc Table$PrimaryKey] PRIMARY KEY CLUSTERED  ([PrefixID]) ON [PRIMARY]
GO
PRINT N'Refreshing [dbo].[vSchedulingCableRunSpeeds]'
GO
EXEC sp_refreshview N'[dbo].[vSchedulingCableRunSpeeds]'
GO
PRINT N'Creating [dbo].[PrintedLabelsArchive]'
GO
CREATE TABLE [dbo].[PrintedLabelsArchive]
(
[Reel No] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Order Qty] [int] NOT NULL,
[Previously Printed] [int] NULL,
[Print Now] [int] NULL,
[Completed Buffering] [int] NULL,
[Buff Line #] [smallint] NOT NULL,
[TB PRIORITY] [float] NULL,
[Setup Buff] [int] NULL,
[Setup SZ/SH] [int] NULL,
[Completed Cabling] [int] NULL,
[Make/Ship orders] [int] NULL,
[Sheathing Line #] [smallint] NULL,
[Shipped] [int] NULL,
[Close Date] [datetime] NULL,
[BOM] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BOM Comments] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CM Required] [int] NULL,
[Run Order] [smallint] NULL,
[Early Star Date] [int] NULL,
[Completed TightBuffer] [int] NULL,
[IASeq] [smallint] NULL,
[CabSeq] [int] NULL,
[Sh3Seq] [smallint] NULL,
[SSMA_TimeStamp] [timestamp] NOT NULL,
[DateCreatedArchiveRecord] [datetime] NULL CONSTRAINT [DF_PrintedLabelsArchive_DateCreatedArchiveRecord] DEFAULT (getdate()),
[CreatedByArchiveRecord] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_PrintedLabelsArchive_CreatedByArchiveRecord] DEFAULT (suser_sname()),
[DateCreated] [datetime] NULL CONSTRAINT [DF_PrintedLabelsArchive_DateCreated] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_PrintedLabelsArchive_CreatedBy] DEFAULT (suser_sname()),
[RevisedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_PrintedLabelsArchive_RevisedBy] DEFAULT (suser_sname()),
[DateRevised] [datetime] NULL CONSTRAINT [DF_PrintedLabelsArchive_DateRevised] DEFAULT (getdate()),
[GUID] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
PRINT N'Altering [dbo].[Printed Labels (Data Products)]'
GO
ALTER TABLE [dbo].[Printed Labels (Data Products)] ADD
[DateCreated] [datetime] NULL CONSTRAINT [DF_Printed Labels (Data Products)_DateCreatedArchiveRecord] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_Printed Labels (Data Products)_CreatedByArchiveRecord] DEFAULT (suser_sname()),
[RevisedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_Printed Labels (Data Products)_RevisedBy] DEFAULT (suser_sname()),
[DateRevised] [datetime] NULL CONSTRAINT [DF_Printed Labels (Data Products)_DateRevised] DEFAULT (getdate())
GO
PRINT N'Creating trigger [dbo].[PrintedLabelsArchivetrgr] on [dbo].[Printed Labels (Data Products)]'
GO
-- =============================================
-- Author:		Bryan Eddy
-- Create date: 6/8/2018
-- Description:	Track changes in Printed Labels table
-- =============================================
CREATE TRIGGER [dbo].[PrintedLabelsArchivetrgr]
   ON  [dbo].[Printed Labels (Data Products)] 
   AFTER DELETE,UPDATE
AS 
BEGIN

			  UPDATE t
			  SET t.DateRevised = GETDATE(),
			  t.RevisedBy = (SUSER_SNAME())
			  FROM dbo.[Printed Labels (Data Products)] as t
			  JOIN inserted i
			  ON i.[Reel No] = t.[Reel No] AND i.[Order Qty] = t.[Order Qty]
			

	
	SET NOCOUNT ON;
		IF UPDATE ([Close Date])
		BEGIN	
			DECLARE @INS int, @DEL int

			SELECT @INS = COUNT(*) FROM INSERTED
			SELECT @DEL = COUNT(*) FROM DELETED

			IF @INS > 0 OR @DEL > 0 
		

				INSERT INTO DBO.PrintedLabelsArchive
				(
				    [Reel No],
				    [Order Qty],
				    [Previously Printed],
				    [Print Now],
				    [Completed Buffering],
				    [Buff Line #],
				    [TB PRIORITY],
				    [Setup Buff],
				    [Setup SZ/SH],
				    [Completed Cabling],
				    [Make/Ship orders],
				    [Sheathing Line #],
				    Shipped,
				    [Close Date],
				    BOM,
				    [BOM Comments],
				    [CM Required],
				    [Run Order],
				    [Early Star Date],
				    [Completed TightBuffer],
				    IASeq,
				    CabSeq,
				    Sh3Seq,
					DateCreated,
					DateRevised,
					RevisedBy,
					CreatedBy

				)

					SELECT d.[Reel No],
                           d.[Order Qty],
                           d.[Previously Printed],
                           d.[Print Now],
                           d.[Completed Buffering],
                           d.[Buff Line #],
                           d.[TB PRIORITY],
                           d.[Setup Buff],
                           d.[Setup SZ/SH],
                           d.[Completed Cabling],
                           d.[Make/Ship orders],
                           d.[Sheathing Line #],
                           d.Shipped,
                           d.[Close Date],
                           d.BOM,
                           d.[BOM Comments],
                           d.[CM Required],
                           d.[Run Order],
                           d.[Early Star Date],
                           d.[Completed TightBuffer],
                           d.IASeq,
                           d.CabSeq,
                           d.Sh3Seq,
						   d.DateCreated,
					d.DateRevised,
					d.RevisedBy,
					d.CreatedBy

				FROM DELETED d

				

			END



END
GO
PRINT N'Refreshing [CutSheet].[vImage]'
GO
EXEC sp_refreshview N'[CutSheet].[vImage]'
GO
PRINT N'Altering [dbo].[tblCableTightBufferReference]'
GO
ALTER TABLE [dbo].[tblCableTightBufferReference] ALTER COLUMN [TBIndicatorID] [int] NULL
GO
PRINT N'Creating index [IX_tblCableTightBufferReference] on [dbo].[tblCableTightBufferReference]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblCableTightBufferReference] ON [dbo].[tblCableTightBufferReference] ([TBIndicatorID]) ON [PRIMARY]
GO
PRINT N'Refreshing [dbo].[vSchedulingCableReferences]'
GO
EXEC sp_refreshview N'[dbo].[vSchedulingCableReferences]'
GO
PRINT N'Altering [dbo].[vCosntructionReferenceActiveDesignCodeExtensions]'
GO
/*
Author:		Bryan Eddy
Date:		2/28/2018
Desc:		Consolidated list of active design code extensions to check during item builds
Version:	1
Update:		Initial Creation

*/

ALTER VIEW [dbo].[vCosntructionReferenceActiveDesignCodeExtensions]
AS
SELECT  DISTINCT DesignExtension
FROM dbo.tblCableConstructionReferences
WHERE DesignExtension IS NOT NULL AND Active = 1 AND ReleasedDesign = 1

GO
PRINT N'Refreshing [dbo].[vScheduling_OpenOrders_Items]'
GO
EXEC sp_refreshview N'[dbo].[vScheduling_OpenOrders_Items]'
GO
PRINT N'Refreshing [dbo].[vCableConstructions]'
GO
EXEC sp_refreshview N'[dbo].[vCableConstructions]'
GO
PRINT N'Refreshing [dbo].[vScheduling_OpenOrders]'
GO
EXEC sp_refreshview N'[dbo].[vScheduling_OpenOrders]'
GO
PRINT N'Refreshing [dbo].[vScheduling_OpenOrders_AllComponentsDemand]'
GO
EXEC sp_refreshview N'[dbo].[vScheduling_OpenOrders_AllComponentsDemand]'
GO
PRINT N'Refreshing [dbo].[vBurnListingLengthRequirement]'
GO
EXEC sp_refreshview N'[dbo].[vBurnListingLengthRequirement]'
GO
PRINT N'Refreshing [dbo].[vOracleBaseItems_Newest]'
GO
EXEC sp_refreshview N'[dbo].[vOracleBaseItems_Newest]'
GO
PRINT N'Refreshing [dbo].[vOracleBaseItems_Newest_NoMixedFibers]'
GO
EXEC sp_refreshview N'[dbo].[vOracleBaseItems_Newest_NoMixedFibers]'
GO
PRINT N'Refreshing [dbo].[vFindImages_AllBases]'
GO
EXEC sp_refreshview N'[dbo].[vFindImages_AllBases]'
GO
PRINT N'Creating [SalesForce].[usp_CatalogCode_Armor_Cost_Weight]'
GO


CREATE PROCEDURE [SalesForce].[usp_CatalogCode_Armor_Cost_Weight]
as
BEGIN 



IF OBJECT_ID(N'tempdb..#BaseArmor', N'U') IS NOT NULL
DROP TABLE #BaseArmor

	SELECT JacketLetter, B.NominalOD CoreOD, G.MaxCoreOD, Base, ArmorExtension, G.NominalOD ArmorOD, AmorMaterialCost
	, ArmorWeight, SalesForceDescription, K.BaseID, G.Armor, JacketRating, ArmorCostAdder, P.ArmorSize
	INTO #BaseArmor
	FROM dbo.tblCableConstructionReferences K INNER JOIN dbo.tblCableConstructions B ON K.BaseID = B.BaseID INNER JOIN dbo.tblArmor_Costing_Weight G ON G.JacketLetter = K.CableLevel1
		INNER JOIN dbo.tblDesignTypes E ON E.DesignTypeID = K.DesignTypeID INNER JOIN tblDesignArmor P ON P.Armor = G.Armor
	WHERE B.NominalOD <= G.MaxCoreOD AND E.Armor = 1
	order by base


IF OBJECT_ID(N'tempdb..#BaseMaxArmor', N'U') IS NOT NULL
DROP TABLE #BaseMaxArmor

SELECT MIN(MaxCoreOD) MaxCoreOD, Base, JacketLetter
INTO #BaseMaxArmor
FROM #BaseArmor
GROUP BY Base, JacketLetter


--IF OBJECT_ID(N'ArmorConstructionBase', N'U') IS NOT NULL
--DROP TABLE #ArmorCost
TRUNCATE TABLE ArmorConstructionBase_TEMP;


DECLARE @ErrorNumber INT = ERROR_NUMBER();
DECLARE @ErrorLine INT = ERROR_LINE();

	BEGIN TRY
		BEGIN TRAN

		INSERT INTO ArmorConstructionBase_TEMP
		SELECT Base, Resources + OverHead + AmorMaterialCost as ArmorLoadedCost, ArmorExtension, AmorMaterialCost, ArmorWeight, ArmorOD, Armor, JacketRating, ArmorCostAdder
		,ArmorSize
		--INTO ArmorConstructionBase
		FROM 
		(
			SELECT G.*, 0.02482 + 0.001667 as Resources, 0.12836 as OverHead
			FROM #BaseArmor G INNER JOIN #BaseMaxArmor K ON G.MaxCoreOD = K.MaxCoreOD AND G.Base = K.Base AND K.JacketLetter = G.JacketLetter

		) Armor


		INSERT INTO tblSalesForce_Catalog
								 (CatalogCode, Base, Weight_kg_per_m, 
								 DesignTypeDesc, Jacket, TBType, TBDescription, NominalOD, NumSubFillers, NumSubPositions,FinishedCableColor,TBLetter,
								 CablePasses,FiberCount,UnitOD, BaseID,DesignTypeId, LoadedBaseCost, Armored, 
								 BaseCost, Boxed, OracleItem,Fiber_Type__c,Armor_Type__c,Print_Type__c, Min_Order_Quantity__c, ArmorJacket,FiberID,
								 FurcationTube, SetupID, Non_Standard, Active, ProdLevel3)

		SELECT		CatalogCode  + ArmorExtension, c. Base, Weight_kg_per_m+ArmorWeight, 
								 C.DesignTypeDesc, Jacket, TBType, TBDescription, ArmorOD, NumSubFillers, NumSubPositions,FinishedCableColor,TBLetter,
								 CablePasses,FiberCount,UnitOD, BaseID,C.DesignTypeId, LoadedBaseCost ,1, 
								 BaseCost ,0 as Boxed, OracleItem,Fiber_Type__c, 'Armored' as Armor_Type__c,Print_Type__c,C.Min_Order_Quantity__c, JacketRating,FiberID
								 ,FurcationTube, SetupID, Non_Standard, C.Active,ProdLevel3
		FROM		ArmorConstructionBase_TEMP A INNER JOIN tblSalesForce_Catalog C ON A.BASE = C.BASE INNER JOIN dbo.tblDesignTypes K ON K.DesignTypeID = C.DesignTypeID
		WHERE		K.Armor = 1 AND C.NominalOD > 2.9

		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;


END

GO
PRINT N'Creating [SalesForce].[usp_CatalogCode_Armor_Cost_Weight_Create_Table]'
GO


CREATE PROCEDURE [SalesForce].[usp_CatalogCode_Armor_Cost_Weight_Create_Table]
as
BEGIN 


DECLARE @ErrorNumber INT = ERROR_NUMBER();
DECLARE @ErrorLine INT = ERROR_LINE();

TRUNCATE TABLE tblArmor_Costing_Weight;

	BEGIN TRY
		BEGIN TRAN
		INSERT INTO tblArmor_Costing_Weight (AmorMaterialCost, ArmorWeight, MaxArmorOD,ArmorExtension, JacketLetter, Armor, MaxCoreOD, NominalOD, Compound, ArmorSize, JacketRating)
		SELECT        ROUND((ColorCost.Item_Cost * 0.03 * tblMaterialDensity.SpecificGravity) * (PI() * (SQUARE((AmorMaterialCost.MaxArmorOD + A.WallThickness * 2) / 2) 
								 - SQUARE(AmorMaterialCost.MaxArmorOD / 2))) / 1000 + (K.Item_Cost * 0.97 * tblMaterialDensity.SpecificGravity) * (PI() 
								 * (SQUARE((AmorMaterialCost.MaxArmorOD + A.WallThickness * 2) / 2) - SQUARE(AmorMaterialCost.MaxArmorOD / 2))) / 1000 + AmorMaterialCost.AmorMaterialCost,6) AS AmorMaterialCost, 


					ROUND(( tblMaterialDensity.SpecificGravity) * (PI()* (SQUARE((AmorMaterialCost.MaxArmorOD + A.WallThickness * 2) / 2) - SQUARE(AmorMaterialCost.MaxArmorOD / 2)))
					 / 1000 + AmorMaterialCost.ArmorUsage,6) AS ArmorWeight, 

								 AmorMaterialCost.MaxArmorOD, A.ArmorExtension, A.JacketLetter, AmorMaterialCost.Armor, AmorMaterialCost.MaxCoreOD, ROUND(A.WallThickness * 2 + AmorMaterialCost.MaxArmorOD, 2) 
								 AS NominalOD, tblMaterialDensity.Compound, ArmorSize, JacketRating
		--INTO	tblArmor_Costing_Weight
		FROM            tblDesignArmorJacket AS A INNER JOIN
								 dbo.AFLPRD_INVSysItemCost_CAB AS K ON A.JacketMaterial = K.ItemNumber INNER JOIN
								 dbo.AFLPRD_INVSysItemCost_CAB AS ColorCost ON ColorCost.ItemNumber = A.ColorChip INNER JOIN
								 tblMaterialDensity ON A.JacketMaterial = tblMaterialDensity.Compound CROSS JOIN
									 (SELECT        tblDesignArmor.MaxCoreOD, tblDesignArmor.MaxArmorOD, armorsize,ArmorUsage,
																 tblDesignArmor.ArmorUsage * dbo.AFLPRD_INVSysItemCost_CAB.Item_Cost AS AmorMaterialCost, tblDesignArmor.Armor
									   FROM            tblDesignArmor INNER JOIN
																 dbo.AFLPRD_INVSysItemCost_CAB ON tblDesignArmor.OracleArmor = dbo.AFLPRD_INVSysItemCost_CAB.ItemNumber) 
								 AS AmorMaterialCost
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;

	BEGIN TRY
		BEGIN TRAN
		UPDATE tblArmor_Costing_Weight
		SET ArmorLoadedCost = 0.02482 + 0.001667 + 0.12836 + AmorMaterialCost
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;


END

GO
PRINT N'Altering [Schedule].[vInactiveItems]'
GO

ALTER VIEW [Schedule].[vInactiveItems]
AS
SELECT K.[New Oracle Part #],K.Reason,k.Customer, I.[Reel No], I.[Order Qty], I.Customer CustomerOrder, P.[Buff Line #], I.[Schedule date], I.Desgin, I.Job#, O.[Promise Date], I.[Shipped Qty]
, P.Shipped, I.[Type Order], CASE WHEN  k.Active = 0 THEN 'No' ELSE 'Yes' end ActiveItem, CASE WHEN r.Active = 0 THEN 'No' ELSE 'Yes' end ActiveConstruction
FROM dbo.[Basic Product Construction] K INNER JOIN dbo.[Cust Order Specifications] I ON I.[Item No] = K.[New Oracle Part #]
INNER JOIN dbo.[Printed Labels (Data Products)] P ON  P.[Order Qty] = I.[Order Qty] AND p.[Reel No] = i.[Co Number]
INNER JOIN dbo.[New Orders Spreadsheet] O ON O.[Order #] = I.[Reel No]
INNER JOIN dbo.tblCableConstructionReferences R ON R.BASE = K.Base
WHERE (K.Active = 0 OR r.active = 0)  AND P.Shipped = 0 AND I.[Type Order] IN ('new' , 'sset') 
AND LEFT(K.[New Oracle Part #],2) NOT IN ('bu','rb','fb','cu')
GO
PRINT N'Creating [SalesForce].[usp_CatalogCode_Boxed_Items]'
GO
-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 10/19/2016
-- Description:	Sales Force catalog code procedure to update eligigle items to have box indicators
-- =============================================
CREATE PROCEDURE [SalesForce].[usp_CatalogCode_Boxed_Items]

AS
BEGIN

DECLARE @ErrorNumber INT = ERROR_NUMBER();
DECLARE @ErrorLine INT = ERROR_LINE();


	BEGIN TRY
		BEGIN TRAN

		INSERT INTO tblSalesForce_Catalog
								 (CatalogCode, Base, Weight_kg_per_m, 
								 DesignTypeDesc, Jacket, TBType, TBDescription, NominalOD, NumSubFillers, NumSubPositions,FinishedCableColor,TBLetter
								 ,CablePasses,FiberCount,UnitOD, BaseID,DesignTypeId, Armored,Boxed, 
								 BoxedLength_FT,LoadedBaseCost,BaseCost,OracleItem,Fiber_Type__c,Packaging__c,UOM__c,Print_Type__c,Min_Order_Quantity__c,FiberID
								 ,FurcationTube,SetupID, Non_Standard, Active,ProdLevel3,Minimum_Order_Multiple__c)

		SELECT				CatalogCode+BoxExtension, Base, Weight_kg_per_m, 
								 DesignTypeDesc, Jacket, TBType, TBDescription, NominalOD, NumSubFillers, NumSubPositions,FinishedCableColor,TBLetter
								 ,CablePasses,FiberCount,UnitOD, BaseID,A.DesignTypeId, 0,1, 
								 FeetCablePerBox,LoadedBaseCost, BaseCost ,OracleItem,Fiber_Type__c,'Box' as Packaging__c, 'Each' as UOM__c,Print_Type__c,Minimum_Order_Multiple,FiberID
								 ,FurcationTube, SetupID, Non_Standard, Active,ProdLevel3,Minimum_Order_Multiple
		  FROM [Premise].[dbo].[tblDesignCode_BoxedFiber] A INNER JOIN tblSalesForce_Catalog K ON k.DesignTypeID = A.DesignTypeID
		WHERE NominalOD <= MaxOD AND K.Armored <> 1 and tbtype <>'furcation' --AND Base LIKE 'C%'

		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;


END


GO
PRINT N'Creating [SalesForce].[usp_CatalogCode_Cables]'
GO
-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 10/5/2016
-- Description:	Generate the catalog code and attributes for Sales Force Quoting - Appends All base cables to the table
-- Update:		Added error handling
-- Version:		3
-- =============================================
CREATE PROCEDURE [SalesForce].[usp_CatalogCode_Cables] 

AS
BEGIN



	--EXEC [OracleExtracts].[dbo].[usp_BOMCalculator_AllCables]


DELETE FROM tblSalesForce_Catalog

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	--IF OBJECT_ID (N'dbo.tblSalesForce_Catalog_Generator', N'U') IS NOT NULL
	--DROP TABLE dbo.tblSalesForce_Catalog_Generator;


	--Code appends all non-furcation cables to tblSalesForce_Catalog


DECLARE @ErrorNumber INT = ERROR_NUMBER();
DECLARE @ErrorLine INT = ERROR_LINE();


	BEGIN TRY
		BEGIN TRAN

		INSERT  INTO tblSalesForce_Catalog
								 (CatalogCode, Base,Weight_kg_per_m, 
								 DesignTypeDesc, Jacket, TBType, TBDescription, NominalOD, NumSubFillers, NumSubPositions
								 ,CablePasses,FiberCount,UnitOD, BaseID,DesignTypeId, Armored,Boxed, Fiber_Type__c,Print_Type__c, Min_Order_Quantity__c,FiberID,FinishedCableColor,TBLetter,SetupID
								 , Active,Non_Standard, ProdLevel3)
		SELECT DISTINCT 
								 LEFT(tblCableConstructionReferences.DesignCode, 5) + tblDesignCodeFiberElementValue.FiberLetter + SUBSTRING(tblCableConstructionReferences.DesignCode, 6, 2) 
								 + tblDesignCodeFiberElementValue.CablePrintType
								 + COALESCE(tblDesignTypeS.DefaultFamilyColor,tblDesignCodeFiberElementValue.PreferedCableColor)
								 --+ FinishedColor.ColorLetter
								 + CASE WHEN tblCableConstructions.CablePasses = 1 AND tblCableConstructionReferences.TBType <> 'Ribbon' THEN '0' 
										WHEN tblCableTightBufferReference.TBTypeID = 20 THEN 'X'
										WHEN tblCableConstructionReferences.TBType = 'Ribbon' THEN '1'
										ELSE 
											--FinishedColor.ColorLetter
											COALESCE(tblDesignTypeS.DefaultFamilyColor,tblDesignCodeFiberElementValue.PreferedCableColor )
									END
								  + tblCableTBType.TBLetter + CASE WHEN [DesignExtension] IS NULL 
								 THEN '' ELSE [DesignExtension] END + + COALESCE(tblDesignCodeFiberElementValue.FiberExt,'') AS CatalogCode, tblCableConstructionReferences.Base, 
								  tblBOM_Base_Weight.Weight AS Weight_kg_per_m, tblDesignTypes.SalesForceDescription, 
								 JacketDescription_SalesForce, tblCableConstructionReferences.TBType, tblCableTBType.TightBufferDescription_SalesForce, 
								 tblCableConstructions.NominalOD, tblCableConstructionReferences.NumSubFillers, tblCableConstructionReferences.NumSubPositions,
								 tblCableConstructions.CablePasses, FiberCount--cast(substring(tblCableConstructionReferences.DesignCode, 3,3) as int) FiberCount
								 ,CASE WHEN tblCableConstructionReferences.TBType = 'Ribbon' THEN SUBSTRING(tblCableConstructionReferences.DesignCode, 6,2) 
								 ELSE (SUBSTRING(tblCableConstructionReferences.DesignCode, 6,1) + '.' + SUBSTRING(tblCableConstructionReferences.DesignCode, 7,1))+' mm'  END UnitOD
								 , tblCableConstructionReferences.BaseID, dbo.tblCableConstructionReferences.DesignTypeID
								 ,0 AS Armored
								 ,0 AS Boxed
								 ,Fiber_Type__c
								 ,CASE WHEN tblDesignCodeFiberElementValue.CablePrintType = 1 THEN 'AFL Standard'
									WHEN tblDesignCodeFiberElementValue.CablePrintType = 2 THEN 'Generic'
									END  AS Print_Type__c
								,tblDesignTypes.Min_Order_Quantity__c
								,tblDesignCodeFiberElementValue.FiberID
								,CASE WHEN tblDesignTypeS.DefaultFamilyColor IS NOT NULL THEN tblDesignTypeS.DefaultFamilyColor ELSE tblDesignCodeFiberElementValue.PreferedCableColor END
								,tblCableTBType.TBLetter
								,tblCableConstructionReferences.SetupID
								, tblCableConstructionReferences.ReleasedDesign
								, tblCableTBType.Non_Standard_Product
								, tblDesignTypeGroups.DesignTypeGroupDesc
		FROM            tbl_Fibers INNER JOIN SalesForce.FiberToFiberDescriptionQuoting FiberLink ON FiberLink.FiberItemID = tbl_Fibers.FiberItemID
								 INNER JOIN tblDesignCodeFiberElementValue ON tblDesignCodeFiberElementValue.FiberID = FiberLink.FiberID
								 INNER JOIN tblFiberTBCatalog ON tbl_Fibers.TBCatalogType = tblFiberTBCatalog.TBCatalogType INNER JOIN
								 tblFiberTBIndicators ON tblFiberTBCatalog.TBCatalogType = tblFiberTBIndicators.TBCatalogType INNER JOIN
								 tblBOM_Base_Weight INNER JOIN
								 tblCableTBType INNER JOIN
								 tblCableConstructionReferences INNER JOIN
								 tblCableTightBufferReference ON tblCableConstructionReferences.TBType = tblCableTightBufferReference.TBType INNER JOIN
								 tblCableConstructions ON tblCableConstructionReferences.BaseID = tblCableConstructions.BaseID ON 
								 tblCableTBType.TBIndicatorID = tblCableTightBufferReference.TBTypeID ON tblBOM_Base_Weight.BASE = tblCableConstructionReferences.Base INNER JOIN
								 tblDesignTypes ON tblCableConstructionReferences.DesignTypeID = tblDesignTypes.DesignTypeID INNER JOIN
								 tblDesignTypeGroups ON tblDesignTypes.DesignTypeGroupID = tblDesignTypeGroups.DesignTypeGroupID INNER JOIN
								 tblDesignCodeJacket ON tblCableConstructionReferences.CableFamily = tblDesignCodeJacket.CableLetter AND 
								 tblCableConstructionReferences.CableLevel1 = tblDesignCodeJacket.JacketLetter ON tblFiberTBIndicators.TBLetter = tblCableTBType.TBLetter 
		WHERE          (tblDesignCodeFiberElementValue.Active = 1) AND tblCableConstructionReferences.ApprovedForQuoting = 1 AND
								 (tblDesignCodeFiberElementValue.FiberLetter NOT LIKE '%@%') AND (tblCableConstructionReferences.DesignTypeID IS NOT NULL) AND (tblDesignTypes.Active = 1) 
								AND (tblDesignTypeGroups.Active = 1) 
								 AND (tblCableConstructionReferences.TBType <> 'Furcation' ) AND (tblCableConstructionReferences.ApprovedForQuoting = 1) 
								 AND (tbl_Fibers.Active = 1) AND dbo.tblCableTBType.Active = 1



		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;


END




GO
PRINT N'Creating [SalesForce].[usp_CatalogCode_Descriptions]'
GO
-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 11/1/2016
-- Description:	ALTER item description for armored items, cables, and furcation tubes for the sales force quoting system
-- Version: 2
-- Update:	Added error handling
-- =============================================
CREATE PROCEDURE [SalesForce].[usp_CatalogCode_Descriptions] 
	-- Add the parameters for the stored procedure here

AS
BEGIN



DECLARE @ErrorNumber INT = ERROR_NUMBER();
DECLARE @ErrorLine INT = ERROR_LINE();



	BEGIN TRY
		BEGIN TRAN
		--ALTERs description for all basic cables (non-armored, non-furcation)
		Update dbo.tblSalesForce_Catalog 
		SET Product_Quote_Description__c = K.DesignTypeDesc + ', ' + 
			Case WHEN K.Jacket = 'Riser' or K.Jacket = 'Plenum' THEN k.jacket + ' Rated'
				 ELSE k.jacket 
				 END
			+ ', ' --+ K.COLOR__c +' jacket color, ' 
			+ cast(k.FiberCount as nvarchar ) + ' ' + G.FiberDescription_SalesForce 
				+ ' fibers, ' + CAST(k.UnitOD AS NVARCHAR) + ', RoHS, ' + k.TBDescription
		FROM [dbo].[tblSalesForce_Catalog] K INNER JOIN dbo.tblDesignCodeFiberElementValue G ON K.FiberID = G.FiberID
		WHERE k.TBType <> 'FURCATION'

		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;

	BEGIN TRY
		BEGIN TRAN

		--Descriptin for furcation cables
		Update dbo.tblSalesForce_Catalog 
		SET Product_Quote_Description__c = K.DesignTypeDesc +  ', ' --+ K.COLOR__c +' jacket color, ' 
		+ (CASE WHEN  k.FurcationTube IS NOT NULL THEN K.FurcationTube ELSE 'Furcation' END)
		FROM [dbo].[tblSalesForce_Catalog] K
		WHERE k.TBType = 'FURCATION'

		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;


	BEGIN TRY
		BEGIN TRAN
		--Update armor description for armored cables
		Update dbo.tblSalesForce_Catalog 
		SET Product_Quote_Description__c = Product_Quote_Description__c + ', Aluminum Interlocking armor'-- with a ' + K.ArmorJacket + ' Jacket '
		FROM [dbo].[tblSalesForce_Catalog] K 
		WHERE k.Armored = 1


		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;


	BEGIN TRY
		BEGIN TRAN
		--Update ribbon description
		Update dbo.tblSalesForce_Catalog 
		SET Product_Quote_Description__c = K.DesignTypeDesc + ', ' + 
			Case WHEN K.Jacket = 'Riser' or K.Jacket = 'Plenum' THEN k.jacket + ' Rated'
				 ELSE k.jacket 
				 END
			+ ', ' --+ K.COLOR__c +' jacket color, ' 
			+ cast(k.FiberCount as nvarchar ) + ' ' + G.FiberDescription_SalesForce 
				+ ' fibers, ' + CAST(k.UnitOD AS NVARCHAR) + ', RoHS, ' + k.TBDescription + ', No skew testing required'
		FROM [dbo].[tblSalesForce_Catalog] K INNER JOIN dbo.tblDesignCodeFiberElementValue G ON K.FiberID = G.FiberID
		WHERE k.TBType = 'RIBBON'
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;



END


GO
PRINT N'Altering [dbo].[tblDesignCodeFurcationTube]'
GO
ALTER TABLE [dbo].[tblDesignCodeFurcationTube] ADD
[OdTolPlus] [decimal] (6, 3) NULL,
[OdTolMinus] [decimal] (6, 3) NULL
GO
PRINT N'Creating [SalesForce].[usp_CatalogCode_Furcation]'
GO

-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 10/5/2016
-- Description:	Generate the catalog code and attributes for Sales Force Quoting - Furcation Cables
-- =============================================
CREATE PROCEDURE [SalesForce].[usp_CatalogCode_Furcation] 

AS
BEGIN

DECLARE @ErrorNumber INT = ERROR_NUMBER();
DECLARE @ErrorLine INT = ERROR_LINE();


	BEGIN TRY
		BEGIN TRAN

		INSERT INTO tblSalesForce_Catalog
								 (CatalogCode
								 , Base
								 , Weight_kg_per_m
								 ,DesignTypeDesc
								 , Jacket
								 , TBType
								 , TBDescription
								 , NominalOD
								 , NumSubFillers
								 , NumSubPositions
								 ,CablePasses
								 ,FiberCount
								 ,UnitOD
								 ,baseid
								 ,DesignTypeID
								 ,Armored
								 ,Boxed
								 ,Fiber_Type__c
								 ,Min_Order_Quantity__c
								 ,FiberID
								 , FinishedCableColor,TBLetter
								 ,FurcationTube
								 ,SetupID
								 ,Active
								 ,Non_Standard
								 ,ProdLevel3)
		SELECT DISTINCT 
								 LEFT(tblCableConstructionReferences.DesignCode, 5) + '@' + SUBSTRING(tblCableConstructionReferences.DesignCode, 6, 2) 
								 + tblDesignCodeFiberElementValue.CablePrintType +  tblDesignCodeJacketColor.ColorLetter + CASE WHEN dbo.tblFurcationTubeReference.BaseID IS NULL 
								 THEN '0' ELSE dbo.tblDesignCodeFurcationTube.FurcationLetter END + tblCableTBType.TBLetter + CASE WHEN [DesignExtension] IS NULL 
								 THEN '' ELSE [DesignExtension] END + tblDesignCodeFiberElementValue.FiberExt AS CatalogCode
								 , tblCableConstructionReferences.Base
								 , tblBOM_Base_Weight.Weight AS Weight_kg_per_m
								 , tblDesignTypes.SalesForceDescription
								 , JacketDescription_SalesForce
								 , tblCableConstructionReferences.TBType
								 , tblCableTBType.TightBufferDescription_SalesForce
								 ,tblCableConstructions.NominalOD
								 , tblCableConstructionReferences.NumSubFillers
								 , tblCableConstructionReferences.NumSubPositions 
								 , tblCableConstructions.CablePasses
								 ,NumSubPositions FiberCount
								 ,CASE WHEN tblDesignTypes.DesignTypeID = 21 THEN substring(tblCableConstructionReferences.DesignCode, 6,2) 
								 ELSE (substring(tblCableConstructionReferences.DesignCode, 6,1) + '.' + substring(tblCableConstructionReferences.DesignCode, 7,1))+' mm'  END UnitOD
								 ,tblCableConstructionReferences.BaseID
								 , dbo.tblCableConstructionReferences.DesignTypeID
								 ,0 Armored
								 ,0 Boxed
								 ,Fiber_Type__c
								 ,tblDesignTypes.Min_Order_Quantity__c
								 ,FiberID
								 ,tblDesignCodeFiberElementValue.PreferedCableColor
								,tblCableTBType.TBLetter
								,tblDesignCodeFurcationTube.FurcationTube
								,tblCableConstructionReferences.SetupID
								,tblCableConstructionReferences.Active
								,tblCableTBType.Non_Standard_Product
								,tblDesignTypeGroups.DesignTypeGroupDesc
		FROM            tblDesignCodeFiberElementValue INNER JOIN
								 tblCableTBType INNER JOIN
								 tblDesignCodeJacketColor AS tblDesignCodeJacketColor_1 INNER JOIN
								 tblDesignCodeJacketColor INNER JOIN
								 tblCableConstructionReferences INNER JOIN
								 tblCableTightBufferReference ON tblCableConstructionReferences.TBType = tblCableTightBufferReference.TBType INNER JOIN
								 tblCableConstructions ON tblCableConstructionReferences.BaseID = tblCableConstructions.BaseID ON 
								 tblDesignCodeJacketColor.CablePasses = tblCableConstructions.CablePasses ON 
								 tblDesignCodeJacketColor_1.CablePasses = tblCableConstructions.CablePasses ON tblCableTBType.TBIndicatorID = tblCableTightBufferReference.TBTypeID ON 
								 tblDesignCodeFiberElementValue.PreferedCableColor = tblDesignCodeJacketColor.ColorLetter INNER JOIN
								 tblDesignTypes ON tblCableConstructionReferences.DesignTypeID = tblDesignTypes.DesignTypeID INNER JOIN
								 tblDesignTypeGroups ON tblDesignTypes.DesignTypeGroupID = tblDesignTypeGroups.DesignTypeGroupID INNER JOIN
								 tblDesignCodeJacket ON tblCableConstructionReferences.CableFamily = tblDesignCodeJacket.CableLetter AND 
								 tblCableConstructionReferences.CableLevel1 = tblDesignCodeJacket.JacketLetter LEFT OUTER JOIN
								 tblFurcationTubeReference ON tblCableConstructions.BaseID = tblFurcationTubeReference.BaseID LEFT OUTER JOIN
								 tblDesignCodeFurcationTube ON tblFurcationTubeReference.Furcation = tblDesignCodeFurcationTube.Furcation LEFT OUTER JOIN
								 tblBOM_Base_Weight ON tblCableConstructionReferences.Base = tblBOM_Base_Weight.BASE
		WHERE         (tblDesignCodeFiberElementValue.Active = 1) AND tblCableConstructionReferences.ApprovedForQuoting = 1 AND
								 (tblDesignCodeJacketColor.FinsishedCableColorPosition = 1) AND (tblDesignCodeJacketColor_1.SubunitCableColorPostion = 1) AND 
								 (tblDesignCodeFiberElementValue.FiberLetter = '@') AND (tblCableConstructionReferences.DesignTypeID IS NOT NULL) AND (tblDesignTypes.Active = 1) AND 
								 (tblDesignTypeGroups.Active = 1) AND (tblCableConstructionReferences.TBType = 'Furcation') AND (tblCableConstructionReferences.ApprovedForQuoting = 1)


		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;


END



GO
PRINT N'Creating [SalesForce].[usp_CatalogCode_Special_Subunit]'
GO
-- Author:		Bryan Eddy
-- ALTER date: 10/5/2016
-- Description:	Generate the catalog code and attributes for Sales Force Quoting - Update certain items with the special subunit coloring indicator

-- =============================================
CREATE PROCEDURE [SalesForce].[usp_CatalogCode_Special_Subunit] 
AS
BEGIN


DECLARE @ErrorNumber INT = ERROR_NUMBER();
DECLARE @ErrorLine INT = ERROR_LINE();


	BEGIN TRY
		BEGIN TRAN



		INSERT INTO tblSalesForce_Catalog
								 (CatalogCode, Base, Weight_kg_per_m, 
								 K.DesignTypeDesc, Jacket, TBType, TBDescription, NominalOD, NumSubFillers, NumSubPositions,FinishedCableColor,TBLetter,
								 CablePasses,FiberCount,UnitOD, BaseID,K.DesignTypeId, Armored,Boxed, Print_Type__c, Min_Order_Quantity__c, Fiber_Type__c,FiberID,SetupID
								 ,Non_Standard,Active,ProdLevel3)

		SELECT LEFT(CatalogCode,10) + Special_Subunit_Indicator + SUBSTRING(CatalogCode,12,LEN(CatalogCode)-11), Base, Weight_kg_per_m, 
								 K.DesignTypeDesc, Jacket, TBType, TBDescription, NominalOD, NumSubFillers, NumSubPositions,FinishedCableColor,TBLetter,
								 CablePasses,FiberCount,UnitOD, BaseID,K.DesignTypeId, Armored,Boxed,Print_Type__c,k.Min_Order_Quantity__c,Fiber_Type__c,FiberID,SetupID
								 ,1,k.Active,ProdLevel3
		FROM [dbo].[tblDesignSpecialSubunitColor] CROSS JOIN dbo.tblDesignTypes A  INNER JOIN dbo.tblSalesForce_Catalog K ON A.DesignTypeID = K.DesignTypeID
		WHERE Special_Subunit_Color_X = 1 and CablePasses = 2


		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;


END

GO
PRINT N'Creating [SalesForce].[usp_CatalogCode_RemoveDuplicates]'
GO
-- =============================================
-- Author:      Bryan Eddy
-- Create date: 7/20/2017
-- Description: Delete duplicate records to prevent the Quoting item creation procedure from erroring out.
-- =============================================

CREATE PROCEDURE [SalesForce].[usp_CatalogCode_RemoveDuplicates]
as
BEGIN
	DECLARE @ErrorNumber INT = ERROR_NUMBER();
	DECLARE @ErrorLine INT = ERROR_LINE();
		BEGIN TRY
			BEGIN TRAN
			;WITH cte AS (
				SELECT *, ROW_NUMBER() OVER (PARTITION BY CatalogCode ORDER BY CatalogCode,Base Desc ) AS RowNumber
				FROM 
				(
					SELECT CatalogCode, F.Base,COUNT(F.CatalogCode) OVER (PARTITION BY CatalogCode) Countof--, MAX(G.DateCreated) OVER (PARTITION BY CatalogCode) MaxDateCreated_Construction, G.DateCreated--, MAX(F.DateCreated) OVER (PARTITION BY CatalogCode) MaxDateCreated_Item, f.DateCreated DateCreated_Item
					FROM tblSalesForce_Catalog F --INNER JOIN tblCableConstructionReferences G ON G.Base = F.Base
				)X 
				WHERE Countof > 1
			)
			DELETE cte WHERE RowNumber > 1
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
 
			PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
			PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
			THROW;
		END CATCH;
END
GO
PRINT N'Creating [SalesForce].[usp_CatalogCode_PricingUpdate]'
GO
-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 12/1/2016
-- Description:	Pricing Update for Sales Force Catalogs
-- =============================================

CREATE PROCEDURE [SalesForce].[usp_CatalogCode_PricingUpdate]

AS
-- Update the cost of all cables
BEGIN

DECLARE @ErrorNumber INT = ERROR_NUMBER();
DECLARE @ErrorLine INT = ERROR_LINE();




--******************************
--Pricing for all typical cables.
--********************************
	BEGIN TRY
		BEGIN TRAN
		UPDATE tblSalesForce_Catalog
		SET Price =								(CASE 
														WHEN A.Contribution <> 0 THEN ROUND((K.LoadedBaseCost + K.FiberCount * E.CPQ_Fiber_Cost + A.Contribution) / (1 - T.Multiplier), 3)
														ELSE ROUND((K.BaseCost + K.FiberCount * E.CPQ_Fiber_Cost + A.Contribution) / (1 - T.Multiplier), 3) 
												END ),
			--Price = ROUND((K.LoadedBaseCost + K.FiberCount * E.CPQ_Fiber_Cost + A.Contribution) / (1 - T.Multiplier), 3),
		Loaded_Base_Cost_Fiber_Included__c =    ROUND((K.LoadedBaseCost + K.FiberCount * E.CPQ_Fiber_Cost),3)
		FROM            tblSalesForce_Pricing AS A INNER JOIN
								 tblDesignTypes AS G ON A.Product_Category = G.Product_Pricing_Group INNER JOIN
								 tblSalesForce_Pricing_Multiplier AS T ON A.Product_Category = T.Product_Category INNER JOIN
								 tblSalesForce_Catalog AS K ON T.FiberID = K.FiberID INNER JOIN
								 tblDesignCodeFiberElementValue AS E ON E.FiberID = K.FiberID INNER JOIN
								 tblCableConstructionReferences AS CR ON CR.Base = K.Base AND G.DesignTypeID = CR.DesignTypeID
		WHERE        CR.TBType <> 'furcation' OR CablePasses = 2


		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;

--******************************
--Pricing for furcation cables
--********************************
	BEGIN TRY
		BEGIN TRAN
		UPDATE       tblSalesForce_Catalog
		SET    
		--SELECT            catalogcode,k.base,k.BaseCost,k.loadedbasecost, e.item_cost,t.Multiplier,a.Contribution,P.FiberCount,
						Price = (CASE WHEN A.Contribution <> 0 THEN ROUND((K.LoadedBaseCost + P.FiberCount * E.Item_Cost + A.Contribution) / (1 - T .Multiplier), 3) 
								 ELSE ROUND((K.BaseCost + P.FiberCount * E.Item_Cost + A.Contribution) / (1 - T .Multiplier), 3) END)
		FROM            tblSalesForce_Pricing AS A INNER JOIN
								 tblDesignTypes AS G ON A.Product_Category = G.Product_Pricing_Group INNER JOIN
								 tblSalesForce_Pricing_Multiplier AS T ON A.Product_Category = T.Product_Category INNER JOIN
								 tblSalesForce_Catalog k ON T.FiberID = k.FiberID INNER JOIN
								 tblDesignCodeFurcationTube AS B ON B.FurcationTube = k.FurcationTube INNER JOIN
								 AFLPRD_INVSysItemCost_CAB AS E ON E.ItemNumber = B.Furcation INNER JOIN
								 tblCableConstructionReferences P ON k.Base = P.Base AND 
								 G.DesignTypeID = P.DesignTypeID
		WHERE        (k.TBType = 'furcation') AND (k.CablePasses = 1)
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;

--******************************
--Pricing for boxed cables
--********************************

	BEGIN TRY
		BEGIN TRAN
		-- Update the cost of boxed cables
		UPDATE tblSalesForce_Catalog
		SET	Price = (Price * BoxedLength_FT /3.281) + 45
		FROM tblSalesForce_Catalog
		WHERE boxed = 1

		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;

--******************************
--Pricing for ribbon cables
--********************************

	BEGIN TRY
		BEGIN TRAN

-- Update the cost of Ribbon cables
		UPDATE tblSalesForce_Catalog
		SET 
			Price =								
												 (CASE 
														WHEN A.Contribution <> 0 THEN ROUND((K.LoadedBaseCost + K.FiberCount * E.CPQ_Fiber_Cost + A.Contribution + K.FiberCount*(.207 / 12) ) / (1 - T.Multiplier), 3)
														ELSE ROUND((K.BaseCost + K.FiberCount * E.CPQ_Fiber_Cost + A.Contribution + K.FiberCount*(.207 / 12)*1.02) / (1 - T.Multiplier), 3) 
												END ),
			--Price =ROUND((K.LoadedBaseCost + K.FiberCount * E.CPQ_Fiber_Cost + A.Contribution + (.207 / 12) ) / (1 - T.Multiplier), 3),
			Loaded_Base_Cost_Fiber_Included__c =    ROUND((K.LoadedBaseCost + K.FiberCount * E.CPQ_Fiber_Cost +  K.FiberCount*(.207 / 12)*1.02),3)
		FROM            tblSalesForce_Pricing AS A INNER JOIN
								 tblDesignTypes AS G ON A.Product_Category = G.Product_Pricing_Group INNER JOIN
								 tblSalesForce_Pricing_Multiplier AS T ON A.Product_Category = T.Product_Category INNER JOIN
								 tblSalesForce_Catalog AS K ON T.FiberID = K.FiberID INNER JOIN
								 tblDesignCodeFiberElementValue AS E ON E.FiberID = K.FiberID INNER JOIN
								 tblCableConstructionReferences AS CR ON CR.Base = K.Base AND G.DesignTypeID = CR.DesignTypeID
		WHERE cr.TBType = 'Ribbon' 
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;



--******************************
--Pricing for SWR Cables
--********************************
	BEGIN TRY
		BEGIN TRAN

		UPDATE tblSalesForce_Catalog
		SET 
			Price =				
												(CASE 
														WHEN A.Contribution <> 0 THEN ROUND((K.LoadedBaseCost + K.FiberCount * E.CPQ_Fiber_Cost + A.Contribution +  K.FiberCount*(.10800 / 12) ) / (1 - T.Multiplier), 3)
														ELSE ROUND((K.BaseCost + K.FiberCount * E.CPQ_Fiber_Cost + A.Contribution + K.FiberCount*(.10800 / 12)) / (1 - T.Multiplier), 3) 
												END ),
			--Price = ROUND((K.LoadedBaseCost + K.FiberCount * E.CPQ_Fiber_Cost + A.Contribution + (.10800 / 12) ) / (1 - T.Multiplier), 3),
			Loaded_Base_Cost_Fiber_Included__c =    ROUND((K.LoadedBaseCost + K.FiberCount * E.CPQ_Fiber_Cost + K.FiberCount *(.10800 / 12)),3)
		FROM            tblSalesForce_Pricing AS A INNER JOIN
								 tblDesignTypes AS G ON A.Product_Category = G.Product_Pricing_Group INNER JOIN
								 tblSalesForce_Pricing_Multiplier AS T ON A.Product_Category = T.Product_Category INNER JOIN
								 tblSalesForce_Catalog AS K ON T.FiberID = K.FiberID INNER JOIN
								 tblDesignCodeFiberElementValue AS E ON E.FiberID = K.FiberID INNER JOIN
								 tblCableConstructionReferences AS CR ON CR.Base = K.Base AND G.DesignTypeID = CR.DesignTypeID
		WHERE TBLetter IN( 'r', 's' )
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;


--******************************
--Pricing for armored cables
--********************************
	BEGIN TRY
		BEGIN TRAN
		UPDATE tblSalesForce_Catalog
		SET Price =	Price + G.ArmorCostAdder, LoadedBaseCost = LoadedBaseCost + ArmorLoadedCost, BaseCost = AmorMaterialCost + BaseCost
		FROM            tblSalesForce_Catalog AS K INNER JOIN ArmorConstructionBase_TEMP G ON K.Base = G.Base
		WHERE armored = 1
			
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;
--******************************
--Pricing for mixed fiber cables
--********************************
	BEGIN TRY
		BEGIN TRAN
		UPDATE dbo.tblSalesForce_Catalog 
		SET Loaded_Base_Cost_Fiber_Included__c   = NULL
		WHERE Fiber_Type_Config__c like '%mixed%'

		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;
end



GO
PRINT N'Creating [SalesForce].[usp_CatalogCode_NonArmored_Costing]'
GO
-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 10/19/2016
-- Description:	Costing Update for Sales Force Catalogs
-- =============================================
CREATE PROCEDURE [SalesForce].[usp_CatalogCode_NonArmored_Costing]
AS
BEGIN
DECLARE @ErrorNumber INT = ERROR_NUMBER();
DECLARE @ErrorLine INT = ERROR_LINE();
	BEGIN TRY
		BEGIN TRAN
-- Updates Base item's material cost (minus the fiber)

		UPDATE dbo.tblSalesForce_Catalog
		SET BaseCost = BaseSkeletalCost, OracleItem = AssemblyItemNumber, LoadedBaseCost = x.LoadedBaseCost
		FROM dbo.tblBase_Skeletal_Cost X INNER JOIN dbo.tblSalesForce_Catalog G ON G.SetupID = X.SetupID
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;


END


GO
PRINT N'Creating [SalesForce].[usp_CatalogCode_InvokeUrl_Update]'
GO
/*
-- =============================================
	Author:			Bryan Eddy
	Create date:	12/11/2017
	Description:	Invoke URL to push data to Sales Force
	Version:		2
	Update:			Added header.
-- =============================================

*/
CREATE PROCEDURE [SalesForce].[usp_CatalogCode_InvokeUrl_Update] 


AS
BEGIN
Declare @Object as Int;
Declare @ResponseText as Varchar(8000);


Exec sp_OACreate 'MSXML2.XMLHTTP', @Object OUT;
Exec sp_OAMethod @Object, 'open', NULL, 'get',
                 'http://ci-data.aflglobal.com/PRE_SF_Products', --Your Web Service Url (invoked)
                 'false'
Exec sp_OAMethod @Object, 'send'
Exec sp_OAMethod @Object, 'responseText', @ResponseText OUTPUT

Select @ResponseText

Exec sp_OADestroy @Object


END
GO
PRINT N'Creating [SalesForce].[usp_CatalogCode_FlateFile_Export]'
GO
CREATE PROCEDURE [SalesForce].[usp_CatalogCode_FlateFile_Export]
as


BEGIN
EXEC msdb.dbo.sp_start_job  
    @job_name = N'SalesForce_Catalog_Export'
END


GO
PRINT N'Creating [SalesForce].[usp_CatalogCode_Generator]'
GO
-- =============================================
-- Author:		Bryan Eddy
-- date:		10/5/2016
-- Description:	Generate the catalog code and attributes for Sales Force Quoting
-- Version:		3
-- Update:		Added error handling
-- =============================================
CREATE PROCEDURE [SalesForce].[usp_CatalogCode_Generator] 

AS
BEGIN
SET NOCOUNT ON;

--ALTERs table of BOM weights
--EXEC [OracleExtracts].[dbo].[usp_BOMCalculator_AllCables]
	DECLARE @ErrorNumber INT = ERROR_NUMBER();
	DECLARE @ErrorLine INT = ERROR_LINE();

TRUNCATE TABLE tblSalesForce_Catalog;

--Appends all base cables to tblSalesForce_Catalog
EXEC SalesForce.usp_CatalogCode_Cables;


--Appends all furcation cables to tblSalesForce_Catalog
EXEC SalesForce.usp_CatalogCode_Furcation;


DELETE FROM dbo.tblSalesForce_Catalog 
WHERE (FiberCount > 4 or DesignTypeDesc LIKE '%BREAKOUT%') AND TBType = 'TightBuffer' AND tbletter <>'1'

--Delete OM4+ Spdier web ribbons from catalog code table
DELETE FROM dbo.tblSalesForce_Catalog
WHERE (TBLetter ='r' or TBLetter ='s')  AND CatalogCode like '%+'

--Delete Mixed fiber option for cables with 1 fiber
DELETE  FROM dbo.tblSalesForce_Catalog
where FiberCount = 1 and Fiber_Type__c like '%MIXED%'


		BEGIN TRY
			BEGIN TRAN


			--Update Unit OD for ribbon cables 
			UPDATE       tblSalesForce_Catalog
			SET                UnitOD = tblCableRibbonUnitType.Ribbon_Description
			FROM            tblSalesForce_Catalog INNER JOIN
									 tblCableRibbonUnitType ON tblSalesForce_Catalog.FiberCount = tblCableRibbonUnitType.FiberCount AND 
									 tblSalesForce_Catalog.UnitOD = tblCableRibbonUnitType.RibbonUnitType
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
 
			PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
			PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
			THROW;
		END CATCH;

--Updates all special items in tblSalesForce_Catalog to have X and Z subunits
EXEC SalesForce.usp_CatalogCode_Special_Subunit 

--Updates costing for all non-armored cable in tblSalesForce_Catalog
EXEC SalesForce.usp_CatalogCode_NonArmored_Costing

--Calculates weights and cost for armoring of cables and appends armored versions of the cables into tblSalesForce_Catalog
EXEC SalesForce.usp_CatalogCode_Armor_Cost_Weight

--Identifies which cables can be boxed and appends those cables with the box suffix to tblSalesForce_Catalog
EXEC SalesForce.usp_CatalogCode_Boxed_Items


--Update the color of each cable based on the color indicator
		BEGIN TRY
			BEGIN TRAN
			UPDATE tblSalesForce_Catalog
			SET COLOR__c = G.ColorDescription_SalesForce
			FROM tblSalesForce_Catalog K INNER JOIN [dbo].[tblDesignCodeJacketColor] G ON  G.ColorLetter = K.FinishedCableColor

			COMMIT TRAN
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
 
			PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
			PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
			THROW;
		END CATCH;



--Add spec and image links to each row (non-boxed)
		BEGIN TRY
			BEGIN TRAN
			UPDATE tblSalesForce_Catalog
			SET [ImageURL__c] = G.[ImageURL__c], Product_Spec_link__c = g.Product_Spec_link__c
			FROM tblSalesForce_Catalog K INNER JOIN [dbo].[tblDesignCode_CableImages] G ON k.DesignTypeID = G.DesignTypeID AND K.Armor_Type__c = G.Armor_Type__c  
			WHERE K.Packaging__c = 'REEL'

			COMMIT TRAN
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
 
			PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
			PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
			THROW;
		END CATCH;


--Add spec and image links to Boxed items
		BEGIN TRY
			BEGIN TRAN
			UPDATE tblSalesForce_Catalog
			SET [ImageURL__c] = G.[ImageURL__c], Product_Spec_link__c = g.Product_Spec_link__c
			FROM tblSalesForce_Catalog K CROSS JOIN [dbo].[tblDesignCode_CableImages] G
			WHERE K.Boxed = 1 AND G.Packaging__c = 'box'

			COMMIT TRAN
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
 
			PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
			PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
			THROW;
		END CATCH;

--Update descriptions of each cable
EXEC SalesForce.usp_CatalogCode_Descriptions


--Update lead time ID's for each item
		BEGIN TRY
			BEGIN TRAN
			UPDATE dbo.tblSalesForce_Catalog
			Set Lead_Time_ID__c = 
				CASE WHEN Armor_Type__c = 'Armored' THEN K.LeadTime_ID_Armored
				ELSE K.LeadTime_ID
				END 
			FROM dbo.tblCableConstructionReferences K INNER JOIN DBO.tblSalesForce_Catalog G ON  K.base = g.base	
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
 
			PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
			PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
			THROW;
		END CATCH;
--Update the price of all cables
EXEC SalesForce.usp_CatalogCode_PricingUpdate

--Identify stock items and set Stock__c to 1
		BEGIN TRY
			BEGIN TRAN
			UPDATE DBO.tblSalesForce_Catalog
			SET Stock__b = 1,Stock__c='Yes', Min_Order_Quantity__c = G.Min_Order_Quantity, UOM__c = 'Feet'
			, LoadedBaseCost = LoadedBaseCost /3.281, BaseCost = BaseCost /3.281--, Weight_kg_per_m = Weight_kg_per_m * 0.671969
			,price = G.Price_feet, Lead_Time_ID__c = G.LeadTime_ID
			FROM dbo.tblstockitems G INNER JOIN dbo.tblSalesForce_Catalog K ON G.itemno = k.CatalogCode
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
 
			PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
			PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
			THROW;
		END CATCH;

--Remove -BIF for all Tactical cable products
		BEGIN TRY
			BEGIN TRAN
			UPDATE C
			SET CatalogCode = REPLACE(CatalogCode,'-BIF','')
			FROM dbo.tblSalesForce_Catalog C INNER JOIN dbo.tblDesignTypes I ON I.DesignTypeID = C.DesignTypeID 
			INNER JOIN dbo.tblDesignTypeGroups K ON K.DesignTypeGroupID = I.DesignTypeGroupID
			WHERE I.DesignTypeGroupID = 5 
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
 
			PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
			PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
			THROW;
		END CATCH;

--Update pricing static priced list
/* eABF and Tactical don't want a calculated version.  They have supplied a list they would like the price to reflect*/
--Static price list in Feet
		BEGIN TRY
			BEGIN TRAN
			UPDATE DBO.tblSalesForce_Catalog
			SET   UOM__c = I.UnitOfMeasure
			, LoadedBaseCost = LoadedBaseCost /3.281
			, BaseCost = BaseCost /3.281
			,Loaded_Base_Cost_Fiber_Included__c =Loaded_Base_Cost_Fiber_Included__c/3.281 --, Weight_kg_per_m = Weight_kg_per_m * 0.671969
			,price = G.Price
			FROM SalesForce.ItemPriceOverride G INNER JOIN dbo.tblSalesForce_Catalog K ON G.itemno = k.CatalogCode
			INNER JOIN SalesForce.UnitOfMeasure I ON I.UnitOfMeasureID = G.UnitOfMeasureID
			WHERE G.UnitOfMeasureID = 2
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
 
			PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
			PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
			THROW;
		END CATCH;

--Static Price List in Meters
		BEGIN TRY
			BEGIN TRAN
			UPDATE DBO.tblSalesForce_Catalog
			SET   UOM__c = I.UnitOfMeasure
			, LoadedBaseCost = LoadedBaseCost 
			, BaseCost = BaseCost
			,Loaded_Base_Cost_Fiber_Included__c =Loaded_Base_Cost_Fiber_Included__c --, Weight_kg_per_m = Weight_kg_per_m * 0.671969
			,price = G.Price
			,Status__c = 'Inactive'/*Temporary change to deactivate all Tactical items until teiring is in place*/
			FROM SalesForce.ItemPriceOverride G INNER JOIN dbo.tblSalesForce_Catalog K ON G.itemno = k.CatalogCode
			INNER JOIN SalesForce.UnitOfMeasure I ON I.UnitOfMeasureID = G.UnitOfMeasureID
			WHERE G.UnitOfMeasureID = 1
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
 
			PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
			PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
			THROW;
		END CATCH;

--Remove all tactical cables that are not in the override table
		BEGIN TRY
			BEGIN TRAN
			DELETE dbo.tblSalesForce_Catalog
			FROM dbo.tblSalesForce_Catalog C LEFT JOIN SalesForce.ItemPriceOverride X ON X.ItemNo = C.CatalogCode
			INNER JOIN dbo.tblDesignTypes I ON I.DesignTypeID = C.DesignTypeID 
			INNER JOIN dbo.tblDesignTypeGroups K ON K.DesignTypeGroupID = I.DesignTypeGroupID
			WHERE I.DesignTypeGroupID = 5 --AND X.ItemNo IS NULL
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
 
			PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
			PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
			THROW;
		END CATCH;

--Updating binary fields to Salesforce defined values
		BEGIN TRY
			BEGIN TRAN
			UPDATE dbo.tblSalesForce_Catalog
			  SET Non_Standard_Design__c = (CASE WHEN Non_Standard = 1 THEN 'TRUE' ELSE 'FALSE' END),
			   Distributor_Price_List__c = (CASE WHEN Stock__b = 1 THEN 'Yes' ELSE 'No' END),
			   Override__c = (CASE WHEN Stock__b = 1 THEN 'TRUE' ELSE 'FALSE' END),
			   Fiber_Count_Config__c = FiberCount,
			   Fiber_Type_Config__c = Fiber_Type__c,
			   Status__c = (CASE WHEN Active = 1 THEN 'Active' ELSE 'Inactive' END ),
			   Premise_Design_Program_Synch_ID = CatalogCode, 
			   Subunit_Color__c = (CASE WHEN CablePasses = 2 THEN COLOR__c ELSE Subunit_Color__c END),
			   Jacket_Print__c = Print_Type__c;
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
 
			PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
			PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
			THROW;
		END CATCH;

--Remove the Subunit_Color_Position__c indicator for single pass cables
		BEGIN TRY
			BEGIN TRAN
			UPDATE tblSalesForce_Catalog
			SET Subunit_Color_Position__c = NULL
			WHERE CablePasses = 1 ;
			COMMIT TRAN
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
 
			PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
			PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
			THROW;
		END CATCH;


--Remove MultiMode SWR types
DELETE FROM tblSalesForce_Catalog
WHERE TBType LIKE '%SPIDER%' AND SUBSTRING(CatalogCode,12,1) = 'S'

--DELETE any duplicates that may be housed in the table.
EXEC SalesForce.usp_CatalogCode_RemoveDuplicates


EXEC SalesForce.usp_CatalogCode_FlateFile_Export;

--If the count of SalesForce_Catalog table is < 30k then send Bryan an email and don't run SF update

exec SalesForce.usp_CatalogCode_InvokeUrl_Update ;



END



GO
PRINT N'Altering [dbo].[vFiber]'
GO
ALTER VIEW [dbo].[vFiber]
AS
SELECT        Fiber, [SM/MM], BIF, OM#, SpecialNotes, Fiber_Type, Alt1_Fiber_Type, Alt2_Fiber_Type, Alt3_Fiber_Type, Alt4_Fiber_Type, Description_Oracle, Active, Mode, 
                         Vendor, TBCatalogType, OpticalID,  ITU
FROM            dbo.tbl_Fibers
GO
PRINT N'Refreshing [dbo].[vOracleBaseItems]'
GO
EXEC sp_refreshview N'[dbo].[vOracleBaseItems]'
GO
PRINT N'Refreshing [dbo].[FurcationTube_Fill_Ratio]'
GO
EXEC sp_refreshview N'[dbo].[FurcationTube_Fill_Ratio]'
GO
PRINT N'Refreshing [PrintSafe].[vInterfacePrintView]'
GO
EXEC sp_refreshview N'[PrintSafe].[vInterfacePrintView]'
GO
PRINT N'Creating [SalesForce].[usp_CatalogCode_NonArmored_Costing_InsertNewBase]'
GO

-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 12/2/2016
-- Description:	Insert new base costs into tblBase_Skeletal_Cost
-- Version:		1 
-- Update:		refactored into a merge statement
--				added error handling
-- =============================================
CREATE PROCEDURE [SalesForce].[usp_CatalogCode_NonArmored_Costing_InsertNewBase]
AS

BEGIN

SET NOCOUNT ON;

DECLARE @ErrorNumber INT = ERROR_NUMBER();
DECLARE @ErrorLine INT = ERROR_LINE();
	BEGIN TRY
		BEGIN tran

			INSERT INTO  dbo.tblBase_Skeletal_Cost( Base, BaseSkeletalCost, AssemblyItemNumber, LoadedBaseCost, SetupID)

			SELECT Base, SUM(MaterialCost) AS BaseSkeletalCost, AssemblyItemNumber, SUM(MaterialCost) AS LoadedBaseCost, SetupID

			FROM
			(
				SELECT d.AssemblyItemNumber,e.ComponentItemNumber,SUM(e.ExtendedQuantityPer*S.Material_Cost) AS MaterialCost,e.[PrimaryUOM],s.Make_Buy , SUM(e.UnitCost) AS UnitCost,  d.base, D.SetupID
				FROM  [dbo].vOracleBaseItems AS d CROSS APPLY [dbo].[fn_ExplodeBOM](D.AssemblyItemNumber) AS e 
				INNER JOIN [dbo].[AFLPRD_INVSysItemCost_CAB] AS S ON e.ComponentItemNumber = s.ItemNumber LEFT JOIN dbo.tblBase_Skeletal_Cost G ON G.SetupID = D.SetupID
				GROUP BY  e.ComponentItemNumber,d.AssemblyItemNumber,e.[PrimaryUOM],s.Make_Buy , e.UnitCost, d.base, D.SetupID,G.SetupID
				HAVING s.Make_Buy = 'buy' AND NOT (e.ComponentItemNumber LIKE 'fbr%' OR e.ComponentItemNumber LIKE 'rbn%' OR e.ComponentItemNumber LIKE 'swr%' OR e.ComponentItemNumber LIKE 'frc%') 
				--AND d.Base = 'GQ072-2.0A' 
						AND G.SetupID IS NULL
						--(e.ComponentItemNumber  like 'rbn%' AND e.ComponentItemNumber  like '%osp%' and e.ComponentItemNumber  like '%rbn%f%')))
						--OR  (e.ComponentItemNumber like 'swr%' AND e.ComponentItemNumber  LIKE  '%osp%'))
				--having s.make_buy = 'buy' and base = 'GQ048-3.0-SW'
			)X 
			GROUP BY X.BASE, x.AssemblyItemNumber, X.SetupID 

		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;

	BEGIN TRY
		BEGIN tran

			UPDATE dbo.tblBase_Skeletal_Cost
			SET LoadedBaseCost = g.Resource_Cost + g.Overhead_Cost + BaseSkeletalCost
			FROM dbo.tblBase_Skeletal_Cost X INNER JOIN  dbo.AFLPRD_INVSysItemCost_CAB G ON G.ItemNumber = X.AssemblyItemNumber

		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;


END


GO
PRINT N'Creating [SalesForce].[usp_CatalogCode_UpdateStage]'
GO
/****** Script for SelectTopNRows command from SSMS  ******/

CREATE PROCEDURE [SalesForce].[usp_CatalogCode_UpdateStage]
AS
BEGIN
	TRUNCATE TABLE tblSalesForce_Catalog_Stage

	DECLARE @ErrorNumber INT = ERROR_NUMBER();
	DECLARE @ErrorLine INT = ERROR_LINE();


		BEGIN TRY
			BEGIN TRAN

			INSERT INTO tblSalesForce_Catalog_Stage
									 (CatalogCode, Base, Weight_kg_per_m, DesignTypeDesc, Jacket, TBType, TBDescription, NominalOD, NumSubFillers, NumSubPositions, CablePasses, BaseID, 
									 BaseCost, FiberCount, UnitOD, OracleItem, COLOR__c, LoadedBaseCost, Armored, Boxed, BoxedLength_FT, DesignTypeID, DateCreated, Fiber_Type__c, 
									 Armor_Type__c, Packaging__c, UOM__c, Stock__c, Lead_Time_ID__c, ImageURL__c, Product_Spec_Link__c, Min_Order_Quantity__c, Print_Type__c, 
									 Product_Quote_Description__c, ArmorJacket, FiberID, TBLetter, FinishedCableColor, FurcationTube, SetupID,Non_Standard, Active, Price, ProdLevel1, ProdLevel2, ProdLevel3, ID)
			SELECT        CatalogCode, Base, Weight_kg_per_m, DesignTypeDesc, Jacket, TBType, TBDescription, NominalOD, NumSubFillers, NumSubPositions, CablePasses, BaseID, 
									 BaseCost, FiberCount, UnitOD, OracleItem, COLOR__c, LoadedBaseCost, Armored, Boxed, BoxedLength_FT, DesignTypeID, DateCreated, Fiber_Type__c, 
									 Armor_Type__c, Packaging__c, UOM__c, Stock__c, Lead_Time_ID__c, ImageURL__c, Product_Spec_Link__c, Min_Order_Quantity__c, Print_Type__c, 
									 Product_Quote_Description__c, ArmorJacket, FiberID, TBLetter, FinishedCableColor, FurcationTube, SetupID, Non_Standard, Active, Price, ProdLevel1, ProdLevel2, 
									 ProdLevel3, ID
			FROM            tblSalesForce_Catalog

			COMMIT TRAN
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
 
			PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
			PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
			THROW;
		END CATCH;
END
GO
PRINT N'Refreshing [dbo].[vFillersActive]'
GO
EXEC sp_refreshview N'[dbo].[vFillersActive]'
GO
PRINT N'Refreshing [dbo].[vScheduling_Gantt_TightBuffer]'
GO
EXEC sp_refreshview N'[dbo].[vScheduling_Gantt_TightBuffer]'
GO
PRINT N'Altering [Setup].[TightBufferSetupRecipe]'
GO


ALTER VIEW [Setup].[TightBufferSetupRecipe]
AS
SELECT        BasicProductConstruction.[New Oracle Part #], BasicProductConstruction.[Item No], BasicProductConstruction.[Fiber Type], BasicProductConstruction.[Jacket Material], BasicProductConstruction.[EZ Strip] AS EZStrip, 
                         BasicProductConstruction.[TB Material], BasicProductConstruction.[TB Chips Type], BasicProductConstruction.[TB Nominal OD], BasicProductConstruction.[TB OD Tol  (+)], BasicProductConstruction.[TB OD Tol  (-)], 
                         BasicProductConstruction.[1st Req Freq], BasicProductConstruction.[1st Max Atten], BasicProductConstruction.[1st Min BandW], BasicProductConstruction.[2nd Req Freq], BasicProductConstruction.[2nd Max Atten], 
                         BasicProductConstruction.[2nd Min BandW], BasicProductConstruction.[SM 1300 Max Atten], BasicProductConstruction.[SM 1550 Max Atten], BasicProductConstruction.[Special Instr Product1], 
                         BasicProductConstruction.[Jacket Color], RIGHT(BasicProductConstruction.[New Oracle Part #], 2) AS right2, BasicProductConstruction.[Fiber Oracle item], BasicProductConstruction.[Cable Type], 
                         tblCableConstructions.StandardOperation, tblCableConstructions.JacketMaterial, tblCableConstructions.NominalOD, tblCableConstructions.ODTolPlus, tblCableConstructions.ODTolMinus, tblCableConstructions.Height, 
                         tblCableConstructions.HeightTolPlus, tblCableConstructions.HeightTolMinus, tblCableConstructions.NominalWall, tblCableConstructions.MaxAveWall, tblCableConstructions.MinAveWall, tblCableConstructions.MinSpotWall, 
                         tblCableConstructions.AramidType1, tblCableConstructions.AramidEnds1, tblCableConstructions.AramidType2, tblCableConstructions.AramidEnds2, tblCableConstructions.ChipType, tblCableConstructions.Ripcord, 
                         tblCableConstructions.LayLength, tblCableConstructions.Talc, tblCableConstructions.FRP_Dia, tblCableConstructions.CM, tblCableConstructions.CMMaterial, tblCableConstructions.CM_OD, tblCableConstructions.CMODTolPlus, 
                         tblCableConstructions.CMODTolMinus, tblCableConstructions.CMWall, tblCableConstructions.CMMinWall, tblCableConstructions.HelixFactor, tblCableConstructions.CoreWrap, tblCableConstructions.CoreDia, 
                         tblCableConstructions.Binder1, tblCableConstructions.QtyBinder1, tblCableConstructions.Binder1LayLength, tblCableConstructions.Binder2, tblCableConstructions.QtyBinder2, tblCableConstructions.Binder2LayLength, 
                         tblCableConstructions.Binder3, tblCableConstructions.QtyBinder3, tblCableConstructions.Binder3LayLength, tblCableConstructions.CablePasses, tblCableConstructions.RevisionDate, tblCableConstructions.RevisionNumber, 
                         tblCableConstructions.RevisionHistory, tblCableConstructions.Instructions2, tblCableConstructions.Instructions, tblCableConstructionReferences.Active, tblTightBufferSetup.PSS, tblTightBufferSetup.Recipe, 
                         vColor_Chip_Jacket_Material.ColorChip, tblTightBufferStripType.ID, tblTightBufferSetup.MachineGroupID, K.MachineName, BasicProductConstruction.Base, Filler, TBType
FROM            tblCableConstructions INNER JOIN
                         dbo.BasicProductConstruction INNER JOIN
                         tblCableConstructionReferences ON BasicProductConstruction.Base = tblCableConstructionReferences.Base ON tblCableConstructions.BaseID = tblCableConstructionReferences.BaseID INNER JOIN
                         tblTightBufferSetup INNER JOIN
                         tblTightBufferStripType ON tblTightBufferSetup.TightBufferStrip = tblTightBufferStripType.TightBufferStrip ON tblCableConstructions.NominalOD = tblTightBufferSetup.ZumbachLibrarySetting AND 
                         tblCableConstructions.JacketMaterial = tblTightBufferSetup.Compound AND BasicProductConstruction.[EZ Strip] = tblTightBufferStripType.TightBufferStrip INNER JOIN
                         [Product Desrcriptions] ON [Product Desrcriptions].SubFiller = tblTightBufferSetup.Filler AND tblCableConstructionReferences.SetupID = [Product Desrcriptions].ProductID INNER JOIN
                         vColor_Chip_Jacket_Material ON BasicProductConstruction.[Jacket Color] = vColor_Chip_Jacket_Material.Color AND tblCableConstructions.JacketMaterial = vColor_Chip_Jacket_Material.JacketMaterial INNER JOIN
                         tblTightBufferMachines AS K ON K.MachineGroupID = tblTightBufferSetup.MachineGroupID
WHERE        (tblCableConstructionReferences.Active <> 0)
GO
PRINT N'Refreshing [dbo].[vCatalogTightBufferType]'
GO
EXEC sp_refreshview N'[dbo].[vCatalogTightBufferType]'
GO
PRINT N'Refreshing [dbo].[vBurnListingInventory]'
GO
EXEC sp_refreshview N'[dbo].[vBurnListingInventory]'
GO
PRINT N'Refreshing [dbo].[vArmorCoreItems_Approvals]'
GO
EXEC sp_refreshview N'[dbo].[vArmorCoreItems_Approvals]'
GO
PRINT N'Refreshing [dbo].[vExtrusionMaterialsItem]'
GO
EXEC sp_refreshview N'[dbo].[vExtrusionMaterialsItem]'
GO
PRINT N'Refreshing [Setup].[vSetup_Scheduling_LineSpeed]'
GO
EXEC sp_refreshview N'[Setup].[vSetup_Scheduling_LineSpeed]'
GO
PRINT N'Refreshing [Schedule].[vInterfaceItemAttributes]'
GO
EXEC sp_refreshview N'[Schedule].[vInterfaceItemAttributes]'
GO
PRINT N'Refreshing [dbo].[vColor_Chip_OracleItem]'
GO
EXEC sp_refreshview N'[dbo].[vColor_Chip_OracleItem]'
GO
PRINT N'Refreshing [dbo].[vCableTightBufferType]'
GO
EXEC sp_refreshview N'[dbo].[vCableTightBufferType]'
GO
PRINT N'Refreshing [dbo].[vSinglePassComponentParent]'
GO
EXEC sp_refreshview N'[dbo].[vSinglePassComponentParent]'
GO
PRINT N'Altering [dbo].[tblCorningPrint]'
GO
ALTER TABLE [dbo].[tblCorningPrint] ADD
[VendorGUID] [uniqueidentifier] NULL
GO
PRINT N'Refreshing [dbo].[vCorningPrintFiberExtension]'
GO
EXEC sp_refreshview N'[dbo].[vCorningPrintFiberExtension]'
GO
PRINT N'Refreshing [dbo].[vqryPremiseItemDetails_Union]'
GO
EXEC sp_refreshview N'[dbo].[vqryPremiseItemDetails_Union]'
GO
PRINT N'Refreshing [dbo].[vqryPremiseItems]'
GO
EXEC sp_refreshview N'[dbo].[vqryPremiseItems]'
GO
PRINT N'Refreshing [dbo].[vSubunitConstruction]'
GO
EXEC sp_refreshview N'[dbo].[vSubunitConstruction]'
GO
PRINT N'Refreshing [dbo].[vCreateItemBaseFurcation]'
GO
EXEC sp_refreshview N'[dbo].[vCreateItemBaseFurcation]'
GO
PRINT N'Refreshing [dbo].[qrySelectItemNumber]'
GO
EXEC sp_refreshview N'[dbo].[qrySelectItemNumber]'
GO
PRINT N'Refreshing [dbo].[vFiber_Planning_Schedule]'
GO
EXEC sp_refreshview N'[dbo].[vFiber_Planning_Schedule]'
GO
PRINT N'Refreshing [dbo].[vCableQualities]'
GO
EXEC sp_refreshview N'[dbo].[vCableQualities]'
GO
PRINT N'Refreshing [dbo].[vOracleItemsUncommoned]'
GO
EXEC sp_refreshview N'[dbo].[vOracleItemsUncommoned]'
GO
PRINT N'Refreshing [dbo].[vDesignCode]'
GO
EXEC sp_refreshview N'[dbo].[vDesignCode]'
GO
PRINT N'Creating [DiamondJet].[JobPrint_Archive]'
GO
CREATE TABLE [DiamondJet].[JobPrint_Archive]
(
[JobNumber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PrintString] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreationDate] [datetime] NULL,
[RevisionDate] [datetime] NULL,
[UniqueID] [uniqueidentifier] NULL,
[ItemNumber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TemplateID] [int] NULL,
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RevisedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VerificationPrint] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ArchiveRecordID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__JobPrint___Archi__5DCC8612] DEFAULT (newid()),
[DateInsertedArchiveRecord] [datetime] NULL CONSTRAINT [DF_JobPrint_Archive_DateInsertedArchiveRecord] DEFAULT (getdate())
) ON [PRIMARY]
GO
PRINT N'Creating primary key [PK_JobPrint_Archive] on [DiamondJet].[JobPrint_Archive]'
GO
ALTER TABLE [DiamondJet].[JobPrint_Archive] ADD CONSTRAINT [PK_JobPrint_Archive] PRIMARY KEY CLUSTERED  ([ArchiveRecordID]) ON [PRIMARY]
GO
PRINT N'Creating [DiamondJet].[JobPrint]'
GO
CREATE TABLE [DiamondJet].[JobPrint]
(
[JobNumber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PrintString] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreationDate] [datetime] NULL CONSTRAINT [DF_JobPrint_CreationDate] DEFAULT (getdate()),
[RevisionDate] [datetime] NULL CONSTRAINT [DF_JobPrint_RevisionDate] DEFAULT (getdate()),
[UniqueID] [uniqueidentifier] NULL CONSTRAINT [DF_JobPrint_UniqueID] DEFAULT (newid()),
[ItemNumber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TemplateID] [int] NULL,
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_JobPrint_CreatedBy] DEFAULT (suser_sname()),
[RevisedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_JobPrint_RevisedBy] DEFAULT (suser_sname()),
[VerificationPrint] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
PRINT N'Creating primary key [PK_JobPrint] on [DiamondJet].[JobPrint]'
GO
ALTER TABLE [DiamondJet].[JobPrint] ADD CONSTRAINT [PK_JobPrint] PRIMARY KEY CLUSTERED  ([JobNumber]) ON [PRIMARY]
GO
PRINT N'Creating trigger [DiamondJet].[trgr_JobPrint] on [DiamondJet].[JobPrint]'
GO
-- =============================================
-- Author:		Bryan Eddy
-- Create date: 5/1/2018
-- Description:	Triger to update JobPrint table when the print string, job, or template has been updated
-- =============================================
CREATE TRIGGER [DiamondJet].[trgr_JobPrint] 
   ON  [DiamondJet].[JobPrint]
   AFTER INSERT, UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF UPDATE(JobNumber) OR UPDATE(PrintString) OR UPDATE(TemplateID) OR UPDATE(VerificationPrint)
		BEGIN
			UPDATE J
			SET RevisionDate = GETDATE(), J.RevisedBy = SUSER_SNAME()
			FROM DiamondJet.JobPrint J INNER JOIN Inserted I ON J.UniqueID = I.UniqueID


			

			
		END

		DECLARE @INS int, @DEL int
		SELECT @INS = COUNT(*) FROM INSERTED
		SELECT @DEL = COUNT(*) FROM DELETED

	IF @INS > 0 OR @DEL > 0 
		BEGIN
			INSERT INTO DiamondJet.JobPrint_Archive
			(
				JobNumber,
				PrintString,
				CreationDate,
				RevisionDate,
				UniqueID,
				ItemNumber,
				TemplateID,
				CreatedBy,
				RevisedBy,
				VerificationPrint
			)
			SELECT DISTINCT JobNumber,
				PrintString,
				CreationDate,
				RevisionDate,
				UniqueID,
				ItemNumber,
				TemplateID,
				CreatedBy,
				RevisedBy,
				VerificationPrint
			FROM Deleted 
		END
		



END
GO
PRINT N'Refreshing [dbo].[vCreateItemBaseCenterMember]'
GO
EXEC sp_refreshview N'[dbo].[vCreateItemBaseCenterMember]'
GO
PRINT N'Refreshing [dbo].[vCutSheet_TechApproval]'
GO
EXEC sp_refreshview N'[dbo].[vCutSheet_TechApproval]'
GO
PRINT N'Refreshing [dbo].[vDesignCodeCableRating]'
GO
EXEC sp_refreshview N'[dbo].[vDesignCodeCableRating]'
GO
PRINT N'Refreshing [dbo].[vCutSheet_CommericalApproval]'
GO
EXEC sp_refreshview N'[dbo].[vCutSheet_CommericalApproval]'
GO
PRINT N'Creating [DiamondJet].[Templates]'
GO
CREATE TABLE [DiamondJet].[Templates]
(
[Template] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TemplateID] [int] NOT NULL IDENTITY(1, 1),
[DateCreated] [datetime] NULL CONSTRAINT [DF_Templates_DateCreated] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_Templates_CreatedBy] DEFAULT (suser_sname()),
[TemplateDescription] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MinOD] [decimal] (10, 5) NULL,
[MarkingIntervalID] [int] NULL
) ON [PRIMARY]
GO
PRINT N'Creating primary key [PK_Templates] on [DiamondJet].[Templates]'
GO
ALTER TABLE [DiamondJet].[Templates] ADD CONSTRAINT [PK_Templates] PRIMARY KEY CLUSTERED  ([TemplateID]) ON [PRIMARY]
GO
PRINT N'Creating [DiamondJet].[vJobPrintInterface]'
GO
/*
Author:		Bryan Eddy
Desc:		View for DiamondJet to pull print information from
Date:		4/25/2018
Version:	1
Update:		n/a
*/

CREATE VIEW [DiamondJet].[vJobPrintInterface]
AS 
SELECT k.JobNumber,
       k.PrintString,
       k.CreationDate,
       k.RevisionDate,
       k.UniqueID,
       k.ItemNumber,
       k.TemplateID,
	   i.Template,
	   k.VerificationPrint
	   ,k.RevisedBy
	   ,k.CreatedBy
FROM DiamondJet.JobPrint k INNER JOIN DiamondJet.Templates i ON i.TemplateID = k.TemplateID
GO
PRINT N'Altering [dbo].[usp_Order_History_Update_Premise_Cable_Shipments]'
GO


/*
Author:			Bryan Eddy
Date:			1/12/2017
Desc:			Update the Sales History table for reporting ( Oracle.MarginRevenueExtractSalesHistory)
Version:		4
Update:			Added another query to remove duplicates
*/

ALTER PROCEDURE [dbo].[usp_Order_History_Update_Premise_Cable_Shipments]
AS

DELETE FROM Oracle.MarginRevenueExtractSalesHistory
FROM            rp_revenue_margin_extract_POBI_CAB INNER JOIN
                         Oracle.MarginRevenueExtractSalesHistory ON rp_revenue_margin_extract_POBI_CAB.ORDER_NUMBER = Oracle.MarginRevenueExtractSalesHistory.ORDER_NUMBER and
                         rp_revenue_margin_extract_POBI_CAB.SO_LINE_NUMBER = Oracle.MarginRevenueExtractSalesHistory.SO_LINE_NUMBER AND 
						 MarginRevenueExtractSalesHistory.ORG_CODE = rp_revenue_margin_extract_POBI_CAB.ORG_CODE 

				

INSERT INTO Oracle.MarginRevenueExtractSalesHistory
                         (BUSINESS_UNIT, TRANSACTION_TYPE, ORDER_NUMBER, SO_LINE_NUMBER, INVOICE_NUMBER, INV_LINE_NUMBER, TRANSACTION_DATE, 
                         TRANSACTION_PERIOD, ITEM_NUMBER, ITEM_DESCRIPTION, BILL_TO_NUMBER, BILL_TO_CLASS, BILL_TO_CATEGORY, BILL_TO_NAME, BILL_TO_STATE, 
                         BILL_TO_COUNTRY, BILL_TO_POSTAL_CODE, SHIP_TO_NUMBER, SHIP_TO_CLASS, SHIP_TO_TERRITORY, SHIP_TO_NAME, SHIP_TO_STATE, 
                         SHIP_TO_COUNTRY, SHIP_TO_POSTAL_CODE, UNIT_OF_MEASURE, REVENUE, QUANTITY, CATEGORY1, CATEGORY2, CATEGORY3, CATEGORY4, CATEGORY5, 
                         CURR_MATERIAL_COST, CURR_RESOURCE_COST, CURR_OVERHEAD_COST, CURR_OUTSIDE_PROCESSING_COST, ACTUAL_MATERIAL_COST, 
                         ACTUAL_RESOURCE_COST, ACTUAL_OVERHEAD_COST, ACTUAL_OUTSIDE_PROCESSING_COST, SCHEDULING_APPROVAL, AGENT, AFL_ACCOUNT, 
                         AFL_NATIONAL, INSIDE_SALES, PURCHASE_ORDER, EXTRACT_DATE, BOOKED_DATE, SCHEDULE_PERIOD, SALES_CHANNEL, REQUEST_DATE, PROMISE_DATE, 
                         ORDER_TYPE, PARTIAL_ALLOWED, RESERVATION_FLAG, SHIP_TO_CITY, FOB_CODE, FREIGHT_TERMS_CODE, HOLD_FLAG, MULTI_ORG_SHIP_SET, 
                         MAKE_BUY_CODE, SHIP_SET_NUMBER, SO_LINE_FREIGHT_CARRIER, SCHEDULE_APPROVAL_DATE, SO_LINE_CREATE_DATE, QTY_IN_LBS, CUSTOMER_UOM, 
                         SPECIFICATION, QUOTE_NUMBER, NEW_PRODUCT, NEW_PRODUCT_CATEGORY, ACTUAL_COST_UPDATE_DATE, PRIMARY_QUANTITY, PRIMARY_UOM_CODE, 
                         INVOICE_SOURCE, QUOTE_TYPE, DATA_SOURCE, NEW_PRODUCT_TYPE, COMMENTS, CURR_MATERIAL_OVERHEAD_COST, 
                         ACTUAL_MATERIAL_OVERHEAD_COST, FORECAST_DESCRIPTION, FORECAST_DESIGNATOR, ORG_CODE)
SELECT        rp_revenue_margin_extract_POBI_CAB.BUSINESS_UNIT, rp_revenue_margin_extract_POBI_CAB.TRANSACTION_TYPE, 
                         rp_revenue_margin_extract_POBI_CAB.ORDER_NUMBER, rp_revenue_margin_extract_POBI_CAB.SO_LINE_NUMBER, 
                         rp_revenue_margin_extract_POBI_CAB.INVOICE_NUMBER, rp_revenue_margin_extract_POBI_CAB.INV_LINE_NUMBER, 
                         rp_revenue_margin_extract_POBI_CAB.TRANSACTION_DATE, rp_revenue_margin_extract_POBI_CAB.TRANSACTION_PERIOD, 
                         rp_revenue_margin_extract_POBI_CAB.ITEM_NUMBER, rp_revenue_margin_extract_POBI_CAB.ITEM_DESCRIPTION, 
                         rp_revenue_margin_extract_POBI_CAB.BILL_TO_NUMBER, rp_revenue_margin_extract_POBI_CAB.BILL_TO_CLASS, 
                         rp_revenue_margin_extract_POBI_CAB.BILL_TO_CATEGORY, rp_revenue_margin_extract_POBI_CAB.BILL_TO_NAME, 
                         rp_revenue_margin_extract_POBI_CAB.BILL_TO_STATE, rp_revenue_margin_extract_POBI_CAB.BILL_TO_COUNTRY, 
                         rp_revenue_margin_extract_POBI_CAB.BILL_TO_POSTAL_CODE, rp_revenue_margin_extract_POBI_CAB.SHIP_TO_NUMBER, 
                         rp_revenue_margin_extract_POBI_CAB.SHIP_TO_CLASS, rp_revenue_margin_extract_POBI_CAB.SHIP_TO_TERRITORY, 
                         rp_revenue_margin_extract_POBI_CAB.SHIP_TO_NAME, rp_revenue_margin_extract_POBI_CAB.SHIP_TO_STATE, 
                         rp_revenue_margin_extract_POBI_CAB.SHIP_TO_COUNTRY, rp_revenue_margin_extract_POBI_CAB.SHIP_TO_POSTAL_CODE, 
                         rp_revenue_margin_extract_POBI_CAB.UNIT_OF_MEASURE, rp_revenue_margin_extract_POBI_CAB.REVENUE, rp_revenue_margin_extract_POBI_CAB.QUANTITY, 
                         rp_revenue_margin_extract_POBI_CAB.CATEGORY1, rp_revenue_margin_extract_POBI_CAB.CATEGORY2, rp_revenue_margin_extract_POBI_CAB.CATEGORY3, 
                         rp_revenue_margin_extract_POBI_CAB.CATEGORY4, rp_revenue_margin_extract_POBI_CAB.CATEGORY5, 
                         rp_revenue_margin_extract_POBI_CAB.CURR_MATERIAL_COST, rp_revenue_margin_extract_POBI_CAB.CURR_RESOURCE_COST, 
                         rp_revenue_margin_extract_POBI_CAB.CURR_OVERHEAD_COST, rp_revenue_margin_extract_POBI_CAB.CURR_OUTSIDE_PROCESSING_COST, 
                         rp_revenue_margin_extract_POBI_CAB.ACTUAL_MATERIAL_COST, rp_revenue_margin_extract_POBI_CAB.ACTUAL_RESOURCE_COST, 
                         rp_revenue_margin_extract_POBI_CAB.ACTUAL_OVERHEAD_COST, rp_revenue_margin_extract_POBI_CAB.ACTUAL_OUTSIDE_PROCESSING_COST, 
                         rp_revenue_margin_extract_POBI_CAB.SCHEDULING_APPROVAL, rp_revenue_margin_extract_POBI_CAB.AGENT, 
                         rp_revenue_margin_extract_POBI_CAB.AFL_ACCOUNT, rp_revenue_margin_extract_POBI_CAB.AFL_NATIONAL, 
                         rp_revenue_margin_extract_POBI_CAB.INSIDE_SALES, rp_revenue_margin_extract_POBI_CAB.PURCHASE_ORDER, 
                         rp_revenue_margin_extract_POBI_CAB.EXTRACT_DATE, rp_revenue_margin_extract_POBI_CAB.BOOKED_DATE, 
                         rp_revenue_margin_extract_POBI_CAB.SCHEDULE_PERIOD, rp_revenue_margin_extract_POBI_CAB.SALES_CHANNEL, 
                         rp_revenue_margin_extract_POBI_CAB.REQUEST_DATE, rp_revenue_margin_extract_POBI_CAB.PROMISE_DATE, 
                         rp_revenue_margin_extract_POBI_CAB.ORDER_TYPE, rp_revenue_margin_extract_POBI_CAB.PARTIAL_ALLOWED, 
                         rp_revenue_margin_extract_POBI_CAB.RESERVATION_FLAG, rp_revenue_margin_extract_POBI_CAB.SHIP_TO_CITY, 
                         rp_revenue_margin_extract_POBI_CAB.FOB_CODE, rp_revenue_margin_extract_POBI_CAB.FREIGHT_TERMS_CODE, 
                         rp_revenue_margin_extract_POBI_CAB.HOLD_FLAG, rp_revenue_margin_extract_POBI_CAB.MULTI_ORG_SHIP_SET, 
                         rp_revenue_margin_extract_POBI_CAB.MAKE_BUY_CODE, rp_revenue_margin_extract_POBI_CAB.SHIP_SET_NUMBER, 
                         rp_revenue_margin_extract_POBI_CAB.SO_LINE_FREIGHT_CARRIER, rp_revenue_margin_extract_POBI_CAB.SCHEDULE_APPROVAL_DATE, 
                         rp_revenue_margin_extract_POBI_CAB.SO_LINE_CREATE_DATE, rp_revenue_margin_extract_POBI_CAB.QTY_IN_LBS, 
                         rp_revenue_margin_extract_POBI_CAB.CUSTOMER_UOM, rp_revenue_margin_extract_POBI_CAB.SPECIFICATION, 
                         rp_revenue_margin_extract_POBI_CAB.QUOTE_NUMBER, rp_revenue_margin_extract_POBI_CAB.NEW_PRODUCT, 
                         rp_revenue_margin_extract_POBI_CAB.NEW_PRODUCT_CATEGORY, rp_revenue_margin_extract_POBI_CAB.ACTUAL_COST_UPDATE_DATE, 
                         rp_revenue_margin_extract_POBI_CAB.PRIMARY_QUANTITY, rp_revenue_margin_extract_POBI_CAB.PRIMARY_UOM_CODE, 
                         rp_revenue_margin_extract_POBI_CAB.INVOICE_SOURCE, rp_revenue_margin_extract_POBI_CAB.QUOTE_TYPE, 
                         rp_revenue_margin_extract_POBI_CAB.DATA_SOURCE, rp_revenue_margin_extract_POBI_CAB.NEW_PRODUCT_TYPE, 
                         rp_revenue_margin_extract_POBI_CAB.COMMENTS, rp_revenue_margin_extract_POBI_CAB.CURR_MATERIAL_OVERHEAD_COST, 
                         rp_revenue_margin_extract_POBI_CAB.ACTUAL_MATERIAL_OVERHEAD_COST, rp_revenue_margin_extract_POBI_CAB.FORECAST_DESCRIPTION, 
                         rp_revenue_margin_extract_POBI_CAB.FORECAST_DESIGNATOR, rp_revenue_margin_extract_POBI_CAB.ORG_CODE
FROM            rp_revenue_margin_extract_POBI_CAB LEFT OUTER JOIN
                         Oracle.MarginRevenueExtractSalesHistory AS Premise_Cable_Shipments_1 ON 
                         rp_revenue_margin_extract_POBI_CAB.ORDER_NUMBER = Premise_Cable_Shipments_1.ORDER_NUMBER AND 
                         rp_revenue_margin_extract_POBI_CAB.SO_LINE_NUMBER = Premise_Cable_Shipments_1.SO_LINE_NUMBER AND 
                         Premise_Cable_Shipments_1.ORG_CODE = rp_revenue_margin_extract_POBI_CAB.ORG_CODE
WHERE        rp_revenue_margin_extract_POBI_CAB.ORDER_NUMBER IS NOT NULL AND rp_revenue_margin_extract_POBI_CAB.SO_LINE_NUMBER IS NOT NULL AND 
                         --rp_revenue_margin_extract_POBI_CAB.INVOICE_NUMBER IS NOT NULL AND 
						 rp_revenue_margin_extract_POBI_CAB.INV_LINE_NUMBER IS NOT NULL
						  AND  Premise_Cable_Shipments_1.ORDER_NUMBER IS NULL AND Premise_Cable_Shipments_1.SO_LINE_NUMBER IS NULL 
						  --AND Premise_Cable_Shipments_1.INVOICE_NUMBER IS NULL AND Premise_Cable_Shipments_1.INV_LINE_NUMBER IS NULL
						 AND rp_revenue_margin_extract_POBI_CAB.ORDER_NUMBER IS NOT NULL AND rp_revenue_margin_extract_POBI_CAB.SO_LINE_NUMBER IS NOT NULL

;WITH cteUnique
AS(
SELECT ROW_NUMBER() OVER (PARTITION BY[ORG_CODE]
      ,[BUSINESS_UNIT]
      ,[TRANSACTION_TYPE]
      ,[ORDER_NUMBER]
      ,[SO_LINE_NUMBER]
      ,[INVOICE_NUMBER]
      ,[INV_LINE_NUMBER]
      ,[TRANSACTION_DATE]
      ,[TRANSACTION_PERIOD]
      ,[ITEM_NUMBER]
      ,[ITEM_DESCRIPTION]
      ,[BILL_TO_NUMBER]
      ,[BILL_TO_CLASS]
      ,[BILL_TO_CATEGORY]
      ,[BILL_TO_NAME]
      ,[BILL_TO_STATE]
      ,[BILL_TO_COUNTRY]
      ,[BILL_TO_POSTAL_CODE]
      ,[SHIP_TO_NUMBER]
      ,[SHIP_TO_CLASS]
      ,[SHIP_TO_TERRITORY]
      ,[SHIP_TO_NAME]
      ,[SHIP_TO_STATE]
      ,[SHIP_TO_COUNTRY]
      ,[SHIP_TO_POSTAL_CODE]
      ,[UNIT_OF_MEASURE]
      ,[REVENUE]
      ,[QUANTITY]
      ,[CATEGORY1]
      ,[CATEGORY2]
      ,[CATEGORY3]
      ,[CATEGORY4]
      ,[CATEGORY5]
      ,[ACTUAL_MATERIAL_COST]
      ,[ACTUAL_RESOURCE_COST]
      ,[ACTUAL_OVERHEAD_COST]
      ,[ACTUAL_OUTSIDE_PROCESSING_COST]
      ,[SCHEDULING_APPROVAL]
      ,[AGENT]
      ,[AFL_ACCOUNT]
      ,[AFL_NATIONAL]
      ,[INSIDE_SALES]
      ,[BOOKED_DATE]
      ,[SCHEDULE_PERIOD]
      ,[SALES_CHANNEL]
      ,[REQUEST_DATE]
      ,[PROMISE_DATE]
      ,[ORDER_TYPE]
      ,[PARTIAL_ALLOWED]
      ,[RESERVATION_FLAG]
      ,[SHIP_TO_CITY]
      ,[FOB_CODE]
      ,[FREIGHT_TERMS_CODE]
      ,[HOLD_FLAG]
      ,[MULTI_ORG_SHIP_SET]
      ,[MAKE_BUY_CODE]
      ,[SHIP_SET_NUMBER]
      ,[SO_LINE_FREIGHT_CARRIER]
      ,[SCHEDULE_APPROVAL_DATE]
      ,[SO_LINE_CREATE_DATE]
      ,[QTY_IN_LBS]
      ,[CUSTOMER_UOM]
      ,[SPECIFICATION]
      ,[QUOTE_NUMBER]
      ,[NEW_PRODUCT]
      ,[NEW_PRODUCT_CATEGORY]
      ,[ACTUAL_COST_UPDATE_DATE]
      ,[PRIMARY_QUANTITY]
      ,[PRIMARY_UOM_CODE]
      ,[INVOICE_SOURCE]
      ,[QUOTE_TYPE]
      ,[DATA_SOURCE]
      ,[NEW_PRODUCT_TYPE]
      ,[COMMENTS]
      ,[ACTUAL_MATERIAL_OVERHEAD_COST]
      ,[FORECAST_DESCRIPTION]
      ,[FORECAST_DESIGNATOR]
       ORDER BY CURR_MATERIAL_COST desc
	  ) AS RowNumber
	  ,[ORG_CODE]
      ,[BUSINESS_UNIT]
      ,[TRANSACTION_TYPE]
      ,[ORDER_NUMBER]
      ,[SO_LINE_NUMBER]
      ,[INVOICE_NUMBER]
      ,[INV_LINE_NUMBER]
      ,[TRANSACTION_DATE]
      ,[TRANSACTION_PERIOD]
      ,[ITEM_NUMBER]
      ,[ITEM_DESCRIPTION]
      ,[BILL_TO_NUMBER]
      ,[BILL_TO_CLASS]
      ,[BILL_TO_CATEGORY]
      ,[BILL_TO_NAME]
      ,[BILL_TO_STATE]
      ,[BILL_TO_COUNTRY]
      ,[BILL_TO_POSTAL_CODE]
      ,[SHIP_TO_NUMBER]
      ,[SHIP_TO_CLASS]
      ,[SHIP_TO_TERRITORY]
      ,[SHIP_TO_NAME]
      ,[SHIP_TO_STATE]
      ,[SHIP_TO_COUNTRY]
      ,[SHIP_TO_POSTAL_CODE]
      ,[UNIT_OF_MEASURE]
      ,[REVENUE]
      ,[QUANTITY]
      ,[CATEGORY1]
      ,[CATEGORY2]
      ,[CATEGORY3]
      ,[CATEGORY4]
      ,[CATEGORY5]
      ,[ACTUAL_MATERIAL_COST]
      ,[ACTUAL_RESOURCE_COST]
      ,[ACTUAL_OVERHEAD_COST]
      ,[ACTUAL_OUTSIDE_PROCESSING_COST]
      ,[SCHEDULING_APPROVAL]
      ,[AGENT]
      ,[AFL_ACCOUNT]
      ,[AFL_NATIONAL]
      ,[INSIDE_SALES]
      ,[BOOKED_DATE]
      ,[SCHEDULE_PERIOD]
      ,[SALES_CHANNEL]
      ,[REQUEST_DATE]
      ,[PROMISE_DATE]
      ,[ORDER_TYPE]
      ,[PARTIAL_ALLOWED]
      ,[RESERVATION_FLAG]
      ,[SHIP_TO_CITY]
      ,[FOB_CODE]
      ,[FREIGHT_TERMS_CODE]
      ,[HOLD_FLAG]
      ,[MULTI_ORG_SHIP_SET]
      ,[MAKE_BUY_CODE]
      ,[SHIP_SET_NUMBER]
      ,[SO_LINE_FREIGHT_CARRIER]
      ,[SCHEDULE_APPROVAL_DATE]
      ,[SO_LINE_CREATE_DATE]
      ,[QTY_IN_LBS]
      ,[CUSTOMER_UOM]
      ,[SPECIFICATION]
      ,[QUOTE_NUMBER]
      ,[NEW_PRODUCT]
      ,[NEW_PRODUCT_CATEGORY]
      ,[ACTUAL_COST_UPDATE_DATE]
      ,[PRIMARY_QUANTITY]
      ,[PRIMARY_UOM_CODE]
      ,[INVOICE_SOURCE]
      ,[QUOTE_TYPE]
      ,[DATA_SOURCE]
      ,[NEW_PRODUCT_TYPE]
      ,[COMMENTS]
      ,[CURR_MATERIAL_OVERHEAD_COST]
      ,[ACTUAL_MATERIAL_OVERHEAD_COST]
      ,[SalesID]
      ,[FORECAST_DESCRIPTION]
      ,[FORECAST_DESIGNATOR]
      ,[DateInserted]
  FROM [Premise].[Oracle].[MarginRevenueExtractSalesHistory]
  )
DELETE I 
FROM cteUnique K INNER JOIN ORACLE.[MarginRevenueExtractSalesHistory]  I ON I.SalesID = K.SalesID
WHERE K.RowNumber > 1--item_number = 'DNO-9246' AND cteUnique.ORDER_NUMBER ='1958265' AND cteUnique.SO_LINE_NUMBER = 1

--Remove more duplicates.  Find SO's and SO Lines that are Rev and CAB and delete the REV transaction type
BEGIN TRAN
;WITH cteDuplicates
AS(
	SELECT R.SalesID
	FROM oracle.MarginRevenueExtractSalesHistory  R INNER JOIN  oracle.MarginRevenueExtractSalesHistory O ON O.ORDER_NUMBER = R.ORDER_NUMBER AND O.SO_LINE_NUMBER = R.SO_LINE_NUMBER
	WHERE R.SCHEDULING_APPROVAL IS NULL AND R.ORG_CODE = 'cab' AND R.TRANSACTION_TYPE = 'rev' AND O.TRANSACTION_TYPE = 'ORD' AND O.ORG_CODE = 'CAB'
)
DELETE ORACLE.MarginRevenueExtractSalesHistory 
FROM cteDuplicates E INNER JOIN ORACLE.MarginRevenueExtractSalesHistory K ON K.SalesID = E.SalesID
COMMIT




GO
PRINT N'Refreshing [Setup].[vSetup_Cable_Machine]'
GO
EXEC sp_refreshview N'[Setup].[vSetup_Cable_Machine]'
GO
PRINT N'Altering [dbo].[usp_Scheduling_Construction_CenterMember]'
GO
-- =============================================
-- Author:		<Bryan Eddy>
-- ALTER date: <1/27/2017>
-- Description:	<Explodes all levels of BOM finds the UJCM>
-- =============================================
ALTER PROC [dbo].[usp_Scheduling_Construction_CenterMember](
@Item varchar(50)
)
as
SELECT ComponentItemNumber
FROM dbo.fn_ExplodeBOM(@Item) INNER JOIN
dbo.[Basic Product Construction] ON ComponentItemNumber = [New Oracle Part #] INNER JOIN
dbo.tblCableConstructionReferences ON tblCableConstructionReferences.Base =  [Basic Product Construction].base INNER JOIN
dbo.tblCableType ON tblCableType.CableType = tblCableConstructionReferences.CableType
WHERE CableID = 6



GO
PRINT N'Altering [dbo].[vBurnListingBase]'
GO
ALTER VIEW [dbo].[vBurnListingBase]
AS
SELECT        dbo.tblBurnListing.ListingCompany, dbo.tblBurnListing.Base, dbo.tblBurnListing.ListingTab, dbo.tblBurnListing.ListingSection, 
                         dbo.tblBurnListing.ListingConstruction, dbo.tblBurnListingConstruction.ConstructionID, dbo.tblBurnListingRating.Rating, dbo.tblBurnListingRatingReference.US, 
                         dbo.tblBurnListingRatingReference.Canada, Priority
FROM            dbo.tblBurnListing INNER JOIN
                         dbo.tblBurnListingConstruction ON dbo.tblBurnListing.ListingConstruction = dbo.tblBurnListingConstruction.ListingConstruction AND 
                         dbo.tblBurnListing.ListingSection = dbo.tblBurnListingConstruction.ListingSection AND 
                         dbo.tblBurnListing.ListingTab = dbo.tblBurnListingConstruction.ListingDocument AND 
                         dbo.tblBurnListing.ListingCompany = dbo.tblBurnListingConstruction.ListingCompany INNER JOIN
                         dbo.tblBurnListingRating ON dbo.tblBurnListingConstruction.ConstructionID = dbo.tblBurnListingRating.ConstructionID INNER JOIN
                         dbo.tblBurnListingRatingReference ON dbo.tblBurnListingRating.Rating = dbo.tblBurnListingRatingReference.Rating

GO
PRINT N'Altering [dbo].[tblItemBuildDescrepancyLog]'
GO
ALTER TABLE [dbo].[tblItemBuildDescrepancyLog] ALTER COLUMN [Item] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
GO
PRINT N'Creating primary key [PK_tblItemBuildDescrepancyLog] on [dbo].[tblItemBuildDescrepancyLog]'
GO
ALTER TABLE [dbo].[tblItemBuildDescrepancyLog] ADD CONSTRAINT [PK_tblItemBuildDescrepancyLog] PRIMARY KEY CLUSTERED  ([Item]) ON [PRIMARY]
GO
PRINT N'Altering [dbo].[PrintLine4Codes]'
GO
ALTER TABLE [dbo].[PrintLine4Codes] ADD
[DiamondJetPrintLine4Code] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO
PRINT N'Altering [dbo].[qryBasePrint]'
GO
/*
Author:		Bryan Eddy
Date:		1/25/2018
Desc:		View to show print for items
Version:	2
Update:		New logic for converting print line 4 to the new diamond jet syntax
*/

ALTER VIEW [dbo].[qryBasePrint]
AS
SELECT        [Print Line 1] AS PrintLine1, RTRIM([Customer]) AS Cust, [Print Line 2] AS PrintLine2, [Print Line 3] AS PrintLine3, LEFT([Item No], 2) AS CabFam, 
                         [New Oracle Part #] AS Oracle, [Print Line 4] AS PrintLine4, [Print Item No], [Print Type (base)], [Print Reel No], [Item No], OracleStatus, [NewPrintLine4]
						 , COALESCE([Print Line 1],'') + ' ' + COALESCE([print line 2],'') + ' ' + CASE WHEN [Print Item No] <> 0 THEN [Item No] + ' ' ELSE ' ' END 
						+ COALESCE([Print Line 3],'') + ' ' 
						+ CASE WHEN [Print Reel No] <> 0 THEN 'LOT ###### ' ELSE ' ' END + COALESCE([Print Line 4],'') AS ConcatPrintLine

						 , COALESCE([Print Line 1],'') + ' ' + COALESCE([print line 2],'') + ' ' + CASE WHEN [Print Item No] <> 0 THEN [Item No] + ' ' ELSE ' ' END 
						+ COALESCE([Print Line 3],'') + ' ' 
						+ CASE WHEN [Print Reel No] <> 0 THEN 'LOT ###### ' ELSE ' ' END + COALESCE(DiamondJetPrintLine4Code,'') AS ConcatPrintLineDiamondJet
						,p.DiamondJetPrintLine4Code, K.[Print Spacing] AS Spacing, c.NominalOD

FROM            [Basic Product Construction] k left JOIN dbo.PrintLine4 i ON i.Line4PrintCode = k.NewPrintLine4 AND i.Line4Print = k.[Print Line 4]
				left JOIN dbo.PrintLine4Codes p ON p.Line4PrintCode = i.Line4PrintCode
				left JOIN dbo.tblCableConstructionReferences l ON l.Base = k.Base
				left JOIN dbo.tblCableConstructions c ON c.BaseID = l.BaseID
--UNION ALL
--SELECT        [Print Line 1] AS PrintLine1, RTRIM([Customer]) AS Cust, [Print Line 2] AS PrintLine2, [Print Line 3] AS PrintLine3, LEFT([Item No], 2) AS CabFam, 
--                         [New Oracle Part Number] AS Oracle, [Print Line 4] AS PrintLine4, [Print Item No], [Print Type (base)], [Print Reel No], [Item No], OracleStatus,[NewPrintLine4]
--FROM            [Basic (Cable/Sheath)]



GO
PRINT N'Creating [DiamondJet].[MarkingIntervals]'
GO
CREATE TABLE [DiamondJet].[MarkingIntervals]
(
[MarkingInterval] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MarkingIntervalID] [int] NOT NULL IDENTITY(1, 1),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_MarkingUom_CreatedBy] DEFAULT (suser_sname()),
[DateCreated] [datetime] NULL CONSTRAINT [DF_MarkingUom_DateCreated] DEFAULT (getdate())
) ON [PRIMARY]
GO
PRINT N'Creating primary key [PK_MarkingUom] on [DiamondJet].[MarkingIntervals]'
GO
ALTER TABLE [DiamondJet].[MarkingIntervals] ADD CONSTRAINT [PK_MarkingUom] PRIMARY KEY CLUSTERED  ([MarkingIntervalID]) ON [PRIMARY]
GO
PRINT N'Adding constraints to [DiamondJet].[MarkingIntervals]'
GO
ALTER TABLE [DiamondJet].[MarkingIntervals] ADD CONSTRAINT [IX_MarkingUom] UNIQUE NONCLUSTERED  ([MarkingInterval]) ON [PRIMARY]
GO
PRINT N'Creating [DiamondJet].[usp_SetJobPrint]'
GO
/*
Author:		Bryan Eddy
Date:		5/2/2018
Desc:		Procedure for updating/inserting print records into the db
Version:	1
Update:		n/a
*/


CREATE PROC [DiamondJet].[usp_SetJobPrint]
	@Item NVARCHAR(100),
	@LotNumber NVARCHAR(100),
	@JobNumber NVARCHAR(100)
AS

SET NOCOUNT ON;

DECLARE @Print TABLE(
PrintLine NVARCHAR(1000),
ItemNumber NVARCHAR(100),
TemplateID INT,
JobNumber NVARCHAR(100),
VerificationPrint NVARCHAR(1000)
)

BEGIN

DECLARE @ErrorNumber INT = ERROR_NUMBER();
DECLARE @ErrorLine INT = ERROR_LINE();

	BEGIN TRY
		BEGIN TRAN
			;WITH ctePrint
			AS(
				SELECT i.Oracle, t.Template, t.TemplateID
				,ROW_NUMBER() OVER (PARTITION BY i.Oracle ORDER BY t.MinOD desc) RowNumber
				,@JobNumber AS JobNumber
				,COALESCE(i.PrintLine1,'') + ' ' + COALESCE(i.PrintLine2,'') + ' ' + CASE WHEN [Print Item No] <> 0 THEN [Item No] + ' ' ELSE ' ' END 
									+ COALESCE(i.PrintLine3,'') + ' ' 
									+ CASE WHEN [Print Reel No] <> 0 THEN ' LOT NO. '+ @LotNumber + ' '  ELSE ' ' END + COALESCE(DiamondJetPrintLine4Code,'') AS ConcatPrintLineDiamondJet

				,COALESCE(i.PrintLine1,'') + ' ' + COALESCE(i.PrintLine2,'') + ' ' + CASE WHEN [Print Item No] <> 0 THEN [Item No] + ' ' ELSE ' ' END 
									+ COALESCE(i.PrintLine3,'') + ' ' 
									+ CASE WHEN [Print Reel No] <> 0 THEN ' LOT NO. '+ @LotNumber + ' '  ELSE ' ' END + COALESCE(i.PrintLine4,'') AS VerificationPrint
				FROM DBO.qryBasePrint i left JOIN DiamondJet.MarkingIntervals k ON I.Spacing = k.MarkingInterval
				left JOIN DiamondJet.Templates t ON t.MarkingIntervalID = k.MarkingIntervalID
				WHERE t.MinOD <= i.NominalOD
			) 
			INSERT INTO @Print
			(
				PrintLine,
				ItemNumber,
				TemplateID,
				JobNumber,
				VerificationPrint
			)
			SELECT  k.ConcatPrintLineDiamondJet, k.Oracle, k.TemplateID, JobNumber, k.VerificationPrint
			FROM ctePrint k
			WHERE k.RowNumber = 1 AND k.Oracle = @ITEM


			MERGE DiamondJet.JobPrint T
			USING @Print AS S
			ON t.JobNumber = s.JobNumber
			WHEN MATCHED
				THEN UPDATE SET T.PrintString = S.PrintLine, T.VerificationPrint = S.VerificationPrint
			WHEN NOT MATCHED
				THEN INSERT (JobNumber, PrintString, ItemNumber, TemplateID,VerificationPrint)
				VALUES (S.JobNumber, S.PrintLine, S.ItemNumber, S.TemplateID,VerificationPrint);
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
 
 
		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
		THROW;
	END CATCH;
END
GO
PRINT N'Refreshing [dbo].[vSalesForce_Catalog_Price_view]'
GO
EXEC sp_refreshview N'[dbo].[vSalesForce_Catalog_Price_view]'
GO
PRINT N'Refreshing [dbo].[vFindImages]'
GO
EXEC sp_refreshview N'[dbo].[vFindImages]'
GO
PRINT N'Creating trigger [dbo].[trgr_CableRunSpeeds] on [dbo].[Buff#1/#2 Alloc Table]'
GO
-- =============================================
-- Author:		Bryan Eddy
-- Create date: 5/3/2018
-- Description:	Keep ID synced with PrefixID
-- =============================================
CREATE TRIGGER [dbo].[trgr_CableRunSpeeds] ON [dbo].[Buff#1/#2 Alloc Table]
AFTER INSERT, UPDATE 
AS
	BEGIN 
			BEGIN
			  UPDATE t
			  SET t.ID = t.PrefixID
			  FROM dbo.[Buff#1/#2 Alloc Table] as t
			  JOIN inserted i
			  ON i.PrefixID = t.PrefixID
			END
            
    -- Insert statements for trigger here

END
GO
PRINT N'Altering [Schedule].[vFBR00466Selection]'
GO
ALTER VIEW [Schedule].[vFBR00466Selection]
AS
SELECT Name, [Item Number], [Lot Number], Locator, [Box Number], [Onhand Qty]
FROM dbo.fi_fiber_length_extract_AFLPRD
WHERE ([Item Number] LIKE 'FBR00356%' OR [Item Number] LIKE 'FBR00374%') AND [MFD 1310nm] BETWEEN 8.7000 AND 9.2000
GO
PRINT N'Refreshing [dbo].[vFindItem]'
GO
EXEC sp_refreshview N'[dbo].[vFindItem]'
GO
PRINT N'Refreshing [Oracle].[vMissingFiberSpecs]'
GO
EXEC sp_refreshview N'[Oracle].[vMissingFiberSpecs]'
GO
PRINT N'Refreshing [dbo].[vCreateItemBase]'
GO
EXEC sp_refreshview N'[dbo].[vCreateItemBase]'
GO
PRINT N'Creating [dbo].[Vendors]'
GO
CREATE TABLE [dbo].[Vendors]
(
[VendorGUID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__Vendors__VendorG__619D16F6] DEFAULT (newid()),
[VendorName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateCreated] [datetime] NULL CONSTRAINT [DF__Vendors__DateCre__62913B2F] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Vendors__Created__63855F68] DEFAULT (suser_sname())
) ON [PRIMARY]
GO
PRINT N'Creating primary key [PK_Vendors] on [dbo].[Vendors]'
GO
ALTER TABLE [dbo].[Vendors] ADD CONSTRAINT [PK_Vendors] PRIMARY KEY CLUSTERED  ([VendorGUID]) ON [PRIMARY]
GO
PRINT N'Creating [dbo].[vVendorSpecificPrint]'
GO
/*
Author:		Bryan Eddy
Date:		5/8/2018
Desc:		Show print for vedor specific fiber items.  Replace vCorningPrintFiberExtension
Version:	1
Update:		n/a
*/

CREATE VIEW [dbo].[vVendorSpecificPrint]
AS
SELECT        DISTINCT i.FiberExtensions, i.CorningPrint VendorSpecificPrint, i.FiberLetter
			,v.VendorName
FROM            dbo.tblFiberExtensions k  RIGHT JOIN
                         dbo.tbl_Fibers j  ON k.Fiber = j.Fiber RIGHT JOIN
                         dbo.tblCorningPrint i ON k.FiberExtension = i.FiberExtensions
				INNER JOIN dbo.Vendors v ON v.VendorGUID = i.VendorGUID
GO
PRINT N'Refreshing [dbo].[vCutSheet]'
GO
EXEC sp_refreshview N'[dbo].[vCutSheet]'
GO
PRINT N'Refreshing [SalesForce].[vInterfacePrintView]'
GO
EXEC sp_refreshview N'[SalesForce].[vInterfacePrintView]'
GO
PRINT N'Refreshing [dbo].[vScheduling_SubUnitPrintSpacing]'
GO
EXEC sp_refreshview N'[dbo].[vScheduling_SubUnitPrintSpacing]'
GO
PRINT N'Refreshing [dbo].[vCableConstruction]'
GO
EXEC sp_refreshview N'[dbo].[vCableConstruction]'
GO
PRINT N'Refreshing [dbo].[vCreateItemBaseCableExtensions]'
GO
EXEC sp_refreshview N'[dbo].[vCreateItemBaseCableExtensions]'
GO
PRINT N'Refreshing [dbo].[vItemSearch]'
GO
EXEC sp_refreshview N'[dbo].[vItemSearch]'
GO
PRINT N'Altering [dbo].[usp_MTY_ObsoleteComponentNotification]'
GO

-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 2/15/2017
-- Description:	Send out emails to notify approvers of constructions awaiting for approval.
-- Job has been ALTERd to run automatically with these notifications
-- =============================================
ALTER PROC [dbo].[usp_MTY_ObsoleteComponentNotification]


AS

EXECUTE AS USER = 'dbo' 

SET ANSI_NULLS OFF;
SET NOCOUNT ON;

--Run around 8:30am everyday
DECLARE @numRows int
DECLARE @Receipientlist varchar(1000)

--Check if any open item requests need commercial approval
IF OBJECT_ID(N'tempdb..#Results', N'U') IS NOT NULL
DROP TABLE #Results;

WITH cteInventory
AS(
	SELECT Item, SUM(QTY) AS Quantity, [Org Code]
	FROM dbo.AFLPRD_onhandqty_STD_81_ALL 
	GROUP BY [Org Code], Item
	HAVING [Org Code] = 'MTY'
)
SELECT DISTINCT   ComponentItemNumber,Description, AssemblyItemStatus, CompItemStatus, COALESCE(NewItem,'') NewItem, COALESCE(i.Quantity,'') QuantityOnHand, COALESCE(i.[Org Code],'') AS Org
INTO #Results
FROM AFLPRD_BOMInvComp_MTY K INNER JOIN AFLPRD_INVSysItemCost_CAB G ON K.ComponentItemNumber = G.ItemNumber
LEFT JOIN PCN_History P ON P.OldItem = ComponentItemNumber
LEFT JOIN cteInventory i ON i.Item = G.ItemNumber
WHERE Item_Status <>'active' and AssemblyItemStatus = 'active' AND NewItem IS NULL

SELECT @numRows = COUNT(*) FROM #Results


SET @ReceipientList = (STUFF((SELECT ';' + UserEmail 
						FROM tblConfiguratorUser G  INNER JOIN users.UserResponsibility  K ON  G.UserID = K.UserID
  						WHERE K.ResponsibilityID = 20 FOR XML PATH('')),1,1,''))

DECLARE @body1 VARCHAR(MAX)
DECLARE @subject VARCHAR(MAX)
DECLARE @query VARCHAR(MAX) = N'SELECT * FROM tempdb..#Results;'
SET @subject = 'MTY ALERT - Inactive Components in BOM ' + CAST(GETDATE() AS NVARCHAR)
SET @body1 = 'There are  ' + CAST(@numRows AS NVARCHAR) + ' inactive components in MTY BOMs.  Please review.' +CHAR(13)+CHAR(13)

DECLARE @tableHTML  NVARCHAR(MAX) ;
IF @numRows > 0
BEGIN
	
			SET @tableHTML =
				N'<H1>MTY Inactive BOM Components</H1>' +
				N'<p>'+@body1+'</p>' +
				N'<p class=MsoNormal><span style=''font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D''>'+
				N'<table border="1">' +
				N'<tr><th>ComponentItemNumber</th><th>Description</th>' +
				N'<th>AssemblyItemStatus</th><th>CompItemStatus</th><th>NewItem</th>' +
				N'<th>Quantity On Hand</th><th>Org</th></tr>' +
				CAST ( ( SELECT		td=ComponentItemNumber,       '',
									td=Description,       '',
									td=AssemblyItemStatus, '',
									td=CompItemStatus, '',
									td=NewItem, '',
									td=QuantityOnHand, '',
									td=Org,''
							FROM #Results 
						  FOR XML PATH('tr'), TYPE 
				) AS NVARCHAR(MAX) ) +
				N'</table>' ;
			--SET @tableHTML =
			--	N'<H1>Premise Cut Sheet Approval</H1>' +
			--	N'<p>'+@body1+'</p>' +
			--	N'</table>' ;
		
			EXEC msdb.dbo.sp_send_dbmail 
			@recipients=@Receipientlist,
			--@recipients = 'Bryan.Eddy@aflglobal.com',
			@blind_copy_recipients = 'Bryan.Eddy@aflglobal.com',
			@subject = @subject,
			@body = @tableHTML,
			@body_format = 'HTML';
END

GO
PRINT N'Refreshing [Setup].[vSetupStandardOperationMismatch]'
GO
EXEC sp_refreshview N'[Setup].[vSetupStandardOperationMismatch]'
GO
PRINT N'Altering [dbo].[usp_EmailSetupStdOpMismatch]'
GO


-- =============================================
-- Author:		Bryan Eddy
-- ALTER date: 10/31/2017
--Desc:					automated email to notify product engineering of open orders with Standard Ops
--						that do not match the Premise Configurator program's Standard Op.
-- Version:		2
-- Update:		added logic to explode the BOM and look at all components for mismatch setups
-- =============================================
ALTER PROCEDURE [dbo].[usp_EmailSetupStdOpMismatch]


AS

EXECUTE AS USER = 'dbo' 

SET ANSI_NULLS OFF;
SET NOCOUNT ON;

--Run around 8:30am everyday
DECLARE @numRows int
DECLARE @Receipientlist varchar(1000)

--Check if any open item requests need commercial approval
IF OBJECT_ID(N'tempdb..#Results', N'U') IS NOT NULL
DROP TABLE #Results;
WITH cteOpenOrderItems
AS(
	SELECT DISTINCT K.AssemblyItemNumber, E.[Sales Order]
	FROM dbo.AFLPRD_ORDDTLREPT_UPLOAD_CAB E CROSS APPLY dbo.fn_ExplodeBOM([Item Number]) K
	)
SELECT [ItemRouting]
	  ,[DateCreated]
      ,[StdOpBOM]
      ,[OperationDescription]
      ,[StdOpConfigurator]
      ,[OracleStatus]
	  ,g.[Sales Order]
	INTO	#Results
  FROM [Premise].[Setup].[vSetupStandardOperationMismatch] K INNER JOIN
   cteOpenOrderItems G ON g.AssemblyItemNumber = K.ItemRouting
  ORDER BY DateCreated DESC, StdOpBOM


SELECT @numRows = count(*) FROM #Results



SET @ReceipientList = (STUFF((SELECT ';' + UserEmail 
						FROM tblConfiguratorUser G  INNER JOIN users.UserResponsibility  K ON  G.UserID = K.UserID
  						WHERE K.ResponsibilityID = 5 FOR XML PATH('')),1,1,''))
						--WHERE g.UserTypeID = 1 FOR XML PATH('')),1,1,''))

DECLARE @body1 VARCHAR(MAX)
DECLARE @subject VARCHAR(MAX)
DECLARE @query VARCHAR(MAX) = N'SELECT * FROM tempdb..#Results;'
SET @subject = 'Stanadard Operation Errors' 
SET @body1 = 'There are  ' + CAST(@numRows AS NVARCHAR) + ' item(s) in open orders with mismatch standard ops.  Please review.' +CHAR(13)+CHAR(13)

DECLARE @tableHTML  NVARCHAR(MAX) ;
IF @numRows > 0
BEGIN
	
			SET @tableHTML =
				N'<H1>Erroneous Standard Op Report</H1>' +
				N'<p>'+@body1+'</p>' +
				N'<p class=MsoNormal><span style=''font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D''>'+
				N'<table border="1">' +
				N'<tr><th>Item</th><th>Bom Std Op</th>' +
				N'<th>Std Op Desc</th><th>Configurator Std Op</th>'+
				N'<th>Oracle Status</th><th>Sales Order</th>'+
				N'<th>DateCreated</th></tr>' +
				CAST ( ( SELECT		td=[ItemRouting],       '',
									td=[StdOpBOM], '',
									td=[OperationDescription], '',
									td=[StdOpConfigurator], '', 
									td=[OracleStatus], '', 
									td=[Sales Order], '', 
									td=[DateCreated], ''
							FROM #Results 
						  FOR XML PATH('tr'), TYPE 
				) AS NVARCHAR(MAX) ) +
				N'</table>' ;
			--SET @tableHTML =
			--	N'<H1>Premise Cut Sheet Approval</H1>' +
			--	N'<p>'+@body1+'</p>' +
			--	N'</table>' ;
		
			EXEC msdb.dbo.sp_send_dbmail 
			@recipients=@ReceipientList,
			--@recipients='Bryan.Eddy@aflglobal.com',
			@blind_copy_recipients = 'Bryan.Eddy@aflglobal.com',
			@subject = @subject,
			@body = @tableHTML,
			@body_format = 'HTML';


END
GO
PRINT N'Refreshing [Oracle].[vInterFaceMesNcmirProcessData]'
GO
EXEC sp_refreshview N'[Oracle].[vInterFaceMesNcmirProcessData]'
GO
PRINT N'Creating [SalesForce].[LeadTimes]'
GO
CREATE TABLE [SalesForce].[LeadTimes]
(
[LeadTimeID] [int] NOT NULL,
[LeadTimeName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateCreated] [datetime] NULL CONSTRAINT [DF__LeadTimes__DateC__693E38BE] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__LeadTimes__Creat__6A325CF7] DEFAULT (suser_sname())
) ON [PRIMARY]
GO
PRINT N'Creating primary key [PK__LeadTime__77BBF64849A6BBB3] on [SalesForce].[LeadTimes]'
GO
ALTER TABLE [SalesForce].[LeadTimes] ADD CONSTRAINT [PK__LeadTime__77BBF64849A6BBB3] PRIMARY KEY CLUSTERED  ([LeadTimeID]) ON [PRIMARY]
GO
PRINT N'Creating [SalesForce].[vLeadTimes]'
GO
/*
Author:		Bryan Eddy
Date:		5/8/2018
Desc:		Lead times names for all salesforce items
Version:	1
Update:		n/a
*/

CREATE VIEW [SalesForce].[vLeadTimes]
AS
SELECT LeadTimeID,
       LeadTimeName,
       DateCreated,
       CreatedBy
FROM SalesForce.LeadTimes
GO
PRINT N'Refreshing [dbo].[vSubunitBases]'
GO
EXEC sp_refreshview N'[dbo].[vSubunitBases]'
GO
PRINT N'Refreshing [dbo].[vConstructionSearch]'
GO
EXEC sp_refreshview N'[dbo].[vConstructionSearch]'
GO
PRINT N'Refreshing [dbo].[vBurnTestingLength]'
GO
EXEC sp_refreshview N'[dbo].[vBurnTestingLength]'
GO
PRINT N'Refreshing [dbo].[Build CM Base]'
GO
EXEC sp_refreshview N'[dbo].[Build CM Base]'
GO
PRINT N'Refreshing [dbo].[vItemPrintByLine]'
GO
EXEC sp_refreshview N'[dbo].[vItemPrintByLine]'
GO
PRINT N'Refreshing [dbo].[vFindCutSheet]'
GO
EXEC sp_refreshview N'[dbo].[vFindCutSheet]'
GO
PRINT N'Refreshing [dbo].[FiberAllComponents]'
GO
EXEC sp_refreshview N'[dbo].[FiberAllComponents]'
GO
PRINT N'Refreshing [dbo].[vSchedulingGanttFiberPlanning]'
GO
EXEC sp_refreshview N'[dbo].[vSchedulingGanttFiberPlanning]'
GO
PRINT N'Creating [Schedule].[usp_GetFurcationTube]'
GO
/*
Author:		Bryan Eddy
Date:		5/21/2018
Desc:		Produre to get the furcation tube
Version:	1
Update:		n/a
*/
CREATE PROCEDURE [Schedule].[usp_GetFurcationTube] 
(
@Item NVARCHAR(100)
)
AS
BEGIN
	WITH cteFurcation
	AS(
	SELECT AssemblyItemNumber, ComponentItemNumber,SUM(CAST(ComponentQuantity AS INT)) AS ComponentQuantity--, SUM(CAST(CountPerUOM AS INT)) AS CountPerUOM
	FROM dbo.AFLPRD_BOMInvComp_CAB
	GROUP BY AssemblyItemNumber, ComponentItemNumber
	HAVING ComponentItemNumber LIKE 'frc%'
	)
	SELECT e.AssemblyItemNumber,
		   e.ComponentItemNumber,
		   e.ComponentQuantity
	FROM cteFurcation e
	WHERE e.AssemblyItemNumber = @Item
	ORDER BY e.AssemblyItemNumber

END

GO
PRINT N'Refreshing [CutSheet].[vImageGroupPivotImages]'
GO
EXEC sp_refreshview N'[CutSheet].[vImageGroupPivotImages]'
GO
PRINT N'Altering [dbo].[tblCableFamilyDocs]'
GO
ALTER TABLE [dbo].[tblCableFamilyDocs] ADD
[CableFamilyDocID] [int] NOT NULL IDENTITY(1, 1)
GO
PRINT N'Creating [dbo].[AFL_SHP_Shipments_Value_Report_260418]'
GO
CREATE TABLE [dbo].[AFL_SHP_Shipments_Value_Report_260418]
(
[Org] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Shipped] [datetime] NULL,
[Cust Num] [bigint] NULL,
[Customer] [varchar] (65) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Order Num] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Customer PO] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Item] [varchar] (26) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [varchar] (288) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Price] [float] NULL,
[Qty] [bigint] NULL,
[Value (BU Currency)] [float] NULL,
[UOM] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Freight Carrier] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Tracking Num] [varchar] (39) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Delivery Receipt] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Billable Tolerance Pct] [bigint] NULL,
[Customer PID] [varchar] (36) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Product Class] [varchar] (76) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Product Group] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Location] [varchar] (52) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Customer PO Line] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Value (USD)] [float] NULL,
[Item Cost] [float] NULL,
[Shipment Cost] [float] NULL,
[Sales Order Type] [varchar] (23) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Customer Reference] [varchar] (104) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Invoice Number] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Promise Date] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Schedule Date] [datetime] NULL,
[Cable Weigth] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Suggested Reel] [varchar] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Reel Description] [varchar] (148) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Reel Type] [varchar] (19) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Lagging] [varchar] (19) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Reel Weight] [bigint] NULL
) ON [PRIMARY]
GO
PRINT N'Creating [dbo].[PorductionAndProcessData_Archive]'
GO
CREATE TABLE [dbo].[PorductionAndProcessData_Archive]
(
[Reel No] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Cut No] [nvarchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Item #] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RFT] [smallint] NULL,
[OTDR Length] [int] NULL,
[ISE Mark] [int] NULL,
[OSE Mark] [int] NULL,
[Unit] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ID] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Buffer Line] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Ave Wall (OSE)] [real] NULL,
[Min Wall Spot (OSE)] [real] NULL,
[Associates Comments] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Entry Date] [datetime] NULL,
[Comments] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NCMIR #] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Record Create Date] [datetime] NULL,
[Record ID] [int] NOT NULL IDENTITY(1, 1),
[SSMA_TimeStamp] [timestamp] NOT NULL,
[Cut Scrapped] [bit] NULL
) ON [PRIMARY]
GO
PRINT N'Creating [dbo].[tblEmailOptions_DELETE]'
GO
CREATE TABLE [dbo].[tblEmailOptions_DELETE]
(
[EmailSubject] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailTo] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailCC] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailBCC] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProductType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailOption] [int] NOT NULL IDENTITY(1, 1),
[EmailBody] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Path] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
PRINT N'Creating primary key [PK_tblEmailOptions] on [dbo].[tblEmailOptions_DELETE]'
GO
ALTER TABLE [dbo].[tblEmailOptions_DELETE] ADD CONSTRAINT [PK_tblEmailOptions] PRIMARY KEY CLUSTERED  ([EmailOption]) ON [PRIMARY]
GO
PRINT N'Creating [SalesForce].[usp_CatalogCode_InvokeUrl_Update_DEV]'
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [SalesForce].[usp_CatalogCode_InvokeUrl_Update_DEV] 


AS
BEGIN
Declare @Object as Int;
Declare @ResponseText as Varchar(8000);


Exec sp_OACreate 'MSXML2.XMLHTTP', @Object OUT;
Exec sp_OAMethod @Object, 'open', NULL, 'get',
                 'http://ci-data-dev.aflglobal.com/PRE_SF_Products', --Your Web Service Url (invoked)
                 'false'
Exec sp_OAMethod @Object, 'send'
Exec sp_OAMethod @Object, 'responseText', @ResponseText OUTPUT

Select @ResponseText

Exec sp_OADestroy @Object


END
GO
PRINT N'Creating primary key [PK_tblCableTBType] on [dbo].[tblCableTBType]'
GO
ALTER TABLE [dbo].[tblCableTBType] ADD CONSTRAINT [PK_tblCableTBType] PRIMARY KEY CLUSTERED  ([TBLetterIndicator]) ON [PRIMARY]
GO
PRINT N'Creating index [IX_tblCableTBType_1] on [dbo].[tblCableTBType]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblCableTBType_1] ON [dbo].[tblCableTBType] ([TBIndicatorID], [TBLetter]) ON [PRIMARY]
GO
PRINT N'Adding constraints to [dbo].[tblTightBufferStripType]'
GO
ALTER TABLE [dbo].[tblTightBufferStripType] ADD CONSTRAINT [IX_tblTightBufferStripType] UNIQUE NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
PRINT N'Adding constraints to [dbo].[Unit Series]'
GO
ALTER TABLE [dbo].[Unit Series] ADD CONSTRAINT [SSMA_CC$Unit Series$Unit Color Series$disallow_zero_length] CHECK ((len([Unit Color Series])>(0)))
GO
PRINT N'Adding constraints to [dbo].[tblBurnListingDocument]'
GO
ALTER TABLE [dbo].[tblBurnListingDocument] ADD CONSTRAINT [DF_tblBurnListingDocument_RevisionDate] DEFAULT (getdate()) FOR [RevisionDate]
GO
ALTER TABLE [dbo].[tblBurnListingDocument] ADD CONSTRAINT [DF_tblBurnListingDocument_RevisedBy] DEFAULT (suser_sname()) FOR [RevisedBy]
GO
PRINT N'Adding constraints to [dbo].[tblCorningPrint]'
GO
ALTER TABLE [dbo].[tblCorningPrint] ADD CONSTRAINT [DF_tblCorningPrint_FiberExtensions] DEFAULT (N'NONE') FOR [FiberExtensions]
GO
PRINT N'Adding constraints to [dbo].[tblMaterialDensity]'
GO
ALTER TABLE [dbo].[tblMaterialDensity] ADD CONSTRAINT [DF_tblMaterialDensity_LotSize] DEFAULT ((1)) FOR [LotSize]
GO
PRINT N'Adding constraints to [dbo].[tblMaterialWeightsMetersUOM]'
GO
ALTER TABLE [dbo].[tblMaterialWeightsMetersUOM] ADD CONSTRAINT [DF_tblMaterialWeightsMetersUOM_LotSize] DEFAULT ((1)) FOR [LotSize]
GO
PRINT N'Adding foreign keys to [DiamondJet].[JobPrint]'
GO
ALTER TABLE [DiamondJet].[JobPrint] ADD CONSTRAINT [FK_JobPrint_Templates] FOREIGN KEY ([TemplateID]) REFERENCES [DiamondJet].[Templates] ([TemplateID]) ON UPDATE CASCADE
GO
PRINT N'Adding foreign keys to [DiamondJet].[Templates]'
GO
ALTER TABLE [DiamondJet].[Templates] ADD CONSTRAINT [FK_Templates_MarkingUom] FOREIGN KEY ([MarkingIntervalID]) REFERENCES [DiamondJet].[MarkingIntervals] ([MarkingIntervalID]) ON UPDATE CASCADE
GO
PRINT N'Adding foreign keys to [dbo].[tblCableConstructionReferences]'
GO
ALTER TABLE [dbo].[tblCableConstructionReferences] ADD CONSTRAINT [FK_tblCableConstructionReferences_Buff#1/#2 Alloc Table] FOREIGN KEY ([PrefixID]) REFERENCES [dbo].[Buff#1/#2 Alloc Table] ([PrefixID]) ON DELETE SET NULL ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblCableConstructionReferences] ADD CONSTRAINT [FK_tblCableConstructionReferences_tblCableTightBufferReference] FOREIGN KEY ([TBType]) REFERENCES [dbo].[tblCableTightBufferReference] ([TBType]) ON DELETE SET NULL ON UPDATE CASCADE
GO
PRINT N'Adding foreign keys to [dbo].[tblCorningPrint]'
GO
ALTER TABLE [dbo].[tblCorningPrint] ADD CONSTRAINT [FK__tblCornin__Vendo__6661CC13] FOREIGN KEY ([VendorGUID]) REFERENCES [dbo].[Vendors] ([VendorGUID])
GO
PRINT N'Adding foreign keys to [dbo].[tblCableConstructions]'
GO
ALTER TABLE [dbo].[tblCableConstructions] ADD CONSTRAINT [FK_tblCableConstructions_tblTightBufferStripType] FOREIGN KEY ([JacketStripID]) REFERENCES [dbo].[tblTightBufferStripType] ([ID])
GO
PRINT N'Adding foreign keys to [dbo].[tblCableFamilyDocs]'
GO
ALTER TABLE [dbo].[tblCableFamilyDocs] ADD CONSTRAINT [FK_tblCableFamilyDocs_tblCableFamily] FOREIGN KEY ([FamilyID]) REFERENCES [dbo].[tblCableFamily] ([FamilyID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
PRINT N'Adding foreign keys to [dbo].[tblItemBuildDescrepancyLog]'
GO
ALTER TABLE [dbo].[tblItemBuildDescrepancyLog] ADD CONSTRAINT [fk_ItemBuild_Items] FOREIGN KEY ([Item]) REFERENCES [dbo].[Basic Product Construction] ([New Oracle Part #]) ON DELETE CASCADE ON UPDATE CASCADE
GO
PRINT N'Adding foreign keys to [dbo].[tblJacketMaterials]'
GO
ALTER TABLE [dbo].[tblJacketMaterials] ADD CONSTRAINT [FK_tblJacketMaterials_tblMaterialDensity] FOREIGN KEY ([JacketMaterial]) REFERENCES [dbo].[tblMaterialDensity] ([Compound]) ON UPDATE CASCADE
GO
PRINT N'Creating extended properties'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Armor Line Speed]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Armor Line Speed'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Buff#1 Line Speed]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Buff#1 Line Speed'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Buff#10 Line Speed]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Buff#10 Line Speed'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Buff#11 Line Speed]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Buff#11 Line Speed'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Buff#11 Line Speed (SH)]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Buff#11 Line Speed (SH)'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Buff#2 Line Speed]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Buff#2 Line Speed'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Buff#4 Line Speed]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Buff#4 Line Speed'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Buff#6 Line Speed]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Buff#6 Line Speed'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Buff#9 Line Speed]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Buff#9 Line Speed'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Buff#9 Line Speed (SH)]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Buff#9 Line Speed (SH)'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Buffering Factor]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Buffering Factor'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[C#4 Line Speed]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'C#4 Line Speed'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Date Adjustments]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Date Adjustments'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Interlock]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Interlock'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[PlannedLotSize]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'PlannedLotSize'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Prefix]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Prefix'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Process Status]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Process Status'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Set-up time level 1]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Set-up time level 1'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Set-up time level 2]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Set-up time level 2'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[SH#3 Line Speed]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'SH#3 Line Speed'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[SH#4 Line Speed]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'SH#4 Line Speed'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Sheathing Line]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Sheathing Line'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[shrinkage limit]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'shrinkage limit'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[Special Notes]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'Special Notes'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[tbspd]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'COLUMN', N'tbspd'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'SQLMigration.[Buff#1/#2 Alloc Table].[PrimaryKey]', 'SCHEMA', N'dbo', 'TABLE', N'Buff#1/#2 Alloc Table', 'CONSTRAINT', N'Buff#1/#2 Alloc Table$PrimaryKey'
GO
PRINT N'Altering permissions on  [DiamondJet].[JobPrint]'
GO
GRANT INSERT ON  [DiamondJet].[JobPrint] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ON  [DiamondJet].[JobPrint] TO [NAA\SPB Premise SQL RO]
GO
PRINT N'Altering permissions on  [dbo].[Basic Product Construction]'
GO
REVOKE DELETE ON  [dbo].[Basic Product Construction] TO [SPB Premise SQL RW]
GO
PRINT N'Altering permissions on [dbo].[Buff#1/#2 Alloc Table]'
GO
GRANT UPDATE ([Prefix]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Buffering Factor]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Special Notes]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Set-up time level 1]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Set-up time level 2]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Buff#11 Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Buff#1 Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Buff#4 Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Buff#6 Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Buff#2 Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Buff#9 Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Buff#10 Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Buff#9 Line Speed (SH)]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Buff#11 Line Speed (SH)]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([SH#3 Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([SH#4 Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([C#4 Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Armor Line Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([PlannedLotSize]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([shrinkage limit]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Sheathing Line]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([Interlock]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([PrimaryBufferingLine]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
GRANT UPDATE ([B18_Line_Speed]) ON [dbo].[Buff#1/#2 Alloc Table] TO [NAA\SPB Premise SQL RO]
GO
PRINT N'Altering permissions on  [dbo].[tblSalesForce_Pricing]'
GO
REVOKE UPDATE ON  [dbo].[tblSalesForce_Pricing] TO [SPB Premise SQL RW]
GO
REVOKE DELETE ON  [dbo].[tblSalesForce_Pricing] TO [SPB Premise SQL RW]
GO
PRINT N'Altering permissions on  [dbo].[tblSalesForce_Pricing_Multiplier]'
GO
REVOKE UPDATE ON  [dbo].[tblSalesForce_Pricing_Multiplier] TO [SPB Premise SQL RW]
GO
REVOKE DELETE ON  [dbo].[tblSalesForce_Pricing_Multiplier] TO [SPB Premise SQL RW]
GO
PRINT N'Altering permissions on  [dbo].[tblStockItems]'
GO
REVOKE DELETE ON  [dbo].[tblStockItems] TO [SPB Premise SQL RW]
GO
REVOKE UPDATE ON  [dbo].[tblStockItems] TO [SPB Premise SQL RW]
GO

