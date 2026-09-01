# 1757. Recyclable and Low Fat Products

**Difficulty:** Easy  
**Topics:** SQL, SELECT, WHERE, AND, ENUM

🔗 [LeetCode Problem](https://leetcode.com/problems/recyclable-and-low-fat-products/)

---

## 📝 Problem

Find the `product_id` of products that are both low fat and recyclable.

---

## 💻 Solution

```sql
SELECT product_id
FROM Products
WHERE low_fats = 'Y'
  AND recyclable = 'Y';
```

---

## 🔍 Explanation

- `FROM Products` → selects the `Products` table.
- `WHERE low_fats = 'Y'` → filters products that are low fat.
- `AND recyclable = 'Y'` → keeps only products that are also recyclable.
- `SELECT product_id` → returns only the required product IDs.

---

## 🆕 New Concepts Learned

### 1. ENUM

`ENUM` is a data type that allows only predefined values.

In this problem:

```text
low_fats   → ENUM('Y', 'N')
recyclable → ENUM('Y', 'N')
```

So we can directly compare the value:

```sql
WHERE low_fats = 'Y'
```

---

### 2. AND Operator

`AND` is used when **all conditions must be true**.

```sql
WHERE low_fats = 'Y'
  AND recyclable = 'Y'
```

Both conditions must be satisfied.

| low_fats | recyclable | Result |
|----------|------------|--------|
| Y | Y | ✅ |
| Y | N | ❌ |
| N | Y | ❌ |
| N | N | ❌ |

---

### 3. SQL Logical Execution Order

Although SQL is written as:

```sql
SELECT
FROM
WHERE
```

The logical execution order is:

```text
FROM
  ↓
WHERE
  ↓
SELECT
```

### Meaning

- `FROM` → choose the table
- `WHERE` → filter rows
- `SELECT` → choose columns to return

---

## 🧠 Key Takeaway

> `FROM` → choose table → `WHERE` → filter rows → `SELECT` → choose columns

Use `AND` when **multiple conditions must be true**.

---

## ⚠️ Common Mistake

Do not forget quotes around string/ENUM values:

```sql
-- Correct
WHERE low_fats = 'Y'

-- Incorrect
WHERE low_fats = Y

```

---

## 📌 Concepts Used

- SELECT
- FROM
- WHERE
- AND
- ENUM
- SQL Logical Execution Order
