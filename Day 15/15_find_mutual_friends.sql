
-- Find number of mutual friends

DROP TABLE IF EXISTS Friends;

CREATE TABLE Friends
(
	Friend1 	VARCHAR(10),
	Friend2 	VARCHAR(10)
);
INSERT INTO Friends VALUES ('Jason','Mary');
INSERT INTO Friends VALUES ('Mike','Mary');
INSERT INTO Friends VALUES ('Mike','Jason');
INSERT INTO Friends VALUES ('Susan','Jason');
INSERT INTO Friends VALUES ('John','Mary');
INSERT INTO Friends VALUES ('Susan','Mary');

select * from Friends;


---------------------------SOLUTION-------------------------------------------

with friends_list as(select Friend1,Friend2 
from Friends
union all
select Friend2,Friend1 
from Friends)
select distinct f.friend1, f.friend2,
count(fl.friend1) over(
						partition by f.friend1, f.friend2 
						order by f.friend1, f.friend2
						) as mutual_friends 
from friends f 
left join friends_list fl 
		on f.friend1 = fl.friend1
		and fl.friend2 in ( select fl2.friend2
							from friends_list fl2
							where f.friend2 = fl2.friend1);

