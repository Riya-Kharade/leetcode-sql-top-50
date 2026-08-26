# 1148. Article Views I

**Difficulty:** Easy  
**Topics:** SQL, SELECT, WHERE, DISTINCT, ORDER BY, Alias

🔗 [LeetCode Problem](https://leetcode.com/problems/article-views-i/)

---

## 📝 Problem

Find all authors who viewed at least one of their own articles.

An author viewed their own article when:

```text
author_id = viewer_id
```

Return the author IDs as `id` and sort them in ascending order.

---

## 💻 Solution

```sql
SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id ASC;
```

---

## 🔍 Explanation

- `FROM Views` → selects the `Views` table.
- `WHERE author_id = viewer_id` → finds rows where the author and viewer are the same person.
- `SELECT author_id` → returns the author's ID.
- `AS id` → renames `author_id` to `id` in the output.
- `DISTINCT` → removes duplicate author IDs.
- `ORDER BY id ASC` → sorts the result in ascending order.

---

## 🆕 New Concepts Learned

### 1. DISTINCT

`DISTINCT` removes duplicate values from the result.

Example:

```text
author_id
---------
7
7
4
4
```

Without `DISTINCT`:

```text
7
7
4
4
```

With `DISTINCT`:

```text
4
7
```

Use it when the question asks for **unique** results.

---

### 2. Column Alias using AS

An alias gives a column a temporary name in the result.

```sql
SELECT author_id AS id
```

Here:

```text
author_id → original column name
id        → output column name
```

The question expects the output column to be called `id`.

`AS` is commonly used for column aliases.

---

### 3. Comparing Two Columns

Usually, we compare a column with a value:

```sql
WHERE age > 18
```

Here, we compare **two columns**:

```sql
WHERE author_id = viewer_id
```

This means:

> Select rows where the author and viewer are the same person.

---

### 4. ORDER BY

`ORDER BY` is used to sort the result.

```sql
ORDER BY id ASC
```

- `ASC` → ascending order
- `DESC` → descending order

Example:

```text
4
7
10
```

Ascending means smallest to largest.

---

## 🔄 SQL Logical Execution Order

Although SQL is written as:

```sql
SELECT
FROM
WHERE
ORDER BY
```

The logical execution order is approximately:

```text
FROM
  ↓
WHERE
  ↓
SELECT
  ↓
DISTINCT
  ↓
ORDER BY
```

For this query:

```text
FROM Views
      ↓
Find rows where author_id = viewer_id
      ↓
Select author_id
      ↓
Remove duplicates
      ↓
Sort by id
```

---

## ⚠️ Common Mistakes

### Mistake 1: Forgetting DISTINCT

```sql
SELECT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id ASC;
```

This can return the same author multiple times if they viewed their article more than once.

Use:

```sql
SELECT DISTINCT author_id AS id
```

---

### Mistake 2: Forgetting the Alias

```sql
SELECT DISTINCT author_id
```

The result column would be named `author_id`, but the question expects:

```text
id
```

So use:

```sql
author_id AS id
```

---

### Mistake 3: Comparing with a Fixed Value

Do not write:

```sql
WHERE author_id = viewer_id
```

as a fixed value comparison. Here both are **columns**, so SQL compares their values row by row.

---

## 🧠 Key Takeaway

> **`DISTINCT` → removes duplicates**

> **`AS` → gives a column a new output name**

> **`ORDER BY ... ASC` → sorts from smallest to largest**

> **Two columns can be compared directly using `=`.**

---

## 📌 Concepts Used

- SELECT
- FROM
- WHERE
- DISTINCT
- AS (Alias)
- Column-to-column comparison
- ORDER BY
- ASC
- SQL Logical Execution Order
