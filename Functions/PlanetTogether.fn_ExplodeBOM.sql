SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [PlanetTogether].[fn_ExplodeBOM] 
(
-- Input parameters
   @FinishedGood NVARCHAR(100)
)
RETURNS
@BOM TABLE
(
   -- Returned table layout
   FinishedGood NVARCHAR(100),
   item_number NVARCHAR(100), 
   comp_item NVARCHAR(100),
   comp_qty_per DECIMAL(18,10),
   ExtendedQuantityPer DECIMAL(18,10),
   primary_uom_code  NVARCHAR(50),
   BOMLevel INT NULL,
   item_seq SMALLINT,
   opseq SMALLINT,
   unit_id INT NULL,
   layer_id INT NULL,
   count_per_uom INT,
   alternate_designator  NVARCHAR(10),
   FinishedGoodOpSeq SMALLINT, 
   INDEX IX1 NONCLUSTERED(item_number, comp_item),
   make_buy NVARCHAR(100)

)
AS
BEGIN
      -- add current level
   INSERT INTO @BOM
   SELECT G.item_number, G.item_number, comp_item, comp_qty_per, 
    CASE WHEN G.basis_type = 'LOT' THEN comp_qty_per / Lot_Size ELSE comp_qty_per END
   ,primary_uom_code,1, item_seq, opseq, unit_id, layer_id,
	    COALESCE(count_per_uom,'1'),alternate_bom_designator, G.opseq, g.make_buy
   FROM [NAACAB-SCH01].PlanetTogether_Data_Prod.dbo.Oracle_BOMs G INNER JOIN 
   [NAACAB-SCH01].PlanetTogether_Data_Prod.dbo.Oracle_Items K ON G.item_number = K.item_number  
   WHERE G.item_number = @FinishedGood AND ( GETDATE() <= disable_date OR disable_date IS NULL)

    --explode downward
   INSERT INTO @BOM
   SELECT c.FinishedGood, n.item_number, n.comp_item, n.comp_qty_per
        , n.ExtendedQuantityPer * c.comp_qty_per,n.primary_uom_code,  
		n.BOMLevel+1, n.item_seq, n.opseq,n.unit_id,n.layer_id,
		 COALESCE(N.count_per_uom,'1'),c.alternate_designator,c.opseq, c.make_buy
   FROM @BOM c
   CROSS APPLY PlanetTogether.[fn_ExplodeBOM](c.comp_item) n
   RETURN
END


GO
