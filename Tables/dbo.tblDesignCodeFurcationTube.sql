CREATE TABLE [dbo].[tblDesignCodeFurcationTube]
(
[FurcationLetter] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FurcationTube] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Furcation] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TBNomOD] [decimal] (10, 6) NULL,
[SpecialnInstr] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TBNomID] [decimal] (10, 6) NULL,
[TBMaterial] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OdTolPlus] [decimal] (6, 3) NULL,
[OdTolMinus] [decimal] (6, 3) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblDesignCodeFurcationTube] ADD CONSTRAINT [PK_tblDesignCodeFurcationTube] PRIMARY KEY CLUSTERED  ([FurcationLetter]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblDesignCodeFurcationTube] ON [dbo].[tblDesignCodeFurcationTube] ([Furcation]) ON [PRIMARY]
GO
