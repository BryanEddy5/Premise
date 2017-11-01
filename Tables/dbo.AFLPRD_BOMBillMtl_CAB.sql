CREATE TABLE [dbo].[AFLPRD_BOMBillMtl_CAB]
(
[OrganizationCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Assembly] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AssemblyType] [int] NULL,
[AlternateBOMDesignator] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CommonOrgCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CommonBOM] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ItemCopied] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Number] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AFLPRD_BOMBillMtl_CAB] ADD CONSTRAINT [PK_AFLPRD_BOMBillMtl_CAB] PRIMARY KEY CLUSTERED  ([Number]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AFLPRD_BOMBillMtl_CAB] ON [dbo].[AFLPRD_BOMBillMtl_CAB] ([Assembly], [CommonBOM]) ON [PRIMARY]
GO
