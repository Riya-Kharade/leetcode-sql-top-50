# 1378. Replace Employee ID With The Unique Identifier

## Problem
Show the `unique_id` of each employee along with their name.

If an employee does not have a unique ID, show `NULL`.

## My Solution

```sql
SELECT eu.unique_id, e.name
FROM Employees e
LEFT JOIN EmployeeUNI eu
ON e.id = eu.id;
```

## Approach

We use a **LEFT JOIN** between the `Employees` and `EmployeeUNI` tables.

- `Employees` is the main table because we need to show all employees.
- `EmployeeUNI` contains the corresponding `unique_id`.
- We join both tables using the common column `id`.
- If no matching `id` exists in `EmployeeUNI`, SQL returns `NULL` for `unique_id`.

## Why LEFT JOIN?

A `LEFT JOIN` returns:
- All rows from the left table (`Employees`)
- Matching rows from the right table (`EmployeeUNI`)
- `NULL` when no match exists

## Example

### Employees

| id | name |
|---|---|
| 1 | Alice |
| 7 | Bob |
| 11 | Meir |
| 90 | Winston |
| 3 | Jonathan |

### EmployeeUNI

| id | unique_id |
|---|---|
| 3 | 1 |
| 11 | 2 |
| 90 | 3 |

### Result

| unique_id | name |
|---|---|
| NULL | Alice |
| NULL | Bob |
| 2 | Meir |
| 3 | Winston |
| 1 | Jonathan |

## Key Concepts Learned

- `LEFT JOIN`
- Table aliases
- Joining tables using a common column
- `NULL` values when no matching row exists

## LeetCode

**Problem:** 1378. Replace Employee ID With The Unique Identifier  
**Difficulty:** Easy  
**Topic:** SQL - Basic Joins
