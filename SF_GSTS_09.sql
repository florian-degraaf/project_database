delimiter //
create procedure SF_GSTS_09()
begin
select transport.available_transport as most_used_transport, count(trips.id_t) as 'number_of_uses_last_3_months'
from transport
inner join trips on trips.id_t = transport.id_t
where trips.departure_time >= DATE_ADD(CURRENT_TIMESTAMP, interval -3 month) and trips.departure_time <= CURRENT_TIMESTAMP
group by trips.id_t order by 'number_of_uses';
end //
delimiter ;	