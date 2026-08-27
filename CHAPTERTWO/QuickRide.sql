-- 1 -- 
select trip_id, rider_name, fare
from trips
where city = "Lagos";
	
-- 2 -- 
select fare, rider_name, city
from trips
order by fare desc
limit 5;

-- 3 -- 
select distinct city
from trips;

-- 4 -- 
select trip_id, payment_method, fare
from trips
where payment_method = "card" and fare > 5000;

-- 5 -- 
select trip_id, distance_km
from trips
where distance_km between 5 and 10;

-- 6 -- 
select rider_name
from trips
where rider_name like "a%";

-- 7 -- 
select trip_id, payment_method
from trips
where payment_method in ("card" ,"wallet");

-- 8 -- 
select trip_id
from trips
where rating is null;

-- 9 -- 
select trip_id
from trips
where rating is null;

-- 10 -- 
select city, sum(fare) as total_fare
from trips
group by city 
order by city, total_fare desc;

-- 10 -- 
select count(trip_id)
from trips
where status = "cancelled";

-- 11 -- 
select sum(fare) as total_revenue, avg(fare) as average_fare, 
max(fare) as biggest_fare, min(fare) smallest_fare
from trips
where status = "completed";

-- 12 -- 
select vehicle_type, count(trip_id)
from trips
group by vehicle_type;

-- 13 -- 
select city, sum(fare) as total_revenue
from trips
where status = "completed"
group by city
order by total_revenue desc;

-- 14 -- 
select city, avg(rating) as average_rating
from trips
group by city
having average_rating < 4.0;

-- 15 -- 
select trips.driver_id, trip_id, driver_name, home_city
from trips join drivers
on trips.driver_id = drivers.driver_id;

-- 16 -- 
select trips.driver_id, driver_name, count(trip_id) as number_of_trips
from trips join drivers
on trips.driver_id = drivers.driver_id
group by driver_id
having number_of_trips > 6;
