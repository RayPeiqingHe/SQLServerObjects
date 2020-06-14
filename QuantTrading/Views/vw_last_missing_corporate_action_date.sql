CREATE VIEW vw_last_missing_corporate_action_date
AS
SELECT s.id, ticker
, coalesce(CONVERT(char(10),DATEADD(day, 1, MAX(p.corporate_action_date)), 126), '2000-01-01') AS last_price_date 
FROM symbol s
LEFT JOIN corporate_action p ON s.id = p.symbol_id
GROUP BY s.id, ticker
HAVING getdate() >= COALESCE(CONVERT(char(10),DATEADD(day, 1, MAX(p.corporate_action_date)), 126), '2000-01-01')
