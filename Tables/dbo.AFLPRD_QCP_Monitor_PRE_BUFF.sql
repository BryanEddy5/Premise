CREATE TABLE [dbo].[AFLPRD_QCP_Monitor_PRE_BUFF]
(
[Machine] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Start Date] [datetime] NULL,
[Cable Type] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Job] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Cut Number] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Started by] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Completed by] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RFT] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Cable Length] [numeric] (18, 0) NULL,
[QCP_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Item] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NCMIR] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Extruder Cleaned] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateInserted] [datetime] NULL CONSTRAINT [DF_AFLPRD_QCP_Monitor_PRE_BUFF_DateInserted] DEFAULT (getdate())
) ON [PRIMARY]
GO
