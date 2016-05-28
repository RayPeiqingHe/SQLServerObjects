IF OBJECT_ID (N'dbo.ufn_historical_price', N'IF') IS NOT NULL
    DROP FUNCTION dbo.ufn_historical_price;

	PRINT 'DROP FUNCTION dbo.ufn_historical_price'
GO


CREATE FUNCTION dbo.ufn_historical_price (@ticker VARCHAR(32))
RETURNS TABLE
AS
RETURN 
(
SELECT
   price_date as [datetime]
   ,open_price as [open]
   ,high_price as [high]
   ,low_price as [low]
   ,close_price as [close]
   ,volume
   ,adj_close_price as [adj_close]
   FROM daily_price p
   JOIN symbol s ON s.id = p.symbol_id
   WHERE ticker = @ticker
);