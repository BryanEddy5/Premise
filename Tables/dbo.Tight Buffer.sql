CREATE TABLE [dbo].[Tight Buffer]
(
[Form_Number] [int] NOT NULL IDENTITY(1, 1),
[Product_ID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Revision] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Revision_Date] [datetime] NULL,
[Approved] [int] NULL CONSTRAINT [DF__Tight Buf__Appro__5DC0CDC3] DEFAULT ((0)),
[Line_Number] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[X-head_Type] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Screens] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Material] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Extr_Tip_ID] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Extr_Tip_OD] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Extr_Die_ID] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Extr_Design] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Extr_Gap] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Extr_Fenner_Set] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Extr_Fenner_Range] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Extr_Pressure_Set] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Extr_Pressure_Range] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Melt_Temp_Set] [float] NULL CONSTRAINT [DF__Tight Buf__Melt___5EB4F1FC] DEFAULT ((0)),
[Melt_Temp_Range] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Extr_Current_Set] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Extr_Current_Range] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Screw_Set] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Screw_Range] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Line_Speed_Set] [float] NULL CONSTRAINT [DF__Tight Buf__Line___5FA91635] DEFAULT ((0)),
[Line_Speed_Range] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Payoff_Tension] [float] NULL CONSTRAINT [DF__Tight Buf__Payof__609D3A6E] DEFAULT ((0)),
[Payoff_Tension_Range] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[X-head_Vac] [float] NULL CONSTRAINT [DF__Tight Buf__X-hea__61915EA7] DEFAULT ((0)),
[X-head_Vac_Range] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[First_Trough_Temp] [float] NULL CONSTRAINT [DF__Tight Buf__First__628582E0] DEFAULT ((0)),
[First_Trough_Temp_Range] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[2nd_Trough_Temp] [float] NULL CONSTRAINT [DF__Tight Buf__2nd_T__6379A719] DEFAULT ((0)),
[2nd_Trough_Temp_Range] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Water_Line] [float] NULL CONSTRAINT [DF__Tight Buf__Water__646DCB52] DEFAULT ((0)),
[Water_Line_Range] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Traverse Pitch Control] [float] NULL CONSTRAINT [DF__Tight Buf__Trave__6561EF8B] DEFAULT ((0)),
[Take-up Speed Control] [float] NULL CONSTRAINT [DF__Tight Buf__Take-__665613C4] DEFAULT ((0)),
[AXIS1 SETPT] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AXIS2 SETPT] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AXIS12 SETPT] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OVL12 SETPT] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AXIS1 TOL] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AXIS2 TOL] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AVG12 TOL] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OVL12 TOL] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Flaw Detection?] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[special1] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[special2] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[special3] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSMA_TimeStamp] [timestamp] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$2nd_Trough_Temp_Range$disallow_zero_length] CHECK ((len([2nd_Trough_Temp_Range])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$AVG12 TOL$disallow_zero_length] CHECK ((len([AVG12 TOL])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$AXIS1 SETPT$disallow_zero_length] CHECK ((len([AXIS1 SETPT])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$AXIS1 TOL$disallow_zero_length] CHECK ((len([AXIS1 TOL])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$AXIS12 SETPT$disallow_zero_length] CHECK ((len([AXIS12 SETPT])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$AXIS2 SETPT$disallow_zero_length] CHECK ((len([AXIS2 SETPT])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$AXIS2 TOL$disallow_zero_length] CHECK ((len([AXIS2 TOL])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$Extr_Current_Range$disallow_zero_length] CHECK ((len([Extr_Current_Range])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$Extr_Current_Set$disallow_zero_length] CHECK ((len([Extr_Current_Set])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$Extr_Design$disallow_zero_length] CHECK ((len([Extr_Design])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$Extr_Die_ID$disallow_zero_length] CHECK ((len([Extr_Die_ID])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$Extr_Fenner_Range$disallow_zero_length] CHECK ((len([Extr_Fenner_Range])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$Extr_Fenner_Set$disallow_zero_length] CHECK ((len([Extr_Fenner_Set])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$Extr_Gap$disallow_zero_length] CHECK ((len([Extr_Gap])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$Extr_Pressure_Range$disallow_zero_length] CHECK ((len([Extr_Pressure_Range])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$Extr_Pressure_Set$disallow_zero_length] CHECK ((len([Extr_Pressure_Set])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$Extr_Tip_ID$disallow_zero_length] CHECK ((len([Extr_Tip_ID])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$Extr_Tip_OD$disallow_zero_length] CHECK ((len([Extr_Tip_OD])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$First_Trough_Temp_Range$disallow_zero_length] CHECK ((len([First_Trough_Temp_Range])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$Flaw Detection?$disallow_zero_length] CHECK ((len([Flaw Detection?])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$Line_Number$disallow_zero_length] CHECK ((len([Line_Number])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$Line_Speed_Range$disallow_zero_length] CHECK ((len([Line_Speed_Range])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$Material$disallow_zero_length] CHECK ((len([Material])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$Melt_Temp_Range$disallow_zero_length] CHECK ((len([Melt_Temp_Range])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$OVL12 SETPT$disallow_zero_length] CHECK ((len([OVL12 SETPT])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$OVL12 TOL$disallow_zero_length] CHECK ((len([OVL12 TOL])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$Payoff_Tension_Range$disallow_zero_length] CHECK ((len([Payoff_Tension_Range])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$Product_ID$disallow_zero_length] CHECK ((len([Product_ID])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$Revision$disallow_zero_length] CHECK ((len([Revision])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$Screens$disallow_zero_length] CHECK ((len([Screens])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$Screw_Range$disallow_zero_length] CHECK ((len([Screw_Range])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$Screw_Set$disallow_zero_length] CHECK ((len([Screw_Set])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$special1$disallow_zero_length] CHECK ((len([special1])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$special2$disallow_zero_length] CHECK ((len([special2])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$special3$disallow_zero_length] CHECK ((len([special3])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$Water_Line_Range$disallow_zero_length] CHECK ((len([Water_Line_Range])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$X-head_Type$disallow_zero_length] CHECK ((len([X-head_Type])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [SSMA_CC$Tight Buffer$X-head_Vac_Range$disallow_zero_length] CHECK ((len([X-head_Vac_Range])>(0)))
GO
ALTER TABLE [dbo].[Tight Buffer] ADD CONSTRAINT [Tight Buffer$PrimaryKey] PRIMARY KEY CLUSTERED  ([Form_Number]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Tight Buffer$Extr_Die_ID] ON [dbo].[Tight Buffer] ([Extr_Die_ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Tight Buffer$Extr_Tip_ID] ON [dbo].[Tight Buffer] ([Extr_Tip_ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Tight Buffer$Product_ID] ON [dbo].[Tight Buffer] ([Product_ID]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[2nd_Trough_Temp]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'2nd_Trough_Temp'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[2nd_Trough_Temp_Range]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'2nd_Trough_Temp_Range'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Approved]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Approved'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[AVG12 TOL]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'AVG12 TOL'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[AXIS1 SETPT]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'AXIS1 SETPT'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[AXIS1 TOL]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'AXIS1 TOL'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[AXIS12 SETPT]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'AXIS12 SETPT'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[AXIS2 SETPT]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'AXIS2 SETPT'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[AXIS2 TOL]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'AXIS2 TOL'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Extr_Current_Range]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Extr_Current_Range'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Extr_Current_Set]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Extr_Current_Set'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Extr_Design]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Extr_Design'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Extr_Die_ID]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Extr_Die_ID'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Extr_Fenner_Range]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Extr_Fenner_Range'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Extr_Fenner_Set]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Extr_Fenner_Set'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Extr_Gap]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Extr_Gap'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Extr_Pressure_Range]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Extr_Pressure_Range'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Extr_Pressure_Set]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Extr_Pressure_Set'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Extr_Tip_ID]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Extr_Tip_ID'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Extr_Tip_OD]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Extr_Tip_OD'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[First_Trough_Temp]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'First_Trough_Temp'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[First_Trough_Temp_Range]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'First_Trough_Temp_Range'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Flaw Detection?]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Flaw Detection?'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Form_Number]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Form_Number'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Line_Number]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Line_Number'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Line_Speed_Range]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Line_Speed_Range'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Line_Speed_Set]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Line_Speed_Set'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Material]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Material'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Melt_Temp_Range]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Melt_Temp_Range'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Melt_Temp_Set]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Melt_Temp_Set'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[OVL12 SETPT]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'OVL12 SETPT'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[OVL12 TOL]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'OVL12 TOL'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Payoff_Tension]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Payoff_Tension'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Payoff_Tension_Range]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Payoff_Tension_Range'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Product_ID]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Product_ID'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Revision]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Revision'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Revision_Date]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Revision_Date'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Screens]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Screens'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Screw_Range]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Screw_Range'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Screw_Set]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Screw_Set'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[special1]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'special1'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[special2]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'special2'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[special3]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'special3'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Take-up Speed Control]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Take-up Speed Control'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Traverse Pitch Control]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Traverse Pitch Control'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Water_Line]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Water_Line'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Water_Line_Range]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'Water_Line_Range'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[X-head_Type]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'X-head_Type'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[X-head_Vac]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'X-head_Vac'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[X-head_Vac_Range]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'COLUMN', N'X-head_Vac_Range'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[PrimaryKey]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'CONSTRAINT', N'Tight Buffer$PrimaryKey'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Extr_Die_ID]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'INDEX', N'Tight Buffer$Extr_Die_ID'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Extr_Tip_ID]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'INDEX', N'Tight Buffer$Extr_Tip_ID'
GO
EXEC sp_addextendedproperty N'MS_SSMA_SOURCE', N'AccessSQLExport.[Tight Buffer].[Product_ID]', 'SCHEMA', N'dbo', 'TABLE', N'Tight Buffer', 'INDEX', N'Tight Buffer$Product_ID'
GO
