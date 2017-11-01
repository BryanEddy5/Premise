CREATE TABLE [db_accessadmin].[SSMA_Access_InventoryDatabases]
(
[DatabaseId] [uniqueidentifier] NOT NULL,
[DatabaseName] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ExportTime] [datetime] NULL,
[FilePath] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FileSize] [bigint] NULL,
[FileOwner] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateCreated] [datetime] NULL,
[DateModified] [datetime] NULL,
[TablesCount] [int] NULL,
[QueriesCount] [int] NULL,
[FormsCount] [int] NULL,
[ModulesCount] [int] NULL,
[ReportsCount] [int] NULL,
[MacrosCount] [int] NULL,
[AccessVersion] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Collation] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[JetVersion] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsUpdatable] [bit] NULL,
[QueryTimeout] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [db_accessadmin].[SSMA_Access_InventoryDatabases] ADD CONSTRAINT [PK__SSMA_Acc__2C9BE46F7F60ED59] PRIMARY KEY CLUSTERED  ([DatabaseId]) ON [PRIMARY]
GO
