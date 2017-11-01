CREATE TABLE [PrintSafe].[PS_HISTORY]
(
[DOWNLOAD_TYPE] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PRODUCTION_ORDER_NUMBER] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COMPUTER_NAME] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PRINTER_NAME] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FONT_SPEC] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CALIBRATION_VALUE] [int] NULL,
[PRINT_STRING] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WHEN_RUN] [datetime] NULL,
[ARCHIVED] [tinyint] NULL,
[UniqueID] [uniqueidentifier] NULL CONSTRAINT [DF_PS_HISTORY_UniqueID] DEFAULT (newid()),
[DateInserted] [datetime] NULL CONSTRAINT [DF_PS_HISTORY_DateInserted] DEFAULT (getdate())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
