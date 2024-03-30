/*
Analyse the given input table and come up with output as shown.
We have to count number of apple products in both product_1 and product_2 column. 
The product should always start with ‘Apple’ and no other character
*/

drop table if exists product_demo;
create table product_demo
(
	store_id	int,
	product_1	varchar(50),
	product_2	varchar(50)
);
insert into product_demo values (1, 'Apple - IPhone', '   Apple - MacBook Pro');
insert into product_demo values (1, 'Apple - AirPods', 'Samsung - Galaxy Phone');
insert into product_demo values (2, 'Apple_IPhone', 'Apple: Phone');
insert into product_demo values (2, 'Google Pixel', ' apple: Laptop');
insert into product_demo values (2, 'Sony: Camera', 'Apple Vision Pro');
insert into product_demo values (3, 'samsung - Galaxy Phone', 'mapple MacBook Pro');

select * from product_demo;


-------------------------- SOLUTION -----------------------

select store_id,sum(case when product_1 like 'apple%' then 1 else 0 end) as Product_1,
sum(case when trim(product_2)like 'apple%' then 1 else 0 end) as Product_2
from product_demo
GROUP by store_id;