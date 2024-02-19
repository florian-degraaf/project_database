select round(avg(total_full_price),2) as average_trip_cost
from (
select distinct trips.id_full_trip,
sum(distinct case when trips.departure_city = trips.destination then destinations.package_price else distances.distance*price_km end) as total_full_price
from trips
inner join trips_destinations on trips.id_trip = trips_destinations.id_trip
inner join destinations on destinations.id_city = trips_destinations.id_city
inner join destinations_transport on destinations_transport.id_city = destinations.id_city
inner join distances on trips.id_di = distances.id_di
group by trips.id_full_trip) as inner_query


