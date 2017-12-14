CREATE TABLE [dbo].[SalesHistory_BI_Data]
(
[BU] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ORG] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CALENDAR_QUARTER] [smallint] NULL,
[FISCAL_QUARTER] [smallint] NULL,
[Month] [smallint] NULL,
[DATE] [datetime] NOT NULL,
[CUSTOMER_CLUSTER] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CUSTOMER] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AGENT] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CUSTOMER_CLASS] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CUSTOMER_CATEGORY] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TERRITORY_MARKET] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MARKET] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CLUSTER_ACCOUNT] [int] NULL,
[SHIP_TO_STATE] [nvarchar] (33) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SHIP_TO_COUNTRY] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SHIP_TO_POSTAL_CODE] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ITEM_NUMBER] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ITEM_DESCRIPTION] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[REVENUE] [real] NOT NULL,
[QUANTITY] [real] NOT NULL,
[UOM] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PO] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SO_NUMBER] [int] NOT NULL,
[SO_LINE] [real] NOT NULL,
[INVOICE_NUMBER] [int] NULL,
[INVOICE_LINE] [int] NULL,
[CSR] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PRODUCT_CATEGORY] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SO_LINE_ID] [int] NOT NULL IDENTITY(1, 1),
[DateInserted] [datetime] NULL CONSTRAINT [DF_SalesHistory_BI_Data_DateInserted] DEFAULT (getdate()),
[DateRevised] [datetime] NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Bryan Eddy
-- Create date: 12/11/2017
-- Description:	Update the revised date
-- =============================================
CREATE TRIGGER [dbo].[trgr_SalesHistory] 
   ON  [dbo].[SalesHistory_BI_Data] 
   AFTER INSERT,UPDATE
AS 
BEGIN
	IF NOT UPDATE(DateInserted)
		BEGIN
			UPDATE k
			SET DateRevised = GETDATE()
			FROM SalesHistory_BI_Data k INNER JOIN Inserted i 
			ON K.SO_LINE_ID = I.SO_LINE_ID
		END
END
GO
ALTER TABLE [dbo].[SalesHistory_BI_Data] ADD CONSTRAINT [PK_SalesHistory_BI_Data] PRIMARY KEY CLUSTERED  ([DATE], [AGENT], [SHIP_TO_STATE], [SHIP_TO_COUNTRY], [SHIP_TO_POSTAL_CODE], [SO_NUMBER], [SO_LINE]) ON [PRIMARY]
GO
