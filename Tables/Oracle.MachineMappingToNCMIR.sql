CREATE TABLE [Oracle].[MachineMappingToNCMIR]
(
[NcmirMachineID] [int] NULL,
[OracleMachineID] [int] NULL,
[MachineMappingID] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY]
GO
ALTER TABLE [Oracle].[MachineMappingToNCMIR] ADD CONSTRAINT [PK_MachineMappingToNCMIR] PRIMARY KEY CLUSTERED  ([MachineMappingID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ__MachineM__65FF5465ECE2D5EF] ON [Oracle].[MachineMappingToNCMIR] ([NcmirMachineID], [OracleMachineID]) ON [PRIMARY]
GO
