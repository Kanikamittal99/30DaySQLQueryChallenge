# 30 Days SQL Query Challenge 👩‍💻

This amazing series of Easy to Advanced SQL concepts is curated by [Thoufiq Mohammed](https://www.youtube.com/playlist?list=PLavw5C92dz9Hxz0YhttDniNgKejQlPoAn). It not only offers us a chance to practice SQL concepts but also improves logical thinking.

Check out my solution to these problems below ⬇️


## 📝Summary
<p align="left">
    <img src="https://github.com/Kanikamittal99/30DaySQLQueryChallenge/assets/32505627/c63639c0-5b84-4d61-a6c7-cdc7899a3efc" width="300" height="300"/> 
</p>

<p align="left">
    <img src="https://github.com/Kanikamittal99/30DaySQLQueryChallenge/assets/32505627/e97db657-d849-44e9-b130-f1f0930376f5" width="300" height="300"/> 
</p>


## 📚 Table of contents
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
| [Day21](https://github.com/Kanikamittal99/30DaySQLQueryChallenge/blob/main/Day%2021/21_popular_posts.sql) | Calculate total time that each post was viewed by users | DATEDIFF ┃ SUBQUERY |
| [Day22](https://github.com/Kanikamittal99/30DaySQLQueryChallenge/blob/main/Day%2022/22_IPL_winning_streak.sql) | Identify the maximum winning streak for each IPL team| WINDOW FUNCTION [  ROW_NUMBER, COUNT ] ┃ ISNULL |
| [Day23](https://github.com/Kanikamittal99/30DaySQLQueryChallenge/blob/main/Day%2023/23_passengers_in_each_bus.sql) | Report the number of users that used each bus | ROW_NUMBER ┃ UNION ALL |
| [Day24](https://github.com/Kanikamittal99/30DaySQLQueryChallenge/blob/main/Day%2024/24_find_valid_emails.sql) | Find valid emails | REGEX  ┃ CHARINDEX ┃ REVERSE |
| [Day25](https://github.com/Kanikamittal99/30DaySQLQueryChallenge/blob/main/Day%2025/25_Apple_products.sql) |  Products that always start with ‘Apple’  | TRIM ┃ SUM USING CASE WHEN |
| [Day26](https://github.com/Kanikamittal99/30DaySQLQueryChallenge/blob/main/Day%2026/26_lowest_token_number.sql) | Return the lowest token number which is unique to a customer | TOP N ┃ COUNT(DISTINCT) |
| [Day27](https://github.com/Kanikamittal99/30DaySQLQueryChallenge/blob/main/Day%2027/27_leave_approver.sql) | Determine if the vacations applied by each employee can be approved or not based on the available leave balance | RECURSIVE CTE ┃ DATENAME ┃ DATEADD ┃ ROW_NUMBER |
| [Day28](https://github.com/Kanikamittal99/30DaySQLQueryChallenge/blob/main/Day%2028/28_find_length.sql) | Return the lowest token number which is unique to a customer | STRING_AGG ┃ STRING_SPLIT ┃ CROSS APPLY |
| [Day29](https://github.com/Kanikamittal99/30DaySQLQueryChallenge/blob/main/Day%2029/29_login_duration.sql) | Generate a report representing the different periods (in minutes) when the user was logged in | FIRST_VALUE ┃ LAST_VALUE ┃ DATEDIFF|
| [Day30](https://github.com/Kanikamittal99/30DaySQLQueryChallenge/blob/main/Day%2030/30_generate_student_report.sql) | Generate student Report (given 3 tables) | SYS.COLUMNS ┃ CROSS APPLY ┃ UNPIVOT |

