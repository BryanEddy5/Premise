CREATE TABLE [dbo].[tblDesignCodeJacketColor]
(
[ColorLetter] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Color] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CablePasses] [smallint] NOT NULL,
[FinsishedCableColorPosition] [bit] NULL,
[SubunitCableColorPostion] [bit] NULL,
[TimeStamp] [timestamp] NULL,
[SalesForce_Include] [bit] NULL CONSTRAINT [DF_tblDesignCodeJacketColor_SalesForce_Include] DEFAULT ((0)),
[ColorDescription_SalesForce] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblDesignCodeJacketColor] ADD CONSTRAINT [PK_tblDesignCodeJacketColor] PRIMARY KEY CLUSTERED  ([ColorLetter], [CablePasses]) ON [PRIMARY]
GO
