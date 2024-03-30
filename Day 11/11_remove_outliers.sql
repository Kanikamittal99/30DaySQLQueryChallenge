use TechTFQ_SQL_Challenges;
drop table if exists hotel_ratings;
create table hotel_ratings
(
	hotel 		varchar(30),
	year		int,
	rating 		float
);
insert into hotel_ratings values('Radisson Blu', 2020, 4.8);
insert into hotel_ratings values('Radisson Blu', 2021, 3.5);
insert into hotel_ratings values('Radisson Blu', 2022, 3.2);
insert into hotel_ratings values('Radisson Blu', 2023, 3.8);
insert into hotel_ratings values('InterContinental', 2020, 4.2);
insert into hotel_ratings values('InterContinental', 2021, 4.5);
insert into hotel_ratings values('InterContinental', 2022, 1.5);
insert into hotel_ratings values('InterContinental', 2023, 3.8);

select * from hotel_ratings;

--https://www.analyticsvidhya.com/blog/2022/08/dealing-with-outliers-using-the-z-score-method/

WITH hotel_stats as ( 
    SELECT 
         *
        ,AVG(rating) OVER (PARTITION BY hotel order by year 
							range between unbounded preceding and unbounded following) AS Hotel_Avg
        ,STDEV(rating) OVER (PARTITION BY hotel order by year 
							range between unbounded preceding and unbounded following) AS Hotel_Std
    FROM hotel_ratings
)
SELECT hotel,year,rating
FROM hotel_stats AS s
WHERE s.rating BETWEEN s.Hotel_Avg - s.Hotel_Std AND s.Hotel_Avg + s.Hotel_Std 
ORDER BY s.hotel desc, s.year;


--https://machinelearningmastery.com/how-to-use-statistics-to-identify-outliers-in-data/#:~:text=We%20can%20calculate%20the%20mean,standard%20deviations%20from%20the%20mean.&text=We%20can%20then%20identify%20outliers,defined%20lower%20and%20upper%20limits.
/*
Three standard deviations from the mean is a common cut-off in practice for identifying outliers in a Gaussian or 
Gaussian-like distribution. For smaller samples of data, perhaps a value of 2 standard deviations (95%) can be used, 
and for larger samples, perhaps a value of 4 standard deviations (99.9%) can be used.
*/

--https://help.highbond.com/helpdocs/analytics/15/en-us/Content/analytics/analyzing_data/identifying_outliers.htm#:~:text=For%20example%2C%20if%20you%20specify,outliers%20in%20the%20output%20results

select PERCENTILE_DISC()
from hotel_ratings






with cte as
		(select *, round(avg(rating) over(partition by hotel order by year
									range between unbounded preceding and unbounded following)
						,2) as avg_rating
		from hotel_ratings),
	cte_rnk as
		(select *,abs(avg_rating-rating) as diff
		, rank() over(partition by hotel order by abs(avg_rating-rating) desc ) rnk
		from cte)
select hotel, year, rating
from cte_rnk
where rnk > 1
order by hotel,year;