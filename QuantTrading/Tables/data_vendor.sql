CREATE TABLE IF NOT EXISTS data_vendor (
id int NOT NULL AUTO_INCREMENT,
name varchar(64) NOT NULL,
website_url varchar(255) NULL,
support_email varchar(255) NULL,
created_date datetime NOT NULL DEFAULT NOW(),data_vendor
last_updated_date datetime NOT NULL DEFAULT NOW(),
PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


INSERT INTO data_vendor (name, website_url, support_email, created_date, last_updated_date)
VALUES ('yahoo', 'http://ichart.finance.yahoo.com/table.csv?s=%s&a=%s&b=%s&c=%s&d=%s&e=%s&f=%s', NULL,
CURDATE(), CURDATE())