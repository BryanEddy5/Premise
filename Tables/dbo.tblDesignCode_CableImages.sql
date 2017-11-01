CREATE TABLE [dbo].[tblDesignCode_CableImages]
(
[DesignTypeID] [int] NOT NULL,
[Armor_Type__c] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ImageURL__c] [varchar] (2083) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Packaging__c] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Product_Spec_link__c] [varchar] (2083) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblDesignCode_CableImages] ADD CONSTRAINT [PK_tblDesignCode_CableImages] PRIMARY KEY CLUSTERED  ([DesignTypeID], [Armor_Type__c], [Packaging__c]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblDesignCode_CableImages] ADD CONSTRAINT [FK_tblDesignCode_CableImages_tblDesignTypes] FOREIGN KEY ([DesignTypeID]) REFERENCES [dbo].[tblDesignTypes] ([DesignTypeID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
