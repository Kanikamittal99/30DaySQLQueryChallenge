#  30 Days SQL Query Challenge

| Days | Short Description | Key Concepts Used | 
|---|---|---|
| [Day1](https://github.com/Kanikamittal99/30DaySQLQueryChallenge/blob/main/Day%2001/1_remove_redundant_pairs.sql) | Remove redundant pairs | CONCAT ┃ ROW_NUMBER ┃ MULTIPLE CTE |
| [Day2](https://github.com/Kanikamittal99/30DaySQLQueryChallenge/blob/main/Day%2002/2_ski_resort_company.sql) | Find triplets representing mountain huts | CASE WHEN ┃ MULTIPLE CTE |
| [Day3](https://github.com/Kanikamittal99/30DaySQLQueryChallenge/blob/main/Day%2003/3_fetch_footer_values.sql) | Fetch Footer values | WINDOW FUNCTIONS [ SUM, MAX ] ┃ MULTIPLE CTE |
| [Day4](https://github.com/Kanikamittal99/30DaySQLQueryChallenge/blob/main/Day%2004/4_segregate_data.sql) | Print minimum and maximum values while ignoring NULLS | WINDOW FUNCTION [ FIRST_VALUE ] ┃ CROSS JOIN ┃ MIN, MAX on Strings |
| [Day5](https://github.com/Kanikamittal99/30DaySQLQueryChallenge/blob/main/Day%2005/5_generate_salary_report.sql) | Generate Salary report | CROSS JOIN ┃ PIVOT ┃ SUM USING CASE WHEN  ┃  UNION |
| [Day6](https://github.com/Kanikamittal99/30DaySQLQueryChallenge/blob/main/Day%2006/6_improved_performance.sql) | Output the tests in which student has improved performance | WINDOW FUNCTION [ LAG ] ┃ ROW_NUMBER |
| [Day7](https://github.com/Kanikamittal99/30DaySQLQueryChallenge/blob/main/Day%2007/7_find_relevant_dates.sql) | Find relevant dates | DATEPART ┃ DATEFIRST ┃ SUBSTRING |
| [Day8](https://github.com/Kanikamittal99/30DaySQLQueryChallenge/blob/main/Day%2008/08_Fill_Blanks_JobRole.sql) | Fill in the BLANK job_roles | RECURSIVE CTE ┃ WINDOW FUNCTIONS [ SUM,MAX ] |
| [Day9](https://github.com/Kanikamittal99/30DaySQLQueryChallenge/blob/main/Day%2009/9_Merge_Agg_Product_by_Date_Cust.sql) | Merge Products per Customer for each Day  | STRING_AGG  ┃ UNION |
| [Day10](https://github.com/Kanikamittal99/30DaySQLQueryChallenge/blob/main/Day%2010/10_Velocity_level.sql) | Create query for expected output  | SUM USING CASE WHEN ┃ WINDOW FUNCTION [ LAG ] ┃ PIVOT |
| [Day11](https://github.com/Kanikamittal99/30DaySQLQueryChallenge/blob/main/Day%2011/11_remove_outliers.sql) | Identify and exclude Outliers  | CTE ┃ WINDOW FUNCTIONS [ AVG, STDEV ] |
| [Day12](https://github.com/Kanikamittal99/30DaySQLQueryChallenge/blob/main/Day%2012/12_split_hierarchy.sql) | Split the hierarchy and display employees by their teams | STRING_AGG ┃  ROW_NUMBER ┃ UNION ┃ RECURSIVE CTE |
| [Day13](https://github.com/Kanikamittal99/30DaySQLQueryChallenge/blob/main/Day%2013/13_No_of_employees_manager.sql) | Find number of employees managed by each manager | SELF JOIN |
| [Day14](https://github.com/Kanikamittal99/30DaySQLQueryChallenge/blob/main/Day%2014/14_find_missing_data.sql) | Find missing serial numbers | EXCEPT ┃ RECURSIVE CTE |
| [Day15](https://github.com/Kanikamittal99/30DaySQLQueryChallenge/blob/main/Day%2015/15_find_mutual_friends.sql) | Find the number of mutual friends | RECURSIVE CTE  ┃ WINDOW FUNCTION [ COUNT ] |
| [Day16](https://github.com/Kanikamittal99/30DaySQLQueryChallenge/blob/main/Day%2016/16_covid_percentage_incr.sql) | Calculate the percentage increase in covid cases each month versus cumulative cases as of the prior month. | MONTH ┃ WINDOW FUNCTION [  SUM, LAG ] |
| [Day17](https://github.com/Kanikamittal99/30DaySQLQueryChallenge/blob/main/Day%2017/17_Users_loggedIn_5_consecutiveDays.sql) | Identify dates where a user has logged in for 5 or more consecutive days | DATEADD  ┃ ROW_NUMBER |
| [Day18](https://github.com/Kanikamittal99/30DaySQLQueryChallenge/blob/main/Day%2018/18_employees_who_attended_all_events.sql) | Find out the employees who attended all company events | COUNT along with DISTINCT |
| [Day19](https://github.com/Kanikamittal99/30DaySQLQueryChallenge/blob/main/Day%2019/19_delayed_order_free_pizzas.sql) | Identify the percentage of delayed orders for each month and the total no of free pizzas given each month | FORMAT ┃ WINDOW FUNCTION [ SUM ] |
| [Day20](https://github.com/Kanikamittal99/30DaySQLQueryChallenge/blob/main/Day%2020/20_countries_median_age.sql) | Find the median ages of countries | WINDOW FUNCTION [  ROW_NUMBER, COUNT ] ┃ CAST |
