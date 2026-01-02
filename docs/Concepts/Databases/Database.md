---
title: Database
description: Database is a collection of data that is stored and organized in a way that can be easily accessed, managed and updated
---

# Database

A **database** is a collection of data that is stored and organized in a way that can be easily accessed, managed and updated. Databases are used to store and manage data for various applications, such as websites, mobile apps, and desktop software

- A _database_ is nothing more than a set of related information
- A _database management system (DBMS)_ is a software that allows users to define, create, maintain and control access to the database
  - Primary goal of a DBMS is to provide an _efficient_ and _convenient_ method for defining and managing databases

## Before Databases

## Structure vs. Unstructured Data

Data can be stored in different formats, depending on the type of data and how it is used

1. **Structured Data**: Data that is organized in a predefined manner, such as in a table with rows and columns

   _Example_: Relational databases

2. **Unstructured Data**: Data that does not have a predefined structure or organization

   _Example_: Text, images, videos, audio files

## Non-Relational Database Systems

Databases before the advent of relational databases were non-relational. They were based on the hierarchical or network model. These databases were designed to handle specific types of data and were not as flexible as relational databases

- **Hierarchical Database**: Data is organized in a tree-like structure, with parent-child relationships
  - _Single-parent_ hierarchy (one-to-many relationship)

  ```text
    Company
     /    \
    Dept1  Dept2
   /    \   |   \
  Emp1 Emp2 Emp3 Emp4
  ```

- **Network Database**: Data is organized in a graph-like structure, with many-to-many relationships
  - Exposes sets of records and sets of links that define relationships between different records
  - _Multiple-parent_ hierarchy (many-to-many relationship)

  ```text
  Employee1
      |
      |
  Project1

  Employee2
      |
      |
  Project2
  ```

## Relational Database Systems

A [**relational database**](./RDBMS.md) is a type of database that stores and provides access to data points that are related to one another

## Data Models

A **data model** is a conceptual representation of the data structures that are required by a database

1. **Entity-Relationship Model**: A data model that describes the relationships between entities in a database
   - The entity-relationship (E-R) data model uses a collection of basic objects, called _entities_, and _relationships_ among these objects
   - An entity is a "thing" or "object" in the real world that is distinguishable from other objects

2. **Relational Model**: A data model that describes the relationships between tables in a database
   - The relational model uses a collection of tables to represent both data and the relationships among those data
   - Each table has multiple columns, and each column has a unique name
   - Tables are also known as **relations**

3. **Semi-Structured Model**: A data model that allows for the representation of data that does not fit neatly into a tabular format
   - This data model permits the specification of data where individual data items of the same type may have different attributes
   - _JSON_ and _XML_ are examples of semi-structured data formats

4. **Object-Oriented Model**: A data model that represents data as objects, similar to object-oriented programming

### Data Abstraction

**Data abstraction** is the process of hiding the complex details of data storage and retrieval operations

Different levels of data abstraction:

- **Physical Level**: Describes how data is stored in the database (e.g., data structures, file formats)
  - Lowest level of abstraction

- **Logical Level**: Describes **what** data is stored in the database and the relationships among the data
  - Describes the structure of the database
  - Independent of the physical storage of data (physical data independence)

- **View Level**: Describes **how** data is presented to the user
  - Highest level of abstraction
  - Describes only a part of the database
  - Not all users need to see all the data in the database

```text
+------------------------------------+
|            View Level              |
|                                    |
| View 1  View 2  View 3  ... View n |
|                                    |
+------------------------------------+
                 |
                 |

           Logical Level

                 |
                 |

          Physical Level
```

The database system allows application developers to store and retrieve data using the abstractions of the data model, and converts the abstract operations into operations on the low-level implementation

## Transaction

What is a Transaction?

Transaction is a sequence of operations that are executed as a single unit

- A collection of queries
- One unit of work
- E.g., Account deposit (`SELECT`, `UPDATE`, `INSERT`)

Transaction Life-cycle:

- Transaction `BEGIN`
- `COMMIT` transaction if all queries completed or `ROLLBACK` to revert back the changes
- Transaction unexpected ending = `ROLLBACK` (e.g. crash)

Nature of Transactions:

- Usually Transactions are used to change and modify data
- However, it is perfectly normal to have a read only transaction
- Example, you want to generate a report and you want to get consistent snapshot based at the time of transaction

_Example_:

Lets say you have a bank account and you want to transfer money from your account to another account. This is a transaction. You will have to do the following steps:

| ACCOUNT_ID | BALANCE |
| ---------- | ------- |
| 1          | $900    |
| 2          | $600    |

Send $100 from account 1 to account 2

```sql
BEGIN TRANSACTION

   SELECT BALANCE FROM ACCOUNT WHERE ACCOUNT_ID = 1 AND BALANCE >= 100
      UPDATE ACCOUNT SET BALANCE = BALANCE - 100 WHERE ACCOUNT_ID = 1
      UPDATE ACCOUNT SET BALANCE = BALANCE + 100 WHERE ACCOUNT_ID = 2

COMMIT TRANSACTION
```

## ACID Properties

