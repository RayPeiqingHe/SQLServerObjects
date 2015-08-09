IF NOT EXISTS (SELECT * FROM SYS.tables WHERE NAME = 'HistoricalQuotesStaging' AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN

CREATE TABLE DBO.HistoricalQuotesStaging
(
ticker VARCHAR(10) NOT NULL
,[Date] DATE NOT NULL
,[Open] MONEY NULL
,[High] MONEY NULL
,[Low] MONEY NULL
,[Close] MONEY NULL
,[Volume] BIGINT NULL
,[AdjClose] MONEY NULL
)

PRINT 'CREATE TABLE DBO.HistoricalQuotesStaging'

END
ELSE
PRINT 'Table already exists'

