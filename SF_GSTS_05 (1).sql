delimiter //
create procedure SF_GSTS_05()
begin
select 
sum(case when trips.departure_city = trips.destination then 1 else 0 end)/
count(trips.id_trip)*100  as '%_intra-city',
sum(case when trips.departure_city = trips.destination then 0 else 1 end)/
count(trips.id_trip)*100  as '%_inter-city'
from trips;
end //
delimiter ;		