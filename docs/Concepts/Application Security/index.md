---
next: ./API
---

# Table of Content

1. [API](./API)
2. [SQL Injections](./SQL%20Injections)
3. [SameOrigin vs SameSite](./SameOrigin)
4. [Content Security Policy](./CSP)

## The Five Stages of Hacking

1. [Reconnaissance](#reconnaissance) - Gathering Information
   - Passive Reconnaissance
   - Active Reconnaissance
2. Scanning and Enumeration
3. Gaining Access - Exploitation, Remote Connection Execution (RCE)
4. Maintaining Access
5. Covering Tracks

### Reconnaissance

1. Passive Reconnaissance:
   - Target Validation: WHOIS, nslookup, dnsrecon
   - Finding Subdomains: Google Fu, dig, Nmap, Sublist3r, Bluto, crt.sh, etc.
   - Fingerprinting: Nmap, Wappalyze, WhatWeb, BuiltWith, Netcat
   - Data Breaches: HaveIBeenPwned and similar lists

## Application Security

1. What is Application Security?
   - Security beyond infrastructure.
   - Integrating security tooling to DevOps a.k.a DevSecOps.
   - Determine security posture for application.
   - Understanding technical risks.
   - Providing technical recommendations.
   - Application security guidelines and standards for Group.
   - Knowledge sharing and presentations on security.
2. Why is Application Security Important?
   - PCI DSS.
   - APRA Prudential Standard CPS 234 & Practice Guide CPG 234.

### Static Code Analysis

1. What is Static Code Analysis?

   Predicting defects in code without running it.

2. How Static Code Analysis tools work?

   At the core of most popular static analysis libraries is the concept of an **Abstract Syntax Tree**, or AST for short. An AST is a representation of source code as a tree structure: each source file is a root node, and root-level constructs declared in the file are child nodes of that node. Those child nodes can each have child nodes within them.

3. Some of the Static Code Analysis are:

   - There are many Static Code Analysis for different languages.
   - As JavaScript is a dynamically typed language, we can use [ESLint](https://eslint.org/) (linter) and [Prettier](https://prettier.io/) (formatter) to catch most of the errors.
   - from Facebook is a Static type checker. It can be used along side linters and formatters to catch more bugs.
   - [TypeScript](https://www.typescriptlang.org/) extends JavaScript by adding types.
   - Checkmarx, JFROG XRAY are some of the other tools.

4. What are the other techniques to find bugs?

   - **_Code Coverage Tools_** - Code coverage provides information about whether, and optionally how often certain parts of an application have been executed. It’s commonly used to determine how thoroughly a test suite exercises a particular codebase. [JestJS](https://jestjs.io/) is testing framework for JavaScript with code coverage.
   - **_Software Composition Analysis_** - Identify Vulnerabilities In Open Source Libraries used as dependencies in the project. [RetireJS](https://github.com/RetireJS/retire.js) is one such tool for JavaScript.

::: tip
TypeScript is more popular than Flow.
:::

## References

- [OWASP API Security](https://github.com/OWASP/API-Security)
- Insecure apps for testing:
  - [Juice Shop](https://github.com/bkimminich/juice-shop)
  - [Juice Shop Splutions](https://bkimminich.gitbooks.io/pwning-owasp-juice-shop/content/appendix/solutions.html)
