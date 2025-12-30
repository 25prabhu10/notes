---
title: SQL
description: Structured Query Language
---

# SQL

Structured Query Language (SQL) is a standard language for storing, manipulating, and retrieving data in databases

- SQL can mainly be categorised as [declarative programming](../../Concepts/Designs/Programming_Paradigms/) (non-procedural)
- Cascading referential integrity constraint

The result of an SQL query is a table (also called a _result set_)

## History

Developed by _Raymond Boyce and Donald Chamberlin_ at IBM in the early 1970s

- SQL-86: First formalized by ANSI in 1986
- SQL-89: Added integrity constraints
- SQL-92: Added triggers, support for procedural programming
- SQL:1999 (SQL3): Added recursive queries, window functions, user-defined types
- SQL:2003: Added XML support
- SQL:2008: Added support for sequences, `MERGE` statement
- SQL:2011: Added temporal data management
- SQL:2016: Added JSON support
- SQL:2019: Added support for SQL/MDA

## Syntax

SQL is a declarative language, meaning that it describes the results that you want, not how to get them

Even though there is a standard SQL, every database system has its own dialect. The SQL syntax is similar, but not identical. Each database system has its own set of extensions and enhancements. Refer to the documentation of the database system you are using for the syntax of SQL

- SQL is **case-insensitive** language
  - All identifiers, commands and keywords can be written in any case
  - Usually, SQL commands and keywords are written in upper-case like `SELECT`

- Identifiers are the names of tables, columns, etc...
  - Identifiers must start with a letter or an underscore (`_`)
  - Can be enclosed in double quotes (`"`) to allow the inclusion of spaces or other non-standard characters

- SQL is white-space insensitive
  - Spaces, tabs, and newlines are used to separate keywords and identifiers
  - Multiple spaces are treated as a single space

- SQL statements end in a semicolon (`;`)
- SQL comments start with `--` for single-line comments and `/* */` for multi-line comments
- Numeric literals can be written in integer `453`, real `10.5`, or scientific notation `1.05e1`
- Text literals are written in single quotes `'` (`'Hello'`)
  - If a string contains a single quote, it must be escaped with another single quote (`'It''s'`)
  - Double quotes (`"`) are reserved for identifiers and are not used for string literals

- Blob literals (binary data) can be represented as an `x` (or `X`) followed by a string of hexadecimal characters (`x'4F4C4C4548'`)

```sql
-- single-line comment

/* multi-line
   comment */

-- SQL statement
SELECT column_name
  FROM table_name
  WHERE condition;
```

The main properties of SQL is that formal standard exists, but every database system has its own dialect, custom extensions, and enhancements

### Three-Valued Logic

SQL allows any value to be assigned a `NULL`. `NULL` is not a value, but a marker that the value is missing, unknown, or inapplicable

- `NULL` don't interact well with other values (is `NULL > 3` true or false?)
- To deal with `NULL`, SQL uses a _three-valued logic_ (TVL or 3VL) also known as _ternary logic_

Three states:

- `TRUE`: `1`, `YES`, `ON`
- `FALSE`: `0`, `NO`, `OFF`
- `UNKNOWN`: `NULL`

Truth tables:

| Value   | `NOT` Value |
| ------- | ----------- |
| `TRUE`  | `FALSE`     |
| `FALSE` | `TRUE`      |
| `NULL`  | `NULL`      |

| `3VL` AND | `TRUE`  | `FALSE` | `NULL`  |
| --------- | ------- | ------- | ------- |
| `TRUE`    | `TRUE`  | `FALSE` | `NULL`  |
| `FALSE`   | `FALSE` | `FALSE` | `FALSE` |
| `NULL`    | `NULL`  | `FALSE` | `NULL`  |

| `3VL` OR | `TRUE` | `FALSE` | `NULL` |
| -------- | ------ | ------- | ------ |
| `TRUE`   | `TRUE` | `TRUE`  | `TRUE` |
| `FALSE`  | `TRUE` | `FALSE` | `NULL` |
| `NULL`   | `TRUE` | `NULL`  | `NULL` |

To check for `NULL` values, use `IS NULL` or `IS NOT NULL`, you cannot use equality operators (`=`, `!=`)

