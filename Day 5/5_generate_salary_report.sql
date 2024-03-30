use TechTFQ_SQL_Challenges
drop table if exists salary;
create table salary
(
	emp_id		int,
	emp_name	varchar(30),
	base_salary	int
);
insert into salary values(1, 'Rohan', 5000);
insert into salary values(2, 'Alex', 6000);
insert into salary values(3, 'Maryam', 7000);


drop table if exists income;
create table income
(
	id			int,
	income		varchar(20),
	percentage	int
);
insert into income values(1,'Basic', 100);
insert into income values(2,'Allowance', 4);
insert into income values(3,'Others', 6);


drop table if exists deduction;
create table deduction
(
	id			int,
	deduction	varchar(20),
	percentage	int
);
insert into deduction values(1,'Insurance', 5);
insert into deduction values(2,'Health', 6);
insert into deduction values(3,'House', 4);


drop table if exists emp_transaction;
create table emp_transaction
(
	emp_id		int,
	emp_name	varchar(50),
	trns_type	varchar(20),
	amount		numeric
);
insert into emp_transaction
select s.emp_id, s.emp_name, x.trns_type
, case when x.trns_type = 'Basic' then round(base_salary * (cast(x.percentage as decimal)/100),2)
	   when x.trns_type = 'Allowance' then round(base_salary * (cast(x.percentage as decimal)/100),2)
	   when x.trns_type = 'Others' then round(base_salary * (cast(x.percentage as decimal)/100),2)
	   when x.trns_type = 'Insurance' then round(base_salary * (cast(x.percentage as decimal)/100),2)
	   when x.trns_type = 'Health' then round(base_salary * (cast(x.percentage as decimal)/100),2)
	   when x.trns_type = 'House' then round(base_salary * (cast(x.percentage as decimal)/100),2) end as amount	   
from salary s
cross join (select income as trns_type, percentage from income
			union
			select deduction as trns_type, percentage from deduction) x;


select * from salary;
select * from income;
select * from deduction;
select * from emp_transaction;



-------------------------------------- SOLUTION -------------------------------------------------

-- Populating Emp_transaction table 

INSERT INTO emp_transaction (emp_id,emp_name,trns_type,amount)
(select s.emp_id,s.emp_name,d.deduction as trns_type,d.percentage*s.base_salary/100 as amount from salary as s
cross join deduction as d
union
select s.emp_id,s.emp_name,i.income as trns_type,i.percentage*s.base_salary/100 as amount from salary as s
cross join income as i
)


-- Salary Report 

With base_cte as(
select emp_name, 
sum(case when trns_type = 'Allowance' then amount end) as Allowance,
sum(case when trns_type = 'Basic' then amount end) as Basic,
sum(case when trns_type = 'Others' then amount end) as Others,
sum(case when trns_type = 'Insurance' then amount end) as Insurance,
sum(case when trns_type = 'Health' then amount end) as Health,
sum(case when trns_type = 'House' then amount end) as House
from emp_transaction
group by emp_name
)
select *, (Allowance + Basic + Others) as gross,
(Insurance + Health + House) as Total_deductions,
(Allowance + Basic + Others)-(Insurance + Health + House) as net_pay
from base_cte




------------ Using PIVOT on emp_transaction table ------------

/*select *
from
	(
		base query
	)bq
pivot
	(
		agg func
		list of columns
	)pq;
*/

select emp_name, 
Basic,Allowance,Others,
(Allowance + Basic + Others) as gross,
Insurance,Health, House,
(Insurance + Health + House) as Total_deductions,
(Allowance + Basic + Others)-(Insurance + Health + House) as net_pay
from
	(
		select emp_name,trns_type, amount
		from emp_transaction
	)bq
pivot
	(
		sum(amount)
		for trns_type in([Allowance],[Basic],[Others],[Insurance],[Health],[House])
	)pq;


