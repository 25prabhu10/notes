---
title: SQLite
description: A database engine
---

# SQLite

SQLite is a SQL database engine that is **self-contained**, **serverless**, **zero-configuration**, **transactional** (ACID compliant), **cross-platform**, **small runtime footprint**, **full-featured** (supports standard SQL), and **highly reliable**. It is the most widely deployed database in the world with an estimated _1 trillion deployments_

It was created by D. Richard Hipp in 2000 and is public domain software

## Features

- Uses flexible types for columns
- Allows a single database connection to access multiple files (databases) simultaneously
- Capable of creating in-memory databases
- Max DB size: 281 TB
- Max row size: 1 GB
- `N+1` Queries are not a problem with SQLite

### Not Suitable

- **High Transaction Rates**: SQLite is not designed for high concurrency
- **Extremely Large Databases**: SQLite is not designed for large databases
- **Access Control**: SQLite does not have a built-in access control system
- **Client/Server Architecture**: SQLite is not a client/server database engine
- **Replication**: SQLite does not have a built-in replication or redundancy system

## Getting Started

Once you have installed SQLite, you can start using it by running the `sqlite3` command followed by the name of the database file

```bash
# create a new database file
sqlite3 database_file_name.db

# or

# open sqlite command-line shell
sqlite3
# use dot-commands to create a new database
.open database_file_name.db
```

- SQLite database files have the `.db` or `.sqlite` extension

### SQLite Command-Line Shell

- The SQLite command-line shell is used to interact with SQLite databases
- It is a text-based interface that allows you to enter SQL commands and view the results
- The shell is started by running the `sqlite3` command followed by the name of the database file

### SQLite GUI Tools

