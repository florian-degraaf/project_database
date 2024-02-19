delimiter //
create procedure SF_GSTS_16
(in id int)
begin
select distinct trips.id_full_trip, trips.departure_time,
round(sum(distinct case when trips.departure_city = trips.destination then destinations.package_price else distances.distance*price_km end),2) as total_price,
(case when count(*) > 2 then count(*)-1 else count(*) end) as nbr_cities_traversed
from trips
inner join trips_destinations on trips.id_trip = trips_destinations.id_trip
inner join destinations on destinations.id_city = trips_destinations.id_city
inner join distances on trips.id_di = distances.id_di
where trips.id_full_trip = id
group by trips.id_full_trip;
end //
delimiter ;