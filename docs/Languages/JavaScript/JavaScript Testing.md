# JavaScript Testing

Tests: Describe the expected behaviour of the application.

Unit Testing: Writing tests that confirm an individual function or piece of code works.

Integration Testing:

End-To-End Testing:

## Behaviour Driven Development (BDD)

BDD is like creating a plan before you write your program.

**Red** > **Green** > **Refactor**:

- Write the tests, even though they'll fail.
- Write the easiest code we can that passes that tests.
- Go back and improve the passing code.
- Repeat.

## Mocha

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
