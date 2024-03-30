-- Given is user login table for , identify dates where a user has logged in for 5 or more consecutive days.
-- Return the user id, start date, end date and no of consecutive days, sorting based on user id.
-- If a user logged in consecutively 5 or more times but not spanning 5 days then they should be excluded.

/*
-- Output:
USER_ID		START_DATE		END_DATE		CONSECUTIVE_DAYS
1			10/03/2024		14/03/2024		5
1 			25/03/2024		30/03/2024		6
3 			01/03/2024		05/03/2024		5
*/


-- Micrososft SQL Server Dataset

drop table if exists user_login;
create table user_login
(
	user_id		int,
	login_date	date
);
insert into user_login values(1, convert(datetime,'01/03/2024',103));
insert into user_login values(1, convert(datetime,'02/03/2024',103));
insert into user_login values(1, convert(datetime,'03/03/2024',103));
insert into user_login values(1, convert(datetime,'04/03/2024',103));
insert into user_login values(1, convert(datetime,'06/03/2024',103));
insert into user_login values(1, convert(datetime,'10/03/2024',103));
insert into user_login values(1, convert(datetime,'11/03/2024',103));
insert into user_login values(1, convert(datetime,'12/03/2024',103));
insert into user_login values(1, convert(datetime,'13/03/2024',103));
insert into user_login values(1, convert(datetime,'14/03/2024',103));
insert into user_login values(1, convert(datetime,'20/03/2024',103));
insert into user_login values(1, convert(datetime,'25/03/2024',103));
insert into user_login values(1, convert(datetime,'26/03/2024',103));
insert into user_login values(1, convert(datetime,'27/03/2024',103));
insert into user_login values(1, convert(datetime,'28/03/2024',103));
insert into user_login values(1, convert(datetime,'29/03/2024',103));
insert into user_login values(1, convert(datetime,'30/03/2024',103));
insert into user_login values(2, convert(datetime,'01/03/2024',103));
insert into user_login values(2, convert(datetime,'02/03/2024',103));
insert into user_login values(2, convert(datetime,'03/03/2024',103));
insert into user_login values(2, convert(datetime,'04/03/2024',103));
insert into user_login values(3, convert(datetime,'01/03/2024',103));
insert into user_login values(3, convert(datetime,'02/03/2024',103));
insert into user_login values(3, convert(datetime,'03/03/2024',103));
insert into user_login values(3, convert(datetime,'04/03/2024',103));
insert into user_login values(3, convert(datetime,'04/03/2024',103));
insert into user_login values(3, convert(datetime,'04/03/2024',103));
insert into user_login values(3, convert(datetime,'05/03/2024',103));
insert into user_login values(4, convert(datetime,'01/03/2024',103));
insert into user_login values(4, convert(datetime,'02/03/2024',103));
insert into user_login values(4, convert(datetime,'03/03/2024',103));
insert into user_login values(4, convert(datetime,'04/03/2024',103));
insert into user_login values(4, convert(datetime,'05/03/2024',103));


select * from user_login;
--https://stackoverflow.com/questions/26117179/sql-count-consecutive-days

select user_id, Min(login_date) over(partition by user_id order by login_date) as start_date,
MAX(login_date) over(partition by user_id order by login_date) as end_date
from user_login

With cte as(
select login_date, DATEADD(day,-ROW_NUMBER() over(order by user_id),login_date) as grp_Set
from user_login
)
select grp_set,MIN(login_date), MAX(login_date)
from cte
group by grp_Set


-- returns NULL if two expressions are equal, otherwise it returns the first expression. 
-- nullif(UserCode,0)
--  so when UserCode is 0, the NULLIF function will turn it into NULL, and it won't be included in the COUNT 

With cte as(
	select user_id,login_date, 
		DATEADD(day,-ROW_NUMBER() over(partition by user_id order by login_date),login_date) as grp_Set
	from user_login
), cte_final as(
select USER_ID, grp_set, MIN(login_date) as start_date, MAX(login_date) as end_date,COUNT(grp_set) as consecutive_days
from cte
group by user_id, grp_set
)
select user_id, start_date,end_date, consecutive_days
from cte_final
where consecutive_Days >=5
order by user_id


-- final OPTIMIZED SOLUTION
With cte as(
	select user_id,login_date, 
		DATEADD(day,-ROW_NUMBER() over(partition by user_id order by login_date),login_date) as grp_Set
	from user_login
)
select user_id,MIN(login_date) as start_date, MAX(login_date) as end_date,COUNT(user_id) as consecutive_days
from cte
group by user_id, grp_set
having COUNT(user_id) >=5
order by user_id,grp_set

select user_id,login_date,
	ROW_NUMBER() over(partition by user_id order by login_date) as rn, 
	DATEADD(day,-ROW_NUMBER() over(partition by user_id order by login_date),login_date) as grp_Set
from user_login