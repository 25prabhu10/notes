# Testing

Tests: Describe the expected behaviour of the application.

[Unit Testing](#unit-testing): Writing tests that confirm an individual function or piece of code works.

Integration Testing: Testing multiple units of together

End-To-End Testing: Run app in simulated environment. Cypress testing library.

Acceptance Testing: test client or user's requirements.

Regression Testing:

System Testing: Works on real hardware.

Sanity or smoke test: Run few of most important test first to make sure the app is not on fire before testing rest of the test suite.

Functional Testing: tests that test actual code.

Performance Testing:

Usability Testing:

Security Testing:

Stress or failure-over testing: Testing the infrastructure capabilities.

### Testing Methods and Approaches

Common Testing Approaches:

1. Obvious implementation
2. Fake it till you make it
3. Triangulation

Testing Methodologies:

1. [Test-Driven Development](#test-driven-development):
2. [Behaviour Driven Development](#behaviour-driven-development):
3. [Acceptance Test-Driven Development](#acceptance-test-driven-development):

### Test-Driven Development (TDD)

**Red** > **Green** > **Refactor** (Blue)

TDD cycle:

1. Add a test
2. Run all test. The new test _should fail_ for expected reasons
3. Write the simplest code that passes the new test
4. All tests should now pass
5. Refactor as needed, using tests after each refactor to ensure that functionality is preserved
6. Repeat

Test Structure:

1. **Setup**: Put the Unit Under Test (UUT) or the overall test system in the state needed to run the test.

2. **Execution**: Trigger/drive the UUT to perform the target behavior and capture all output, such as return values and output parameters. This step is usually very simple.

3. **Validation**: Ensure the results of the test are correct. These results may include explicit outputs captured during execution or state changes in the UUT.

4. **Cleanup**: Restore UUT or the overall test system to the pre-test state. This restoration permits another test to execute immediately after this one. In some cases in order to preserve the information for possible test failure analysis the cleanup should be starting the test just before the test's setup run.

### Behaviour Driven Development (BDD)

BDD is emerged from TDD.

- In BDD, tests are written first as in TDD, but focuses on tests which describe behaviour, rather than tests which test a unit of implementation.
- The **Given-When-Then** approach is used for writing test cases:

  - **Given** the user has entered valid login credentials
  - **When** a user clicks on the login button
  - **Then** display the successful validation message

- BDD suggests that unit test names be whole sentences starting with a conditional verb ("should" in English for example)

Benefits of BDD approach:

- Helps reach a wider audience by the usage of non-technical language
- Focuses in how the system should behave from customer's and the developer's perspective
- BDD is a cost-effective technique

## Tools

1. Test Runners:

   - Code becomes DRY
   - Test results
   - Predictable
   - CI Integration
   - Auto Run

## Unit Testing

Unit test: Test(s) written for testing a _unit_ of code. Verify that a **know, fixed input produces a known, fixed output**

- One _unit test_ runs independently of any other unit test
- Tests can (and do) run in any order
- Tests can (and do) run in parallel in multiple threads
- _External dependencies_ are managed with _Test Doubles_ (**Mocks/Stubs/Fakes**)
- A single unit test should run in a second or less
- Unit test usually are partitioned into: **Arrange** - **Act** - **Assert**

Test Doubles: A Test Double is an object that can stand-in for a real object in a test. Used instead of External Dependencies.

- DB, Web, API, Library, Network etc
- If tests fail then it must due the unit of code that is being tested not due to its dependencies
- Easy to simulate various scenarios

Types of Test Doubles:

1. **Dummy**: A dummy is the simplest form of a test double. It facilitates linker time substitution by providing a default return value where required.

   - It is used as a placeholder when an argument needs to be filled in.
   - Objects that the SUT (System Under Test) depends but they are never used.
   - Not relevant to the test scope.

2. **Stub**: Generates predefined outputs. It provides fake data to the SUT.

   - Programmed Stub to return a Success, Failure or Exception
   - A stub adds simplistic logic to a dummy, providing different outputs.

3. **Spy**: It records information about how the class is being used.

4. **Mock**: Mocks replace external interface

   - They have the same signature of the function
   - We can check if the function is being called or not
   - How many times is the function being called?
   - What Parameters are passed when it is called?
   - It defines an expectation of how it will be used. It will cause a failure if the expectation isn't met.
   - **Right call, Right Number of times with Right set of Parameter and in the Right order**

5. **Fake**: Almost working implementation. It is an actual implementation of the contract but is unsuitable for production.

   - Connect to a local HTTP server
   - Instead of actually going to the internet it connects to a local (limited) implementation
   - Check the behaviour with respect to the actual data it receives from the server

Suite: A specific group of related tests.

> [Effective Unit Testing by Eliotte Rusty Harold](https://www.youtube.com/watch?v=fr1E9aVnBxw)

## JavaScript Testing

### Mocha

Mocha is a test framework for Node.js programs, featuring:

- Browser support
- Asynchronous testing
- Test coverage reports
- Use of any assertion library
- Really good for Node.js projects

```javascript
var expect = require("chai").expect;

// TEST SUITE
describe("Mocha", function () {
  // TEST SPEC (UNIT TEST)
  it("should run our tests using Mocha", function () {
    expect(true).to.be.ok;
  });
});
```

- No Test double library included (use Sinon)
- No assertions library included (use [Chai](#chai))

`Check mocha's execution context being reset after each test case execution?`

### Chai

An expectation or assertion library.

`expect` is used to run BDD style test cases.

```javascript
var expect = require("chai").expect;

expect(true).to.be.true;
```

The above code will not provide any output if the expectation is met.

### Jest

Jest is a JavaScript unit testing framework, used by Facebook to test services and React applications.

- Jest is ready to use. It has an assertion library and mocking library.
- Jest looks for filenames ending with `.test.js`.
