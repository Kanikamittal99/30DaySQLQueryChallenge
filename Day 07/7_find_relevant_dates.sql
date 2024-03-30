use TechTFQ_SQL_Challenges;

-- Micrososft SQL Server
drop table if exists Day_Indicator;
create table Day_Indicator
(
	Product_ID 		varchar(10),	
	Day_Indicator 	varchar(7),
	Dates			date
);
insert into Day_Indicator values ('AP755', '1010101', CONVERT(DATE,'04-Mar-2024', 102));
insert into Day_Indicator values ('AP755', '1010101', CONVERT(DATE,'05-Mar-2024', 102));
insert into Day_Indicator values ('AP755', '1010101', CONVERT(DATE,'06-Mar-2024', 102));
insert into Day_Indicator values ('AP755', '1010101', CONVERT(DATE,'07-Mar-2024', 102));
insert into Day_Indicator values ('AP755', '1010101', CONVERT(DATE,'08-Mar-2024', 102));
insert into Day_Indicator values ('AP755', '1010101', CONVERT(DATE,'09-Mar-2024', 102));
insert into Day_Indicator values ('AP755', '1010101', CONVERT(DATE,'10-Mar-2024', 102));
insert into Day_Indicator values ('XQ802', '1000110', CONVERT(DATE,'04-Mar-2024', 102));
insert into Day_Indicator values ('XQ802', '1000110', CONVERT(DATE,'05-Mar-2024', 102));
insert into Day_Indicator values ('XQ802', '1000110', CONVERT(DATE,'06-Mar-2024', 102));
insert into Day_Indicator values ('XQ802', '1000110', CONVERT(DATE,'07-Mar-2024', 102));
insert into Day_Indicator values ('XQ802', '1000110', CONVERT(DATE,'08-Mar-2024', 102));
insert into Day_Indicator values ('XQ802', '1000110', CONVERT(DATE,'09-Mar-2024', 102));
insert into Day_Indicator values ('XQ802', '1000110', CONVERT(DATE,'10-Mar-2024', 102));

select * from Day_Indicator;


-- https://learn.microsoft.com/en-us/sql/t-sql/functions/datepart-transact-sql?view=sql-server-ver16 

-- Since sunday is interpreted as the first day of week (by default)
-- We used DATEFIRST to use MONDAY as first day

SET DATEFIRST 1 -- ( Monday )

-- Draft 1
With cte as(
select *,datepart(dw,dates) as position
from Day_Indicator
)
select *,
case when SUBSTRING(day_indicator,position,1)='1' then 1 else 0 end as flag
from cte


--- Draft 2



select Product_ID, Day_Indicator, Dates
from(
		select *,case when SUBSTRING(day_indicator,datepart(dw,dates),1)='1' then 1 else 0 end as flag
		from Day_Indicator
	) sq
where flag = 1



select Product_ID,SUBSTRING(Product_ID,2,1) as second_character
from Day_Indicator