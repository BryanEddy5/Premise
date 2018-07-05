CREATE TABLE [dbo].[tblItemBuildDescrepancyLog]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[DateCreated] [datetime] NOT NULL CONSTRAINT [DF_tblItemBuildDescrepancyLog_DateCreated] DEFAULT (getdate()),
[Item] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CriticalErrors] [bit] NULL CONSTRAINT [DF_tblItemBuildDescrepancyLog_CriticalErrors] DEFAULT ((0)),
[NonCriticalErrors] [bit] NULL CONSTRAINT [DF_tblItemBuildDescrepancyLog_NonCriticalErrors] DEFAULT ((0)),
[DescOfError] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Timestamp] [timestamp] NULL,
[NumberRevisions] [int] NOT NULL CONSTRAINT [DF_tblItemBuildDescrepancyLog_NumberRevisions] DEFAULT ((0)),
[CheckListVersion] [int] NOT NULL CONSTRAINT [DF_tblItemBuildDescrepancyLog_CheckListVersion] DEFAULT ((2)),
[ItemRequest] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblItemBuildDescrepancyLog_CreatedBy] DEFAULT (suser_sname())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO








CREATE TRIGGER [dbo].[tblItemBuildDescrepancyLogUpdatetrgr2] ON [dbo].[tblItemBuildDescrepancyLog]
AFTER DELETE, UPDATE
AS
	BEGIN 

		DECLARE @INS int, @DEL int

		SELECT @INS = COUNT(*) FROM INSERTED
		SELECT @DEL = COUNT(*) FROM DELETED

		IF @INS > 0 OR @DEL > 0 

		  INSERT INTO [dbo].tblItemBuildDescrepancyLogARCHIVE
           ([DateCreated]
           ,[Item]
           ,[CriticalErrors]
           ,[NonCriticalErrors]
           ,[DescOfError]
           ,[NumberRevisions]
		   ,CheckListVersion
		   ,ItemRequest)
	  
			SELECT
			[DateCreated]
           ,[Item]
           ,[CriticalErrors]
           ,[NonCriticalErrors]
           ,[DescOfError]
           ,[NumberRevisions]
		   ,CheckListVersion
		   ,ItemRequest
			FROM DELETED --the DELETED table contains the OLD values

	


	END
			



GO
ALTER TABLE [dbo].[tblItemBuildDescrepancyLog] ADD CONSTRAINT [PK_tblItemBuildDescrepancyLog] PRIMARY KEY CLUSTERED  ([Item]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblItemBuildDescrepancyLog] ADD CONSTRAINT [fk_ItemBuild_Items] FOREIGN KEY ([Item]) REFERENCES [dbo].[Basic Product Construction] ([New Oracle Part #]) ON DELETE CASCADE ON UPDATE CASCADE
GO
