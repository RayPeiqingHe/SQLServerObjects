IF NOT EXISTS (SELECT * FROM sys.tables WHERE NAME = 'daily_price' AND SCHEMA_NAME(SCHEMA_ID) = 'DBO')
BEGIN

CREATE TABLE daily_price (
id int NOT NULL identity,
data_vendor_id int NOT NULL,
symbol_id int NOT NULL,
price_date datetime NOT NULL,
created_date datetime NOT NULL,
last_updated_date datetime NOT NULL,
open_price decimal(19,4) NULL,
high_price decimal(19,4) NULL,
low_price decimal(19,4) NULL,
close_price decimal(19,4) NULL,
adj_close_price decimal(19,4) NULL,
volume bigint NULL,
constraint pk_daily_price PRIMARY KEY (id),
constraint fk_data_vendor_id foreign KEY (data_vendor_id) references data_vendor(id),
constraint fk_symbol_id foreign KEY (symbol_id) references symbol(id)
)

END


CREATE NONCLUSTERED INDEX ix_daily_price_symbol_id
ON [dbo].[daily_price] ([symbol_id])
INCLUDE ([price_date],[adj_close_price])


CREATE UNIQUE NONCLUSTERED INDEX uix_daily_price_symbol_id_date_price_date
ON [dbo].[daily_price] ([symbol_id], [price_date])
INCLUDE ([adj_close_price])