IF NOT EXISTS (SELECT * FROM sys.tables WHERE NAME = 'exchange' AND SCHEMA_NAME(SCHEMA_ID) = 'DBO')
BEGIN
CREATE TABLE exchange 
(
id int NOT NULL identity,
abbrev varchar(32) NOT NULL,
name varchar(255) NOT NULL,
city varchar(255) NULL,
country varchar(255) NULL,
currency varchar(64) NULL,
timezone_offset time NULL,
create_date DATETIME NOT NULL,
last_updated_date DATETIME NOT NULL,
constraint pk_exchange PRIMARY KEY (id)
)

END