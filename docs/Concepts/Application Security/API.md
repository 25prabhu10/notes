---
title: API
description: An application programming interface is a computing interface that defines interactions between multiple software intermediaries.
---

# API Security

## Missing Object Level Access Control

- Object level access control acts as an authorization mechanism.
- Access control is generally set up at the code level to determine which objects a given user can and cannot access.

Prevention Methods

- Ensure the authorization mechanism is set up based on the application's user policies and data level access hierarchy.
- Perform checks to see whether users have access to perform the requested action for each function.
- Use difficult to predict globally unique identifiers to ID records.
- Ensure there are tests in place to evaluate the access control mechanism.

::: danger Vulnerabilities
Failure to set up object level access control can leave records or other objects open to unauthorized access or modification.
:::
