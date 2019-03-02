CREATE TABLE [Schedule].[SetupPreferredMachine]
(
[SetupPreferredLineId] [int] NOT NULL IDENTITY(1, 1),
[Setup] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PreferredMachineId] [int] NULL,
[DateCreated] [datetime] NULL CONSTRAINT [DF__SetupPref__DateC__3CF5A22C] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__SetupPref__Creat__3DE9C665] DEFAULT (suser_sname()),
[DateRevised] [datetime] NULL CONSTRAINT [DF__SetupPref__DateR__3EDDEA9E] DEFAULT (getdate()),
[RevisedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__SetupPref__Revis__3FD20ED7] DEFAULT (suser_sname())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [Schedule].[trgrSchedule_SetupPreferredMachine] ON [Schedule].[SetupPreferredMachine]
AFTER INSERT, UPDATE 
AS
	--Capture the user and time a change occured 
	BEGIN 

	SET NOCOUNT ON

	UPDATE t
	SET t.DateRevised = GETDATE() , t.RevisedBy = (SUSER_SNAME()) 
	FROM Schedule.SetupPreferredMachine as t
	JOIN inserted i
	ON i.SetupPreferredLineId = t.SetupPreferredLineId

	END
GO
ALTER TABLE [Schedule].[SetupPreferredMachine] ADD CONSTRAINT [PK__SetupPre__380E786CC3161C04] PRIMARY KEY CLUSTERED  ([SetupPreferredLineId]) ON [PRIMARY]
GO
ALTER TABLE [Schedule].[SetupPreferredMachine] ADD CONSTRAINT [UQ__SetupPre__7E027FC1767D052C] UNIQUE NONCLUSTERED  ([Setup]) ON [PRIMARY]
GO
