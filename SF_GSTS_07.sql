select trips.id_trip from trips
where (trips.transport_mode = 'car' or trips.transport_mode = 'plane') and trips.id_full_trip = trips.id_full_trip
