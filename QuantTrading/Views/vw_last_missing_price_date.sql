CREATE VIEW vw_last_missing_price_date
AS
select 
s.id
,s.ticker
,coalesce((max(p.price_date) + interval 1 day),'2000-01-01') AS `last_price_date` 
from ((symbol s 
	   left join (select max(corporate_action.corporate_action_date) 
				  AS `d_date`, corporate_action.symbol_id AS `symbol_id`
				  from corporate_action group by corporate_action.symbol_id) d
	   on((s.id = d.symbol_id))) left join daily_price p on(((p.symbol_id = s.id) 
	   and (isnull(d.d_date) or (d.d_date <= p.price_date))))) 
	   group by s.id, s.ticker having (cast(now() as date) >= coalesce((max(p.price_date) + interval 1 day),'2000-01-01'))
           and (cast(now() as date) >= coalesce((max(p.last_updated_date)),'2000-01-01'));;