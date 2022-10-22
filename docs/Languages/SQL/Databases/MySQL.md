---
title: MySQL
description: MySQL is an open-source relational database management system (RDBMS).
---

# MySQL

MySQL is an open-source _relational database management system_ (RDBMS).

MySQL InnoDB Storage Engine.

Collation and Character Set:

- Default `latin1_swedish_ci` and `latin1`

```sql
SHOW CHARACTER SET;
SHOW COLLATION;

SHOW VARIABLES LIKE 'c%';

CREATE DATABASE rose DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_cs;
```

## Setup

Install the MySQL Community Server from this [link](https://dev.mysql.com/downloads/)

## Database Design / Data Modeling

1. It's an ongoing process where basic Database is designed:

   - Understand business data
   - Create a logical design
     - Tables, Indexes, Columns (ER Diagram)

2. Normalization is done:

   - Eliminate / Reduce:
     - Data Redundancy
     - Data Anomalies
     - Data Inconsistency

| De-normalized Database | Normalized Database |
| :--------------------- | :------------------ |
| Less Joins             | More Joins          |
| More Storage           | Less Storage        |
| High Data Redundancy   | Low Data Redundancy |

## Database Queries

### List / Show

```sql
-- list databases
SHOW DATABASES;

-- list tables
SHOW TABLES;
SHOW TABLES FROM music;

-- list columns
SHOW COLUMNS FROM track;

-- show statement used to create database, table
SHOW CREATE DATABASE music;
SHOW CREATE TABLE track;
```

### Create Database

```sql
CREATE DATABASE lucy;

-- avoid errors
CREATE DATABASE IF NOT EXISTS lucy;

USE lucy;
```

### Create Table

```sql
CREATE TABLE artist (
  artist_id SMALLINT(5) NOT NULL DEFAULT 0,
  artist_name CHAR(128) DEFAULT NULL,
  PRIMARY KEY (artist_id)
);
```

- `AUTO_INCREMENT`

Create temporary tables which will be deleted once the monitor connection is closed.

```sql
CREATE TEMPORARY TABLE
```

#### Column Types

1. `INT[(width)] [UNSIGNED] [ZEROFILL]`:

   - `UNSIGNED` can be used
   - `width`: Not the max number of digits but the min number of digits, like `INT(4)` will save 33 as 0033.
   - `width` and `ZEROFILL` arguments to left-pad the values with 0's.

## Locks

`show session variables like '%isolation%';`

Add Table lock:

`lock table PRODUCTS write;`

## Settings

- `set autocommit=0;`: Disable auto-commit (default: ON)
- `set session transaction isolation level read commited;`: Good for OLTP Databases (default: repeatable-read)
