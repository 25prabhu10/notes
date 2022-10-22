---
title: Authentication
description: Different Authentication mechanisms
---

# Authentication

Incorrectly build authentication and session management scheme that allows an attacker to impersonate another user

## Impact

Attacker can take identity of victim

## Mitigation

- **Don't develop your own authentication schemes**
- Use open source frameworks that are actively maintained by the community
- Use strong passwords (upper, lower, number, special characters)
- Require current credential when sensitive information is required or changed
- Multi-factor authentication (sms, password, fingerprint, iris scan, etc.)
- Log-out or expire session after X amount of time
- Be careful with 'remember me' functionality

## Passwords

Always hash passwords before saving to Database

**Never use MD5** for password storage

Password Entropy matters (amount of information held in the password)

- It can easily be brute forced if its 8 or less chars.
- Is it dictionary attackable
- min 16

PBKDF2

## Hashing

Used to:

- Used as signatures

Hashing algorithms must be:

- Reasonable fast (not too quick)
- Change in 1 bit at any place should change the whole hash (called the avalanche effect)
- Should avoid has collisions (the pigeon hole principal)

Salting must be used:

- Salts must be long strings
- Salts must be unique to each user

## References

- [Root cause analysis of session management and broken authentication vulnerabilities](https://ieeexplore.ieee.org/abstract/document/6280203)
- [xkcd: Password Strength](https://xkcd.com/936/)
- [xkcd: Password Reuse](https://xkcd.com/792/)

### Cracking Passwords

- [hashcat](https://hashcat.net/hashcat/):

## Authorization

### Least Privileges

These vulnerabilities are exposed when application privileges are loosely assigned

- This can allow users or processes more privilege than they actually require to complete their function
- "Least Privilege" is a general rule that says all user, application and system functions should run with the least amount of privileges possible to complete their role

The "Least Privilege" concept will not stop application security weaknesses, like code injections, for example. However, it will make it much harder for an attacker to further exploit those weaknesses

- Deny by default; allow on a case-by-case basis

### Insecure Direct Object Reference

This vulnerability allows an attacker to bypass authorization checks in order to gain access to protected resources

- A direct object reference occurs when a reference to an internal object (e.g. file, DB key ...) is exposed through a link or parameter value. If no authorization check is in place, attackers can manipulate these to access unauthorized data

The impact of an attack depends on the parameter:

- _Example:_ If the attacker is able to access another user's password, if he's able to access another user's shopping basket he could buy products in that user's name.
- This attack can also be used to access files from the system

Prevention:

- Prevent attackers from directly targeting unauthorized resources by using per user or per session indirect references instead, implement access control checks to make sure the user is authorized for the requested information
- Never rely on user-defined inputs parameters (GET/POST parameters, cookies, HTTP headers, etc) to authorize access to sensitive resources.
- Always rely on server-side session information. Use mapping values to access objects
- Use centralized authorization routines. No two separate pieces of code should verify if an account belongs to a certain user

### Missing Functional level access control

Missing functional level access control occurs when users can perform functions they have not been authorised for when resources can be accessed by an authorised user s

- functional level access control is missing when access checks have not been implemented or when a protection mechanism exists but is not properly configured

- an attacker could fauj request in order to access functionality without proper authorisation. an attacker could gain access to the administrative panel of your application. and employee from the sales department could view information from the financial department.

Prevention:

- protect all business functions using a role based authorisation mechanism, server side. authorisation should be implemented using centralised authorisation routing. deny access by default

- all business functions should be authorised
- implement authorisation using a role based mechanism
- you centralised authorisation proteins. easy-to-use external module
- deny access by default
- perform access control server side
