/*
PROBLEM STATEMENT: Given table provides login and logoff details of one user.
Generate a report to reqpresent the different periods (in mins) when user was logged in.
*/
drop table if exists login_details;
create table login_details
(
	times	time,
	status	varchar(3)
);
insert into login_details values('10:00:00', 'on');
insert into login_details values('10:01:00', 'on');
insert into login_details values('10:02:00', 'on');
insert into login_details values('10:03:00', 'off');
insert into login_details values('10:04:00', 'on');
insert into login_details values('10:05:00', 'on');
insert into login_details values('10:06:00', 'off');
insert into login_details values('10:07:00', 'off');
insert into login_details values('10:08:00', 'off');
insert into login_details values('10:09:00', 'on');
insert into login_details values('10:10:00', 'on');
insert into login_details values('10:11:00', 'on');
insert into login_details values('10:12:00', 'on');
insert into login_details values('10:13:00', 'off');
insert into login_details values('10:14:00', 'off');
insert into login_details values('10:15:00', 'on');
insert into login_details values('10:16:00', 'off');
insert into login_details values('10:17:00', 'off');

select * from login_details;

--select convert(time(0),'10:00:00') as t 

---------------------------- SOLUTION ------------------------

With segmentCte 
as (
select *,rn-ROW_NUMBER() over(order by times) as segment
from (
	select *,ROW_NUMBER() over(order by times) as rn
	from login_details
) sq
where status = 'on'
),
loginCte 
as(
	select distinct FIRST_VALUE(ct.times) over(partition by segment order by segment,rn) as log_on,
	LAST_VALUE(ct.times) over(partition by segment order by segment,rn range between unbounded preceding and unbounded following) as last_log_on
	from segmentCte as ct
)
select *,datediff(minute,log_on,log_off) as duration 
from (
	select log_on,LEAD(times) over(order by times) as log_off
	from loginCte as ct right join login_details as lg on ct.last_log_on=lg.times
) sq
where log_on is not null


