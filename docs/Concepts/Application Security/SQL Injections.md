---
title: SQL Injection
description: It is a web security vulnerability that allows an attacker to interfere with the SQL queries.
---

# SQL Injection

SQL injection occur when an attacker is able to inject SQL queries via the input data of an application.

A successful attack allows an attacker to access and manipulate the backend database.

## GET Request

## POST Request

Vulnerable Node.JS code:

```javascript
function authenticate(req, res, next){
  const username = req.query.username,
        password = req.query.password
  let sqlRequest = new sql.Request(),
      sqlQuery = "select * from users where (username= '" + username + "' and password ='" + password + "')"
  sqlRequest.query(sqlQuery).then(function(recordset){
    if(recordset.length == 1){
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
        .then(function (recordset) {
          if (recordset.length == 1) {
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

## References

1. [SQL Injection Cheat Sheet](https://www.netsparker.com/blog/web-security/sql-injection-cheat-sheet/)
2. [OWASP - SQL Injection](https://owasp.org/www-community/attacks/SQL_Injection)
