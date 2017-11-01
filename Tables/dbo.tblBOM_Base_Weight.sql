CREATE TABLE [dbo].[tblBOM_Base_Weight]
(
[Base] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Weight] [float] NULL,
[SetupID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBOM_Base_Weight] ADD CONSTRAINT [pk_tblBOM_Base_Weight] PRIMARY KEY CLUSTERED  ([Base]) ON [PRIMARY]
GO
