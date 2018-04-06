SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_ExplodeRoute] 
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
   TrueOperationCode VARCHAR(100)
	
)
as
begin
      -- add current level
   insert into @BOM
   select g.AssemblyItemNumber, g.AssemblyItemNumber, ComponentItemNumber , i.TrueOperationCode
     from AFLPRD_BOMInvComp_CAB G INNER JOIN AFLPRD_INVSysItemCost_CAB K ON G.AssemblyItemNumber = K.ItemNumber  
		INNER JOIN dbo.AFLPRD_BOMOpSeq_CAB i ON i.AssemblyItemNumber = g.AssemblyItemNumber AND i.AlternateRoutingDesignator = g.AlternateBOMDesignator
		AND i.OperationSeqNum = g.OperationSeqNumber
   where g.AssemblyItemNumber = @FinishedGood AND LEN(EffectivityDateTo) > 0 and AlternateBOMDesignator is null

    --explode downward
   insert into @BOM
   select c.FinishedGood, n.AssemblyItemNumber, n.ComponentItemNumber, n.TrueOperationCode 
   from @BOM c
   cross apply dbo.[fn_ExplodeRoute](c.ComponentItemNumber) n
  return
end



GO
