---
title: SQL
description: Structured Query Language
---

# SQL

Structured Query Language

- Cascading referential integrity constraint

Sub-Groups of SQL Commands:

1. DDL (Data Definition Language):

   - Commands that can be used to define the database schema
   - Some commands:

     - `CREATE`: to create objects in database
     - `ALTER`: alters the structure of database
     - `DROP`: delete objects from database
     - `RENAME`: rename an objects

2. DML (Data Manipulation Language)

   - Commands that deal with the manipulation of data present in database
   - Some commands:

     - `SELECT`: retrieve data from the database
     - `INSERT`: insert data into a table
     - `UPDATE`: update existing data within a table
     - `DELETE`: deletes all records from a table, space for the records remain

3. DQL (Data Query Language)

   - Commands that can be used to define the database schema
   - Some commands:

     - `SELECT`: retrieve data from the database

4. DCL (Data Control Language)

   - Commands which deal with the rights, permissions and other controls of the database system
   - Some commands:

     - `GRANT`: allow specified users to perform specified tasks
     - `REVOKE`: cancel previously granted or denied permissions

- TCL (Transaction control language)

  - Commands which mainly deal with the transaction of database
  - Some commands:

    - `COMMIT`: This command is used to permanently save any transaction into the database
    - `ROLLBACK`: This command restores the database to last committed state. It is also used with savepoint command to jump to a savepoint in a transaction
    - `SAVEPOINT`: This command is used to temporarily save a transaction so that you can rollback to that point whenever necessary

## CREATE

The `CREATE` command is used to establish a new database, table, index, or stored procedure

- DDL statement

```sql
-- CREATE TABLE [table name] ( [column definitions] ) [table parameters]
CREATE TABLE employees (
    id            INTEGER       PRIMARY KEY,
    first_name    VARCHAR(50)   not null,
    last_name     VARCHAR(75)   not null,
    mid_name      VARCHAR(50)   not null,
    dateofbirth   DATE          not null
);
```

## SELECT

`SELECT` is used to read data from tables

- DQL statement

```sql
-- query for all columns
SELECT * FROM artist;

-- query for select columns
SELECT artist_name,artist_id FROM artist;

-- calculate value
SELECT name, (gdp/population) FROM world;
```

## WHERE

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

- `AND`
- `OR`
- `XOR`

```sql
-- query with constraints
SELECT column, another_column, …
FROM myTable
WHERE condition
    AND/OR another_condition
    AND/OR …;

SELECT *
FROM   artist
WHERE  artist_name = "new order";

-- >, <, <=, >=, not equal ( <> or !=)
SELECT artist_name
FROM   artist
WHERE  artist_id < 5;

-- pattern matching
SELECT album_name
FROM   album
WHERE  album_name LIKE "retro%";

-- 3 letters beginning with 'R' and match rest
SELECT *
FROM   track
WHERE  track_name LIKE "r__ %";

SELECT album_name
FROM   album
WHERE  album_name > "c"
       AND album_name < "m";

SELECT name,
       population
FROM   world
WHERE  name IN ( 'Brazil', 'Russia', 'India', 'China' );

SELECT name,
       area
FROM   world
WHERE  area BETWEEN 250000 AND 300000;

-- XOR
SELECT name,
       population,
       area
FROM   world
WHERE  ( population >= 250000000
         AND area < 3000000 )
        OR ( population < 250000000
             AND area >= 3000000 );
```

### DISTINCT

Select query with unique results:

```sql
SELECT DISTINCT column, another_column, …
FROM myTable
WHERE condition(s);
```

### ORDER BY

Query sorted

```sql
-- ascending (default) ASC
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

## INSERT

- DML statement

```sql
INSERT INTO artist VALUES (7, "Barry Adamson");

INSERT INTO album (artist_id, album_id, album_name)
VALUES (7, 2, "Oedipus Schmoedipus");

-- using SELECT
INSERT INTO artist
VALUES((SELECT 1+MAX(artist_id) FROM artist), "Barry Adamson");
```

- `IGNORE`: Ignore errors
- `DEFAULT`: Use default value

## UPDATE

- DML statement

```sql
UPDATE artist SET artist_name = UPPER(artist_name);
```

## DELETE

Delete a row in a table

- DML statement
- We can rollback data after using delete statement

```sql
-- delete all rows (empty the table)
DELETE FROM played;

DELETE FROM artist WHERE artist_id = 3;
```

## TRUNCATE

Faster method to remove all rows in a table

- It is a DDL statement
- Drops the table
- Creates a new table
- Cannot rollback data

```sql
-- TRUNCATE TABLE table_name;
TRUNCATE TABLE played;
```

Limitations:

- In [MySQL](./Databases/MySQL.md) Identical to `DELETE` if you use InnoDB tables
- It dose not work with locking or transactions

## DROP

The `DROP` statement destroys an existing database, table, index, or view

- DDL statement

```sql
-- DROP objectType objectName
DROP TABLE employees;
```

## ALTER

The ALTER statement modifies an existing database object

```sql
-- ALTER objecttype objectname parameters
ALTER TABLE sink ADD bubbles INTEGER;

ALTER TABLE sink DROP COLUMN bubbles;
```

## GRANT

Give certain permissions for the table (and other objects) for specified groups/users of a database

```sql
GRANT SELECT,INSERT,UPDATE,DELETE on Employee To User1;
```

## DENY

Bans certain permissions from groups/users

```sql
DENY Update On Employee to user1;
```

## REVOKE

This command takes away permissions from groups/users

```sql
REVOKE INSERT On Employee To user1;
```
