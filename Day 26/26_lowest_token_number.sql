/*
PROBLEM STATEMENT:
Given table contains tokens taken by different customers in a tax office.
Write a SQL query to return the lowest token number which is unique to a customer (meaning token should be allocated to just a single customer).
*/

drop table if exists tokens;
create table tokens
(
	token_num	int,
	customer	varchar(20)
);
insert into tokens values(1, 'Maryam');
insert into tokens values(2, 'Rocky');
insert into tokens values(3, 'John');
insert into tokens values(3, 'John');
insert into tokens values(2, 'Arya');
insert into tokens values(1, 'Pascal');
insert into tokens values(9, 'Kate');
insert into tokens values(9, 'Ibrahim');
insert into tokens values(8, 'Lilly');
insert into tokens values(8, 'Lilly');
insert into tokens values(5, 'Shane');

select * from tokens;

--easy approach
select top 1 token_num
from tokens
group by token_num
having count(distinct customer) =  1
order by token_num

-- another way
select top 1 token_num --,COUNT(token_num) as unique_cust_count
from (select distinct * from tokens) a
group by token_num
having COUNT(token_num) = 1
order by token_num




-- another approach
With flagCte as(
	select token_num,customer, 
	case when customer = FIRST_VALUE(customer) over(partition by token_num order by customer) then 1 else 0 end as flag
	from tokens
),finalcte 
as( 
	select token_num,COUNT(customer)as total_customers,SUM(flag) as total_unique_customers 
	from flagCte 
	group by token_num
)
select top 1 token_num
from finalcte
where total_customers=total_unique_customers
order by token_num