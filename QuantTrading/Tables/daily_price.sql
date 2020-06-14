CREATE TABLE IF NOT EXISTS daily_price (
id int NOT NULL AUTO_INCREMENT,
data_vendor_id int NOT NULL,
symbol_id int NOT NULL,
price_date datetime NOT NULL,
created_date datetime NOT NULL DEFAULT NOW(),
last_updated_date datetime NOT NULL DEFAULT NOW(),
open_price decimal(19,6) NULL,
high_price decimal(19,6) NULL,
low_price decimal(19,6) NULL,
close_price decimal(19,6) NULL,
adj_close_price decimal(19,6) NULL,
dividends decimal(19,6) NULL,
stock_splits decimal(19,6) NULL,
volume bigint NULL,
constraint pk_daily_price PRIMARY KEY (id),
constraint fk_data_vendor_id foreign KEY (data_vendor_id) references data_vendor(id),
constraint fk_symbol_id foreign KEY (symbol_id) references symbol(id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


ALTER TABLE daily_price  ADD UNIQUE INDEX ix_dail_price (symbol_id, price_date);