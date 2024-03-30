-- Given table contains reported covid cases in 2020. 
-- Calculate the percentage increase in covid cases each month versus cumulative cases as of the prior month.
-- Return the month number, and the percentage increase rounded to one decimal. Order the result by the month.

drop table if exists covid_cases;
create table covid_cases
(
	cases_reported	int,
	dates			date	
);
insert into covid_cases values(20124,convert(datetime,'10/01/2020',103));
insert into covid_cases values(40133,convert(datetime, '15/01/2020',103));
insert into covid_cases values(65005,convert(datetime,'20/01/2020',103));
insert into covid_cases values(30005,convert(datetime,'08/02/2020',103));
insert into covid_cases values(35015,convert(datetime,'19/02/2020',103));
insert into covid_cases values(15015,convert(datetime,'03/03/2020',103));
insert into covid_cases values(35035,convert(datetime,'10/03/2020',103));
insert into covid_cases values(49099,convert(datetime,'14/03/2020',103));
insert into covid_cases values(84045,convert(datetime,'20/03/2020',103));
insert into covid_cases values(100106,convert(datetime,'31/03/2020',103));
insert into covid_cases values(17015,convert(datetime,'04/04/2020',103));
insert into covid_cases values(36035,convert(datetime,'11/04/2020',103));
insert into covid_cases values(50099,convert(datetime,'13/04/2020',103));
insert into covid_cases values(87045,convert(datetime,'22/04/2020',103));
insert into covid_cases values(101101,convert(datetime,'30/04/2020',103));
insert into covid_cases values(40015,convert(datetime,'01/05/2020',103));
insert into covid_cases values(54035,convert(datetime,'09/05/2020',103));
insert into covid_cases values(71099,convert(datetime,'14/05/2020',103));
insert into covid_cases values(82045,convert(datetime,'21/05/2020',103));
insert into covid_cases values(90103,convert(datetime,'25/05/2020',103));
insert into covid_cases values(99103,convert(datetime,'31/05/2020',103));
insert into covid_cases values(11015,convert(datetime,'03/06/2020',103));
insert into covid_cases values(28035,convert(datetime,'10/06/2020',103));
insert into covid_cases values(38099,convert(datetime,'14/06/2020',103));
insert into covid_cases values(45045,convert(datetime,'20/06/2020',103));
insert into covid_cases values(36033,convert(datetime,'09/07/2020',103));
insert into covid_cases values(40011,convert(datetime,'23/07/2020',103));	
insert into covid_cases values(25001,convert(datetime,'12/08/2020',103));
insert into covid_cases values(29990,convert(datetime,'26/08/2020',103));	
insert into covid_cases values(20112,convert(datetime,'04/09/2020',103));	
insert into covid_cases values(43991,convert(datetime,'18/09/2020',103));	
insert into covid_cases values(51002,convert(datetime,'29/09/2020',103));	
insert into covid_cases values(26587,convert(datetime,'25/10/2020',103));	
insert into covid_cases values(11000,convert(datetime,'07/11/2020',103));	
insert into covid_cases values(35002,convert(datetime,'16/11/2020',103));	
insert into covid_cases values(56010,convert(datetime,'28/11/2020',103));	
insert into covid_cases values(15099,convert(datetime,'02/12/2020',103));	
insert into covid_cases values(38042,convert(datetime,'11/12/2020',103));	
insert into covid_cases values(73030,convert(datetime,'26/12/2020',103));		


select * from covid_cases;

----------------- SOLUTION --------------------

-- With ORDER BY , the default frame is RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW . 
-- Without ORDER BY , the default frame is ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING


With cte as(
select MONTH(dates) as months,SUM(cases_reported) as current_cases
from covid_cases
group by MONTH(dates)
), totalCasesCte as(
select *, sum(current_cases) over(order by months) as rolling_cases_sum
from cte
)
select months, isnull(cast(
				cast(current_cases*1.0/lag(rolling_cases_sum)over (order by months)*100 as decimal(5,1)) as varchar),
				'-')
as percent_incr
from totalCasesCte


