IF NOT EXISTS (SELECT * FROM sys.tables WHERE NAME = 'corporate_action' AND SCHEMA_NAME(SCHEMA_ID) = 'DBO')
BEGIN

CREATE TABLE corporate_action (
id int NOT NULL identity,
data_vendor_id int NOT NULL,
symbol_id int NOT NULL,
corporate_action_date datetime NOT NULL,
created_date datetime NOT NULL CONSTRAINT df_corporate_action_created_date
DEFAULT GETDATE(),
last_updated_date datetime NOT NULL CONSTRAINT df_corporate_action_last_updated_date
DEFAULT GETDATE(),
corporate_action_type VARCHAR(20) NOT NULL,
prior_amount decimal(19,4) NULL,
ex_amount decimal(19,4) NULL,
constraint pk_corporate_action PRIMARY KEY (id),
constraint fk_corporate_action_data_vendor_id foreign KEY (data_vendor_id) references data_vendor(id),
constraint fk_corporate_action_symbol_id foreign KEY (symbol_id) references symbol(id)
)

END


--DROP TABLE corporate_action


CREATE UNIQUE NONCLUSTERED INDEX uix_corporate_action_symbol_id_date_price_date
ON [dbo].[corporate_action] ([symbol_id], [corporate_action_date], [corporate_action_type])
INCLUDE (prior_amount, ex_amount)