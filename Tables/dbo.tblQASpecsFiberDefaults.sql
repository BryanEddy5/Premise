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
[TestIncrement] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblQASpecsFiberDefaults] ADD CONSTRAINT [PK_tblQASpecsFiberDefaults] PRIMARY KEY CLUSTERED  ([SpecificationElement], [FiberType]) ON [PRIMARY]
GO
