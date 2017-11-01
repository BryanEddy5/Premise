CREATE TABLE [dbo].[AFLPRD_INVSysItemSpec_CAB]
(
[ItemNumber] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SpecName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SpecificationElement] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UOM] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TargetValue] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LowerLimit] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UpperLimit] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UserLowerLimit] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UserUpperLimit] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FiberType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TestLength] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TestIncrement] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Number] [int] NOT NULL IDENTITY(1, 1),
[DateInserted] [datetime] NULL CONSTRAINT [DF_AFLPRD_INVSysItemSpec_CAB_DateInserted] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AFLPRD_INVSysItemSpec_CAB] ADD CONSTRAINT [PK_AFLPRD_INVSysItemSpec_CAB] PRIMARY KEY CLUSTERED  ([Number]) ON [PRIMARY]
GO
