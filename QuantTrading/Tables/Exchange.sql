CREATE TABLE IF NOT EXISTS exchange 
(
id int NOT NULL AUTO_INCREMENT,exchange
abbrev varchar(32) NOT NULL,
name varchar(255) NOT NULL,
city varchar(255) NULL,
country varchar(255) NULL,
currency varchar(64) NULL,
timezone_offset time NULL,
create_date DATETIME NOT NULL DEFAULT NOW(),
last_updated_date DATETIME NOT NULL DEFAULT NOW(),
constraint pk_exchange PRIMARY KEY (id)
);


INSERT INTO exchange (abbrev, name, country, currency)
VALUES ('NYSE', 'NYSE', 'US', 'USD');


INSERT INTO exchange (abbrev, name, country, currency)
VALUES ('NASDAQ', 'NASDAQ 100', 'US', 'USD');