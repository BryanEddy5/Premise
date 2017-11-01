CREATE TABLE [Schedule].[PrintVerificationError]
(
[ErrorID] [int] NOT NULL IDENTITY(10000, 1),
[ItemNumber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PrintCheck] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CurrentPrint] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SoNumber] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UserName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__PrintVeri__UserN__4476C863] DEFAULT (suser_sname()),
[DateCreated] [datetime] NULL CONSTRAINT [DF__PrintVeri__DateC__456AEC9C] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [Schedule].[PrintVerificationError] ADD CONSTRAINT [PK_PrintVerificationError] PRIMARY KEY CLUSTERED  ([ErrorID]) ON [PRIMARY]
GO
