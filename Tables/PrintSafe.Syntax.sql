CREATE TABLE [PrintSafe].[Syntax]
(
[Syntax] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Conversion] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SyntaxID] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY]
GO
ALTER TABLE [PrintSafe].[Syntax] ADD CONSTRAINT [PK_PrintSafe_Syntax] PRIMARY KEY CLUSTERED  ([Syntax]) ON [PRIMARY]
GO
