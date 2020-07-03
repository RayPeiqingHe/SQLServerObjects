CREATE VIEW vw_get_daily_price_with_ticker2
AS
SELECT s.ticker
, p.price_date as 'Date' 
, p.open_price as 'Open'
, p.low_price as 'Low'
, p.high_price as 'High'
, p.close_price as 'Close'
, p.adj_close_price as 'Adj_Close'
, p.volume as 'Volume'
FROM daily_price AS p
INNER JOIN symbol AS s on p.symbol_id = s.id;
