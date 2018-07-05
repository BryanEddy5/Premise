CREATE TABLE [dbo].[tblMaterialWeightsMetersUOM]
(
[Material] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Density] [decimal] (18, 8) NULL,
[DateCreated] [datetime2] NULL CONSTRAINT [DF_tblBuyMaterialWeights_DateCreated] DEFAULT (getdate()),
[RevisedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblBuyMaterialWeights_RevisedBy] DEFAULT (suser_sname()),
[RevisedDate] [datetime2] NULL CONSTRAINT [DF_tblBuyMaterialWeights_RevisedDate] DEFAULT (getdate()),
[Createdby] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblBuyMaterialWeights_Createdby] DEFAULT (suser_sname()),
[LotSize] [int] NULL CONSTRAINT [DF_tblMaterialWeightsMetersUOM_LotSize] DEFAULT ((1))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblMaterialWeightsMetersUOM] ADD CONSTRAINT [PK_tblBuyMaterialWeights] PRIMARY KEY CLUSTERED  ([Material]) ON [PRIMARY]
GO
