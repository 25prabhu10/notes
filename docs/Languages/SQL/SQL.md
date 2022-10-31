---
title: SQL
description: Structured Query Language
---

# SQL

Structured Query Language

- Cascading referential integrity constraint

## SELECT

`SELECT` is a DQL (Data Query Language) used to read data from tables

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

Insert is a DML (Data Manipulation Language).

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

## DELETE

Delete is a DML (Data Manipulation Language).

```sql
-- delete all rows (empty the table)
DELETE FROM played;

DELETE FROM artist WHERE artist_id = 3;
```

### TRUNCATE

Faster method to remove all rows in a table.

- Drops the table
- Creates a new table

```sql
TRUNCATE TABLE played;
```

Limitations:

- Identical to `DELETE` if you use InnoDB tables
- It dose not work with locking or transactions

## UPDATE

Update is a DML (Data Manipulation Language).

```sql
UPDATE artist SET artist_name = UPPER(artist_name);
```
