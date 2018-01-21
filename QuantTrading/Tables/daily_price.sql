CREATE TABLE IF NOT EXISTS daily_price (
id int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;