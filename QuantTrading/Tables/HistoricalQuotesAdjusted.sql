IF NOT EXISTS (SELECT * FROM sys.tables WHERE NAME = 'HistoricalQuotesAdjusted' AND SCHEMA_NAME(SCHEMA_ID) = 'dbo')
BEGIN

CREATE TABLE dbo.HistoricalQuotesAdjusted
(
	QuoteID BIGINT IDENTITY
	,SecurityID INT
	,[Volume] MONEY
	,AdjClose MONEY
	,CONSTRAINT PK_HistoricalQuotesAdjusted PRIMARY KEY (QuoteID)
	,CONSTRAINT FK_HistoricalQuotesAdjusted_SECURITYID FOREIGN KEY (SecurityID) REFERENCES dbo.SecurityMaster(SecurityID)
)

CREATE NONCLUSTERED INDEX IX_HistoricalQuotesAdjusted_SECURITYID
ON dbo.HistoricalQuotesAdjusted(SecurityID)
INCLUDE ([Volume], AdjClose)

PRINT 'CREATE TABLE dbo.HistoricalQuotesAdjusted'

END