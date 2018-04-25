CREATE TABLE [dbo].[tblColors_Available]
(
[Color] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Color_ID] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[TimeStamp] [timestamp] NULL,
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tblColorChips_CreatedBy] DEFAULT (suser_sname()),
[DateCreated] [datetime] NULL CONSTRAINT [DF_tblColorChips_DateCreated] DEFAULT (getdate()),
[AccessColorID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblColors_Available] ADD CONSTRAINT [PK_tblColorChips] PRIMARY KEY CLUSTERED  ([Color]) ON [PRIMARY]
GO
