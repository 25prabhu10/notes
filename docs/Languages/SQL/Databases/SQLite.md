---
title: SQLite
description: A database engine
---

# SQLite

SQLite is a SQL database engine

It is:

- Self-contained
- Zero-configuration
- Serverless:

  - Doesn't require a separate server process to operate (client/server architecture)

- Transactional:

  - ACID-compliant

## Syntax

- Generally follows PostgreSQL syntax
- Does **not enforce type checking** (one can, for example, insert a `string` into a column defined as an `integer`)

### SELECT

```sql
SELECT 1 + 1;
-- 2

SELECT
   10 / 5,
   2 * 4;
-- 2|8
```

```sql
SELECT DISTINCT column_list
FROM table_list
  JOIN table ON join_condition
WHERE row_filter
ORDER BY column
LIMIT count OFFSET offset
GROUP BY column
HAVING group_filter;
```

- Use `DISTINCT` clause to query unique rows in a table
- Use `WHERE` clause to filter rows in the result set
- Use `ORDER BY` clause to sort the result set
- Use `LIMIT` OFFSET clauses to constrain the number of rows returned
- Use `GROUP BY` to get the group rows into groups and apply aggregate function for each group
- Use `HAVING` clause to filter groups
- Use `INNER JOIN` or `LEFT JOIN` to query data from multiple tables using join

## Commands

- Connect to database:

```shell
sqlite3

# Use ".open FILENAME" to reopen on a persistent database.
sqlite> .open album.db

# or open db directly

sqlite3 album.db
```

- Help: `.help`

- Show databases in the current database connection:

  ```shell
  .database

  # main: album.db r/w
  ```

- Show tables in a database:

  ```shell
  .tables

  # albums employees invoices playlists

  .table '%es'

  # employees invoices
  ```

- Show database schema:

  ```shell
  .schema

  # schema and the content of the sqlite_stat tables
  .fullschema
  ```

- Show table structure:

  ```shell
  .schema albums
  ```

- Show indexes:

  ```shell
  .indexes

  # indexes of a specific table
  .indexes TABLE
  ```

- Export data:

  ```shell
  .output albums.txt

  SELECT title FROM albums;
  ```

- Execute SQL statements from a file:

  ```shell
  .mode column
  .header on
  .read query.sql
  ```
