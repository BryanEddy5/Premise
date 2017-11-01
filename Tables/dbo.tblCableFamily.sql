CREATE TABLE [dbo].[tblCableFamily]
(
[FamilyID] [int] NOT NULL IDENTITY(1, 1),
[FamilyDescription] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NewProductCode] [nvarchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EngineeringChange] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NewProductRelease] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TimeStamp] [timestamp] NULL,
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblCableFamily_CreatedBy] DEFAULT (suser_sname()),
[DateCreated] [datetime] NULL CONSTRAINT [DF_tblCableFamily_DateCreated] DEFAULT (getdate()),
[RevisedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblCableFamily_RevisedBy] DEFAULT (suser_sname()),
[DateRevised] [datetime] NULL CONSTRAINT [DF_tblCableFamily_DateRevised] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[CableFamilyTrg] ON [dbo].[tblCableFamily]
AFTER INSERT, UPDATE
AS
	BEGIN 
		SET NOCOUNT ON;

		IF NOT UPDATE(DateRevised)
			  UPDATE t
			  SET t.DateRevised = GETDATE(),
			  t.RevisedBy = (SUSER_SNAME())
			  FROM dbo.tblCableFamily as t
			  JOIN inserted i
			  ON i.FamilyID = t.FamilyID


    -- Insert statements for trigger here

END
GO
ALTER TABLE [dbo].[tblCableFamily] ADD CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED  ([FamilyID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblCableFamily] ON [dbo].[tblCableFamily] ([FamilyDescription], [NewProductCode], [NewProductRelease]) ON [PRIMARY]
GO
