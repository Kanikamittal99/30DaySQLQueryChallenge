/*
In the given input table, some of the invoice are missing
ToDo: Write a sql query to identify the missing serial no. 
Assumption: Consider the serial no with the lowest value to be the first generated invoice 
			and the highest serial no value to be the last generated invoice
*/

drop table if exists invoice;
create table invoice
(
	serial_no		int,
	invoice_date	date
);
insert into invoice values (330115, cast('01-Mar-2024' as date));
insert into invoice values (330120, cast('01-Mar-2024'as date));
insert into invoice values (330121, cast('01-Mar-2024'as date));
insert into invoice values (330122, cast('02-Mar-2024'as date));
insert into invoice values (330125, cast('02-Mar-2024' as date));

select * from invoice;

-------------------------------------------------------------------------------------------------------------------
--select CONVERT(varchar,invoice_date,103) from invoice;
--convert(datetime,'26/12/2020',103)

--------------- SOLUTION -----------------

With recursiveCte
As(
	select min(serial_no) as n,MAX(serial_no) as m from invoice
	union all
	select (n+1) as n,m from recursiveCte where n < m
)
select n as missing_serial_no
from recursiveCte
except
select serial_no
from invoice