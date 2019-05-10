CREATE TABLE [ItemBuild].[ExtensionTypes]
(
[ExtTypeId] [int] NOT NULL IDENTITY(1000, 1),
[ExtensionType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateCreated] [datetime] NULL CONSTRAINT [DF__Extension__DateC__7EC36589] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Extension__Creat__7FB789C2] DEFAULT (suser_sname()),
[DateRevised] [datetime] NULL CONSTRAINT [DF__Extension__DateR__00ABADFB] DEFAULT (getdate()),
[RevisedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Extension__Revis__019FD234] DEFAULT (suser_sname())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [ItemBuild].[trgrItemBuild_ExtensionTypes] ON [ItemBuild].[ExtensionTypes]
AFTER INSERT, UPDATE 
AS
	SET NOCOUNT ON
	--Capture the user and time a change occured 
	BEGIN 

	UPDATE t
	SET t.DateRevised = GETDATE() , t.RevisedBy = (SUSER_SNAME()) 
	FROM ItemBuild.ExtensionTypes as t
	JOIN inserted i
	ON i.ExtTypeId = t.ExtTypeId

	END;
GO
ALTER TABLE [ItemBuild].[ExtensionTypes] ADD CONSTRAINT [PK__Extensio__717D645F33D3B7CF] PRIMARY KEY CLUSTERED  ([ExtTypeId]) ON [PRIMARY]
GO
ALTER TABLE [ItemBuild].[ExtensionTypes] ADD CONSTRAINT [IX_ExtensionTypes] UNIQUE NONCLUSTERED  ([ExtensionType]) ON [PRIMARY]
GO
