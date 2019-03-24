SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[fn_ExplodeBOM] 
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
   [PrimaryUOM]  varchar(50),
   UnitCost decimal(18,10),
   BOMLevel int NULL,
   ItemSeqNumber smallint,
   OperationSeqNumber smallint,
   UnitID int NULL,
   LayerID int NULL,
   CountPerUOM int

)
as
begin
      -- add current level
   insert into @BOM
   select AssemblyItemNumber, AssemblyItemNumber, ComponentItemNumber, [ComponentQuantity], 
   CASE WHEN G.Basis = 'LOT' THEN ComponentQuantity / Lot_Size
			ELSE ComponentQuantity END
   ,[PrimaryUOM],
   UnitCost* CASE WHEN G.Basis = 'LOT' THEN ComponentQuantity / Lot_Size
			ELSE ComponentQuantity END 
   
   , 1, ItemSeqNumber, OperationSeqNumber, UnitID, LayerID,
	    COALESCE(CountPerUOM,'1')
   from AFLPRD_BOMInvComp_CAB G INNER JOIN AFLPRD_INVSysItemCost_CAB K ON G.AssemblyItemNumber = K.ItemNumber  
	WHERE g.AssemblyItemNumber = @FinishedGood AND (LEN(EffectivityDateTo) > 0 OR G.EffectivityDateTo IS NULL) and AlternateBOMDesignator is null

    --explode downward
   insert into @BOM
   select c.FinishedGood, n.AssemblyItemNumber, n.ComponentItemNumber, n.ComponentQuantity
        , n.ExtendedQuantityPer * c.ComponentQuantity,n.[PrimaryUOM], n.UnitCost * c.ComponentQuantity, 
		n.BOMLevel+1, n.ItemSeqNumber, n.OperationSeqNumber,n.UnitID,n.LayerID,
		 COALESCE(N.CountPerUOM,'1') 
   from @BOM c
   cross apply dbo.[fn_ExplodeBOM](c.ComponentItemNumber) n
   return
end





GO
