IF NOT EXISTS (SELECT * FROM SYS.tables WHERE NAME = 'HistoricalQuotesOHLC' AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN

CREATE TABLE dbo.HistoricalQuotesOHLC
(
	QuoteID BIGINT IDENTITY
	,SecurityID INT
	,[Open] MONEY
	,High MONEY
	,Low MONEY
	,[Close] MONEY
	,CONSTRAINT PK_HistoricalQuotesOHLC PRIMARY KEY (QuoteID)
	,CONSTRAINT FK_HistoricalQuotesOHLC_SECURITYID FOREIGN KEY (SecurityID) REFERENCES dbo.SecurityMaster(SecurityID)
)

CREATE NONCLUSTERED INDEX IX_HISTORICALQUOTESOHLC_SECURITYID
ON dbo.HistoricalQuotesOHLC(SecurityID)
INCLUDE ([Open], High, Low, [Close])

PRINT 'CREATE TABLE dbo.HistoricalQuotesOHLC'

END 