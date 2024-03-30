-- Given table showcases details of pizza delivery order for the year of 2023.
-- If an order is delayed then the whole order is given for free. 
-- Any order that takes 30 minutes more than the expected time is considered as delayed order. 
-- Identify the percentage of delayed order for each month and also display the total no of free pizzas given each month.
-- Output: PERIOD	DELAYED_DELIVERY_PERC	FREE_PIZZAS

DROP TABLE IF EXISTS pizza_delivery;
CREATE TABLE pizza_delivery 
(
	order_id 			INT,
	order_time 			datetime,
	expected_delivery 	datetime,
	actual_delivery 	datetime,
	no_of_pizzas 		INT,
	price 				DECIMAL
);


-- Data to this table can be found in CSV File

select * from pizza_delivery;
--drop table pizza_Delivery
--delete from pizza_delivery


----------------- SOLUTION -----------------------

select FORMAT(order_time,'MMM-yy') as period,
	cast(sum(case when actual_delivery>expected_delivery then 1 else 0 end)*1.0/
						count(order_id)*100 as decimal(4,2)) as delayed_delivery_percantage,
	sum(case when actual_delivery>expected_delivery then no_of_pizzas else 0 end) as free_pizzas
from pizza_delivery
group by FORMAT(order_time,'MMM-yy')



/*
select FORMAT(order_time,'MMM-yy')
from pizza_delivery
*/
