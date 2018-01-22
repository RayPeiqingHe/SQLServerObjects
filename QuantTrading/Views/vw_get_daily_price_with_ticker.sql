CREATE VIEW vw_get_daily_price_with_ticker
AS
SELECT s.ticker, p.* FROM daily_price AS p
INNER JOIN symbol AS s on p.symbol_id = s.id;
