---
title: MongoDB
next: ./MongoDB/MongoDB.md
sidebar: false
---

# Database Management Systems (DBMS)

1. [SQLite](./SQLite.md)
2. [MySQL](./MySQL.md)
3. PostgreSQL
4. Oracle Database
5. Microsoft SQL Server
6. [MongoDB](./MongoDB/MongoDB.md)
7. [MongoDB_Udemy](./MongoDB/MongoDB_Udemy.md)
8. [Redis](./Redis.md)

- CODASYL (Conference/Committee on Data Systems Languages)
- Hierarchical

## Relational Database Management System (RDBMS)

> A Relational Model of Data for Large Shared Data Banks - Ted Codd (1970)

- A few related tables form a relational database
- _Relational Algebra_ allows us to retrieve data efficiently

Relationships: tell you how much of the data from foreign key field can be seen in the primary key column of the table that data is related to and vice-versa

- Cardinality constraints

Types of relationships:

- One-to-many relationships: one value from a column under a table can be found many times in the column in the other table

- One-to-one

- Many to many

## Transactional

A transactional database is one in which all changes and queries appear to be **Atomic**, **Consistent**, **Isolated**, and **Durable** (ACID (atomicity, consistency, isolation, durability))

## Database Design / Data Modelling

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
| ---------------------- | ------------------- |
| Less Joins             | More Joins          |
| More Storage           | Less Storage        |
| High Data Redundancy   | Low Data Redundancy |

- Database designer: plot the entire database system on a canvas using a visualization tool

- Entity-Relationship (ER) diagram
- Relational Schema: an existing idea of how the database must be organized

  - Represents the concept database administrators must implement
  - Depict how a database is organized
  - Blueprints, or a plan for a database

  - Database Schema
    - Table name
    - Primary Key: (column name will be underlined)
    - Foreign Key: (add (FK) in after the column name)
    - Other fields

- Database Management = database design + creation + manipulation

- Database Administrator: maintenance of database

## Normalization

## Schema

## Database

Main goal: organize huge amounts of data that can be quickly retrieved

- _Entity_: the smallest unit that can contain a meaningful set of data

  - An object we want to model & store information about

- Data inside a column is known as _data value_
- Data values in a row make up a _record_ (or _row_)(horizontal entity), a _record_ is each entry that exists in a table
- _Field_ (or _column_)(vertical entity)(entity instance): a column in a table containing specific information about every record in the table

## Table

Tables are data organized in columns and rows

- An entity or database object

A column (or a set of columns) whose value exists and is **unique** for every record in a table is called a **primary key**

- Each table can have 1 and **only 1 primary key**
- **Cannot contain `NULL`** values
- Primary key may be composed of a set of columns
- Primary keys are the unique identifiers of a table
- Not all tables will have a primary key

Foreign key: identifies the relationships between tables, not the tables themselves

Unique Key: to specify that given field shouldn't have duplicate data

| Values           | Primary Key | Unique Key   |
| ---------------- | ----------- | ------------ |
| `NULL` values    | no          | yes          |
| Number of keys   | 1           | 0, 1 or more |
| Multiple columns | yes         | yes          |

## View

## Index

Index is a lookup table for specific columns

## Reference

- [drawSQL - Beautiful database diagrams](https://drawsql.app/)
