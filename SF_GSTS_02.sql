select city_b_c as city,sum(count_per_city) as clients_per_city from (
select id_c, city_b_c, count(city_b_c) as count_per_city from clients group by city_b_c,city_d_c union
select id_c, city_d_c, count(city_d_c) from clients group by city_d_c,city_b_c) as inner_query
group by city_b_c