CREATE TABLE [dbo].[BurnTestVerticalTray]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[FromNominalODmm] [decimal] (8, 3) NULL,
[ToNominalODmm] [decimal] (8, 3) NULL,
[NumberOfCablesPerBundles] [int] NULL,
[NumberOfBundles] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BurnTestVerticalTray] ADD CONSTRAINT [k_BurnTestIee1202Length] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
