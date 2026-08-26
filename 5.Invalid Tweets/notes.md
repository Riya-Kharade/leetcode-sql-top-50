# 1683. Invalid Tweets

**Difficulty:** Easy  
**Topics:** SQL, SELECT, WHERE, String Functions, LENGTH

🔗 [LeetCode Problem](https://leetcode.com/problems/invalid-tweets/)

---

## 📝 Problem

Find the `tweet_id` of tweets whose content contains **more than 15 characters**.

A tweet is invalid if:

```text
length of content > 15
```

---

## 💻 Solution

```sql
SELECT Tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;
```

---

## 🔍 Explanation

- `FROM Tweets` → selects the `Tweets` table.
- `LENGTH(content)` → calculates the length of the `content`.
- `WHERE LENGTH(content) > 15` → keeps only tweets whose content has more than 15 characters.
- `SELECT Tweet_id` → returns the IDs of the invalid tweets.

---

## 🆕 New Concepts Learned

### 1. LENGTH()

`LENGTH()` is a string function used to find the length of a string.

Example:

```sql
LENGTH('Hello')
```

Result:

```text
5
```

In this problem:

```sql
LENGTH(content)
```

calculates the length of each tweet's content.

---

### 2. Using a Function in WHERE

A SQL function can be used directly inside the `WHERE` condition.

```sql
WHERE LENGTH(content) > 15
```

SQL calculates the length of `content` for each row and then checks whether it is greater than 15.

---

### 3. Greater Than `>`

`>` means **greater than**.

```sql
LENGTH(content) > 15
```

means:

> Keep tweets whose length is more than 15.

Important:

- `15` → valid if the condition were `>= 15`
- `16` or more → invalid for this question

The question says **strictly greater than 15**, so `>` is correct.

---

### 4. LENGTH() vs CHAR_LENGTH()

In MySQL:

```sql
LENGTH()
```

returns the length in **bytes**.

```sql
CHAR_LENGTH()
```

returns the length in **characters**.

For this problem, the tweet content consists of alphanumeric characters, `!`, and spaces, so:

```sql
LENGTH(content)
```

works correctly.

For general text containing Unicode/multibyte characters, `CHAR_LENGTH()` is safer when the requirement is specifically about the number of characters.

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
FROM Tweets
      ↓
Calculate LENGTH(content)
      ↓
Keep rows where length > 15
      ↓
Return Tweet_id
```

---

## ⚠️ Common Mistakes

### Mistake 1: Using `>=`

```sql
WHERE LENGTH(content) >= 15
```

❌ This includes tweets with exactly 15 characters.

The question says **strictly greater than 15**.

Correct:

```sql
WHERE LENGTH(content) > 15
```

---

### Mistake 2: Forgetting the function

```sql
WHERE content > 15
```

❌ This compares the content itself instead of checking its length.

Correct:

```sql
WHERE LENGTH(content) > 15
```

---

### Mistake 3: Using `LEN()`

```sql
LEN(content)
```

❌ `LEN()` is commonly associated with SQL Server, not MySQL.

For MySQL, use:

```sql
LENGTH(content)
```

or:

```sql
CHAR_LENGTH(content)
```

---

## 🧠 Key Takeaway

> **`LENGTH()` → finds the length of a string in bytes.**

> **`CHAR_LENGTH()` → finds the number of characters.**

> **`>` → strictly greater than.**

For this problem:

```sql
WHERE LENGTH(content) > 15
```

---

## 📌 Concepts Used

- SELECT
- FROM
- WHERE
- LENGTH()
- String Functions
- `>`
- SQL Logical Execution Order
