CREATE TABLE [dbo].[PorductionAndProcessData_Archive]
(
[Reel No] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Cut No] [nvarchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Item #] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RFT] [smallint] NULL,
[OTDR Length] [int] NULL,
[ISE Mark] [int] NULL,
[OSE Mark] [int] NULL,
[Unit] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ID] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Buffer Line] [nvarchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Ave Wall (OSE)] [real] NULL,
[Min Wall Spot (OSE)] [real] NULL,
[Associates Comments] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Entry Date] [datetime] NULL,
[Comments] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NCMIR #] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Record Create Date] [datetime] NULL,
[Record ID] [int] NOT NULL IDENTITY(1, 1),
[SSMA_TimeStamp] [timestamp] NOT NULL,
[Cut Scrapped] [bit] NULL
) ON [PRIMARY]
GO
