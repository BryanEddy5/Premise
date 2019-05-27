SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[fn_WhereUsed] 
(
   @Component varchar(100)
)
returns
@WhereUsed table
(
   Component varchar(100) ,
   AssemblyItemNumber varchar(100) not null, 
   ComponentItemNumber varchar(100),
   ComponentQuantity real,
   [PrimaryUOM]  varchar(50) ,
   CompItemStatus VARCHAR(50),
   AssemblyDescription VARCHAR(MAX)
   )

as
BEGIN 
      -- add current level
   insert into @WhereUsed
   select ComponentItemNumber, AssemblyItemNumber, ComponentItemNumber,d.ComponentQuantity,PrimaryUOM, d.CompItemStatus, d.AssemblyDescription
   from [dbo].[AFLPRD_BOMInvComp_CAB] d
   WHERE ComponentItemNumber = @Component
   ;


   -- --explode upward
   insert into @WhereUsed
   select c.Component, n.AssemblyItemNumber, n.ComponentItemNumber,n.ComponentQuantity *C.ComponentQuantity ,n.[PrimaryUOM], n.CompItemStatus, n.AssemblyDescription
   from @WhereUsed c
   cross apply dbo.[fn_WhereUsed](c.AssemblyItemNumber) n
   return
END 




GO