**ACID** is a set of properties that guarantee that [database transactions](#transaction) are processed reliably

1. [Atomicity](#atomicity)
2. [Consistency](#consistency)
3. [Isolation](#isolation)
4. [Durability](#durability)

### Atomicity

**Atomicity** ensures that **all operations** within a transaction are **completed successfully**, or **none** of them are completed at all

- All queries in a **transaction must succeed**
- If one query fails, all prior successful queries in the transaction should rollback
- If the database went down prior to a commit of a transaction, all the successful queries in the transactions should rollback

_Example_:

You are sending money from your account to another account. You have initiated a transaction but the computer crashes before the transaction is completed

In this case:

- The first account has been debited but the other account has not been credited
- This is really bad as we just lost data, and the information is inconsistent
- An atomic transaction is a transaction that will rollback all queries if one or more queries failed
- The database should clean this up after restart

### Consistency

**Consistency** ensures that the database remains in a **consistent state before and after** a transaction

- The database should enforce all constraints
- The database should not allow any invalid data to be inserted
- The database should not allow any data that violates the integrity constraints

_Example_:

While transferring funds, there is a moment between the subtraction from one account and the addition to another account that the total amount of funds represented in the database is altered and may become inconsistent with a recorded total. This is acceptable, as long as the transaction, as a whole, is consistent when it is committed

### Isolation

**Isolation** ensures that the operations within a **transaction are not affected by other transactions** that are running concurrently

- Can my in-flight transaction see changes made by other transactions?
- Transactions should be isolated from each other
- Transactions should not interfere with each other
- Transactions should not see the intermediate states of other transactions

Types of Isolation Levels:

1. **Read Uncommitted**: The lowest isolation level, where transactions can see uncommitted changes made by other transactions

2. **Read Committed**: Transactions can only see committed changes made by other transactions

3. **Repeatable Read**: Transactions can see changes made by other transactions, but they cannot see changes made to the same data by other transactions

4. **Serializable**: The highest isolation level, where transactions are completely isolated from each other

#### Isolation Read phenomena

1. **Dirty Read**: A transaction reads data that has been written by another transaction but not yet committed

2. **Non-Repeatable Read**: A transaction reads the same data multiple times and gets different results because another transaction has modified the data in between the reads

3. **Phantom Read**: A transaction reads a set of rows that satisfy a certain condition, but when it tries to read the same set of rows again, it finds that the set of rows has changed because another transaction has inserted or deleted rows that satisfy the condition

4. **Lost Update**: Two transactions read the same data, and then update the data based on the value they read. When they commit, one of the updates is lost because the other transaction overwrote it

### Durability

**Durability** ensures that once a transaction has been committed, the changes made by the transaction are **permanent** and **cannot be lost**

- The database should be able to recover from any failure and restore the database to the state it was in before the failure

_Example_:

After you have transferred funds from one account to another, the transaction is committed. The database should ensure that the changes made by the transaction are permanent and irreversible even if the system crashes

## Database Management System (DBMS)

A **database management system (DBMS)** is a software system that allows users to define, create, maintain, and control access to a database

### Client-Server Architecture

In a **client-server architecture**, the database is stored on a server, and clients access the database through a network connection

3 Main Hardware Components:

- **Client**: The user interface that interacts with the database
- **Server**: The computer that hosts the database
- **Network**: The communication channel that connects the client and server

How a client-server architecture works:

1. The client sends a request to the server containing a database query or command
   - Database drivers are used to connect the client to the server

2. The server passes the request to the database management system (DBMS)
3. The DBMS processes the request and sends a response back to the server
4. The server sends the response back to the client
5. The client displays the response to the user

### DBMS Components

- **Query Processor**: Processes queries and commands
- **Database Engine**: Manages the storage and retrieval of data
- **Database Server**: Hosts the database and manages client connections
- **Database Client**: Provides a user interface to interact with the database

## Instances and Schemas

- **Instance**: A collection of data stored in the database at a particular moment in time

- **Schema**: The structure that represents the logical view of the entire database

## SQL (Structured Query Language)

**SQL** (Structured Query Language) is a standard language for interacting with relational databases and is used to perform various operations on databases

- The application software communicates with the DBMS by sending SQL queries through the data access API
- When the DBMS receives a query, it provides a service like returning the requested data (the query results) to the client

## Entity-Relationship Model

The **entity-relationship model** is a data model that describes the relationships between entities in a database using a collection of basic objects called entities and relationships among these objects

- **Entity**: A thing or object in the real world that is distinguishable from other objects
- **Relationship**: Describes how entities are related to each other

### Entity-Relationship Diagram (ERD)

An **entity-relationship diagram (ERD)** is a visual representation of the entities and relationships in a database that helps to understand the structure of the database

- **Entity**: A table in the database
- **Attribute**: A column in a table
- **Relationship**: A connection between two entities

## Database Paradigms

1. Key-value: Redis, Memcache, etc...
   - Caching
   - Pub/Sub
   - Leaderboards

2. Wide Column: Apache Cassandra, Apache HBase
   - Time-series
   - Historical Records
   - High-write, low-read

3. Document: MongoDB, Firebase Database, Amazon DynamoDB, Apache CouchDB
   - Most Apps
   - Games
   - IOT

4. RDBMS: MySQL, PostgreSQL, SQL Server, CockroachDB
   - Most Apps
   - Not ideal for unstructured data

5. Graph: Neo4j, Dgraph
   - Graphs
   - Knowledge Graphs
   - Recommendation Engines

6. Search: Apache Lucene, Elasticsearch, Apache Solr, Algolia, meilisearch
   - Search Engines
   - Typeahead

7. Multi-Model: Fauna

## References

- CODASYL (Conference/Committee on Data Systems Languages)
- Hierarchical
