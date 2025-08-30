---
title: PostgreSQL
description: PostgreSQL is a free and open-source relational database management system
---

# PostgreSQL

PostgreSQL or also known as Postgres, is a free and open-source relational database management system. PostgreSQL features transactions with Atomicity, Consistency, Isolation, Durability (ACID) properties automatically updatable views, materialized views, triggers, foreign keys, and stored procedures. It is designed to handle a range of workloads, from single machines to data warehouses or web services with many concurrent users

Features:

- OLTP
- Performance
- MUCC
- Continuity

Advantages:

- Open Source
- Extensible
- SQL Compliance
- ACID Compliance
- Advanced Data Types (JSON, XML, Arrays, Key-Value Pairs, Geometric types, etc.)

## Installation

PostgreSQL 12 on Ubuntu 20.04 LTS:

```bash
sudo apt update
sudo apt install -y postgresql postgresql-contrib postgresql-client
sudo systemctl status postgresql.service
```

### Install/deploy Postgres on Kubernetes with Zalando Postgres Operator

Postgres is probably the database which is most common on Cloud platforms and also, running on Kubernetes environments. There are several so called "Kubernetes Operators" which handle the deployment of Postgres clusters for you. One of it is the [Postgres Operator by Zalando](https://github.com/zalando/postgres-operator)

You can find some tutorials regarding deployment of the operator and how to work with it, in the link list below:

- [Deploy Zalando Postgres Operator on your Kubernetes cluster](https://thedatabaseme.de/2022/03/13/keep-the-elefants-in-line-deploy-zalando-operator-on-your-kubernetes-cluster/)

- [Configure Zalando Postgres Operator Backup with WAL-G](https://thedatabaseme.de/2022/03/26/backup-to-s3-configure-zalando-postgres-operator-backup-with-wal-g/)

- [Configure Zalando Postgres Operator Restore with WAL-G](https://thedatabaseme.de/2022/05/03/restore-and-clone-from-s3-configure-zalando-postgres-operator-restore-with-wal-g/)

## Initial database connection

A local connection (from the database server) can be done by the following command:

```bash
sudo -u postgres psql
psql (12.12 (Ubuntu 12.12-0ubuntu0.20.04.1))
Type "help" for help.
postgres=#
```

## Set password for postgres database user

The password for the `postgres` database user can be set the the quick command `\password` or by `alter user postgres password 'Supersecret'`. A connection using the `postgres` user is still not possible from the "outside" hence to the default settings in the `pg_hba.conf`

### Update `pg_hba.conf` to allow postgres user connections with password

In order to allow connections of the `postgres` database user not using OS user
authentication, you have to update the `pg_hba.conf` which can be found under
`/etc/postgresql/12/main/pg_hba.conf`

```bash
sudo vi /etc/postgresql/12/main/pg_hba.conf

...
local   all             postgres                                peer
...
```

Change the last section of the above line to `md5`:

```bash
local   all             postgres                                md5
```

A restart is required in order to apply the new configuration:

```bash
sudo systemctl restart postgresql
```

Now a connection from outside the database host is possible e.g.

```bash
psql -U postgres -d postgres -h databasehostname
```

## Creation of additional database users

A database user can be created by the following command:

```sql
CREATE USER myuser WITH encrypted password 'Supersecret';
CREATE ROLE
postgres=# \du
                                   List of roles
 Role name |                         Attributes                         | Member of
-----------+------------------------------------------------------------+-----------
 myuser    |                                                            | {}
 postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
```

## Creation of additional databases

One can create new Postgres databases within an instance. Therefore you can use the `psql` command to login (see above).

```sql
CREATE DATABASE dbname OWNER myuser;
CREATE DATABASE
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

You can leave the `OWNER` section of the command, when doing so, the current user will become owner of the newly created database.

To change the owner of an existing database later, you can use the following command:

```sql
postgres=# alter database dbname owner to myuser;
ALTER DATABASE
```

## Backup and Restore

There are near to endless combinations in tools and parameters to backup postgres databases. Below you can find some examples using the Postgres built-in tools `pgdump`, `pg_basebackup` and `pg_restore`.

### pg_dump / pg_dumpall

Using `pg_dump` or `pg_dumpall` enables you to extract / export a PostgreSQL database(s) into a (SQL) script file or a custom archive file.

#### pg_dump

The following command creates a custom archive file from a database specified with `-d`. Using the `--create` option will include the SQL commands in the dump script that will create the database before importing it later. The `-Z 9` option in this example compresses the SQL script created with the highest available compression rate (`0-9`).

```bash
pg_dump -h vmdocker -U awx -d awx --create -f -Z 9 /tmp/awx_dump.sql.gz
```

The following command creates a custom archive file from a database specified with `-d`. To export data in custom format, you have to specify so with the `-F c` option. Custom file dumps have the benefit, that they are compressed by default.

```bash
pg_dump -h <pg_host> -U <username> -d <database> -F c -f /pg_dump/dumpfile.dmp
```

Custom format files can only be restored by `pg_restore` (see below). A SQL dump can be restored by using `psql`.

```bash
psql -d newdb -f db.sql
```

A complete guide of `pg_dump` from the official documentation can be found [here](https://www.postgresql.org/docs/current/app-pgdump.html).

#### pg-dumpall

A full dump of all databases of a Postgres instance can be done by `pg_dumpall`. It will include also user creation information.

A difference to `pg_dump`, you cannot choose for different output formats. `pg_dumpall` will always create a SQL script as output. Therefore, you don't need `pg_restore` for restoring a "full" dump. Only `psql` is needed (see below).

```bash
pg_dumpall -h <pg_host> -U postgres > database.out
```

If you use password authentication it will ask for a password each time. It is convenient to have a `~/.pgpass` file or `PGPASSWORD` environment variable set.

So importing a full dump is really easy by the following `psql` command:

```bash
psql -h <pg_host> -f databaseb.out -U postgres
```

A complete guide of `pg_dumpall` from the official documentation can be found [here](https://www.postgresql.org/docs/current/app-pg-dumpall.html).

### pg-restore

`pg_restore` can be used to restore custom file dumps created by `pg_dump`.

The following command will create the datbase (which has been dumped before).

```bash
pg_restore -h <pg_host> -U <pg_user> -d postgres --create -F c /tmp/db.dmp -v
```

A complete guide of `pg_restore` from the official documentation can be found [here](https://www.postgresql.org/docs/current/app-pgrestore.html)

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

CREATE INDEX search_vector_idx ON blogs USING GIN(search_vector);

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

## Tables

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

`pg_cron` is a simple cron-based job scheduler for PostgreSQL (9.5 or higher) that runs inside the database as an extension. It uses the same syntax as regular cron, but it allows you to schedule PostgreSQL commands directly from the database.

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

`pgvector` is a PostgreSQL extension that provides vector similarity search and indexing. It allows you to store and query high-dimensional vectors efficiently.

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

`pgai` is a PostgreSQL extension that provides machine learning and artificial intelligence capabilities. It allows you to train and deploy machine learning models directly in the database.

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
