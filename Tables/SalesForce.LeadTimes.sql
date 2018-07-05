CREATE TABLE [SalesForce].[LeadTimes]
(
[LeadTimeID] [int] NOT NULL,
[LeadTimeName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateCreated] [datetime] NULL CONSTRAINT [DF__LeadTimes__DateC__693E38BE] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__LeadTimes__Creat__6A325CF7] DEFAULT (suser_sname())
) ON [PRIMARY]
GO
ALTER TABLE [SalesForce].[LeadTimes] ADD CONSTRAINT [PK__LeadTime__77BBF64849A6BBB3] PRIMARY KEY CLUSTERED  ([LeadTimeID]) ON [PRIMARY]
GO