```sql
SELECT column_name
  FROM table_name
  WHERE column_name IS NULL;

SELECT column_name
  FROM table_name
  WHERE column_name IS NOT NULL;
```

### Order of SQL Clauses

- **Lexical Order**: Order in which clauses are written (not always the order of execution)
- **Logical Order**: Order in which the clauses are executed logically (the order of execution)
- **Effective Order**: True order of execution after the engine has optimized the query

Logical order of SQL operations:

1. `FROM`: Get the table
2. [`JOIN`](#join): Combine tables
3. [`WHERE`](#where): Filter rows
4. [`GROUP BY`]: Group rows that have the same values into summary rows (squish rows in buckets)
5. Aggregations: Aggregate functions like `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`, etc. (calculate aggregate values (in buckets))
6. [`HAVING`]: Filter groups (drop rows on aggregations)
7. `WINDOW`: Aggregate without collapsing rows
8. [`SELECT`]: Select columns, calculate expressions
9. Aliases: Give names to columns or expressions
10. [`DISTINCT`]: Remove duplicates
11. [`UNION` (All)]: Combine results of two queries (stack tables)
12. [`ORDER BY`]: Sort the result
13. [`LIMIT`]: Limit the number of rows

An operation can only use data produced by the operations before it and an operation doesn't know about data produced by operations after it

### SQL Operators

- Arithmetic Operators: `+`, `-`, `*`, `/`, `%`
- Comparison Operators: `=`, `!=`, `>`, `<`, `>=`, `<=`, `<>`
- Logical Operators: `AND`, `OR`, `NOT`
- Bitwise Operators: `&`, `|`, `^`, `~`, `<<`, `>>`
- String Operators: `||` (concatenation)
- Pattern Matching: `LIKE`, `IN`, `GLOB`, `MATCH`, `REGEXP` (these return `TRUE`, `FALSE`, or `NULL`)

### SQL Data Languages

SQL commands are divided into 4 major categories, or _languages_

- Each language is used for a specific purpose

1. **DDL (Data Definition Language)**:
   - Commands that can be used to define the database schema
   - A set of statements that allow the user to define or modify data structures and objects, such as tables, views, indexes, etc...
   - Some commands:
     - [`CREATE`](#create-ddl): to create entire databases and objects in database
     - [`ALTER`](#alter): alters the structure of existing objects such as database
     - [`DROP`](#drop-ddl): delete objects from database
     - [`RENAME`](#rename): rename an objects
     - [`TRUNCATE`](#truncate)

2. **DML (Data Manipulation Language)**:
   - Commands that deal with the manipulation of data present in database
   - Getting data into and out of the database
   - Statement allow us to manipulation the data in the tables of a database
   - Some commands:
     - [`SELECT`](#select-dml): retrieve data from the database objects, like tables (DQL (Data Query Language))
     - [`INSERT`](#insert-dml): insert data into a table
     - [`UPDATE`](#update-dml): update existing data within a table
     - [`DELETE`](#delete-dml): deletes all records from a table, space for the records remain

3. **TCL (Transaction control language)**:
   - Commands which mainly deal with the transaction of database
   - A transaction is a sequence of operations performed as a single logical unit of work
   - If one part of the transaction fails, the entire transaction fails
   - TCL ensures that the database remains ACID compliant
   - Some commands:
     - [`BEGIN`](#begin): start a transaction
     - [`COMMIT`](#commit): permanently save any transaction into the database
     - [`ROLLBACK`](#rollback): restores the database to last committed state. It is also used with save-point command to jump to a save-point in a transaction
     - `SAVEPOINT`: temporarily save a transaction so that you can rollback to that point whenever necessary
     - `SET TRANSACTION`: places a name on a transaction

4. **DCL (Data Control Language)**:
   - Commands which deal with the rights, permissions and other controls of the database system
   - Some commands:
     - [`GRANT`](#grant): allow specified users to perform specified tasks
     - [`REVOKE`](#revoke): cancel previously granted or denied permissions

### Queries

A query is a set of instructions given to the RDBMS that tell what needs to be done

## Tables

Tables are the basic unit of data storage in an SQL database

- A table is a collection of related data held in a structured format within a database
- It consists of rows and columns
- Each row represents a unique record, and each column represents a field in the record

A table can be created using the [`CREATE TABLE`](#create-ddl) statement

```sql
CREATE TABLE table_name
(
  column_name column_type,
  ...
);
```

### Columns

Columns are the fields in a table

- Each column must have a name and a data type
- Columns can have different data types
- Columns can have different constraints

```sql
CREATE TABLE employees
(
    id            INTEGER,
    first_name    VARCHAR(50),
    last_name     VARCHAR(75),
    mid_name      VARCHAR(50),
    dateofbirth   DATE
);
```

#### Column Constraints

Constraints are used to specify rules for the data in a table

- Constraints are used to limit the type of data that can go into a table
- Constraints can be specified when the table is created with the `CREATE TABLE` statement, or after the table is created with the `ALTER TABLE` statement

```sql
CREATE TABLE table_name
(
    column_name column_type column_constraints,
    ...,
    table_constraints,
    ...
);

-- or

ALTER TABLE table_name
  ADD column_name column_type column_constraints;
```

- `NOT NULL`: Ensures that a column cannot have `NULL` value
- `UNIQUE`: Ensures that all values in a column are different

### Data Type

Different DBMSs support different Data types

## Views

A view is a query that is stored in the data dictionary and acts like a table, but there is no data stored in the view

- A view is a _virtual table_ based on the result-set of an SQL statement
- When you issue a query against a view, your query is merged with the view definition to create a final query to be executed

Views provide a way to package queries into a predefined object that can be reused

- They act more or less like read-only tables
- They are virtual tables that do not store data themselves but display data from the underlying tables
- They can be used to hide the complexity of a query from the user
- They can be used to restrict access to the data in the underlying tables

## Indexes

Indexes (or indices) are a means to optimize database lookups by pre-sorting and indexing one or more columns of a table

- This allows the database to find the rows quickly without having to scan the entire table
- Indexes are used to speed up the retrieval of rows from a table

Indexes are expensive to maintain, so they should only be created on columns that are frequently used in queries

- In some cases, indexes can slow down the database because they require additional disk space and memory

## CREATE (DDL)

The `CREATE` command is used to establish a new database, table, index, or stored procedure

```sql
-- CREATE object_type object_name
CREATE DATABASE airbnb;

-- CREATE TABLE [table name] ( [column definitions] ) [table parameters]
CREATE TABLE employees (
    id            INTEGER       PRIMARY KEY,
    first_name    VARCHAR(50)   not null,
    last_name     VARCHAR(75)   not null,
    mid_name      VARCHAR(50)   not null,
    dateofbirth   DATE          not null
);

-- create a database user
CREATE USER 'kantara'@'localhost' IDENTIFIED BY 'some_password';
```

- Create an object only if it does not exist using `IF NOT EXISTS` clause

## SELECT (DML)

The `SELECT` (DML or DQL statement) statement is used to query the database and retrieve data from one or more tables

- The result of a `SELECT` statement is a result set (table), but the table is not stored in the database
- `Select` can also be used to return the value of simple expressions
- Wildcard (`*`) can be used to select all columns

Basic syntax:

```sql
SELECT [ALL|DISTINCT] column_specification [[AS] alias]
                      [, another_column_specification [[AS] alias]], ...
FROM table_name
WHERE condition
GROUP BY column_name
  HAVING condition
ORDER BY column_name [ASC|DESC]
  LIMIT number;
```

- `ALL`: Default, returns all records
- `DISTINCT`: Returns only distinct (different) values
- `AS`: Alias for the column name

Four ways to code column specifications

- All columns in a base table
- Column name in a base table
- Calculation
- Function

_Example_:

```sql
-- simple expression
SELECT 1 + 1; -- 2
SELECT 1 + 1, 5 * 32, 'abc' || 'def', 1 > 2; -- 2, 160, 'abcdef', 0


-- query for all columns
SELECT * FROM artist;

-- query for select columns
SELECT artist_name, artist_id FROM artist;

-- perform arithmetic operations on columns
SELECT name, (gdp/population) FROM world;
SELECT invoice_id, total, total * 0.15 AS tax FROM invoice;
```

Based on the database system the below queries may vary:

- The arithmetic operators in order of precedence
- What determines the sequence of operations?

### GROUP BY

Group rows that have the same values into summary rows

- It is used to collapse, or "flatten", rows that have the same values into summary rows

```sql
-- GROUP BY grouping_expression [COLLATE collation_name] [, ...]

SELECT column_name, aggregate_function(column_name)
  FROM table_name
  WHERE condition
  GROUP BY column_name;
```

`HAVING` vs `WHERE`:

- `WHERE` runs before `GROUP BY`, cannot use aggregate functions
- `HAVING` runs after `GROUP BY`, hence we can use aggregate functions

```sql
SELECT COUNT(customerId), country
  FROM customers
  GROUP BY country
    HAVING COUNT(customerId) > 5;
```

`HAVING` vs `WHERE`:

- `WHERE` runs before `GROUP BY`, cannot use aggregate functions
- `HAVING` runs after `GROUP BY`, hence we can use aggregate functions

```sql
SELECT COUNT(customerId), country
  FROM customers
  GROUP BY country
    HAVING COUNT(customerId) > 5;
```

### DISTINCT

Select query with unique results:

```sql
SELECT DISTINCT column, another_column
  FROM myTable
  WHERE conditions;
```

### ORDER BY

Query sorted:

```sql
-- `ASC`: ascending (default)
SELECT * FROM artist ORDER BY artist_name;

-- descending
SELECT * FROM artist ORDER BY artist_name DESC;

-- multiple ways to order first by time then track_name
SELECT time, track_name FROM track
  ORDER BY time DESC, track_name ASC;

-- ASCII behaviour
SELECT * FROM artist ORDER BY BINARY artist_name;

-- CAST(), AS
SELECT time, track_name FROM track ORDER BY CAST(time AS CHAR);
```

Cast as:

- `AS BINARY`
- `AS SIGNED`: to sort as a signed integer
- `AS UNSIGNED`: to sort as an unsigned integer
- `AS CHAR`: to sort as a character string
- `AS DATE`: to sort as a date
- `AS DATETIME`: to sort as a date and time
- `AS TIME`: to sort as a time

### LIMIT

Limit the total number of rows returned:

```sql
SELECT track_name FROM track LIMIT 10;

-- limit from row 6
SELECT track_name FROM track LIMIT 5,5;

-- or

SELECT track_name FROM track LIMIT 5 OFFSET 5;
```

### UNION

Combine the result-set of two or more `SELECT` statements

- Every `SELECT` statement within `UNION` must have the **same number of columns**
- The columns must also have **similar data types**
- The columns in every `SELECT` statement must also be in the **same order**

```sql
SELECT city
  FROM customers
UNION
SELECT city
  FROM suppliers
  ORDER BY city;

-- UNION all
SELECT city
  FROM customers
UNION ALL
SELECT city
  FROM suppliers
  ORDER BY city;
```

- `UNION` operator selects only distinct values by default
- To allow duplicate values, use `UNION ALL`

### JOIN

Joins are used to combine rows from two or more tables based on a common field between them

4 types of joins:

1. `LEFT JOIN`:
   - Select **all records** from the **left table** (`table1`), and the **matching records** from the **right table** (`table2`)
   - The result is **0 records** from the **right side**, if there is **no match**

   ```sql
   SELECT column_name
      FROM table1
      LEFT JOIN table2
        ON table1.column_name = table2.column_name;
   ```

2. `RIGHT JOIN`:
   - Select **all records** from the **right table** (`table2`), and the **matching records** from the **left table** (`table1`)
   - The result is **0 records** from the **left side**, if there is **no match**

   ```sql
   SELECT column_name
      FROM table1
      RIGHT JOIN table2
        ON table1.column_name = table2.column_name;
   ```

3. `INNER JOIN`: just known as `JOIN`
   - Select records that have **matching values in both tables**

   ```sql
   SELECT column_name
      FROM table1
      INNER JOIN table2
        ON table1.column_name = table2.column_name;

   -- or

   SELECT column_name
      FROM table1
      JOIN table2
        ON table1.column_name = table2.column_name;
   ```

4. `OUTER JOIN` (`FULL OUTER JOIN`):
   - Select **all records** when there is a **match in left (`table1`) or right (`table2`)** table records
   - Not supported in MySQL

   ```sql
   SELECT column_name
      FROM table1
      FULL OUTER JOIN table2
        ON table1.column_name = table2.column_name
      WHERE condition;
   ```

- Self `JOIN`:
  - A self join is a regular join, but the table is joined with itself

  ```sql
  SELECT
        a.customerName AS customerName1,
        b.customerName AS customerName2,
        a.city
      FROM customers a,
          customers b
      WHERE a.customerId <> b.customerId
          AND a.city = b.city
      ORDER BY a.city;
  ```

  ```sql
  SELECT
        a.customerName AS customerName1,
        b.customerName AS customerName2,
        a.city
      FROM customers a
      JOIN customers b
      WHERE a.customerId <> b.customerId
          AND a.city = b.city
      ORDER BY a.city;
  ```

### Sub-Query (Nested Queries)

A query within another query

```sql
SELECT
      a.studentId,
      a.name,
      b.total_marks
    FROM student a,
        marks b
    WHERE a.studentId = b.studentId
      AND b.total_marks > (SELECT total_marks
          FROM marks
          WHERE studentId = 'V002');
```

## WHERE

The `WHERE` clause is used to filter records

Operators:

| Operator                        | Condition                                            | SQL Example                     |
| ------------------------------- | ---------------------------------------------------- | ------------------------------- |
| `=`, `!=`, `<`, `<=`, `>`, `>=` | Standard numerical operators                         | `col_name != 4`                 |
| `=`, `!=`, `<>`                 | Case sensitive exact string comparison               | `col_name = "abc"`              |
| `LIKE`                          | Case insensitive exact string comparison             | `col_name LIKE "ABC"`           |
| `%`                             | Match a sequence of zero or more characters          | `col_name LIKE "%AT%"`          |
| `_`                             | Match a single character                             | `col_name LIKE "AN_"`           |
| `IN (…)`                        | Number/String exists in a list                       | `col_name IN (2, 4, 6)`         |
| `NOT IN (…)`                    | Number/String does not exist in a list               | `col_name NOT IN (1, 3, 5)`     |
| `BETWEEN … AND …`               | Number is within range of two values (inclusive)     | `col_name BETWEEN 1.5 AND 10.5` |
| `NOT BETWEEN … AND …`           | Number is not within range of two values (inclusive) | `col_name NOT BETWEEN 1 AND 10` |

- `AND`: both conditions must be true
- `OR`: either condition must be true
- `XOR`: either condition must be true, but not both

_Example_:

```sql
-- query with clause
SELECT column, another_column, …
FROM myTable
WHERE condition
    AND/OR another_condition
    AND/OR …;

SELECT *
FROM artist
WHERE artist_name = "new order";

-- >, <, <=, >=, not equal ( <> or !=)
SELECT artist_name
FROM artist
WHERE artist_id < 5;

-- pattern matching
SELECT album_name
FROM album
WHERE album_name LIKE "retro%";

-- 3 letters beginning with 'R' and match rest
SELECT *
FROM track
WHERE track_name LIKE "r__ %";

SELECT album_name
FROM album
WHERE album_name > "c"
AND album_name < "m";

SELECT name, population
FROM world
WHERE name IN ('Brazil', 'Russia', 'India', 'China');

SELECT name, area
FROM world
WHERE area BETWEEN 250000 AND 300000;

-- find rows with NULL value
SELECT name, area
FROM world
WHERE area IS NULL
AND name IS NOT NULL;

-- XOR
SELECT name, population, area
FROM world
WHERE (population >= 250000000
AND area < 3000000)
OR (population < 250000000
AND area >= 3000000);
```

## INSERT (DML)

Insert data into a table

- The number of values must match the number of columns
- The values must be in the same order as the columns
- If any column is not specified, it will be set to the default value as specified in the table definition
- If no default value is specified, the column will be set to `NULL`
- If no explicit list of columns is provided, the `INSERT` statement will assume that you are providing values for all columns in the table
  - The number of values must match the number of columns in the table
  - The values must be in the same order as the columns are defined in the table

```sql
INSERT INTO table_name (column_name [, ...]) VALUES (new_value [, ...]);
INSERT INTO table_name VALUES (new_value [, ...]); -- insert data into all columns

-- insert data into all columns
INSERT INTO artist
  VALUES (7, "Barry Adamson");

-- insert multiple rows
INSERT INTO album (artist_id, album_id, album_name)
  VALUES (7, 2, "Oedipus Schmoedipus"),
  (7, 2, "Oedipus Schmoedipus"),
  (7, 2, "Oedipus Schmoedipus");

-- insert data from another table using sub-query
INSERT INTO artist
  VALUES ((SELECT 1 + MAX(artist_id) FROM artist), "Barry Adamson");
```

- `INSERT OR REPLACE INTO`: If a `UNIQUE` constraint violation occurs, it will replace the row
  - It is also written as `REPLACE INTO`

```sql
INSERT OR REPLACE INTO artist
  VALUES (7, "Barry Adamson");

-- same as above
REPLACE INTO artist
  VALUES (7, "Barry Adamson");
```

- `IGNORE`: Ignore errors
- `DEFAULT`: Use default value

## UPDATE (DML)

Assign new values to one or more columns of existing rows in a table

- All of the rows being updated must be part of the same table

```sql
UPDATE table_name SET column_name=new_value [, ...] WHERE expression;

-- update all rows
UPDATE artist
SET artist_name = UPPER(artist_name);

-- update only those rows that meet the conditions
UPDATE sales
SET date_of_purchase = '2017-12-12'
WHERE purchase_number = 1;
```

## DELETE (DML)

Delete one or more rows from a table

- We can rollback data after using delete statement

```sql
DELETE FROM table_name WHERE expression;

-- delete all rows (empty the table)
DELETE FROM played;

-- delete only those rows that meet the conditions
DELETE FROM artist
WHERE artist_id = 3;
```

When no `WHERE` clause is used, SQLite optimizes the `DELETE` statement by truncating the table, this is faster than deleting all rows one by one, but it bypasses the individual row processing

- To process each row individually before deleting, provide a `WHERE` clause that is always true

```sql
-- delete all rows, force pre-row processing
DELETE FROM artist WHERE 1;
```

## TRUNCATE

Faster method to remove all rows in a table

Instead of deleting an entire table through `DROP`, we can remove its data and continue to have the table

- It is a DDL statement
- Drops the table
- Creates a new table
- Cannot rollback data

```sql
-- TRUNCATE object_type object_name

TRUNCATE TABLE played;
```

Limitations:

- In [MySQL](../../Concepts/Databases/MySQL.md) Identical to `DELETE` if you use InnoDB tables
- It dose not work with locking or transactions

## DROP (DDL)

The `DROP` statement destroys an existing database, table, index, or view

```sql
-- DROP object_type object_name

DROP TABLE employees;

DROP DATABASE airbnb;
```

## ALTER

The ALTER statement modifies an existing database object

- `ADD`
- `REMOVE`
- `RENAME`

```sql
-- ALTER object_type object_name [parameters]

ALTER TABLE sink ADD bubbles INTEGER;

ALTER TABLE sink DROP COLUMN bubbles;
```

## RENAME

```sql
-- RENAME object_type object_type TO new_object_name

RENAME TABLE customers TO customer_data;
```

## GRANT

Give (or grant) certain permissions for the table (and other objects) for specified groups/users of a database

```sql
-- GRANT type_of_permission ON database_name.table_name TO 'username'@'localhost'

GRANT SELECT,INSERT,UPDATE,DELETE ON employee TO user1;

-- grant all permissions
GRANT ALL ON movies.* to 'kantara'@'localhost';
```

## DENY

Bans certain permissions from groups/users

```sql
DENY UPDATE ON employee TO user1;
```

## REVOKE

Revoke permissions and privileges of database from groups/users

```sql
-- REVOKE type_of_permission ON database_name.table_name FROM 'username'@'localhost'

REVOKE INSERT ON employee FROM user1;
```

## BEGIN

Starts a transaction

```sql
-- start a transaction
BEGIN [TRANSACTION];

-- SQL statement that perform some changes on database
```

## COMMIT

Not every change made to a database is saved automatically

- This command saves the changes made using `INSERT`, `DELETE`, `UPDATE`
- Committed states can accrue

```sql
-- SQL statement that perform some changes on database

-- save those changes
COMMIT;
```

## ROLLBACK

Allows you to undo any changes you have made but don't want to be saved permanently

- Reverts to the last non-committed state

```sql
-- SQL statement that perform some changes on database
-- save changes

-- undo last saved changes
ROLLBACK;
```
