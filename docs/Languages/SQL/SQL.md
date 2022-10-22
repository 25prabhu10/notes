---
title: SQL
description: Structured Query Language
---

# SQL

Structured Query Language

- Cascading referential integrity constraint

## SELECT

`SELECT` is a DQL (Data Query Language) used to read data from tables.

```sql
-- read all columns
SELECT * FROM artist;

-- read select columns
SELECT artist_name,artist_id FROM artist;
```

### WHERE

- `LIKE`
- `AND`
- `OR`
- `NOT`
- `XOR`

```sql
SELECT * FROM artist WHERE artist_name = "New Order";

-- >, <, <=, >=, not equal ( <> or !=)
SELECT artist_name FROM artist WHERE artist_id < 5;

-- pattern matching
SELECT album_name FROM album WHERE album_name LIKE "Retro%";

-- 3 letters beginning with 'R' and match rest
SELECT * FROM track WHERE track_name LIKE "R__ %";

SELECT album_name FROM album WHERE
album_name > "C" AND album_name < "M";
```

### ORDER BY

Clause

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

Limit the total number of rows returned.

```sql
SELECT track_name FROM track LIMIT 10;

-- limit from row 6
SELECT track_name FROM track LIMIT 5,5;

or

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
