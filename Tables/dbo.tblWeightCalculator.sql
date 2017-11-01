CREATE TABLE [dbo].[tblWeightCalculator]
(
[ItemNumber] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblWeightCalculator] ADD CONSTRAINT [PK_tblWeightCalculator] PRIMARY KEY CLUSTERED  ([ItemNumber]) ON [PRIMARY]
GO
