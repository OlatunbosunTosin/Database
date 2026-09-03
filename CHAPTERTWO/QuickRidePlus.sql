-- 1 -- 
select rider_name, driver_name, trips.city, fare
from trips  
join drivers on drivers.driver_id = trips.driver_id 
join riders on riders.rider_id = trips.rider_id
WHERE trip_id in
(select trip_id
from trips
where status = "completed");

-- 2 --
select rider_name, driver_name, drivers.vehicle_type, fare
from trips  
join drivers on drivers.driver_id = trips.driver_id 
join riders on riders.rider_id = trips.rider_id 
where trips.city = "Lagos";

-- 3 --
select rider_name, sum(fare) as total_spend
from trips  
join riders on riders.rider_id = trips.rider_id 
where status = "completed"
group by rider_name
order by total_spend desc;

-- 4 --
select driver_name, count(status), avg(rating)
from trips  
join drivers on drivers.driver_id = trips.driver_id 
where status = "completed"
group by driver_name;

-- 5 --
select trip_id, fare
from trips  
where fare > 
(select avg(fare) as average_fare
from trips);

-- 6 --
select driver_name
from drivers  
where driver_id not in (
select distinct driver_id
from trips 
where status = "cancelled");

-- 7 --
select rider_name
from trips  
join riders on riders.rider_id = trips.rider_id 
where fare =  (
select max(fare) as highest_fare
from trips);

-- 8 --
select rider_name
from trips  
join riders on riders.rider_id = trips.rider_id 
group by rider_name
having count(trip_id) > 
(select count(trip_id)
from trips
where rider_id = 
(select rider_id from riders where rider_name = "Chioma Bello"));

-- 9 --
select distinct rider_name
from trips  
join riders on riders.rider_id = trips.rider_id 
where rating = 5;

-- 10 -- 
select driver_name as name, home_city as city, 'driver' as role
from drivers  
union
select rider_name as name, city, 'rider' as role
from riders;

-- 11 -- 
select home_city as city
from drivers  
union
select city
from riders;

-- 12 -- 
select driver_name, sum(fare) as total_amount
from trips join drivers
on trips.driver_id = drivers.driver_id
group by driver_name
order by total_amount desc
limit 1;