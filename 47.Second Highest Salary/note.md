# 176. Second Highest Salary

## Problem
Find the second highest **Distinct** salary from the `Employee` table.

If the second highest salary does not exist, return `NULL`.

## My Solution

```sql
SELECT DISTINCT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (
    SELECT MAX(salary)
    FROM Employee
);
```

## Approach

1. First, find the **highest salary** using:

   ```sql
   SELECT MAX(salary) FROM Employee
   ```

2. Use `WHERE salary < highest_salary` to exclude the highest salary.

3. Find the `MAX(salary)` from the remaining salaries.

4. This gives us the **second highest distinct salary**.

## Example

### Input

| id | salary |
|----|--------|
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |

- Highest salary = `300`
- Salaries less than `300` = `100, 200`
- Maximum from remaining salaries = `200`

### Output

| SecondHighestSalary |
|---------------------|
| 200                 |

## Key Concepts Learned

- `MAX()`
- Subquery
- `WHERE`
- `DISTINCT`
- Aggregate functions

## SQL Concept

The inner query runs first:

```sql
SELECT MAX(salary) FROM Employee
```

Then its result is used by the outer query to find the maximum salary below it.

## Complexity

- **Time:** `O(n)`
- **Space:** `O(1)`

## LeetCode

Problem: **176. Second Highest Salary**  
Difficulty: **Medium**
