CREATE TABLE [dbo].[tblDesignTypeGroups]
(
[DesignTypeGroupID] [int] NOT NULL,
[DesignTypeGroupDesc] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Active] [bit] NULL CONSTRAINT [DF_tblDesignTypeGroups_Active] DEFAULT ((0)),
[Oracle_Product_Class_3] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblDesignTypeGroups] ADD CONSTRAINT [PK_tblDesignTypeGroups] PRIMARY KEY CLUSTERED  ([DesignTypeGroupID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblDesignTypeGroups] ON [dbo].[tblDesignTypeGroups] ([Active], [DesignTypeGroupDesc]) ON [PRIMARY]
GO
