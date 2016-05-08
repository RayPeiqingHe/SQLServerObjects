IF EXISTS(SELECT * FROM SYS.views WHERE NAME = 'vw_last_missing_price_date' AND SCHEMA_NAME(SCHEMA_ID) = 'DBO')
BEGIN

    DROP VIEW DBO.vw_last_missing_price_date

	PRINT 'DROP VIEW DBO.vw_last_missing_price_date'

END

GO

CREATE VIEW DBO.vw_last_missing_price_date
AS
SELECT s.id, ticker
, COALESCE(CONVERT(char(10),DATEADD(day, 1, MAX(price_date)), 126), '2000-01-01') AS last_price_date 
FROM symbol s
LEFT JOIN (SELECT max(corporate_action_date) as d_date, symbol_id from corporate_action GROUP BY symbol_id) d 
ON s.id = d.symbol_id
LEFT JOIN daily_price p
ON p.symbol_id = s.id AND (d.d_date IS NULL OR d.d_date <= p.price_date)
GROUP BY s.id, ticker
HAVING Convert(date, getdate()) >= COALESCE(CONVERT(char(10),DATEADD(day, 1, MAX(price_date)), 126), '2000-01-01')

GO


PRINT 'CREATE VIEW DBO.vw_last_missing_price_date'


