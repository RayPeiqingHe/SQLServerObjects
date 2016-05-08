IF EXISTS (SELECT * FROM sys.procedures WHERE NAME = 'sp_insert_daily_price' AND SCHEMA_NAME(schema_id) = 'dbo')
BEGIN

   DROP PROCEDURE dbo.sp_insert_daily_price

   PRINT 'DROP PROCEDURE dbo.sp_insert_daily_price'

END

GO


CREATE PROCEDURE dbo.sp_insert_daily_price
(
@data_vendor_id INT, 
@symbol_id INT, 
@price_date DATE, 
@created_date DATE,
@last_updated_date DATE, 
@open_price decimal(19,4), 
@high_price decimal(19,4), 
@low_price decimal(19,4),
@close_price decimal(19,4), 
@volume bigint, 
@adj_close_price decimal(19,4)
)
AS
BEGIN

begin tran
if exists (select adj_close_price from daily_price
where symbol_id = @symbol_id AND price_date = @price_date)
begin
   update daily_price 
   set prior_adj_close_price = adj_close_price
   ,adj_close_price = @adj_close_price
   ,last_updated_date = @last_updated_date
   where symbol_id = @symbol_id AND price_date = @price_date
end
else
begin
INSERT INTO daily_price 
(data_vendor_id, symbol_id, price_date, created_date,
last_updated_date, open_price, high_price, low_price,
close_price, volume, adj_close_price) 
VALUES 
(@data_vendor_id, @symbol_id, @price_date, @created_date,
@last_updated_date, @open_price, @high_price, @low_price,
@close_price, @volume, @adj_close_price) 
end
commit tran

END

GO

PRINT 'CREATE PROCEDURE dbo.sp_insert_daily_price'


