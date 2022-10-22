---
title: Application Security
next: ./Web_Security.md
sidebar: false
---

# Table of Content

1. [Web Security](./Web_Security.md)
2. [API](./API.md)
3. [Cross-site scripting (XSS)](./Cross_Site_Scripting.md)
4. [SQL Injections](./Code_Injection.md#sql-injection)
5. [Content Security Policy](./Content_Security_Policy.md)
6. [Same-Origin Policy](./SameOrigin_Policy.md)
7. [XPATH Injection]

- Typosquatting

## XPATH Injection

## Static Analysis Security Testing (SAST)

Static Code Analysis

1. What is Static Code Analysis?

   - Predicting defects in code without running it.

2. How Static Code Analysis tools work?

   - At the core of most popular static analysis libraries is the concept of an **Abstract Syntax Tree**, or AST for short. An AST is a representation of source code as a tree structure: each source file is a root node, and root-level constructs declared in the file are child nodes of that node. Those child nodes can each have child nodes within them.

3. Some of the Static Code Analysis are:

   - There are many Static Code Analysis for different languages.
   - As JavaScript is a dynamically typed language, we can use [ESLint](https://eslint.org/) (linter) and [Prettier](https://prettier.io/) (formatter) to catch most of the errors.
   - from Facebook is a Static type checker. It can be used along side linters and formatters to catch more bugs.
   - [TypeScript](https://www.typescriptlang.org/) extends JavaScript by adding types.
   - `Checkmarx`, `JFROG XRAY` are some of the other tools.

4. What are the other techniques to find bugs?

   - **_Code Coverage Tools_** - Code coverage provides information about whether, and optionally how often certain parts of an application have been executed. It's commonly used to determine how thoroughly a test suite exercises a particular codebase. [JestJS](https://jestjs.io/) is testing framework for JavaScript with code coverage.
   - **_Software Composition Analysis_** - Identify Vulnerabilities In Open Source Libraries used as dependencies in the project. [RetireJS](https://github.com/RetireJS/retire.js) is one such tool for JavaScript.

## Software Composition Analysis (SCA)

- Artifactory X-ray
- SonarCube
- Snyk

## References

- [Different Vulnerability Payloads](https://github.com/swisskyrepo/PayloadsAllTheThings)
- [OWASP API Security](https://github.com/OWASP/API-Security)
- [CheatSheet](https://cheatsheetseries.owasp.org/)
- [Stanford - CS 253 Web Security](https://web.stanford.edu/class/cs253/)
- Insecure apps for testing:

  - [Juice Shop](https://github.com/bkimminich/juice-shop)
  - [WebGoat](https://github.com/WebGoat/WebGoat): A Java based deliberately insecure application and companion app **WebWolf**
