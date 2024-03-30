use TechTFQ_SQL_Challenges
drop table if exists  student_tests;
create table student_tests
(
	test_id		int,
	marks		int
);
insert into student_tests values(100, 55);
insert into student_tests values(101, 55);
insert into student_tests values(102, 60);
insert into student_tests values(103, 58);
insert into student_tests values(104, 40);
insert into student_tests values(105, 50);

select * from student_tests;

-------------------------------------------------------------------------------------------------------
/* You are given a table having the marks of one student in every test. 
You have to output the tests in which the student has improved his performance. 
For a student to improve his performance he has to score more than the previous test.
Provide 2 solutions, one including the first test score and second excluding it.*/

--Output 1
-- Using CTE

With cte as(
select test_id, marks,
lag(marks,1,0) over(order by test_id) as prev_marks
from student_tests
)
select test_id,marks 
from cte 
where marks > prev_marks


--Output 2
-- Using subquery

select test_id, marks
from (
		select test_id, marks,
		lag(marks,1,marks) over(order by test_id) as prev_marks
		from student_tests
	) sq
where sq.marks > sq.prev_marks


-- same result - O/p 2
select test_id, marks
from (
		select test_id, marks,
		lag(marks,1) over(order by test_id) as prev_marks
		from student_tests
	) sq
where sq.marks > sq.prev_marks