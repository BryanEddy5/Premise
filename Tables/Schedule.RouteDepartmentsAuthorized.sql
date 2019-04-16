CREATE TABLE [Schedule].[RouteDepartmentsAuthorized]
(
[DepartmentCode] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Id] [int] NOT NULL IDENTITY(1, 1),
[DateCreated] [datetime] NULL CONSTRAINT [DF__RouteDepa__DateC__2EA782D5] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__RouteDepa__Creat__2F9BA70E] DEFAULT (suser_sname()),
[DateRevised] [datetime] NULL CONSTRAINT [DF__RouteDepa__DateR__308FCB47] DEFAULT (getdate()),
[RevisedBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__RouteDepa__Revis__3183EF80] DEFAULT (suser_sname()),
[Stamp] [timestamp] NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE TRIGGER [Schedule].[trgrSchedule_RouteDepartmentsAuthorized]
ON [Schedule].[RouteDepartmentsAuthorized]
AFTER INSERT, UPDATE
AS
SET NOCOUNT ON;
BEGIN

    UPDATE t
    SET t.DateRevised = GETDATE(),
        t.RevisedBy = (SUSER_SNAME())
    FROM Schedule.RouteDepartmentsAuthorized AS t
        JOIN inserted i
            ON i.Id = t.Id;

END;
GO
ALTER TABLE [Schedule].[RouteDepartmentsAuthorized] ADD CONSTRAINT [PK__RouteDep__3214EC0733B3AC6B] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [Schedule].[RouteDepartmentsAuthorized] ADD CONSTRAINT [UQ__RouteDep__6EA8896D821FEE40] UNIQUE NONCLUSTERED  ([DepartmentCode]) ON [PRIMARY]
GO
