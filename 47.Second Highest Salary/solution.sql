# Write your MySQL query statement below


SELECT DISTINCT MAX(salary) as SecondHighestSalary
FROM Employee
WHERE salary < (
    SELECT MAX(salary) 
    FROM Employee);

