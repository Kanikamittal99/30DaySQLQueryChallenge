/*
PROBLEM STATEMENT: 
Given vacation_plans tables shows the vacations applied by each employee during the year 2024. 
Leave_balance table has the available leaves for each employee.
Write an SQL query to determine if the vacations applied by each employee can be approved or not based on the available leave balance. 
If an employee has enough available leaves then mention the status as "Approved" else mention "Insufficient Leave Balance".
Assume there are no public holidays during 2024. weekends (sat & sun) should be excluded while calculating vacation days. 
*/

drop table if exists vacation_plans;
create table vacation_plans
(
	id 			int primary key,
	emp_id		int,
	from_dt		date,
	to_dt		date
);
insert into vacation_plans values(1,1, '2024-02-12', '2024-02-16');
insert into vacation_plans values(2,2, '2024-02-20', '2024-02-29');
insert into vacation_plans values(3,3, '2024-03-01', '2024-03-31');
insert into vacation_plans values(4,1, '2024-04-11', '2024-04-23');
insert into vacation_plans values(5,4, '2024-06-01', '2024-06-30');
insert into vacation_plans values(6,3, '2024-07-05', '2024-07-15');
insert into vacation_plans values(7,3, '2024-08-28', '2024-09-15');


drop table if exists leave_balance;
create table leave_balance
(
	emp_id			int,
	balance			int
);
insert into leave_balance values (1, 12);
insert into leave_balance values (2, 10);
insert into leave_balance values (3, 26);
insert into leave_balance values (4, 20);
insert into leave_balance values (5, 14);

select * from vacation_plans;
select * from leave_balance;


---------------------- SOLUTION ------------------------

With WeekdaysCte as(  -- to check how many weekdays are falling between from and to dates mentioned for leave
	select id,emp_id,from_dt,to_dt,
	case when DATENAME(DW,from_dt) not in('Saturday','Sunday') then 1 else 0 end as x 
	from vacation_plans
	
	union all
	
	select id,emp_id,dateadd(day,1,from_dt),to_dt,
	case when DATENAME(DW,dateadd(day,1,from_dt)) not in('Saturday','Sunday') then 1 else 0 end as x
	from WeekdaysCte where from_dt<to_dt
),
totalVacationDaysCte  --find vacation_days and balance corresponding to each employee
as (
	select id,ct.emp_id,min(from_dt) as from_dt,max(to_dt) as to_dt, SUM(x) as vacation_days, lb.balance,
	ROW_NUMBER() over(PARTITION by ct.emp_id order by ct.emp_id,ct.id) as rn
	from WeekdaysCte as ct 
	left join leave_balance as lb 
		on ct.emp_id=lb.emp_id
	group by id,ct.emp_id,lb.balance
), 
recurCte as(  -- calculate remaining leaves by checking previous approved leaves
	select *, balance-vacation_days as remaining_balance
	from totalVacationDaysCte 
	where rn=1
	
	union all
	
	select tvd.*, rct.remaining_balance-tvd.vacation_days as remaining_balance 
	from recurCte as rct
	join totalVacationDaysCte as tvd
		on tvd.rn = rct.rn+1 
		and tvd.emp_id=rct.emp_id
)
select id,emp_id,from_dt,to_dt,vacation_days, 
case when remaining_balance <0 then 'Insufficient Leave Balance' else 'Approved' end as status
from recurCte
order by emp_id
