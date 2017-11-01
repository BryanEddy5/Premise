CREATE TABLE [dbo].[CustomerProhibitedConstructions]
(
[RestrictionID] [int] NOT NULL IDENTITY(1, 1),
[Customer] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Base] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreationDate] [datetime] NULL CONSTRAINT [DF_CustomerProhibitedConstructions_CreationDate] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_CustomerProhibitedConstructions_CreatedBy] DEFAULT (suser_sname()),
[Prohibited] [bit] NULL CONSTRAINT [DF_CustomerProhibitedConstructions_Prohibited] DEFAULT ((1)),
[AuthorizedDate] [datetime] NULL,
[AuthorizedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comments] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[CustomerProhibitedConstructionstrgr] ON [dbo].[CustomerProhibitedConstructions]
AFTER INSERT, UPDATE 
AS
		--Trigger to keep all "Parent Items" having the same characteristics.  The only difference between a parent cable and it's children is the print.
		IF UPDATE(Prohibited) 
			BEGIN 
				UPDATE t
				SET t.AuthorizedBy = SUSER_SNAME(), t.AuthorizedDate = getdate()
				FROM dbo.CustomerProhibitedConstructions as t
				INNER JOIN inserted i 
				ON i.RestrictionID = T.RestrictionID
				WHERE i.Prohibited = 0
		END

GO
ALTER TABLE [dbo].[CustomerProhibitedConstructions] ADD CONSTRAINT [PK_CustomerProhibitedConstructions] PRIMARY KEY CLUSTERED  ([Customer], [Base]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CustomerProhibitedConstructions] ADD CONSTRAINT [FK_CustomerProhibitedConstructions_tblCableConstructionReferences] FOREIGN KEY ([Base]) REFERENCES [dbo].[tblCableConstructionReferences] ([Base]) ON DELETE CASCADE ON UPDATE CASCADE
GO
