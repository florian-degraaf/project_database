select sum(case when trips.transport_mode = 'plane' then 1 else 0 end) as 'number_plane_trips' from trips;