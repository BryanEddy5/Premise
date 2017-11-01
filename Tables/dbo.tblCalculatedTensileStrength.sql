CREATE TABLE [dbo].[tblCalculatedTensileStrength]
(
[Base] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TensileApplication] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Tensile_Newtons] [float] NULL
) ON [PRIMARY]
GO
