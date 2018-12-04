CREATE TABLE [Oracle].[CableLevel]
(
[CableLevelGuid] [uniqueidentifier] NOT NULL CONSTRAINT [DF__CableLeve__Cable__4B78CBAD] DEFAULT (newid()),
[CableLevel] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__CableLeve__Creat__4C6CEFE6] DEFAULT (suser_sname()),
[DateCreated] [datetime] NULL CONSTRAINT [DF__CableLeve__DateC__4D61141F] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [Oracle].[CableLevel] ADD CONSTRAINT [PK__CableLev__87E82460CE82C2B5] PRIMARY KEY CLUSTERED  ([CableLevelGuid]) ON [PRIMARY]
GO
