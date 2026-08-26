# 595. Big Countries

**Difficulty:** Easy  
**Topics:** SQL, SELECT, WHERE, OR, Comparison Operators

🔗 [LeetCode Problem](https://leetcode.com/problems/big-countries/)

---

## 📝 Problem

Find the `name`, `population`, and `area` of countries that are considered **big**.

A country is big if:

- `area >= 3000000`
- **OR**
- `population >= 25000000`

---

## 💻 Solution

```sql
SELECT name, population, area
FROM World
WHERE area >= 3000000
   OR population >= 25000000;
```

---

## 🔍 Explanation

- `FROM World` → selects the `World` table.
- `WHERE area >= 3000000` → selects countries with an area of at least 3 million.
- `OR population >= 25000000` → also selects countries with a population of at least 25 million.
- `SELECT name, population, area` → returns only the required columns.

---

## 🆕 New Concepts Learned

### 1. OR Operator

`OR` is used when **at least one condition must be TRUE**.

```sql
WHERE area >= 3000000
   OR population >= 25000000
```

A country is selected if either condition is true, or both are true.

| Area >= 3M | Population >= 25M | Result |
|------------|-------------------|--------|
| ✅ | ✅ | ✅ |
| ✅ | ❌ | ✅ |
| ❌ | ✅ | ✅ |
| ❌ | ❌ | ❌ |

---

### 2. Comparison Operator `>=`

`>=` means **greater than or equal to**.

```sql
area >= 3000000
```

means the area should be 3,000,000 or more.

```sql
population >= 25000000
```

means the population should be 25,000,000 or more.

### Comparison Operators

```text
=    Equal to
!=   Not equal to
>    Greater than
<    Less than
>=   Greater than or equal to
<=   Less than or equal to
```

---

### 3. Multiple Conditions with OR

When a problem says:

> "Condition A OR Condition B"

use:

```sql
WHERE condition_A
   OR condition_B
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
FROM World
     ↓
Check area / population conditions
     ↓
Return name, population, area
```

---

## ⚠️ Common Mistakes

### Mistake 1: Using AND instead of OR

```sql
WHERE area >= 3000000
  AND population >= 25000000
```

❌ This requires both conditions to be true.

The question says **OR**, so use:

```sql
WHERE area >= 3000000
   OR population >= 25000000
```

### Mistake 2: Forgetting `=`

```sql
area > 3000000
```

❌ This excludes a country whose area is exactly 3,000,000.

The question says **at least**, so use:

```sql
area >= 3000000
```

---

## 🧠 Key Takeaway

> **"At least" → `>=`**

> **"Either A or B" → `OR`**

---

## 📌 Concepts Used

- SELECT
- FROM
- WHERE
- OR
- `>=`
- Multiple Conditions
- SQL Logical Execution Order
