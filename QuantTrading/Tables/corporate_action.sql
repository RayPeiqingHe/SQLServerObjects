CREATE TABLE IF NOT EXISTS corporate_action (
id int NOT NULL AUTO_INCREMENT,
data_vendor_id int NOT NULL,
symbol_id int NOT NULL,
corporate_action_date datetime NOT NULL,
-- created_date datetime NOT NULL CONSTRAINT df_corporate_action_created_date DEFAULT NOW(),
created_date datetime NOT NULL DEFAULT NOW(),
-- last_updated_date datetime NOT NULL CONSTRAINT df_corporate_action_last_updated_date DEFAULT NOW(),
last_updated_date datetime NOT NULL DEFAULT NOW(),
corporate_action_type VARCHAR(20) NOT NULL,
prior_amount decimal(19,4) NULL,
ex_amount decimal(19,4) NULL,
constraint pk_corporate_action PRIMARY KEY (id),
constraint fk_corporate_action_data_vendor_id foreign KEY (data_vendor_id) references data_vendor(id),
constraint fk_corporate_action_symbol_id foreign KEY (symbol_id) references symbol(id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;