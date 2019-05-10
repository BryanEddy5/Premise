CREATE TABLE [ItemBuild].[Extensions]
(
[ExtId] [int] NOT NULL IDENTITY(1000, 1),
[Extension] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtTypeId] [int] NOT NULL,
[DateCreated] [datetime] NULL CONSTRAINT [DF__Extension__DateC__0758AB8A] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Extension__Creat__084CCFC3] DEFAULT (suser_sname()),
[DateRevised] [datetime] NULL CONSTRAINT [DF__Extension__DateR__0940F3FC] DEFAULT (getdate()),
[RevisedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Extension__Revis__0A351835] DEFAULT (suser_sname()),
[ExtensionDesc] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [ItemBuild].[trgrItemBuild_Extensions] ON [ItemBuild].[Extensions]
AFTER INSERT, UPDATE 
AS
	SET NOCOUNT ON
	--Capture the user and time a change occured 
	BEGIN 

	UPDATE t
	SET t.DateRevised = GETDATE() , t.RevisedBy = (SUSER_SNAME()) 
	FROM ItemBuild.Extensions as t
	JOIN inserted i
	ON i.ExtId = t.ExtId

	END
GO
ALTER TABLE [ItemBuild].[Extensions] ADD CONSTRAINT [PK__Extensio__44BEF521D81BD862] PRIMARY KEY CLUSTERED  ([ExtId]) ON [PRIMARY]
GO
ALTER TABLE [ItemBuild].[Extensions] ADD CONSTRAINT [UQ__Extensio__B87DD48AF30E300C] UNIQUE NONCLUSTERED  ([Extension]) ON [PRIMARY]
GO
ALTER TABLE [ItemBuild].[Extensions] ADD CONSTRAINT [FK__Extension__ExtTy__06648751] FOREIGN KEY ([ExtTypeId]) REFERENCES [ItemBuild].[ExtensionTypes] ([ExtTypeId])
GO
