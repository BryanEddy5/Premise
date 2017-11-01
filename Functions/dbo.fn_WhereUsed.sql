SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[fn_WhereUsed] 
(
-- Input parameters
   @Component varchar(100)
)
returns
@WhereUsed table
(
   -- Returned table layout
   Component varchar(100) ,
   AssemblyItemNumber varchar(100) not null, 
   ComponentItemNumber varchar(100),
   ComponentQuantity real,
   --ExtendedQuantityPer decimal(18,10),
   [PrimaryUOM]  varchar(50) 
   --PRIMARY KEY( AssemblyItemNumber
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
--ALTER TABLE @WhereUsed
--ADD CONSTRAINT [PK_tblWhereUsed] PRIMARY KEY CLUSTERED (AssemblyItemNumber ASC)

as
BEGIN 
      -- add current level
   insert into @WhereUsed
   select ComponentItemNumber, AssemblyItemNumber, ComponentItemNumber,d.ComponentQuantity,PrimaryUOM
   from [dbo].[AFLPRD_BOMInvComp_CAB] d
   --GROUP BY  ComponentItemNumber, AssemblyItemNumber,ComponentItemNumber
   WHERE ComponentItemNumber = @Component --AND [EffectivityDateTo] IS NULL 
   ;


   -- --explode upward
   insert into @WhereUsed
   select c.Component, n.AssemblyItemNumber, n.ComponentItemNumber,n.ComponentQuantity *C.ComponentQuantity ,n.[PrimaryUOM]
   from @WhereUsed c
   cross apply dbo.[fn_WhereUsed](c.AssemblyItemNumber) n
   --GROUP BY c.Component, n.AssemblyItemNumber,n.ComponentItemNumber,n.ComponentQuantity
   --HAVING c.AssemblyItemNumber <> n.AssemblyItemNumber
   return
END 



GO
