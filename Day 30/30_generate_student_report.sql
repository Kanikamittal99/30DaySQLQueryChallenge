/*
PROBLEM STATEMENT: Given tables represent the marks scored by engineering students.
Create a report to display the following results for each student.
  - Student_id, Student name
  - Total Percentage of all marks
  - Failed subjects (must be comma seperated values in case of multiple failed subjects)
  - Result (if percentage >= 70% then 'First Class', if >= 50% & <=70% then 'Second class', if <=50% then 'Third class' else 'Fail'.
  			The result should be Fail if a students fails in any subject irrespective of the percentage marks)
	
	*** The sequence of subjects in student_marks table match with the sequential id from subjects table.
	*** Students have the option to choose either 4 or 5 subjects only.
*/

drop table if exists student_marks;
drop table if exists students;
drop table if exists subjects;

create table students
(
	roll_no		varchar(20) primary key,
	name		varchar(30)		
);
insert into students values('2GR5CS011', 'Maryam');
insert into students values('2GR5CS012', 'Rose');
insert into students values('2GR5CS013', 'Alice');
insert into students values('2GR5CS014', 'Lilly');
insert into students values('2GR5CS015', 'Anna');
insert into students values('2GR5CS016', 'Zoya');


create table student_marks
(
	student_id		varchar(20) primary key references students(roll_no),
	subject1		int,
	subject2		int,
	subject3		int,
	subject4		int,
	subject5		int,
	subject6		int
);
insert into student_marks values('2GR5CS011', 75, NULL, 56, 69, 82, NULL);
insert into student_marks values('2GR5CS012', 57, 46, 32, 30, NULL, NULL);
insert into student_marks values('2GR5CS013', 40, 52, 56, NULL, 31, 40);
insert into student_marks values('2GR5CS014', 65, 73, NULL, 81, 33, 41);
insert into student_marks values('2GR5CS015', 98, NULL, 94, NULL, 90, 20);
insert into student_marks values('2GR5CS016', NULL, 98, 98, 81, 84, 89);


create table subjects
(
	id				varchar(20) primary key,
	name			varchar(30),
	pass_marks  	int check (pass_marks>=30)
);
insert into subjects values('S1', 'Mathematics', 40);
insert into subjects values('S2', 'Algorithms', 35);
insert into subjects values('S3', 'Computer Networks', 35);
insert into subjects values('S4', 'Data Structure', 40);
insert into subjects values('S5', 'Artificial Intelligence', 30);
insert into subjects values('S6', 'Object Oriented Programming', 35);


select * from students;
select * from student_marks;
select * from subjects;


-------------- SOLUTION ------------------------

--select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'student_marks'



With mainCte 
as( -- matching student_marks columns with subjects table rows
	select a.id,sj.name,pass_marks 
	from (
			select name as id,ROW_NUMBER() over(order by name) as rn 
			from sys.columns 
			where object_id = OBJECT_ID('student_marks') 
			and name like 'subject%'
		) a 
	join (
			select *, ROW_NUMBER() over(order by id) as rn1 
			from subjects 
			where name is not null
		) sj 
	on sj.rn1=a.rn
),
finalCte as( 
-- UNPIVOT removes the NULL values, but we need those null values for comparison, so we will use CROSS APPLY

			select sm.student_id, m.marks,m.subjects
			from student_marks as sm
			CROSS APPLY
				(
			    VALUES('subject1',subject1),
			          ('subject2',subject2),
			          ('subject3',subject3),
					  ('subject4',subject4),
					  ('subject5',subject5),
					  ('subject6',subject6)
				) AS m(subjects,marks)
			
			
), LastCte as(
	select student_id,st.name, 
	AVG(marks) as percentage_marks, 
	STRING_AGG(case when marks<pass_marks then mct.name else null end,',') as failed_subjects
	from finalCte as fct 
	join mainCte as mct on mct.id=fct.subjects 
	join students as st on fct.student_id=st.roll_no
	group by student_id,st.name
)
select student_id,name,
ISNULL(failed_subjects,'-') as failed_subjects, 
case when failed_subjects IS not null then 'Fail' 
	when percentage_marks>=70 then 'First Class' 
	when percentage_marks>=50 and percentage_marks<=70 then 'Second Class'
	when percentage_marks<=50 then 'Third Class' 
	end as Result
from LastCte






