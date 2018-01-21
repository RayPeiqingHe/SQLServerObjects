CREATE TABLE IF NOT EXISTS symbol (
id int NOT NULL AUTO_INCREMENT,
exchange_id int NULL,
ticker varchar(32) NOT NULL,
instrument varchar(64) NOT NULL,
name varchar(255) NULL,
sector varchar(255) NULL,
currency varchar(32) NULL,
created_date datetime NOT NULL DEFAULT NOW(),
last_updated_date datetime NOT NULL DEFAULT NOW(),
CONSTRAINT pk_symbol PRIMARY KEY (id),
CONSTRAINT fk_exchange FOREIGN KEY (exchange_id) references exchange(id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;