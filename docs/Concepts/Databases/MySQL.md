---
title: MySQL
description: MySQL is an open-source RDBMS
---

# MySQL

[MySQL](https://www.mysql.com/) is an open-source [RDBMS](./RDBMS.md) created in 1995

- MySQL InnoDB Storage Engine

Setup: Install the [MySQL Community Server](https://dev.mysql.com/downloads/)

Features:

- Web App
- Ease of use
- Speed
- Scalability

## Data Types

- `CHAR`: It can only store strings of fixed length `CHAR(10)` can only store 10 characters

| Type           | Description                                                     |
| -------------- | --------------------------------------------------------------- |
| `INT`          | Whole numbers                                                   |
| `DECIMAL(M,N)` | Decimal numbers (exact value) (number of digits M, precision N) |
| `FLOAT`        |                                                                 |
| `VARCHAR(L)`   | String of length L (for small strings)                          |
| `TEXT`         | for longer strings                                              |
| `BLOB`         | Binary Large Object, Stores large data                          |
| `DATE`         | 'YYYY-MM-DD'                                                    |
| `TIMESTAMP`    | 'YYYY-MM-DD HH:MM:SS'                                           |

## Database Queries

Collation and Character Set:

- Default `latin1_swedish_ci` and `latin1`

```sql
SHOW CHARACTER SET;
SHOW COLLATION;

SHOW VARIABLES LIKE 'c%';

CREATE DATABASE rose DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_cs;
```

- `count(*)` is fast and good to be used
  - Smallest secondary non-null index

```sql
EXPLAIN SELECT COUNT(*) FROM todos;
```

### DB Info

```sql
-- list databases
SHOW DATABASES;

-- list tables
SHOW TABLES;
SHOW TABLES FROM music;

-- list columns
SHOW COLUMNS FROM track;

-- list triggers
SHOW TRIGGERS;

-- show statement used to create database, table
SHOW CREATE DATABASE music;
SHOW CREATE TABLE track;

-- show table schema
DESCRIBE student;
```

## Database

```sql
CREATE DATABASE lucy;

-- avoid errors
CREATE DATABASE IF NOT EXISTS lucy;

USE lucy;
```

## Table

MySQL stores rows of a table in the leaf nodes of a B+ tree primarily designed for fast retrieval of data

```sql
SELECT *
FROM customers
WHERE last_name REGEXP '^field'
```

Column Constraints:

- `UNIQUE`
- `NOT NULL`
- `PRIMARY KEY`: entry for this column should be unique and cannot be `NULL`
- `DEFAULT value`: set default value
- `ENUM`
- `AUTO_INCREMENT`: Add unique number to each row

- `CHECK`

_Example:_

```sql
-- Users table
CREATE TABLE Users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL UNIQUE,
  bio TEXT,
  country VARCHAR(2)
);

-- Rooms table
CREATE TABLE Rooms (
  id SMALLINT(5) NOT NULL DEFAULT 0,
  street CHAR(128) DEFAULT NULL,
  owner_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (owner_id) REFERENCES Users(id) ON DELETE SET NULL,
);
```

- `ON DELETE SET NULL`: set value as `NULL` when the foreign key entry is delete from the other table

- `ON DELETE SET CASCADE`: delete entry when the foreign key entry is delete from the other table

Create temporary tables which will be deleted once the monitor connection is closed:

```sql
CREATE TEMPORARY TABLE
```

- Show table:

```sql
SHOW CREATE TABLE todos;
```

### Column Types

1. `INT[(width)] [UNSIGNED] [ZEROFILL]`:
   - `UNSIGNED` can be used

   - `width`: Not the max number of digits but the min number of digits, like `INT(4)` will save 33 as 0033

   - `width` and `ZEROFILL` arguments to left-pad the values with 0's

## Index

```sql
CREATE INDEX email_index on Users(email);


-- size of index of a table
select index_name, stat_value * @@innodb_page_size / 1024 / 1024 as index_size_in_mb from mysql.innodb_index_stats where database_name = 'your_database_name' and table_name = 'your_table_name' and stat_name = 'size';

-- show indexes
SHOW INDEXEX FROM table_name \G;
```

## SELECT Statement

The [`SELECT` statement](../../Languages/SQL/SQL.md#select-dml) is used to query the database and retrieve data from one or more tables

The arithmetic operators in order of precedence:

| Operator  | Name               | Order of precedence |
| --------- | ------------------ | :-----------------: |
| `*`       | Multiplication     |          1          |
| `/`       | Division           |          1          |
| `DIV`     | Integer division   |          1          |
| `%` (MOD) | Modulo (remainder) |          1          |
| `+`       | Addition           |          2          |
| `-`       | Subtraction        |          2          |

What determines the sequence of operations?

- Order of precedence
- Parentheses

## Functions

- `CONCAT(string1[, string2]...)`: Concatenate strings
- `LEFT(str, number_of_characters)`: Extract leftmost characters
- `RIGHT(str, number_of_characters)`: Extract rightmost characters
- `DATE_FORMAT(date, format_string)`: Format date
- `ROUND(number[, number_of_decimal_places])`: Round number to specified decimal places

### Date and Time

Handle date and time values

## Triggers

A trigger is a stored program invoked automatically in response to an event such as `INSERT`, `UPDATE`, or `DELETE` that occurs in the associated table

- You can define a trigger that is invoked automatically before a new row is inserted into a table

```sql
CREATE TRIGGER before_employee_update BEFORE
UPDATE
  ON employees FOR EACH ROW
INSERT INTO
  employees_audit
SET
  action = 'update',
  employeeNumber = OLD.employeeNumber,
  lastName = OLD.lastName,
  changeDate = NOW();
```

- Default delimiter is `;`

```bash
mysql> delimiter //
mysql> CREATE TRIGGER upd_check BEFORE UPDATE ON account
       FOR EACH ROW
       BEGIN
           IF NEW.amount < 0 THEN
               SET NEW.amount = 0;
           ELSEIF NEW.amount > 100 THEN
               SET NEW.amount = 100;
           END IF;
       END;//
mysql> delimiter ;
```

## Locks

`show session variables like '%isolation%';`

Add Table lock:

`lock table PRODUCTS write;`

## Settings

- `set autocommit=0;`: Disable auto-commit (default: ON)
- `set session transaction isolation level read commited;`: Good for OLTP Databases (default: repeatable-read)
