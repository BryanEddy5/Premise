CREATE TABLE [dbo].[tblDesignTypes]
(
[DesignTypeID] [int] NOT NULL IDENTITY(1, 1),
[DesignTypeDesc] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Active] [bit] NOT NULL CONSTRAINT [DF_tblDesignTypes_Active] DEFAULT ((0)),
[BillableToleranceMin] [decimal] (18, 4) NULL,
[BillableToleranceMax] [decimal] (18, 4) NULL,
[BillableToleranceUOM] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LotSize] [int] NULL,
[Testing] [bit] NULL CONSTRAINT [DF_tblDesignTypes_Testing] DEFAULT ((0)),
[DesignTypeApproved] [bit] NULL CONSTRAINT [DF_tblDesignTypes_DesignTypeApproved] DEFAULT ((0)),
[DesignTypeGroupID] [int] NULL,
[SalesForceDescription] [nvarchar] (70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DefaultFamilyColor] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Armor] [bit] NULL CONSTRAINT [DF_tblDesignTypes_Armor] DEFAULT ((0)),
[Special_Subunit_Color_X] [bit] NULL CONSTRAINT [DF_tblDesignTypes_Special_Subunit_Color_X] DEFAULT ((0)),
[Min_Order_Quantity__c] [int] NULL,
[Product_Pricing_Group] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Oracle_Product_Class_5] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Createdby] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblDesignTypes_Createdby] DEFAULT (suser_sname()),
[CreationDate] [datetime] NULL CONSTRAINT [DF_tblDesignTypes_CreationDate] DEFAULT (getdate()),
[CableLevelGuid] [uniqueidentifier] NULL,
[OracleCatalogCableType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblDesignTypes] ADD CONSTRAINT [PK_tblDesignTypes] PRIMARY KEY CLUSTERED  ([DesignTypeID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblDesignTypes] ON [dbo].[tblDesignTypes] ([DesignTypeGroupID], [Active], [DesignTypeID], [Armor]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblDesignTypes_1] ON [dbo].[tblDesignTypes] ([DesignTypeID], [SalesForceDescription]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblDesignTypes] ADD CONSTRAINT [FK_CableLevel] FOREIGN KEY ([CableLevelGuid]) REFERENCES [Oracle].[CableLevel] ([CableLevelGuid]) ON DELETE SET NULL ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblDesignTypes] ADD CONSTRAINT [FK_tblDesignTypes_tblDesignTypeGroups] FOREIGN KEY ([DesignTypeGroupID]) REFERENCES [dbo].[tblDesignTypeGroups] ([DesignTypeGroupID]) ON DELETE SET NULL ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblDesignTypes] ADD CONSTRAINT [FK_tblDesignTypes_tblSalesForce_Pricing] FOREIGN KEY ([Product_Pricing_Group]) REFERENCES [dbo].[tblSalesForce_Pricing] ([Product_Category])
GO
