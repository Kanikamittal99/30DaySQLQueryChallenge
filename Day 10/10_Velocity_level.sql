use TechTFQ_SQL_Challenges
drop table if exists auto_repair;
create table auto_repair
(
	client			varchar(20),
	auto			varchar(20),
	repair_date		int,
	indicator		varchar(20),
	value			varchar(20)
);
insert into auto_repair values('c1','a1',2022,'level','good');
insert into auto_repair values('c1','a1',2022,'velocity','90');
insert into auto_repair values('c1','a1',2023,'level','regular');
insert into auto_repair values('c1','a1',2023,'velocity','80');
insert into auto_repair values('c1','a1',2024,'level','wrong');
insert into auto_repair values('c1','a1',2024,'velocity','70');
insert into auto_repair values('c2','a1',2022,'level','good');
insert into auto_repair values('c2','a1',2022,'velocity','90');
insert into auto_repair values('c2','a1',2023,'level','wrong');
insert into auto_repair values('c2','a1',2023,'velocity','50');
insert into auto_repair values('c2','a2',2024,'level','good');
insert into auto_repair values('c2','a2',2024,'velocity','80');

select * from auto_repair;



-- SIMPLE SOLUTION
-- LAG and SUM(CASE WHEN)

SELECT value AS velocity, 
SUM(CASE WHEN level = 'good' THEN 1 ELSE 0 END) AS good,
SUM(CASE WHEN level = 'wrong' THEN 1 ELSE 0 END) AS wrong,
SUM(CASE WHEN level = 'regular' THEN 1 ELSE 0 END) AS regular
FROM 
	(
		SELECT *, LAG(value) OVER(ORDER BY client ASC) AS 'level' FROM auto_repair
	) SQ
WHERE indicator='velocity' 
GROUP BY value;



-- ANOTHER SOLUTION
-- LAG and PIVOT

SELECT velocity, good, wrong, regular
FROM 
	(
		SELECT value AS velocity, level
		FROM (SELECT indicator,value, LAG(value) OVER(ORDER BY client ASC) AS level
			  FROM auto_repair
			) sq
		WHERE indicator='velocity'
		
	)bq
PIVOT
	(
		COUNT(level)
		FOR level IN ([good],[wrong],[regular])
	)pq;




-- TFQ approach

select *
from 
    (
        select v.value as velocity, l.value as level--,count(1) as cnt
        from auto_repair v
        join auto_repair l on v.auto=l.auto and v.repair_date=l.repair_date and v.client=l.client
        where v.indicator='velocity'
		and l.indicator='level'
    ) bq
pivot 
    (
        count(level)
        for level in ([good],[wrong],[regular])
    ) pq;