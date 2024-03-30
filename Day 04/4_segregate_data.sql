use TechTFQ_SQL_Challenges;
drop table if exists Q4_data;
create table Q4_data
(
	id			int,
	name		varchar(20),
	location	varchar(20)
);
insert into Q4_data values(1,null,null);
insert into Q4_data values(2,'David',null);
insert into Q4_data values(3,null,'London');
insert into Q4_data values(4,null,null);
insert into Q4_data values(5,'David',null);

select * from Q4_data;


/**********************************************************************************************/*

-- min(name) - nulls are ignored and names are fetched in alphabeteical order
--Sol 1

select min(id) as id, MIN(name) as name, MIN(location) as location
from Q4_data;

select max(id) as id, MIN(name) as name, MIN(location) as location
from Q4_data;


--Sol2

select * from (select MIN(id) as id from Q4_data) id1
cross join (select distinct name from Q4_data where name is not null) name
cross join (select distinct location from Q4_data where location is not null) location

--sol3

select id=(select MIN(id) from Q4_data), name=(select distinct FIRST_VALUE(name) over(order by id asc) as name
from Q4_data
where name is not null),
location=(
select distinct FIRST_VALUE(location) over(order by id asc) as location
from Q4_data
where location is not null)

--sol4
with my_cte as(
select first_value(name) over(order by case when name is not null then 0 else 1 end asc) as first_name, 
first_value(location) over(order by case when location is not null then 0 else 1 end asc) as first_location
from Q4_data)
select id, first_name as name, first_location as location
from my_cte
where id = (select max(id) from Q4_data) 
