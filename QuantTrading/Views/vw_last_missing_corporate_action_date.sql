IF EXISTS(SELECT * FROM SYS.views WHERE NAME = 'vw_last_missing_corporate_action_date' AND SCHEMA_NAME(SCHEMA_ID) = 'DBO')
BEGIN

    DROP VIEW DBO.vw_last_missing_corporate_action_date

	PRINT 'DROP VIEW DBO.vw_last_missing_corporate_action_date'

END

GO

CREATE VIEW DBO.vw_last_missing_corporate_action_date
AS
SELECT s.id, ticker
, COALESCE(CONVERT(char(10),DATEADD(day, 1, MAX(p.corporate_action_date)), 126), '2000-01-01') AS last_price_date 
FROM symbol s
LEFT JOIN corporate_action p ON s.id = p.symbol_id
GROUP BY s.id, ticker
HAVING getdate() >= COALESCE(CONVERT(char(10),DATEADD(day, 1, MAX(p.corporate_action_date)), 126), '2000-01-01')

GO


PRINT 'CREATE VIEW DBO.vw_last_missing_price_date'
