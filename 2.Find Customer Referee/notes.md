# 584. Find Customer Referee

**Difficulty:** Easy  
**Topics:** SQL, SELECT, WHERE, OR, NULL, NOT IN

🔗 [LeetCode Problem](https://leetcode.com/problems/find-customer-referee/)

---

## 📝 Problem

Find the names of customers who are either:

1. Referred by a customer whose `id != 2`
2. Not referred by anyone (`NULL`)

---

## 💻 Solution

```sql
SELECT name
FROM Customer
WHERE referee_id != 2
   OR referee_id IS NULL;
```

---

## 🔍 Explanation

- `FROM Customer` → selects the `Customer` table.
- `WHERE referee_id != 2` → selects customers who were not referred by customer `2`.
- `OR referee_id IS NULL` → also includes customers who were not referred by anyone.
- `SELECT name` → returns only the customer names.

---

## 🆕 New Concepts Learned

### 1. NULL

`NULL` represents a missing or unknown value.

Example:

```text
id | name | referee_id
---|------|-----------
1  | Will | NULL
```

Will does not have a referee.

---

### 2. Checking NULL

We cannot use:

```sql
referee_id = NULL
```

or:

```sql
referee_id != NULL
```

Instead, use:

```sql
referee_id IS NULL
```

and:

```sql
referee_id IS NOT NULL
```

### Rule

```text
= NULL       ❌
!= NULL      ❌
<> NULL      ❌

IS NULL      ✅
IS NOT NULL  ✅
```

---

### 3. NULL and Comparisons

Comparisons with `NULL` do not return `TRUE`.

For example:

```sql
referee_id != 2
```

does not include rows where `referee_id` is `NULL`.

Therefore, we need to explicitly check:

```sql
referee_id IS NULL
```

---

### 4. OR Operator

`OR` is used when **at least one condition must be true**.

```sql
WHERE referee_id != 2
   OR referee_id IS NULL
```

A row is selected if either condition is true.

| referee_id | `!= 2` | `IS NULL` | Result |
|------------|--------|-----------|--------|
| 1 | ✅ | ❌ | ✅ |
| 2 | ❌ | ❌ | ❌ |
| NULL | ❌ | ✅ | ✅ |
| 3 | ✅ | ❌ | ✅ |

---

### 5. NOT IN

`NOT IN` can be used to exclude specific values.

Example:

```sql
WHERE referee_id NOT IN (2)
```

This excludes `2`.

However, `NOT IN (2)` does **not** include `NULL`.

To include `NULL`, we need:

```sql
WHERE referee_id NOT IN (2)
   OR referee_id IS NULL
```

---

## 🔄 SQL Logical Execution Order

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

For this query:

```text
FROM Customer
      ↓
Filter using WHERE
      ↓
Return name using SELECT
```

---

## ⚠️ Common Mistakes

### Mistake 1: Using `= NULL`

```sql
WHERE referee_id = NULL
```

❌ Incorrect.

Use:

```sql
WHERE referee_id IS NULL
```

### Mistake 2: Using only `!= 2`

```sql
WHERE referee_id != 2
```

❌ This does not include `NULL` rows.

Use:

```sql
WHERE referee_id != 2
   OR referee_id IS NULL
```

### Mistake 3: Assuming `NOT IN` includes NULL

```sql
WHERE referee_id NOT IN (2)
```

❌ `NULL` values are not included.

---

## 🧠 Key Takeaway

> **NULL is not a normal value. Use `IS NULL` or `IS NOT NULL` to check it.**

Also remember:

> `AND` → all conditions must be TRUE  
> `OR` → at least one condition must be TRUE

---

## 📌 Concepts Used

- SELECT
- FROM
- WHERE
- OR
- NULL
- IS NULL
- NOT IN
- SQL Logical Execution Order