- [SQLiteStudio](https://sqlitestudio.pl/)
- [DB Browser for SQLite](https://sqlitebrowser.org/)
- [SQLite Manager](https://addons.mozilla.org/en-US/firefox/addon/sqlite-manager/)

## SQLite Architecture

SQLite is a library that provides a relational database management system (RDBMS) that is embedded into the end program (no separate server process)

- When a new database is created, a new file is created on disk that will store the database
- The database file is divided into pages, each page is a fixed-size block of data
- A page size in the database file by default is 4096 bytes
- Pages are the smallest unit of transaction on the file system
- When database needs to read data from a file, it reads one or more pages at a time
- SQLite uses a B-tree data structure to store the data in the database file

## SQL

SQLite understands most of the standard SQL language. However, it does not support the complete set of [SQL standard](../../Languages/SQL/SQL.md) ([SQL as understood by SQLite](https://www.sqlite.org/lang.html))

- SQLite reserves the use of any identifier beginning with `sqlite_`
- SQLite supports majority of standardised DDL, DML, and TCL commands but lacks any DCL commands

### SQL Features That SQLite Does Not Implement

- Complete `ALTER TABLE` support: Only the RENAME TABLE, ADD COLUMN, RENAME COLUMN, and DROP COLUMN variants of the ALTER TABLE command are supported. Other kinds of ALTER TABLE operations such as ALTER COLUMN, ADD CONSTRAINT, and so forth are omitted.

- Complete trigger support: FOR EACH ROW triggers are supported but not FOR EACH STATEMENT triggers

- Writing to VIEWs: VIEWs in SQLite are read-only. You may not execute a DELETE, INSERT, or UPDATE statement on a view. But you can create a trigger that fires on an attempt to DELETE, INSERT, or UPDATE a view and do what you need in the body of the trigger

- GRANT and REVOKE: Since SQLite reads and writes an ordinary disk file, the only access permissions that can be applied are the normal file access permissions of the underlying operating system. The GRANT and REVOKE commands commonly found on client/server RDBMSes are not implemented because they would be meaningless for an embedded database engine

## Dot-Commands

Along with SQL commands, SQLite supports a number of dot-commands that are used to change the settings of the SQLite environment

- The dot-commands are not SQL commands, they are commands that are processed by the SQLite command-line shell
- They should not be terminated with a semicolon `;`

### Common Dot-Commands

- `.help`: Display help information

- `.open FILENAME`: Open a database file

  ```bash
  # open sqlite
  # use ".open FILENAME" to reopen a persistent database
  .open album.db

  # or open db directly
  sqlite3 album.db
  ```

- `.save FILENAME`: Save the database to a file

- `.databases`: List all databases in the current database connection

  ```bash
  .database
  # main: album.db r/w
  ```

- `.tables`: List all tables in the current database

  ```bash
  .tables
  # albums employees invoices playlists

  .table '%es'
  # employees invoices
  ```

- `.schema`: Show the schema of the database

  ```bash
  .schema

  .schema albums

  # schema and the content of the sqlite_stat tables
  .fullschema
  ```

- `.indexes`: List all indexes in the current database

  ```bash
  .indexes

  # indexes of a specific table
  .indexes TABLE
  ```

- `.dump`: Export the entire database as a text file

- `.output FILENAME`: Redirect output to a file

  ```sql
  .output albums.txt

  SELECT title FROM albums
  ORDER BY title
  LIMIT 24;

  .quit

  -- export entire database:
  .output ./chinook.sql
  .dump
  .quit

  -- export specific table:
  .output ./albums.sql
  .dump albums
  .quit

  -- export only the schema:
  .output ./chinook_structure.sql
  .schema
  .quit
  ```

- `.headers`: Turn column headers on or off
- `.mode`: Set the output mode

  - 14 modes: `list` (default), `ascii`, `box`, `csv`, `column`, `html`, `insert`, `json`, `line`, `markdown`, `quote`, `table`, `tabs`, `tcl`

- Execute SQL statements from a file:

  ```bash
  .mode column
  .header on
  .read query.sql
  ```

- Backup current database:

  ```bash
  .backup
  ```

- Exit sqlite:

  ```bash
  .exit CODE # exit the SQLite shell with a return code
  .quit # exit the SQLite shell
  .q
  ```

## PRAGMA Statements

PRAGMA statements are used to change the behaviour of the SQLite library or to query the library for internal state information or metadata

- No error messages are generated if an unknown pragma is issued. Unknown pragmas are simply ignored

### Common PRAGMA Statements

- `PRAGMA encoding`: Get and set the encoding of the database

  ```sql
  PRAGMA encoding;
  -- UTF-8

  PRAGMA encoding='UTF-16'; -- UTF-16le, UTF-16be
  ```

- `PRAGMA foreign_keys`: Enable or disable foreign key constraints

  ```sql
  PRAGMA foreign_keys; -- 0 ("OFF") or 1 ("ON")

  PRAGMA foreign_keys = ON;
  ```

- `PRAGMA journal_mode`: Get and set the journal mode

  ```sql
  PRAGMA journal_mode; -- delete

  PRAGMA journal_mode = WAL; -- TRUNCATE, PERSIST, MEMORY, OFF
  ```

## Data Types

SQLite uses flexible type system for columns, **it dose not use strict data types**

- The data-type of a value is associated with the value itself, not with its container (column)
- SQLite provides **`STRICT` tables** that do rigid type enforcement

Storage classes (5 basic data types):

1. `NULL`: It dose not hold a value (missing or unknown value)

   - Literal NULLs are represented by the keyword `NULL`

2. `INTEGER`: The value is a signed integer, stored in `0`, `1`, `2`, `3`, `4`, `6`, or `8` bytes depending on the magnitude of the value

3. `REAL`: The value is a floating point value, stored as an 8-byte IEEE floating point number

4. [`TEXT`](#text): The value is a text string, stored using the database encoding (`UTF-8`, `UTF-16BE` or `UTF-16LE`)

5. `BLOB`: The value is a blob of data, stored exactly as it was input

6. `ANY`: The value can be of any type (used in `STRICT` tables)

_Example:_

```sql
SELECT
typeof(100),      -- integer
typeof(100.0),    -- real
typeof("SQLite"), -- text
typeof(0x12),     -- integer
typeof(0e5),      -- real
typeof(x'1000'),  -- blob
typeof(NULL);     -- null
```

- Boolean values are stored as integers `0` (false) and `1` (true). Keywords `TRUE` and `FALSE`, are supported as of V3.23.0 (2018-04-02)

- The built-in Date And Time Functions of SQLite are capable of storing dates and times as `TEXT`, `REAL`, or `INTEGER` values

  - `TEXT` as ISO-8601 strings (`YYYY-MM-DD HH:MM:SS.SSS`)
  - `REAL` as Julian day numbers, the number of days since noon in Greenwich on `November 24, 4714 B.C.` according to the proleptic Gregorian calendar
  - `INTEGER` as Unix Time, the number of seconds since `1970-01-01 00:00:00 UTC`

### Type Affinity

Database engines that use rigid typing usually try to automatically convert values to the appropriate data-type

SQLite supports the concept of "type affinity" on columns. The type affinity of a column is the recommended type for data stored in that column

- Any column can still store any type of data, but the declared type of the column will be used to determine the type affinity of the column

```sql
-- create a table with type affinity
CREATE TABLE types (n INTEGER);

-- insert values
INSERT INTO types (n) VALUES (1);

-- check the type affinity
SELECT n, typeof(n) FROM types;
-- 1|integer

-- insert a text value, and other values
INSERT INTO types (n) VALUES ('hello');
INSERT INTO types (n) VALUES (1.0);
INSERT INTO types (n) VALUES (1.1);

-- check the type affinity
SELECT n, typeof(n) FROM types;
-- 1|integer
-- hello|text
-- 1|integer
-- 1.1|real
```

- `1.0` is stored as `INTEGER` because the column has `INTEGER` affinity
- SQLite will try to convert the value to the declared type of the column if data is not lost during conversion
- `1.0` to `1` is a lossless conversion
- But, `1.1` to `1` is a lossy conversion so it is stored as `1.1` (`REAL` rather than `INTEGER`)

#### Determining Type Affinity

For tables not declared with `STRICT`:

1. If the declared type contains the string `INT` then it is assigned INTEGER affinity

2. If the declared type of the column contains any of the strings `CHAR`, `CLOB`, or `TEXT` then that column has `TEXT` affinity. Notice that the type `VARCHAR` contains the string `CHAR` and is thus assigned `TEXT` affinity

3. If the declared type for a column contains the string `BLOB` or if no type is specified then the column has affinity `BLOB`

4. If the declared type for a column contains any of the strings `REAL`, `FLOA`, or `DOUB` then the column has `REAL` affinity

5. Otherwise, the affinity is `NUMERIC`

### TEXT

- Concatenate text using the `||` operator

```sql
SELECT 'Hello' || ' ' || 'World';
-- Hello World
```

### Collating Sequences

When SQLite compares two strings, it uses a collating sequence to determine which string is greater or if the two strings are equal

SQLite has three built-in collating functions:

1. `BINARY` (default): Compares string data using `memcmp()`, regardless of text encoding.
2. `NOCASE`: Compares strings case-insensitively

   - ASCII are folded to their lower case equivalents before the comparison

3. `RTRIM`: Same as binary, except it ignores trailing space characters

```sql
CREATE TABLE t1(
    x INTEGER PRIMARY KEY,
    a,                 -- collating sequence BINARY
    b COLLATE BINARY,  -- collating sequence BINARY
    c COLLATE RTRIM,   -- collating sequence RTRIM
    d COLLATE NOCASE   -- collating sequence NOCASE
);
                   /* x   a     b     c       d */
INSERT INTO t1 VALUES(1,'abc','abc', 'abc  ','abc');
INSERT INTO t1 VALUES(2,'abc','abc', 'abc',  'ABC');
INSERT INTO t1 VALUES(3,'abc','abc', 'abc ', 'Abc');
INSERT INTO t1 VALUES(4,'abc','abc ','ABC',  'abc');

/* Text comparison a=b is performed using the BINARY collating sequence. */
SELECT x FROM t1 WHERE a = b ORDER BY x;
--result 1 2 3

/* Text comparison a=b is performed using the RTRIM collating sequence. */
SELECT x FROM t1 WHERE a = b COLLATE RTRIM ORDER BY x;
--result 1 2 3 4

/* Text comparison d=a is performed using the NOCASE collating sequence. */
SELECT x FROM t1 WHERE d = a ORDER BY x;
--result 1 2 3 4

/* Text comparison a=d is performed using the BINARY collating sequence. */
SELECT x FROM t1 WHERE a = d ORDER BY x;
--result 1 4

/* Text comparison 'abc'=c is performed using the RTRIM collating sequence. */
SELECT x FROM t1 WHERE 'abc' = c ORDER BY x;
--result 1 2 3

/* Text comparison c='abc' is performed using the RTRIM collating sequence. */
SELECT x FROM t1 WHERE c = 'abc' ORDER BY x;
--result 1 2 3

/* Grouping is performed using the NOCASE collating sequence (Values
** 'abc', 'ABC', and 'Abc' are placed in the same group). */
SELECT count(*) FROM t1 GROUP BY d ORDER BY 1;
--result 4

/* Grouping is performed using the BINARY collating sequence.  'abc' and
** 'ABC' and 'Abc' form different groups */
SELECT count(*) FROM t1 GROUP BY (d || '') ORDER BY 1;
--result 1 1 2

/* Sorting or column c is performed using the RTRIM collating sequence. */
SELECT x FROM t1 ORDER BY c, x;
--result 4 1 2 3

/* Sorting of (c||'') is performed using the BINARY collating sequence. */
SELECT x FROM t1 ORDER BY (c||''), x;
--result 4 2 3 1

/* Sorting of column c is performed using the NOCASE collating sequence. */
SELECT x FROM t1 ORDER BY c COLLATE NOCASE, x;
--result 2 4 3 1
```

### Date And Time

SQLite does not have a dedicated date/time data-type. Instead, date and time values can stored as any of the following:

- ISO-8601: A text string that is one of the ISO 8601 date/time values shown in items 1 through 10 below. Example: `'2025-05-29 14:16:00'`
- Julian day number: The number of days including fractional days since -4713-11-24 12:00:00 Example: `2460825.09444444`
- Unix timestamp: The number of seconds including fractional seconds since 1970-01-01 00:00:00 Example: `1748528160`

## Tables

Tables are the basic unit of data storage in an SQLite database. They are used to store data in rows and columns

### Creating Tables

Tables are created using the `CREATE TABLE` statement

- You can skip data types for columns, SQLite will automatically assign a type based on the data

```sql
CREATE TABLE table_name
(
   column1 datatype PRIMARY KEY,
   column2 datatype,
   column3 datatype,
   ...
);

-- or
CREATE TABLE table_name
(
   column1,
   column2,
   column3,
   ...
);
```

- Create `STRICT` tables to enforce **strict data types**

```sql
CREATE TABLE types
(
   n INTEGER
) STRICT;

-- insert values
INSERT INTO types (n) VALUES (1);

-- If you try to insert a text value, you will get an error
INSERT INTO types (n) VALUES ('hello');
-- Runtime error: cannot store TEXT value in INTEGER column types.n
```

- If you want `STRICT` tables but still want to allow flexibility in data types for some columns, you can use the `ANY` type for those columns

```sql
CREATE TABLE types
(
   n INTEGER,
   s ANY
) STRICT;

-- insert values
INSERT INTO types (n, s) VALUES (1, 'hello');
INSERT INTO types (n, s) VALUES (1, 1.0);
```

- Create **table from query** result:

  - Column constraints are not copied and cannot be specified
  - Data is populated from the result of the query
  - Inherit column names and column affinity

```sql
CREATE TABLE table_name AS SELECT query_statement;
```

### Temporary Tables

Temporary tables are used to store a temporary result set that is accessible only within the session in which it was created

Create **temporary table** using `TEMP` or `TEMPORARY` keyword:

- Temporary tables are automatically deleted when the database connection is closed
- Temporary tables are not visible to other database connections

```sql
CREATE TEMPORARY TABLE table_name
(
   column1 datatype PRIMARY KEY,
   column2 datatype,
   column3 datatype,
   ...
);
```

### Virtual Tables

Virtual tables are used to connect any data source to SQLite, including other databases

Create **virtual table** using `VIRTUAL` keyword:

- They are used to connect any data source to SQLite, including other databases
- Virtual tables cannot be made temporary, nor do they allow for an `IF NOT EXISTS` clause
- Virtual tables are not stored in the database file
- They are implemented using a C module that provides a set of functions that the SQLite library can call

```sql
CREATE VIRTUAL TABLE table_name USING module_name;

-- to drop a virtual table
DROP TABLE table_name;
```

### Column Constraints

They limit the data that can be inserted into tables, multiple constraints can be applied to a single column

Common constraints:

- `NOT NULL`: Ensures that a column cannot have `NULL` value
- `UNIQUE`: Ensures that all values in a column are different

  - As `NULL` is not considered a value, so `UNIQUE` constraint allows multiple `NULL` values
  - An index is created for each column with a `UNIQUE` constraint

- `DEFAULT`: Provides a default value for a column when none is specified

  - `CURRENT_TIMESTAMP`, `CURRENT_DATE`, and `CURRENT_TIME`

- `AUTOINCREMENT`: Automatically generates a unique integer number (identity) for each row

- `NOCASE`: Case-insensitive collation ignores case when sorting and comparing text

- `PRIMARY KEY`: Uniquely identifies each row/record in a database table

  - A table can have only one primary key
  - In SQLite, the `PRIMARY KEY` dose not imply `NOT NULL` constraint, so always use `NOT NULL` with `PRIMARY KEY`
  - Only `INTEGER PRIMARY KEY` have an automatic `NOT NULL` constraint and they are strictly typed to `INTEGER`
  - `INTEGER PRIMARY KEY` can be optionally marked as `AUTOINCREMENT`

  ```sql
  CREATE TABLE table_name
  (
     column1 datatype PRIMARY KEY, -- column1 is the primary key and it can have NULL values
     column2 datatype,
     ...
  );
  ```

- `FOREIGN KEY`: Uniquely identifies a row/record in another table

  - A table can have multiple foreign keys
  - The `FOREIGN KEY` constraint is used to prevent actions that would destroy links between tables
  - The `FOREIGN KEY` constraint also prevents invalid data from being inserted into the foreign key column
  - Foreign key enforcement is **off by default**, it can be enabled using the `PRAGMA foreign_keys = ON` command

  ```sql
  CREATE TABLE table_name
  (
     column1 datatype PRIMARY KEY,
     column2 datatype,
     ...
     FOREIGN KEY (column2) REFERENCES other_table_name(column_name)
  );
  ```

  - The `ON DELETE` and `ON UPDATE` clauses specify what to do when a `DELETE` or `UPDATE` operation affects the foreign key column

    - `CASCADE`: Automatically delete or update the corresponding rows in the child table
    - `SET NULL`: Set the foreign key column to `NULL` when the parent key is deleted or updated
    - `RESTRICT`: Reject the delete or update operation for the parent key
    - `NO ACTION`: The default action is `RESTRICT`

  ```sql
  CREATE TABLE table_name
  (
     column1 datatype PRIMARY KEY,
     column2 datatype,
     ...
     FOREIGN KEY (column2) REFERENCES other_table_name(column_name)
     ON DELETE CASCADE
     ON UPDATE SET NULL
  );
  ```

User defined constraints:

- `CHECK (expression)`: Ensures that all values in a column satisfies certain conditions

_Example:_

```sql
CREATE TABLE company
(
   ID             INT     PRIMARY KEY   NOT NULL,
   NAME           TEXT    NOT NULL,
   EMAIL          TEXT    NOT NULL      UNIQUE,
   AGE            INT     DEFAULT 18,
   ADDRESS        CHAR(50),
   SALARY         REAL    CHECK(SALARY > 0)
);
```

#### `ROWID` Column

Every SQLite table has a special hidden column named `ROWID`. If a table has a column with the name `ROWID`, then that column is the `ROWID` column

- It is used to index the base storage for the table (master index)
- If primary key is an `INTEGER` column, then that column becomes the table's _root_ column (`ROWID`)

### Table Constraints

Table constraints still operate on individual rows, but they can span multiple columns

- Multicolumn constraints are also known as _compound constraints_

SQLite supports the following table constraints:

- `PRIMARY KEY`: Combination of columns that uniquely identify a row in a table
- `UNIQUE`
- `CHECK`

```sql
CREATE TABLE table_name
(
   column1 datatype,
   column2 datatype,
   ...
   PRIMARY KEY (column1, column2)
);
```

### Altering Tables

SQLite supports a limited set of `ALTER TABLE` commands

1. `RENAME TABLE`: Renames a table

   ```sql
   ALTER TABLE table_name RENAME TO new_table_name;
   ```

2. `ADD COLUMN`: Adds a new column to a table

   ```sql
   ALTER TABLE table_name ADD COLUMN column_name datatype;
   ```

### Dropping Tables

Dropping a table removes the table and all its data from the database

- It will also remove all indexes, triggers, and constraints associated with the table

```sql
DROP TABLE table_name;
```

## Views

A view is a query that is stored in the data dictionary and acts like a table, but there is no data stored in the view

### Creating Views

Views are created using the `CREATE VIEW` statement

```sql
CREATE VIEW view_name AS SELECT query_statement;
```

- You can create `TEMPORARY` views that are automatically deleted when the database connection is closed

```sql
CREATE TEMP VIEW view_name AS SELECT query_statement;
```

### Dropping Views

Dropping a view removes the view from the database

```sql
DROP VIEW view_name;
```

## Indexes

Create an index using the `CREATE INDEX` statement

```sql
CREATE [UNIQUE] INDEX index_name ON table_name(column_name [, ...]);

-- create an index on the `name` column of the `employees` table
CREATE INDEX idx_employees_name ON employees ( name );
```

- Use `idx_` prefix for index names

- All automatically created indexes are prefixed with `sqlite_`

- The `UNIQUE` keyword creates a unique index, which means that the indexed columns must contain unique values

Drop an index using the `DROP INDEX` statement:

- Dropping an index removes the index from the database, but does not affect the table

```sql
DROP INDEX index_name;
```

## SELECT Statement

The [`SELECT` statement](../../Languages/SQL/SQL.md#select-dml) is used to query the database and retrieve data from one or more tables

- Concatenate multiple columns using the `||` operator

```sql
SELECT column1, column2, column1 || column2 AS new_column_name
FROM table_name;
```

### Joins

Joins are used to combine rows from two or more tables based on a related column between them (foreign key)

- Two or more tables can be joined together using the `JOIN` operator
- `JOIN` operators are evaluated from left-to-right

```text

```

#### CROSS JOIN

The `CROSS JOIN` operator returns the Cartesian product of two tables (all possible combinations of rows)

- Matches every row of the first table with every row of the second table

```sql
-- "table1"
-- | A   | B   |
-- | --- | --- |
-- | 1   | a   |
-- | 2   | b   |
-- | 3   | c   |
-- | 4   | d   |

-- "table2"
-- | X   | Y   |
-- | --- | --- |
-- | 10  | 1.2 |
-- | 20  | 2.3 |

SELECT *
  FROM table1
  CROSS JOIN table2;

-- result:
-- | A   | B   | X   | Y   |
-- | --- | --- | --- | --- |
-- | 1   | a   | 10  | 1.2 |
-- | 2   | b   | 10  | 1.2 |
-- | 3   | c   | 10  | 1.2 |
-- | 4   | d   | 10  | 1.2 |
-- | 1   | a   | 20  | 2.3 |
-- | 2   | b   | 20  | 2.3 |
-- | 3   | c   | 20  | 2.3 |
-- | 4   | d   | 20  | 2.3 |
```

#### INNER JOIN

The `INNER JOIN` operator selects records that have matching values in both tables (intersection)

- It is the most common type of join
- `INNER JOIN` is the same as `JOIN` (default join type)
- The `ON` keyword is used to specify the join condition

```sql
-- "table1"
-- | A   | B   |
-- | --- | --- |
-- | 3   | a   |
-- | 1   | f   |
-- | 1   | q   |
-- | 4   | e   |
-- | 9   | r   |

-- "table2"
-- | C   | D   |
-- | --- | --- |
-- | 1   | 7.4 |
-- | 3   | 2.3 |
-- | 9   | 8.6 |

SELECT *
  FROM table1
  INNER JOIN table2
  ON table1.A = table2.C;

-- result:
-- | A   | B   | C   | D   |
-- | --- | --- | --- | --- |
-- | 1   | f   | 1   | 7.4 |
-- | 1   | q   | 1   | 7.4 |
-- | 3   | a   | 3   | 2.3 |
-- | 9   | r   | 9   | 8.6 |
```

- `USING` expression can be used to specify the column to join on

  - It is a shorthand for specifying the join condition
  - This will return only one column with the same name
  - Both tables must have a column with the same name

```sql
SELECT *
  FROM table1
  INNER JOIN table2
  USING (column_name [, ...]);
```

- **`NATURAL JOIN`**: It is a shorthand for `INNER JOIN` with `USING` clause

  - It automatically matches columns with the same name in both tables

```sql
SELECT *
  FROM table1
  NATURAL JOIN table2;
```

#### OUTER JOIN

Outer joins are used to return rows that do not have a match in the other table

- It is an extension of the `INNER JOIN`

There are three types of outer joins:

- `LEFT JOIN` (or `LEFT OUTER JOIN`): Returns all rows from the left table, and the matched rows from the right table

  - The result is `NULL` from the right side if there is no match

  ```sql
  SELECT *
    FROM table1
    LEFT JOIN table2
    ON table1.A = table2.C;
  ```

- `RIGHT JOIN` (or `RIGHT OUTER JOIN`): Returns all rows from the right table, and the matched rows from the left table

  - The result is `NULL` from the left side if there is no match

  ```sql
  SELECT *
    FROM table1
    RIGHT JOIN table2
    ON table1.A = table2.C;
  ```

- `FULL JOIN` (or `FULL OUTER JOIN`): Returns all rows when there is a match in either left or right table

  - The result is `NULL` from both sides when there is no match

  ```sql
  SELECT *
    FROM table1
    FULL JOIN table2
    ON table1.A = table2.C;
  ```

## Insert Statement

The `INSERT` statement is used to insert new rows into a table

```sql
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);
```

## Update Statement

The `UPDATE` statement is used to modify the existing records in a table

```sql
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
```

## Delete Statement

The `DELETE` statement is used to delete existing records from a table

```sql
DELETE FROM table_name
WHERE condition;
```

## Functions

Functions are used to perform operations on data and return a result

- `date()`: returns the date as text in this format: `YYYY-MM-DD`
- `time(time-value, modifier, modifier, ...)`
- `datetime(time-value, modifier, modifier, ...)`
- `julianday(time-value, modifier, modifier, ...)`
- `unixepoch(time-value, modifier, modifier, ...)`
- `timediff(time-value, time-value)`
- `strftime(format, time-value, modifier, modifier, ...)`

  Valid string _format_:

  - `%d`: day of month: `01-31`
  - `%e`: day of month without leading zero: `1-31`
  - `%f`: fractional seconds: `SS.SSS`
  - `%F`: ISO 8601 date: `YYYY-MM-DD`
  - `%G`: ISO 8601 year corresponding to `%V`
  - `%g`: 2-digit ISO 8601 year corresponding to `%V`
  - `%H`: hour: `00-24`
  - `%I`: hour for 12-hour clock: `01-12`
  - `%j`: day of year: `001-366`
  - `%J`: Julian day number (fractional)
  - `%k`: hour without leading zero: `0-24`
  - `%l`: %I without leading zero: `1-12`
  - `%m`: month: `01-12`
  - `%M`: minute: `00-59`
  - `%p`: "AM" or "PM" depending on the hour
  - `%P`: "am" or "pm" depending on the hour
  - `%R`: ISO 8601 time: `HH:MM`
  - `%s`: seconds since `1970-01-01`
  - `%S`: seconds: `00-59`
  - `%T`: ISO 8601 time: `HH:MM:SS`
  - `%U`: week of year (00-53) - week 01 starts on the first Sunday
  - `%u`: day of week 1-7 with Monday==1
  - `%V`: ISO 8601 week of year
  - `%w`: day of week 0-6 with Sunday==0
  - `%W`: week of year (00-53) - week 01 starts on the first Monday
  - `%Y`: year: `0000-9999`
  - `%%`: `%`

Valid _time-value_ formats:

- `YYYY-MM-DD`
- `YYYY-MM-DD HH:MM`
- `YYYY-MM-DD HH:MM:SS`
- `YYYY-MM-DD HH:MM:SS.SSS`
- `YYYY-MM-DDTHH:MM`
- `YYYY-MM-DDTHH:MM:SS`
- `YYYY-MM-DDTHH:MM:SS.SSS`
- `HH:MM`
- `HH:MM:SS`
- `HH:MM:SS.SSS`
- `now`
- `DDDDDDDDDD`

Valid _modifier_ values:

- `NNN` days
- `NNN` hours
- `NNN` minutes
- `NNN` seconds
- `NNN` months
- `NNN` years
- `±HH:MM`
- `±HH:MM:SS`
- `±HH:MM:SS.SSS`
- `±YYYY-MM-DD`
- `±YYYY-MM-DD HH:MM`
- `±YYYY-MM-DD HH:MM:SS`
- `±YYYY-MM-DD HH:MM:SS.SSS`
- `ceiling`
- `floor`
- start of month
- start of year
- start of day
- weekday `N`
- `unixepoch`
- `julianday`
- `auto`
- `localtime`
- `utc`
- `subsec`
- `subsecond`

_Example:_

```sql
SELECT date('now'); -- 2025-05-29

SELECT
  strftime('%m/%d/%Y', date()) AS 'MM/DD/YYYY',
  strftime('%d-%m-%Y', date()) AS 'DD-Mon-YYYY';
```

### Arithmetic Functions

- `ROUND(number[, number_of_decimal_places])`: Rounds a number to a specified number of decimal places

#### Aggregate Functions

Aggregate functions are used to perform calculations on a set of values and return a single value

- `AVG()`: Returns the average value of a numeric column
- `COUNT()`: Returns the number of rows that match a specified condition
- `MAX()`: Returns the largest value of a column
- `MIN()`: Returns the smallest value of a column
- `SUM()`: Returns the total sum of a numeric column

```sql
SELECT AVG(column_name) FROM table_name;
SELECT COUNT(column_name) FROM table_name;
SELECT MAX(column_name) FROM table_name;
```

## Operators

- `+`: Addition
- `-`: Subtraction
- `*`: Multiplication
- `/`: Division
- `%`: Modulus
- `=`: Equal to
- `<>` or `!=`: Not equal to
- `>`: Greater than
- `<`: Less than
- `>=`: Greater than or equal to
- `<=`: Less than or equal to

## Transactions

A transaction is a sequence of operations that are executed as a single unit of work so that either all of the operations are executed or none of them are executed

- Transactions are used to ensure data integrity and consistency in the database
- SQLite uses transactions to ensure that changes are atomic, consistent, isolated, and durable (ACID properties)

SQLite by default runs in `autocommit` mode, which means that SQLite will automatically start a transaction for each command, process the command, and (assuming no errors were generated) automatically commit the transaction

- To start a transaction manually, use the `BEGIN [TRANSACTION]` statement (`TRANSACTION` is optional)
- To commit a transaction, use the `COMMIT [TRANSACTION]` statement, and to rollback a transaction, use the `ROLLBACK` statement
- `END [TRANSACTION]` is a synonym for `COMMIT [TRANSACTION]`

- Optional `DEFERRED` (default), `IMMEDIATE`, or `EXCLUSIVE` keywords can be used to specify the type of transaction

  - `DEFERRED`: The `BEGIN` statement will not acquire any locks until the first read or write operation

    - Other clients can continue to use the database file

  - `IMMEDIATE`: The `BEGIN` statement will acquire a reserved lock on the database file immediately

    - Other clients can read the database file but cannot write to it

  - `EXCLUSIVE`: The `BEGIN` statement will acquire an exclusive lock on the database file immediately

    - Other clients cannot read or write to the database file

```sql
-- start a transaction
BEGIN [DEFERRED | IMMEDIATE | EXCLUSIVE] [TRANSACTION];

-- SQL statement that perform some changes on database
UPDATE table_name SET column1 = value1 WHERE condition;

-- commit the transaction
COMMIT [TRANSACTION];
-- or
END [TRANSACTION];

-- rollback the transaction
ROLLBACK [TRANSACTION];
```

### Save-Points

Save-points are used to create points within a transaction that can be rolled back to without affecting the entire transaction

- Unlike transactions, you can have multiple save-points active at the same time
- Save-points are also called _nested transactions_
- `SAVEPOINT` creates a save-point
- `RELEASE` removes a save-point and accepts all changes made since the save-point was created

  - Changes are accepted but not committed as the transaction is still active
  - `COMMIT` is required to commit the transaction

- `ROLLBACK TO` cancels all changes made since the save-point was created

```sql
-- create a save-point
SAVEPOINT save_point_name;

-- release a save-point
RELEASE [SAVEPOINT] save_point_name;

-- rollback to a save-point
ROLLBACK [TRANSACTION] TO [SAVEPOINT] save_point_name;
```

### Write-Ahead Logging (WAL)

By default, SQLite uses `rollback journal` mode to ensure that changes are atomic, consistent, isolated, and durable

- In `rollback journal` mode, SQLite writes changes to a journal file and then applies them to the database file
- SQLite operates in "rollback mode" by default, which means that changes are rolled back if the database is not closed properly

Write-Ahead Logging (WAL) is an alternative method of logging changes to the database

- In WAL mode, SQLite writes changes to a separate WAL file and then applies them to the database file in the background

Advantages of WAL mode:

- WAL is significantly faster in most scenarios
- WAL provides more concurrency as readers do not block writers and a writer does not block readers
- Disk I/O operations tends to be more sequential using WAL

Disadvantages of WAL mode:

- WAL requires more disk space
- WAL does not work well on network filesystems
- WAL might be very slightly slower than rollback journal in applications that do mostly reads and seldom write

To enable WAL mode:

```sql
-- run the following command in the SQLite shell
PRAGMA journal_mode=WAL;
```

Create a database in WAL mode:

```bash
sqlite3 database_file_name.db 'PRAGMA journal_mode=WAL;'
```

You can improve write performance by setting synchronous mode to `NORMAL` (`1`):

```sql
-- FULL (2) default
PRAGMA synchronous=1;
```

## System Catalogues

SQLite provides a number of system catalogues that can be queried to retrieve information about the database

- `sqlite_schema`: Stores the schema for that database

  - Description of all of the other tables, indexes, triggers, and views that are contained within the database
  - Alias names: `sqlite_master`, `sqlite_temp_master`, `sqlite_temp_schema`

  | Column Name | Column Type | Description                                                       |
  | ----------- | ----------- | ----------------------------------------------------------------- |
  | `type`      | `TEXT`      | Type of the database object (`table`, `index`, `view`, `trigger`) |
  | `name`      | `TEXT`      | Name of the database object                                       |
  | `tbl_name`  | `TEXT`      | Name of the table that the object is associated with              |
  | `rootpage`  | `INTEGER`   | The page number of the root b-tree page for tables and indexes    |
  | `sql`       | `TEXT`      | SQL statement that was used to create the object                  |

- `sqlite_sequence`: Auto-incrementing sequence for tables with auto-incrementing columns
- `sqlite_stat#`: Statistics about the database is stored when `ANALYZE` command is executed
