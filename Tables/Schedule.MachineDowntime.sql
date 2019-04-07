CREATE TABLE [Schedule].[MachineDowntime]
(
[MchnDtId] [int] NOT NULL IDENTITY(1000, 1),
[MachineId] [int] NULL,
[StartDt] [datetime] NULL,
[EndDt] [datetime] NULL,
[DateCreated] [datetime] NULL CONSTRAINT [DF__MachineDo__DateC__12CA5E36] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__MachineDo__Creat__13BE826F] DEFAULT (suser_sname()),
[DateRevised] [datetime] NULL CONSTRAINT [DF__MachineDo__DateR__14B2A6A8] DEFAULT (getdate()),
[RevisedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__MachineDo__Revis__15A6CAE1] DEFAULT (suser_sname()),
[Reason] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Active] [bit] NULL CONSTRAINT [DF_MachineDowntime_Active] DEFAULT ((1)),
[Stamp] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [Schedule].[tgrScheduleMachineDowntime] ON [Schedule].[MachineDowntime]
AFTER INSERT, UPDATE 
AS
	SET NOCOUNT ON
	--Capture the user and time a change occured 
	BEGIN 

	UPDATE t
	SET t.DateRevised = GETDATE() , t.RevisedBy = (SUSER_SNAME()) 
	FROM Schedule.MachineDowntime as t
	JOIN inserted i
	ON i.MchnDtId = t.MchnDtId

	END

GO
ALTER TABLE [Schedule].[MachineDowntime] ADD CONSTRAINT [PK__MachineD__E2A85E5876C30745] PRIMARY KEY CLUSTERED  ([MchnDtId]) ON [PRIMARY]
GO
