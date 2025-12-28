---
title: PostgreSQL
description: PostgreSQL is a free and open-source relational database management system
---

# PostgreSQL

[PostgreSQL](https://www.postgresql.org/) or also known as Postgres, is a free and open-source relational database management system. PostgreSQL features transactions with [**Atomicity**, **Consistency**, **Isolation**, **Durability** (_ACID_) properties](./Database.md#acid-properties) automatically updatable views, materialized views, triggers, foreign keys, and stored procedures. It is designed to handle a range of workloads, from single machines to data warehouses or web services with many concurrent users

Features:

- ACID Compliance
- SQL Compliance
- OLTP (Online Transaction Processing)
- MVCC (Multi-Version Concurrency Control)
- Extensible
- Advanced Data Types (JSON, XML, Arrays, Key-Value Pairs, Geometric types, etc.)

## Installation

PostgreSQL can be installed on various [operating systems](https://www.postgresql.org/download/) using different methods such as package managers, source code compilation, or containerization

_Example:_ Install PostgreSQL on Ubuntu/Debian

```bash
sudo apt update
sudo apt install -y postgresql postgresql-contrib postgresql-client
sudo systemctl status postgresql.service
```

- [PostgreSQL on Arch Linux](https://wiki.archlinux.org/title/PostgreSQL)

### Install/deploy Postgres on Kubernetes with Zalando Postgres Operator

Postgres can be containerized and deployed on Kubernetes clusters as well. There are several tools called _Kubernetes Operators_ which handle the deployment of Postgres clusters for you. One of it is the [Postgres Operator by Zalando](https://github.com/zalando/postgres-operator)

You can find some tutorials regarding deployment of the operator and how to work with it, in the link list below:

- [Deploy Zalando Postgres Operator on your Kubernetes cluster](https://thedatabaseme.de/2022/03/13/keep-the-elefants-in-line-deploy-zalando-operator-on-your-kubernetes-cluster/)

- [Configure Zalando Postgres Operator Backup with WAL-G](https://thedatabaseme.de/2022/03/26/backup-to-s3-configure-zalando-postgres-operator-backup-with-wal-g/)

- [Configure Zalando Postgres Operator Restore with WAL-G](https://thedatabaseme.de/2022/05/03/restore-and-clone-from-s3-configure-zalando-postgres-operator-restore-with-wal-g/)

## Connect to Postgres instance

To connect to a Postgres instance, you can use the `psql` command-line tool. By default, Postgres creates a database user called `postgres` which has superuser privileges. You can switch to the `postgres` OS user and connect to the Postgres instance by the following command:

```bash
sudo -u postgres psql
```

This will connect you to the Postgres instance and open a `psql` prompt:

```text
postgres=#
```

We can use GUI tools as well to connect to Postgres instances, e.g. [pgAdmin](https://www.pgadmin.org/), [DBeaver](https://dbeaver.io/), [DataGrip](https://www.jetbrains.com/datagrip/), [beekeeper-studio](https://github.com/beekeeper-studio/beekeeper-studio) etc

## User configuration and authentication

The password for the `postgres` database user can be set the quick command `\password` or by `alter user postgres password 'SuperSecretPassword'`. A connection using the `postgres` user is still not possible from the "outside" hence to the default settings in the `pg_hba.conf`

Update `pg_hba.conf` to allow postgres user connections with password

- In order to allow connections of the `postgres` database user not using OS user authentication, you have to update the `pg_hba.conf` which can be found under `/var/lib/postgres/data/pg_hba.conf`

```bash
sudo vi /etc/postgresql/version/main/pg_hba.conf

..
local   all             postgres                                peer
..
```

Change the last section of the above line to `md5`:

```bash
local   all             postgres                                md5
```

A restart is required in order to apply the new configuration:

```bash
sudo systemctl restart postgresql
```

Now a connection from outside the database host is possible e.g

```bash
psql -U postgres -d postgres -h databasehostname
```

### User creation

A database user can be created by the following command:

```sql
CREATE USER myuser WITH encrypted password 'Supersecret';

postgres=# \du
                                   List of roles
 Role name |                         Attributes                         | Member of
-----------+------------------------------------------------------------+-----------
 myuser    |                                                            | {}
 postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
```

- Or use `createuser` command from the shell:

```bash
createuser --interactive myuser
```

## Create a new database

One can create new Postgres databases within an instance. Therefore you can use the `psql` command to login (see above)

```sql
CREATE DATABASE dbname OWNER myuser;

postgres=# \l
                                  List of databases
   Name    |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges
-----------+----------+----------+-------------+-------------+-----------------------
 dbname    | myuser   | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 postgres  | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 template0 | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
           |          |          |             |             | postgres=CTc/postgres
 template1 | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
           |          |          |             |             | postgres=CTc/postgres
```

You can omit the `OWNER` section of the command, when doing so, the current user will become owner of the newly created database

To change the owner of an existing database later, you can use the following command:

```sql
postgres=# alter database dbname owner to myuser;
```

## Tables

Tables are the basic building blocks of a PostgreSQL database. They are used to store data in a structured format. PostgreSQL supports several types of tables, including:

1. Regular tables
2. Temporary tables
3. UNLOGGED tables

Show summary information about all tables in the current database:

```text
\dt
```

```sql
-- regular tables
SELECT table_schema,
       table_name,
       table_type
FROM information_schema.tables
WHERE table_type = 'BASE TABLE'
  AND table_schema NOT IN ('pg_catalog', 'information_schema');

-- size of a table
SELECT pg_size_pretty(pg_total_relation_size('your_table_name')) AS total_size;
```

PostgreSQL stores table data in a row-oriented format by default. However, it also supports columnar storage through extensions like `cstore_fdw` and `timescaledb`

- Pages are the basic unit of data storage in PostgreSQL. Each page is typically 8KB in size and contains multiple rows of data
- Indexes are stored separately from the table data using b-trees, hash indexes, GIN, GiST, and other index types

PostgreSQL also supports table inheritance, which allows you to create a new table that inherits the structure and data of an existing table

```sql
CREATE TABLE parent_table (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);
CREATE TABLE child_table (
    age INT
) INHERITS (parent_table);
```

PostgreSQL also supports partitioned tables, which allow you to divide a large table into smaller, more manageable pieces called partitions

```sql
CREATE TABLE measurement (
    logdate DATE NOT NULL,
    peaktemp INT,
    unitsales INT
) PARTITION BY RANGE (logdate);
CREATE TABLE measurement_y2020 PARTITION OF measurement
    FOR VALUES FROM ('2020-01-01') TO ('2021-01-01');
CREATE TABLE measurement_y2021 PARTITION OF measurement
    FOR VALUES FROM ('2021-01-01') TO ('2022-01-01');
```

### UNLOGGED tables

`UNLOGGED` tables are not written to the WAL (Write-Ahead Log) and are not replicated to the standby servers. They are faster than regular tables because they do not have to be written to the WAL. They are useful for temporary tables that do not need to be replicated

- It can be used as a in-memory table for temporary data like a cache

```sql
CREATE UNLOGGED TABLE cache_table (
    key TEXT PRIMARY KEY,
    value TEXT,
    expires_at TIMESTAMP NOT NULL WITH TIME ZONE
);

INSERT INTO cache_table (key, value, expires_at)
VALUES ('session_123', 'user_data', NOW() + INTERVAL '1 hour');

SELECT * FROM cache_table
WHERE key = 'session_123' AND expires_at > NOW();
```

To use `UNLOGGED` tables, you need to have the `unlogged_table` parameter set to `on` in the `postgresql.conf` file

```text
unlogged_table = on
```

- Set `shared_buffers` to at least 25% of RAM
- Use _auto vacuum_ to clean up dead tuples
- Also, you can create cron jobs to clean up the table

```sql
SELECT cron.schedule(
  'clean_cache_table',
  '0 0 * * *',
  $$DELETE FROM cache_table WHERE expires_at <= NOW();$$
);
```

## Data Types

PostgreSQL supports a wide range of data types. The following list shows some of the most common data types:

- `integer`

### Text

#### Search Vector

```sql
CREATE TABLE blogs (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    search_vector TSVECTOR
);

CREATE INDEX search_vector_idx ON blogs USING GIN(search_vectorarch);

INSERT INTO blogs (title, content) VALUES
('Postgres Full-Text Search', 'Postgres is a powerful open-source database.'),
('Postgres JSONB', 'Postgres supports JSONB data type.');

SELECT title,
       ts_rank(search_vector, plainto_tsquery('open-source')) AS rank
FROM blogs,
     to_tsquery('english', 'open-source') AS query
WHERE search_vector @@ query
ORDER BY rank DESC;
```

### JSON

PostgreSQL supports JSON data type. JSON is stored as binary JSON (JSONB) which is a decomposed binary format

The following example shows how to create a table with a JSON column:

```sql
CREATE TABLE json_table (
    id serial PRIMARY KEY,
    data json NOT NULL
);
```

```sql
-- create a table with a JSONB column
CREATE TABLE horses (
    id serial PRIMARY KEY,
    name TEXT,
    attributes JSONB
);

-- insert a JSON object
INSERT INTO horses (name, attributes)
VALUES ('Horse1', '{"color": "brown", "age": 5, "weight": 500}');

-- query the JSON object
SELECT * FROM horses
WHERE attributes->>'color' = 'brown';
```

## Indexes

```sql
CREATE INDEX idx_column_name ON your_table_name (column_name);

-- partial index
CREATE INDEX idx_active_users ON your_table_name (user_id) WHERE active = true;

-- use hash index
CREATE INDEX idx_column_name_hash ON your_table_name USING HASH (column_name);
-- use GIN index for JSONB column
CREATE INDEX idx_jsonb_column ON your_table_name USING GIN (jsonb_column);
-- full-text search index
CREATE INDEX idx_fulltext ON your_table_name USING GIN (to_tsvector('english', text_column));
-- use GiST index for geometric data types
CREATE INDEX idx_geom_column ON your_table_name USING GiST (geom_column);
```

| Index Type | Description                                                | Use Case                                          |
| ---------- | ---------------------------------------------------------- | ------------------------------------------------- |
| B-tree     | Default index type, supports equality and range queries    | General-purpose indexing                          |
| Hash       | Supports equality queries only                             | When only equality comparisons are needed         |
| GIN        | Supports full-text search and array indexing               | Full-text search, JSONB indexing                  |
| GiST       | Supports geometric data types and full-text search         | Geometric data, full-text search                  |
| SP-GiST    | Supports partitioned data structures                       | Spatial data, hierarchical data                   |
| BRIN       | Block Range INdexes for large tables with natural ordering | Very large tables where data is naturally ordered |

```sql
-- show index sizes of a table
SELECT pg_stat_user_indexes.indexrelname, pg_size_pretty(pg_relation_size(indexrelid)) AS index_size FROM pg_stat_user_indexes join pg_index using (indexrelid) WHERE relname = 'your_table_name';

-- query index usage statistics
SELECT indexrelname, idx_scan, idx_tup_read, idx_tup_fetch
FROM pg_stat_user_indexes
WHERE relname = 'your_table_name';

-- list all indexes on a table
SELECT i.indexname, i.tablename, c.relname AS index_relname, am.amname AS index_type
FROM pg_indexes i
JOIN pg_class c ON c.relname = i.indexname
JOIN pg_index pi ON pi.indexrelid = c.oid
JOIN pg_am am ON am.oid = c.relam
WHERE i.tablename = 'your_table_name';
```

## Architecture

PostgreSQL follows a client-server architecture. The main components of PostgreSQL architecture are:

1. **Postmaster**: The main server process that manages database connections and starts other processes
2. **Background Processes**: Various processes that handle tasks like writing to disk, cleaning up dead tuples, and managing replication. One process per active connection: `postgres` process
   - **Background Writer Process**: Writes dirty pages from shared memory to disk
   - **Autovacuum Process**: Cleans up dead tuples and updates statistics
   - **WAL Writer Process**: Writes WAL records to disk
   - **Checkpointer Process**: Periodically writes all dirty pages to disk to ensure data durability
   - **Archiver Process**: Archives completed WAL segments for backup and recovery

3. **Shared Memory**: A memory area that is shared among all PostgreSQL processes for caching data and coordinating access to the database
   - **Shared Buffers**: A portion of shared memory used to cache data pages
   - **WAL Buffers**: A portion of shared memory used to cache WAL records

4. **WAL (Write-Ahead Log)**: A log that records all changes made to the database for durability and crash recovery

5. **Disk Storage**: The physical storage where database files, tables, indexes, and WAL files are stored
   - **Data Clusters**: A collection of databases managed by a single PostgreSQL server instance
   - **Data Files**: Store the actual data for tables and indexes
   - **WAL Files**: Store the write-ahead log records

### Data Storage

PostgreSQL stores data in a structured format using tables, which are organized into databases. Each database is stored in a separate directory on disk. The data for each table is stored in one or more files, depending on the size of the table

- A table is made up of multiple pages, and each page contains multiple rows of data
- PostgreSQL uses a heap storage model, where rows are stored in no particular order. This allows for efficient insertion and deletion of rows
- A heap is a collection of a fixed size pages, where each page is typically `8KB` in size
- Each row has a unique identifier called a TID (Tuple Identifier) that is used to locate the row on disk
- Indexes are stored separately from the table data, allowing for efficient querying and retrieval of data

#### TOAST - The Oversized-Attribute Storage Technique

PostgreSQL uses TOAST to handle large data types that exceed the size of a single page (8KB by default). TOAST automatically compresses and stores large values in a separate table, allowing for efficient storage and retrieval of large data types

- When a large value is inserted into a table, PostgreSQL checks if the value exceeds the page size
- If the value exceeds the page size, PostgreSQL compresses the value and stores it in a separate TOAST table
- The original table stores a reference to the TOAST table, allowing for efficient retrieval of the large value when needed

By default, `pglz` compression is used for TOASTed values, but other compression methods can be configured as well, e.g., `lz4`, `zstd`

### Query Processing

Steps in query processing:

1. **Client Connection**: A client connects to the PostgreSQL server using a client library (e.g., libpq)
2. **Query Parsing**: The server parses the SQL query to check for syntax errors
3. **Query Planning**: The server generates a query plan based on the parsed query and the database schema
4. **Query Execution**: The server executes the query plan and retrieves the requested data
5. **Result Return**: The server sends the query results back to the client

### Transactions

PostgreSQL supports transactions, which allow multiple SQL statements to be executed as a single unit of work. Transactions ensure that either all statements are executed successfully, or none of them are executed at all

- Transactions are started with the `BEGIN` command and ended with either `COMMIT` or `ROLLBACK`

```sql
BEGIN;
UPDATE accounts SET balance = balance - 100 WHERE account_id = 1;
UPDATE accounts SET balance = balance + 100 WHERE account_id = 2;
COMMIT;
```

### Multi-Version Concurrency Control (MVCC)

PostgreSQL uses MVCC to handle concurrent access to the database. MVCC allows multiple transactions to access the same data simultaneously without blocking each other

- Each transaction sees a snapshot of the database at the time it started
- When a transaction modifies data, it creates a new version of the data rather than overwriting the existing data
- Other transactions continue to see the old version of the data until they commit

## `plpgsql` - Procedural Language

`plpgsql` is a procedural language for PostgreSQL that allows you to write functions and stored procedures using SQL and control structures like loops and conditionals. It is similar to other procedural languages like PL/SQL in Oracle and T-SQL in SQL Server

```sql
CREATE OR REPLACE FUNCTION calculate_discount(price NUMERIC, discount_rate NUMERIC)
RETURNS NUMERIC AS $$
BEGIN
    RETURN price - (price * discount_rate / 100);
END;
$$ LANGUAGE plpgsql;
```

## Backup and Restore

There are near to endless combinations in tools and parameters to backup postgres databases. Below you can find some examples using the Postgres built-in tools `pgdump`, `pg_basebackup` and `pg_restore`

### `pg_dump`/`pg_dumpall`

Using `pg_dump` or `pg_dumpall` enables you to extract / export a PostgreSQL database(s) into a (SQL) script file or a custom archive file

#### `pg_dump`

The following command creates a custom archive file from a database specified with `-d`. Using the `--create` option will include the SQL commands in the dump script that will create the database before importing it later. The `-Z 9` option in this example compresses the SQL script created with the highest available compression rate (`0-9`)

```bash
pg_dump -h vmdocker -U awx -d awx --create -f -Z 9 /tmp/awx_dump.sql.gz
```

The following command creates a custom archive file from a database specified with `-d`. To export data in custom format, you have to specify so with the `-F c` option. Custom file dumps have the benefit, that they are compressed by default

```bash
pg_dump -h <pg_host> -U <username> -d <database> -F c -f /pg_dump/dumpfile.dmp
```

Custom format files can only be restored by `pg_restore` (see below). A SQL dump can be restored by using `psql`

```bash
psql -d newdb -f db.sql
```

- [`pg_dump` guide](https://www.postgresql.org/docs/current/app-pgdump.html)

#### `pg-dumpall`

A full dump of all databases of a Postgres instance can be done by `pg_dumpall`. It will include also user creation information

A difference to `pg_dump`, you cannot choose for different output formats. `pg_dumpall` will always create a SQL script as output. Therefore, you don't need `pg_restore` for restoring a "full" dump. Only `psql` is needed (see below)

```bash
pg_dumpall -h <pg_host> -U postgres > database.out
```

If you use password authentication it will ask for a password each time. It is convenient to have a `~/.pgpass` file or `PGPASSWORD` environment variable set

So importing a full dump is really easy by the following `psql` command:

```bash
psql -h <pg_host> -f databaseb.out -U postgres
```

- [`pg_dumpall` guide](https://www.postgresql.org/docs/current/app-pg-dumpall.html)

### `pg-restore`

`pg_restore` can be used to restore custom file dumps created by `pg_dump`

The following command will create the database (which has been dumped before)

```bash
pg_restore -h <pg_host> -U <pg_user> -d postgres --create -F c /tmp/db.dmp -v
```

- [`pg_restore` guide](https://www.postgresql.org/docs/current/app-pgrestore.html)

## Extensions

### `pg_mooncake`

`pg_mooncake` is a PostgreSQL extension that provides a set of functions for working with mooncake data types. It allows you to store and query mooncake data efficiently

- A simple time-series data type

### `pgcrypto`

`pgcrypto` is a PostgreSQL extension that provides cryptographic functions. It allows you to encrypt data, generate hashes, and perform other cryptographic operations

```sql
CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE EXTENSION IF NOT EXISTS pgjwt;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  password TEXT NOT NULL,
  name VARCHAR(255),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (email, password, name)
VALUES (
  'abc@m.com',
  crypt('password', gen_salt('bf', 10)),
  'Alice'
);

SELECT id, email, name
FROM users
WHERE email = 'abc@m.com' AND password = crypt('password', password);


CREATE TABLE jwt_tokens (
  id SERIAL PRIMARY KEY,
  kid VARCHAR(255) NOT NULL UNIQUE,
  key TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

SELECT
    sign(
        '{ "sub": "123", "name": "Alice", "iat": 1630000000 }',
        'secret_key',
  );

SELECT * FROM
    verify('someToken', 'secret_key');


ALTER TABLE documents ENABLE ROW LEVEL SECURITY;

CREATE POLICY user_documents_policy
ON documents
FOR SELECT USING (user_id = current_setting('jwt.claims.sub', true));

SELECT set_config('jwt.claims.sub', '123', true);

SELECT * FROM blogs;
```

### `pg_cron`

`pg_cron` is a simple cron-based job scheduler for PostgreSQL (9.5 or higher) that runs inside the database as an extension. It uses the same syntax as regular cron, but it allows you to schedule PostgreSQL commands directly from the database

```sql
CREATE EXTENSION IF NOT EXISTS pg_cron;

SELECT cron.schedule(
  'daily_vacuum', -- name of the job
  '0 3 * * *', -- cron schedule
  $$VACUUM ANALYZE;$$ -- SQL command
);

SELECT * FROM cron.job;
```

### `pgvector`

`pgvector` is a PostgreSQL extension that provides vector similarity search and indexing. It allows you to store and query high-dimensional vectors efficiently

- Use case: recommendation systems, image search, natural language processing

```sql
CREATE EXTENSION IF NOT EXISTS vector;

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    embedding vector(768)
);

INSERT INTO products (name, embedding)
VALUES ('product1', '[0.01, 0.23, -0.47, ...]');

SELECT * FROM products
ORDER BY embedding <-> '[0.1, 0.2, -0.5, ...]'; -- find similar vectors
```

### `pgai`

`pgai` is a PostgreSQL extension that provides machine learning and artificial intelligence capabilities. It allows you to train and deploy machine learning models directly in the database

- Use case: predictive analytics, fraud detection, recommendation systems

```sql
CREATE EXTENSION IF NOT EXISTS ai CASCADE;

SELECT ai.load_dataset(
    'wikimedia/wikipedia',
    '20231101.en',
    table_name=>'wiki',
    batch_size=>5,
    max_batches=>1,
    if_table_exists=>'append'
);

SELECT ai.create_vetorizer(
    'wiki'::regclass,
    destination => 'wiki_embeddings',
    embedding => ai.embedding_ollama('all-minilm', 384),
    chunking => ai.chunking_recursive_character_text_splitter('text')
);
```

### `pg_graphql`

`pg_graphql` is a PostgreSQL extension that provides a GraphQL API for your database. It allows you to expose your database schema as a GraphQL API without writing any backend code

```sql
graphqldb= CREATE EXTENSION IF NOT EXISTS pg_graphql;
CREATE EXTENSION

graphqldb= CREATE TABLE book(id INT PRIMARY KEY, title TEXT);
CREATE TABLE

graphqldb= INSERT INTO book(id, title) VALUES (1, 'PostgreSQL');
INSERT 0 1

graphqldb= SELECT graphql.resolve($$
query {
  bookCollection {
    edges {
      node {
        id
      }
    }
  }
}
$$);
```
