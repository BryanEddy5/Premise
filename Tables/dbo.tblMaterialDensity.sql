CREATE TABLE [dbo].[tblMaterialDensity]
(
[Compound] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SpecificGravity] [decimal] (18, 8) NULL,
[DateCreated] [datetime2] NULL CONSTRAINT [DF_tblCompounds_DateCreated] DEFAULT (getdate()),
[RevisedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblCompounds_RevisedBy] DEFAULT (suser_sname()),
[RevisedDate] [datetime2] NULL CONSTRAINT [DF_tblCompounds_RevisedDate] DEFAULT (getdate()),
[Createdby] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblMaterialDensity_Createdby] DEFAULT (suser_sname()),
[LotSize] [int] NULL CONSTRAINT [DF_tblMaterialDensity_LotSize] DEFAULT ((1))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblMaterialDensity] ADD CONSTRAINT [PK_tblMaterialDensity] PRIMARY KEY CLUSTERED  ([Compound]) ON [PRIMARY]
GO
