-- Find out the employees who attended all company events

drop table if exists employees;
create table employees
(
	id			int,
	name		varchar(50)
);
insert into employees values(1, 'Lewis');
insert into employees values(2, 'Max');
insert into employees values(3, 'Charles');
insert into employees values(4, 'Sainz');


drop table if exists events;
create table events
(
	event_name		varchar(50),
	emp_id			int,
	dates			date
);
insert into events values('Product launch', 1, convert(datetime,'01-03-2024',103));
insert into events values('Product launch', 3, convert(datetime,'01-03-2024',103));
insert into events values('Product launch', 4, convert(datetime,'01-03-2024',103));
insert into events values('Conference', 2, convert(datetime,'02-03-2024',103));
insert into events values('Conference', 2, convert(datetime,'03-03-2024',103));
insert into events values('Conference', 3, convert(datetime,'02-03-2024',103));
insert into events values('Conference', 4, convert(datetime,'02-03-2024',103));
insert into events values('Training', 3, convert(datetime,'04-03-2024',103));
insert into events values('Training', 2, convert(datetime,'04-03-2024',103));
insert into events values('Training', 4, convert(datetime,'04-03-2024',103));
insert into events values('Training', 4, convert(datetime,'05-03-2024',103));



select * from employees;
select * from events;

--------------------- SOLUTION ---------------------

select name as employee_name, COUNT(distinct event_name) as no_of_events
from events join employees on events.emp_id=employees.id
group by name
having COUNT(distinct event_name) = (select COUNT(distinct event_name) from events);