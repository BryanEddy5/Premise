SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[Premise Load - New Orders]
as

SELECT DISTINCT CASE WHEN LEFT([item number], 1) = 'F'  OR LEFT([item number], 1) = 'T' THEN LEFT([item number], 5)
                ELSE LEFT([item number], 5) + '-' + SUBSTRING([item number], 7, 1) + '.' + SUBSTRING( [item number], 8, 1) 
				END AS Prefix2, 
                [new orders (premise) to transfer to ss].[oracle part no] AS 
                Prefix, 
                [new orders (premise) to transfer to ss].customer, 
                [new orders (premise) to transfer to ss].[item number], 
                [new orders (premise) to transfer to ss].length, 
                [new orders (premise) to transfer to ss].[mfg commit date], 
                [new orders (premise) to transfer to ss].[schedule date], 
                [new orders (premise) to transfer to ss].[co number], 
                [new orders (premise) to transfer to ss].[cust po #], 
                [new orders (premise) to transfer to ss].[line item], 
                [new orders (premise) to transfer to ss].[reel number], 
                CASE WHEN [reel number] IS NULL THEN 'New'ELSE [reel number] END  AS  [Reel No], 
                0                                                         AS 
                [Engr  Approval], 
                0                                                         AS 
                [Engr  Approval - S/C], 
                [new orders (premise) to transfer to ss].transferred, 
                [new orders (premise) to transfer to ss].[buff line]      AS 
                [Buff Line #], 
                [new orders (premise) to transfer to ss].[order id], 
                [new orders (premise) to transfer to ss].[oracle part no], 
                [new orders (premise) to transfer to ss].units 
FROM   [new orders (premise) to transfer to ss] 
WHERE  ( ( ( [new orders (premise) to transfer to ss].transferred ) = 0 ) 
         AND ( ( [new orders (premise) to transfer to ss].[oracle part no] ) NOT 
               LIKE 
               'A%' ) ) 


GO
