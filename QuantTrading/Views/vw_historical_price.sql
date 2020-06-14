CREATE VIEW vw_historical_price
AS
SELECT
   price_date as 'datetime'
   ,open_price as 'open'
   ,high_price as 'high'
   ,low_price as 'low'
   ,close_price as 'close'
   ,volume
   ,adj_close_price as 'adj_close'
   ,s.ticker
FROM daily_price p
JOIN symbol s ON s.id = p.symbol_id
