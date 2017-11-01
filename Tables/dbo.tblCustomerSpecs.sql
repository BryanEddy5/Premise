CREATE TABLE [dbo].[tblCustomerSpecs]
(
[CustomerSpec] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CustomerPartNumber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Customer] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DateCreated] [datetime2] NULL CONSTRAINT [DF_tblCustomerSpecs_DateCreated] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblCustomerSpecs_CreatedBy] DEFAULT (suser_sname()),
[RevisedBy] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblCustomerSpecs_RevisedBy] DEFAULT (suser_sname()),
[RevisedDate] [datetime2] NULL CONSTRAINT [DF_tblCustomerSpecs_RevisedDate] DEFAULT (getdate()),
[Timestamp] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE TRIGGER [dbo].[tblCustomerSpecsTrgr] ON [dbo].[tblCustomerSpecs]
AFTER INSERT, UPDATE 
AS
	BEGIN 
		IF NOT (UPDATE(RevisedDate))
			BEGIN
			  UPDATE t
			  SET t.RevisedDate = GETDATE() 
			  FROM dbo.tblCustomerSpecs as t
			  JOIN inserted i
			  ON i.CustomerPartNumber = t.CustomerPartNumber
			END
	END
	BEGIN 
		IF NOT (UPDATE(RevisedBy))
			BEGIN
			  UPDATE t
			  SET t.RevisedBy = (SUSER_SNAME()) 
			  FROM dbo.tblCustomerSpecs as t
			  JOIN inserted d
			  ON d.CustomerPartNumber = t.CustomerPartNumber
			END
	END
			

GO
ALTER TABLE [dbo].[tblCustomerSpecs] ADD CONSTRAINT [PK_tblCustomerSpecs] PRIMARY KEY CLUSTERED  ([CustomerSpec], [CustomerPartNumber], [Customer]) ON [PRIMARY]
GO
