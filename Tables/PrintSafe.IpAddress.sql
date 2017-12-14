CREATE TABLE [PrintSafe].[IpAddress]
(
[IpAddressID] [int] NOT NULL IDENTITY(100, 1),
[IpAddress] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IpType] [int] NOT NULL,
[MachineID] [int] NOT NULL,
[Status] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastRan] [datetime] NULL CONSTRAINT [DF_IpAddress_LastRun] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Bryan Eddy
-- Create date: 12/11/2017
-- Description:	Update last ran
-- =============================================
CREATE TRIGGER [PrintSafe].[trg_PrintSafeIP] 
   ON  [PrintSafe].[IpAddress] 
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	UPDATE k
	SET LastRan = GETDATE()
	FROM PrintSafe.IpAddress K INNER JOIN inserted I 
	ON I.IpAddressID = k.IpAddressID

END
GO
ALTER TABLE [PrintSafe].[IpAddress] ADD CONSTRAINT [PK_IPAddress] PRIMARY KEY CLUSTERED  ([IpAddressID]) ON [PRIMARY]
GO
ALTER TABLE [PrintSafe].[IpAddress] ADD CONSTRAINT [IPAddress_IX] UNIQUE NONCLUSTERED  ([MachineID], [IpType]) ON [PRIMARY]
GO
