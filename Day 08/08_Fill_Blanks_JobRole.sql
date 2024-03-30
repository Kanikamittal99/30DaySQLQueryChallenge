use TechTFQ_SQL_Challenges
drop table if exists job_skills;
create table job_skills
(
	row_id		int,
	job_role	varchar(20),
	skills		varchar(20)
);
insert into job_skills values (1, 'Data Engineer', 'SQL');
insert into job_skills values (2, null, 'Python');
insert into job_skills values (3, null, 'AWS');
insert into job_skills values (4, null, 'Snowflake');
insert into job_skills values (5, null, 'Apache Spark');
insert into job_skills values (6, 'Web Developer', 'Java');
insert into job_skills values (7, null, 'HTML');
insert into job_skills values (8, null, 'CSS');
insert into job_skills values (9, 'Data Scientist', 'Python');
insert into job_skills values (10, null, 'Machine Learning');
insert into job_skills values (11, null, 'Deep Learning');
insert into job_skills values (12, null, 'Tableau');

select * from job_skills;

---------------------- SOLUTION 1 -----------------------------

WITH flag_cte AS
	(
		SELECT *, 
		SUM(CASE WHEN job_role Is not null THEN 1 ELSE 0 END) 
			OVER (ORDER BY row_id ASC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as segment
		FROM job_skills
)
SELECT row_id, FIRST_VALUE(job_role) OVER(PARTITION BY segment) AS job_role_n, skills
FROM flag_cte


---------------------- SOLUTION 2 -----------------------------

WITH recursive_cte AS
	(
		SELECT row_id,job_role,skills
		FROM job_skills 
		WHERE row_id = 1

		UNION ALL

		SELECT js.row_id, COALESCE(js.job_role,rc.job_role) AS job_role, js.skills
		FROM recursive_cte AS rc
		JOIN job_skills AS js ON js.row_id = rc.row_id+1
	)
SELECT *
FROM recursive_cte



/*
----------------------RECURSIVE CTE---------------------------
Sample structure

WITH cte AS
	(	
		Base Query
		UNION ALL
		Recursive Query with termination condition
	)
SELECT *
FROM cte;

*/


-------- Sample example - Recursive CTE

With cte_num 
as	(
		select 1 as num  --anchor Query

		union all

		Select num+1	-- recursive query
		from cte_num 
		where num <6  --filter to stop the recursion
)
select num 
from cte_num

