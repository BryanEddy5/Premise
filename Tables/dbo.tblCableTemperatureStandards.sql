CREATE TABLE [dbo].[tblCableTemperatureStandards]
(
[TemperatureApplication] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TimeStamp] [timestamp] NULL,
[ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_tblCableConstructionICEA_Application_ID] DEFAULT (newid()),
[Operation_C] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StorageShipping_C] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Installation_C] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCableTemperatureStandards] ADD CONSTRAINT [PK_tblCableConstructionICEA_Application] PRIMARY KEY CLUSTERED  ([TemperatureApplication]) ON [PRIMARY]
GO
