use TechTFQ_SQL_Challenges
drop TABLE if exists orders;
CREATE TABLE orders 
(
	customer_id 	INT,
	dates 			DATE,
	product_id 		INT
);
INSERT INTO orders VALUES
(1, '2024-02-18', 101),
(1, '2024-02-18', 102),
(1, '2024-02-19', 101),
(1, '2024-02-19', 103),
(2, '2024-02-18', 104),
(2, '2024-02-18', 105),
(2, '2024-02-19', 101),
(2, '2024-02-19', 106); 


select * from orders;


------SOLUTION-------

SELECT dates, CAST(product_id AS VARCHAR) AS product_id
FROM orders
UNION
SELECT dates, STRING_AGG(product_id,',') AS product_id
FROM orders
GROUP BY customer_id, dates
ORDER BY dates


