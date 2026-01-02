---
title: Testing
description: Testing in software development
---

# Testing

_Tests_ describe the expected behaviour of the application

Types of Tests:

- **[Unit Testing](./Unit_Testing.md)**: Writing tests that confirm an individual function or piece of code works
- **[Functional Testing](#functional-testing)**: tests all functionality of app
- **[Integration Testing](#integration-testing)**: Testing multiple units of together
- **[End-To-End Testing (E2E)](#end-to-end-testing)**: Run app in simulated environment close to production
- **Acceptance Testing (UAT)**: test client or user's requirements
- **Regression Testing**: make sure new code does not break existing functionality
- **Sanity or smoke test**: Run few of most important test first to make sure the app is not on fire before testing rest of the test suite
- **Performance Testing**: tests that test performance characteristics
- **Load Testing**: Testing app under expected load
- **Stress or failure-over testing**: Testing app under extreme load
- **Security Testing**: Testing app for security vulnerabilities
- **Usability (UI) Testing**: Testing app for user-friendliness
- **System Testing**: Works on real hardware
- **Fuzz Testing**: Testing app with random data inputs

## Testing Methods and Approaches

Common Testing Approaches:

1. Obvious implementation
2. Fake it till you make it
3. Triangulation

Testing Methodologies:

1. [Test-Driven Development](#test-driven-development-tdd)
2. [Behaviour Driven Development](#behaviour-driven-development-bdd)
3. Acceptance Test-Driven Development:

### Test-Driven Development (TDD)

TDD is software development process relying on software requirements being converted to test cases before software is fully developed, and tracking all software development by repeatedly testing the software against all test cases. This is as opposed to software being developed first and test cases created later

- **Refactoring**: Improving the internal structure of your code without changing its external behaviour

TDD cycle (_Test-Code-Refactor_):

1. Add a test
2. Run all test. The new test _should fail_ for expected reasons
3. Write the simplest code that passes the new test
4. All tests should now pass
5. Refactor as needed, using tests after each refactor to ensure that functionality is preserved
6. Repeat

The above cycle of steps, which repeat over and over again are usually represented as:

> [!NOTE] TDD Cycle
> **Red** --> **Green** --> **Refactor** (Blue)

Advantages:

- Small test --> modular apps
- Refactor early, not late
- Allows automated testing

Disadvantages:

- Writing tests can be hard
- Initially takes more time
- Danger of constant refactoring

### Behaviour Driven Development (BDD)

BDD emerged from TDD

- In BDD, tests are written first as in TDD, but **focuses on tests which describe behaviour**, rather than tests which test a unit of implementation

- The **Given-When-Then** approach is used for writing test cases:
  - **Given** the user has entered valid login credentials
  - **When** a user clicks on the login button
  - **Then** display the successful validation message

- BDD suggests that unit test names be whole sentences starting with a conditional verb ("should" in English for example)

Benefits of BDD approach:

- Helps reach a wider audience by the usage of non-technical language

- Focuses in how the system should behave from customer's and the developer's perspective

- BDD is a cost-effective technique

BDD is very explicitly defined:

- Involves collaboration between lots of roles
  - Developers, QA, business partners, etc...

- Defines process for different groups to interact

## Integration Testing

Integration Testing involves combining individual units of code or modules and testing them as a group

- Verify that different modules or services used by your application work well together
- **Focus on interactions between modules**
- Can involve testing with external systems (databases, APIs, etc.)
- Can be done after unit testing and before functional or end-to-end testing

## Functional Testing

Functional Testing involves testing the complete functionality of an application to ensure it meets the specified requirements

- Include all relevant units, test behaviour
- Close to how users interact with software
- Robust tests
- Catch issues that unit tests might miss
- Tests can be slower than unit tests
- More difficult to debug failing tests

## End-To-End Testing

End-to-End (E2E) Testing involves testing the entire application flow from start to finish to ensure that all components work together as expected

Tools for E2E testing for web applications:

- [Playwright](https://playwright.dev/)
- [Cypress](https://www.cypress.io/)
- [Selenium](https://www.selenium.dev/)
- [Puppeteer Library](https://pptr.dev/)
