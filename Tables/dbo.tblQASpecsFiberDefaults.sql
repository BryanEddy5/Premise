CREATE TABLE [dbo].[tblQASpecsFiberDefaults]
(
[SpecificationElement] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FiberType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DefaultTarget] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DefaultUpperLimit] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DefaultLowerLimit] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DefaultUserUpperLimit] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DefaultUserLowerLimit] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UOM] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Cu_Unit] [smallint] NULL,
[TestLength] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TestIncrement] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QaSpecId] [int] NOT NULL IDENTITY(1000, 1)
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblQASpecsFiberDefaults] ADD CONSTRAINT [PK_tblQASpecsFiberDefaults] PRIMARY KEY CLUSTERED  ([QaSpecId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblQASpecsFiberDefaults] ADD CONSTRAINT [UQ__tblQASpe__DE419AA13A55C88D] UNIQUE NONCLUSTERED  ([QaSpecId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblQASpecsFiberDefaults] ADD CONSTRAINT [IX_tblQASpecsFiberDefaults] UNIQUE NONCLUSTERED  ([SpecificationElement], [FiberType]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblQASpecsFiberDefaults] ADD CONSTRAINT [fk_qaspec] FOREIGN KEY ([SpecificationElement]) REFERENCES [Oracle].[SpecElement] ([SpecElement]) ON DELETE CASCADE ON UPDATE CASCADE
GO
