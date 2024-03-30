use TechTFQ_SQL_Challenges;
DROP TABLE IF EXISTS company;
CREATE TABLE company
(
	employee	varchar(10) primary key,
	manager		varchar(10)
);

INSERT INTO company values ('Elon', null);
INSERT INTO company values ('Ira', 'Elon');
INSERT INTO company values ('Bret', 'Elon');
INSERT INTO company values ('Earl', 'Elon');
INSERT INTO company values ('James', 'Ira');
INSERT INTO company values ('Drew', 'Ira');
INSERT INTO company values ('Mark', 'Bret');
INSERT INTO company values ('Phil', 'Mark');
INSERT INTO company values ('Jon', 'Mark');
INSERT INTO company values ('Omid', 'Earl');

SELECT * FROM company;


----------------- SOLUTION -----------------

WITH recursivecte 
AS (
		SELECT employee, manager, CONCAT('Team ',ROW_NUMBER() OVER (ORDER BY employee)) AS Teams
		FROM company 
		WHERE manager = (SELECT employee FROM company WHERE manager IS NULL)
		
		UNION ALL
		
		SELECT d.employee, d.manager, Teams 
		FROM recursivecte c JOIN company d ON c.employee = d.manager 
)
,
distinctMembersCte 
AS (
		SELECT employee,Teams 
		FROM recursivecte

		UNION all
		
		SELECT manager,Teams 
		FROM recursivecte
)
SELECT Teams,  STRING_AGG(employee,',') AS Members 
FROM distinctMembersCte
GROUP BY teams 
ORDER BY teams;


