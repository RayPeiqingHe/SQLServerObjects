IF NOT EXISTS (SELECT * FROM sys.tables WHERE NAME = 'symbol' AND SCHEMA_NAME(SCHEMA_ID) = 'DBO')
BEGIN

CREATE TABLE symbol (
id int NOT NULL identity,
exchange_id int NULL,
ticker varchar(32) NOT NULL,
instrument varchar(64) NOT NULL,
name varchar(255) NULL,
sector varchar(255) NULL,
currency varchar(32) NULL,
created_date datetime NOT NULL,
last_updated_date datetime NOT NULL,
CONSTRAINT pk_symbol PRIMARY KEY (id),
CONSTRAINT fk_exchange FOREIGN KEY (exchange_id) references exchange(id)
)

END


CREATE UNIQUE NONCLUSTERED INDEX uix_symbol_ticker ON symbol(ticker)