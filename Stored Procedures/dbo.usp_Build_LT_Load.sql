SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_Build_LT_Load]
as
begin

INSERT INTO [Temp (Premise Load)] ( [Adj Schedule Date], [Setup Buff], [Setup SZ/SH], [Week ending], Customer, [Item number], Length, [Schedule date], [Reel number], [Adj Mfg  Date], [Week ending-mfg], [Count], Ftype, [CO#], Design, [Complete Buff], Family, [Job#], [Order Source], RequiredDays_Orig )
SELECT DISTINCT [Cust Order Specifications].[Schedule date]
, [Printed Labels (Data Products)].[Setup Buff]
, [Printed Labels (Data Products)].[Setup SZ/SH]
, DATEADD(dd, 6-(DATEPART(dw, [Schedule date])), [Schedule date])AS [Week ending]
, [Cust Order Specifications].Customer
, [Cust Order Specifications].Desgin
, [Cust Order Specifications].[Order Qty]
, [Cust Order Specifications].[Schedule date]
, [Cust Order Specifications].[Co Number]
, [Cust Order Specifications].[Mfg commit date]
, [Cust Order Specifications].[Mfg commit date]
, NULL AS Expr2, SUBSTRING([Desgin],6,1) AS Expr3
, [Cust Order Specifications].[Co Number]
, [Cust Order Specifications].Desgin
, [Printed Labels (Data Products)].[Completed Buffering]
, Left([Item No],7) AS Family
, [Cust Order Specifications].[Job#]
, [Cust Order Specifications].[Type Order]
, 1 AS RequirdDays_Orig
FROM [Cust Order Specifications] INNER JOIN [Printed Labels (Data Products)] ON ([Cust Order Specifications].[Reel No] = [Printed Labels (Data Products)].[Reel No]) AND ([Cust Order Specifications].[Order Qty] = [Printed Labels (Data Products)].[Order Qty])
WHERE ((([Cust Order Specifications].Desgin) Not Like 'Shea%') AND ((Left([Item No],7)) Like 'A%') AND (([Cust Order Specifications].[Type Order])='Sset') AND (([Printed Labels (Data Products)].Shipped)=0));
end


GO
