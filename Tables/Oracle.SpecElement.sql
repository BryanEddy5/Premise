CREATE TABLE [Oracle].[SpecElement]
(
[SpecElement] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SpecElementId] [int] NOT NULL IDENTITY(1000, 1),
[DateCreated] [datetime] NULL CONSTRAINT [DF__SpecEleme__DateC__27C57B1C] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__SpecEleme__Creat__28B99F55] DEFAULT (suser_sname()),
[DateRevised] [datetime] NULL CONSTRAINT [DF__SpecEleme__DateR__29ADC38E] DEFAULT (getdate()),
[RevisedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__SpecEleme__Revis__2AA1E7C7] DEFAULT (suser_sname())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE TRIGGER [Oracle].[trgrOracle_SpecElement] ON [Oracle].[SpecElement]
AFTER INSERT, UPDATE 
AS
	SET NOCOUNT ON
	--Capture the user and time a change occured 
	BEGIN 

	UPDATE t
	SET t.DateRevised = GETDATE() , t.RevisedBy = (SUSER_SNAME()) 
	FROM Oracle.SpecElement as t
	JOIN inserted i
	ON i.SpecElementId = t.SpecElementId

	END
GO
ALTER TABLE [Oracle].[SpecElement] ADD CONSTRAINT [PK__SpecElem__AAA835F632889402] PRIMARY KEY CLUSTERED  ([SpecElementId]) ON [PRIMARY]
GO
ALTER TABLE [Oracle].[SpecElement] ADD CONSTRAINT [UQ__SpecElem__A90F34625D66585B] UNIQUE NONCLUSTERED  ([SpecElement]) ON [PRIMARY]
GO
