CREATE TABLE [dbo].[tblCableTensileRating]
(
[TensileApplication] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Tensile_LongTerm_Less_12Fiber_Newton] [int] NULL,
[Tensile_LongTerm_GreaterEqual_12Fiber_Newton] [int] NULL,
[timestamp] [timestamp] NULL,
[ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_tblCableTensileRating_ID] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCableTensileRating] ADD CONSTRAINT [PK_tblCableConstuctionTensileRating] PRIMARY KEY CLUSTERED  ([TensileApplication]) ON [PRIMARY]
GO
