CREATE TABLE [dbo].[tblDesignCode_BoxedFiber]
(
[DesignTypeID] [int] NOT NULL,
[BoxExtension] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FeetCablePerBox] [smallint] NOT NULL,
[MaxOD] [decimal] (10, 4) NULL,
[MaxFiberCount] [decimal] (10, 4) NULL,
[Minimum_Order_Multiple] [tinyint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblDesignCode_BoxedFiber] ADD CONSTRAINT [PK_tblDesignCode_BoxedFiber] PRIMARY KEY CLUSTERED  ([DesignTypeID], [FeetCablePerBox]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblDesignCode_BoxedFiber] ADD CONSTRAINT [FK_tblDesignCode_BoxedFiber_tblDesignTypes] FOREIGN KEY ([DesignTypeID]) REFERENCES [dbo].[tblDesignTypes] ([DesignTypeID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
