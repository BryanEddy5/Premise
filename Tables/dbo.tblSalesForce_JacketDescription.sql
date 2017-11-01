CREATE TABLE [dbo].[tblSalesForce_JacketDescription]
(
[JacketDescription_SalesForce] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Jacket_ID] [int] NOT NULL IDENTITY(1, 1),
[DateCreated] [datetime] NULL CONSTRAINT [DF_tblSalesForce_JacketDescription_DateCreated] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblSalesForce_JacketDescription_CreatedBy] DEFAULT (suser_sname()),
[Timestamp] [timestamp] NULL,
[DateRevised] [datetime] NULL,
[RevisedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[SalesForce_JacketDescription_trgr] ON [dbo].[tblSalesForce_JacketDescription]
AFTER INSERT, UPDATE 
AS
	BEGIN 
		IF  UPDATE(JacketDescription_SalesForce) 
			BEGIN
			  UPDATE t
			  SET t.DateRevised = GETDATE() , t.RevisedBy = (SUSER_SNAME()) 
			  FROM dbo.tblSalesForce_JacketDescription as t
			  JOIN inserted i
			  ON i.Jacket_ID = t.Jacket_ID
			END
	END
GO
ALTER TABLE [dbo].[tblSalesForce_JacketDescription] ADD CONSTRAINT [PK_tblSalesForce_JacketDescription] PRIMARY KEY CLUSTERED  ([JacketDescription_SalesForce]) ON [PRIMARY]
GO
