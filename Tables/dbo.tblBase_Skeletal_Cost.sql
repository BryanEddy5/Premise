CREATE TABLE [dbo].[tblBase_Skeletal_Cost]
(
[Base] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BaseSkeletalCost] [decimal] (38, 10) NULL,
[AssemblyItemNumber] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LoadedBaseCost] [decimal] (38, 10) NULL,
[SetupID] [int] NOT NULL
) ON [PRIMARY]
GO
