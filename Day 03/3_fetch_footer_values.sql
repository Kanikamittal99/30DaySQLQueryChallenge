USE TechTFQ_SQL_Challenges
DROP TABLE IF EXISTS FOOTER;
CREATE TABLE FOOTER 
(
	id 			INT PRIMARY KEY,
	car 		VARCHAR(20), 
	length 		INT, 
	width 		INT, 
	height 		INT
);

INSERT INTO FOOTER VALUES (1, 'Hyundai Tucson', 15, 6, NULL);
INSERT INTO FOOTER VALUES (2, NULL, NULL, NULL, 20);
INSERT INTO FOOTER VALUES (3, NULL, 12, 8, 15);
INSERT INTO FOOTER VALUES (4, 'Toyota Rav4', NULL, 15, NULL);
INSERT INTO FOOTER VALUES (5, 'Kia Sportage', NULL, NULL, 18); 

SELECT * FROM FOOTER;


-- cannot use LAST_value() since IGNORE NULLS feature is not present for older versions
-- CROSS Join - Returns cartesian product of tables involved in join; Doesn't reuire ON clause
-- Window functions - SUM, MAX
-- Multiple CTE

-- Solution provided by tfq
select * from (select top 1 car from FOOTER where car is not null order by id desc) car 
cross join (select top 1 length from FOOTER where length is not null order by id desc) length
cross join (select top 1 width from FOOTER where width is not null order by id desc) width
cross join (select top 1 height from FOOTER where height is not null order by id desc) height;


-- My solution

With partition_cte as(
select *,
sum(case when car is not null then 1 else 0 end) over (order by id asc rows between unbounded preceding and current row) as car_partition,
sum(case when length is not null then 1 else 0 end) over (order by id asc rows between unbounded preceding and current row) as length_partition,
sum(case when width is not null then 1 else 0 end) over (order by id asc rows between unbounded preceding and current row) as width_partition,
sum(case when height is not null then 1 else 0 end) over (order by id asc rows between unbounded preceding and current row) as height_partition
from FOOTER
),
fetch_max_cte as(
select *,
MAX(car) over(PARTITION by car_partition) as last_car,
MAX(length) over(PARTITION by length_partition) as last_length,
MAX(width) over(PARTITION by width_partition) as last_width,
MAX(height) over(PARTITION by height_partition) as last_height
from partition_cte
)
select top 1 last_car as car, last_length as length, last_width as width, last_height as height 
from fetch_max_cte
order by id desc



--can use this instead of MAX
/*
select FIRST_VALUE(car) over(partition by car_Partition order by id asc),
FIRST_VALUE(length) over(partition by length_partition order by id asc),
FIRST_VALUE(width) over(partition by width_partition order by id asc),
FIRST_VALUE(height) over(partition by height_partition order by id asc)
from partition_cte

*/


