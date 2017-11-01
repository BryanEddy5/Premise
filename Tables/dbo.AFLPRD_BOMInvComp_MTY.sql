CREATE TABLE [dbo].[AFLPRD_BOMInvComp_MTY]
(
[OrganizationCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AssemblyItemNumber] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AssemblyDescription] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AssemblyItemStatus] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ItemSeqNumber] [decimal] (8, 3) NULL,
[OperationSeqNumber] [int] NOT NULL,
[ComponentItemNumber] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ComponentDescription] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PrimaryUOM] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EffectivityDate] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ComponentQuantity] [decimal] (18, 10) NULL,
[CompItemStatus] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AlternateBOMDesignator] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PendingFromECN] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CommonOrganizationId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SupplySubinventory] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CountPerUOM] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UnitId] [int] NULL,
[LayerId] [int] NULL,
[CopyCount] [int] NULL,
[ItemCopied] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OrgOpSeq] [int] NULL,
[Basis] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UnitCost] [decimal] (18, 8) NULL,
[EffectivityDateTo] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateInserted] [datetime] NULL CONSTRAINT [DF_AFLPRD_BOMInvComp_MTY_DateInserted] DEFAULT (getdate()),
[ID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Number] [int] NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IiX_AFLPRD_BOMInvComp_MTY] ON [dbo].[AFLPRD_BOMInvComp_MTY] ([AssemblyItemNumber]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AFLPRD_BOMInvComp_MTY] ON [dbo].[AFLPRD_BOMInvComp_MTY] ([ComponentItemNumber]) ON [PRIMARY]
GO
