SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[fn_ArmorWeight] 
(
-- Input parameters
   @FinishedGood varchar(100)
)
returns
@BOM table
(
   -- Returned table layout
   FinishedGood varchar(100),
   AssemblyItemNumber varchar(100), 
   ComponentItemNumber varchar(100),
   ComponentQuantity decimal(18,10),
   ExtendedQuantityPer decimal(18,10),
   [PrimaryUOM]  varchar(50)
)
as
begin
      -- add current level
   insert into @BOM
   select AssemblyItemNumber, AssemblyItemNumber, ComponentItemNumber, [ComponentQuantity], ComponentQuantity,[PrimaryUOM]
   from AFLPRD_BOMInvComp_CAB
   where AssemblyItemNumber = @FinishedGood AND [EffectivityDateTo] IS NULL 
   ;
   return
end




GO
