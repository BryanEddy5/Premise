CREATE TABLE [SalesForce].[AcsEngineeredItems]
(
[RecordID] [int] NOT NULL,
[QuoteID] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LineNumber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Alternate] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Stock] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MarginType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Margin] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Commision] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FreightAdder] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddChargerAdder] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MaterialCost] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LaborCost] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OverheadCost] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Notes] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProductID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QuoteDate] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmployeeID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Quantity] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ItemPacking] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PackingCost] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LeadTime] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Freight] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AdditionalCharge] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CableSize] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LowestMargin] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OracleCost] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomerName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QuotePrice] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QuoteQuantity] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ItemDescription] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProductLevel1] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProductLevel2] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MaxLengthOnWood] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MaxLengthOnSteel] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Processed] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PricingNotes] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ItemInternal] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillableTolerance] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QuotePriceUOM] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QuoteCostUOM] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QuoteUOM] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OpportunityID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ActivityID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [SalesForce].[AcsEngineeredItems] ADD CONSTRAINT [PK_AcsEngineeredItems] PRIMARY KEY CLUSTERED  ([RecordID]) ON [PRIMARY]
GO
GRANT DELETE ON  [SalesForce].[AcsEngineeredItems] TO [NAA\SPB Users]
GO
GRANT INSERT ON  [SalesForce].[AcsEngineeredItems] TO [NAA\SPB Users]
GO
GRANT SELECT ON  [SalesForce].[AcsEngineeredItems] TO [NAA\SPB Users]
GO
GRANT UPDATE ON  [SalesForce].[AcsEngineeredItems] TO [NAA\SPB Users]
GO
