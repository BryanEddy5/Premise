CREATE TABLE [dbo].[tblStrengthMembers]
(
[StrengthMember] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Denier] [int] NULL,
[Modulus] [int] NULL,
[FRP_OD] [decimal] (6, 3) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblStrengthMembers] ADD CONSTRAINT [PK_tblStrengthMembers] PRIMARY KEY CLUSTERED  ([StrengthMember]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tblStrengthMembers] ON [dbo].[tblStrengthMembers] ([Denier], [FRP_OD], [Modulus]) ON [PRIMARY]
GO
