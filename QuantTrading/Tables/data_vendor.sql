IF NOT EXISTS (SELECT * FROM sys.tables WHERE NAME = 'data_vendor' AND SCHEMA_NAME(SCHEMA_ID) = 'DBO')
BEGIN

CREATE TABLE data_vendor (
id int NOT NULL identity,
name varchar(64) NOT NULL,
website_url varchar(255) NULL,
support_email varchar(255) NULL,
created_date datetime NOT NULL,
last_updated_date datetime NOT NULL,
constraint pk_data_vendor PRIMARY KEY (id)
)

END 