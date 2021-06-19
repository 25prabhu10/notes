# JavaScript Testing

Tests: Describe the expected behaviour of the application.

Unit Testing: Writing tests that confirm an individual function or piece of code works.

Integration Testing: Testing multiple units of together

End-To-End Testing: Run app in simulated environment. Cypress testing library.

Acceptance Testing: test client or user's requirements.

System Testing: Works on real hardware.

Sanity or smoke test: Run few of most important test first to make sure the app is not on fire before testing rest of the test suite.

Functional Testing: tests that test actual code.

Performance Testing:

Usability Testing:

Security Testing:

Stress or failure-over testing: Testing the infrastructure capabilities.

## Behaviour Driven Development (BDD)

BDD is like creating a plan before you write your program.

**Red** > **Green** > **Refactor**:

- Write the tests, even though they'll fail.
- Write the easiest code we can that passes that tests.
- Go back and improve the passing code.
- Repeat.

## Mocha

Really good for Node js projects.
Suite: A specific group of related tests.

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

Sanity check

## Chai

An expectation library.

`expect` is used to run BDD style test cases.

```javascript
var expect = require("chai").expect;

expect(true).to.be.true;
```

The above code will not provide any output if the expectation is met.

## Jest

Jest is a JavaScript unit testing framework, used by Facebook to test services and React applications.

Jest looks for filenames ending with **`.test.js`**.


