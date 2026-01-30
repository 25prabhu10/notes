---
title: Unit Testing
description: Unit Testing is the practice of testing individual units or components of a software application in isolation to ensure they function as intended
---

# Unit Testing

_Unit test:_ Test(s) written for testing a _unit_ of code in isolation

Verify that **a known, fixed input produces a known, fixed output**

- Testing a unit of work
- An unit can be a method
- [Red-green testing](./Testing.md#test-driven-development-tdd)
- System under test (SUT)
- [Code coverage](#code-coverage)
- One _unit test_ runs independently of any other unit test
- Tests can (and do) run in any order
- Tests can (and do) run in parallel in multiple threads
- _External dependencies_ are managed with [Test Doubles](#test-doubles) (such as **Mocks/Stubs/Fakes**)
- A single unit test should run in a second or less
- Unit test usually are partitioned into: Arrange, Act, Assert

Unit tests should not be the only means to test an application, as:

- They are further away from how users interact with software
- More likely to break with refactoring

## Characteristics of a good unit test

- **Fast**: It is not uncommon for mature projects to have thousands of unit tests. Unit tests should take very little time to run (in _milliseconds_)

- **Isolated**: Unit tests are stand-alone, can be run in isolation, and have no dependencies on any outside factors such as a file system or database
  - Mock dependencies
  - Test internals

- **Repeatable**: Running a unit test should be consistent with its results, that is, it always returns the same result if you do not change anything in between runs

- **Self-Checking**:. The test should be able to automatically detect if it passed or failed without any human interaction

- **Timely**: A unit test should not take a disproportionately long time to write compared to the code being tested. If you find testing the code taking a large amount of time compared to writing the code, consider a design that is more testable

Unit testing tips:

- Do not unit test everything
- Use data that is close to production data
- Cover edge cases
- Write tests that are independent of each other

## Unit Test Structure

1. **Setup**: Put the Unit Under Test (UUT) or the overall test system in the state needed to run the test

2. **Execution**: Trigger/drive the UUT to perform the target behaviour and capture all output, such as return values and output parameters. This step is usually very simple

3. **Validation**: Ensure the results of the test are correct. These results may include explicit outputs captured during execution or state changes in the UUT

4. **Clean-up**: Restore UUT or the overall test system to the pre-test state. This restoration permits another test to execute immediately after this one. In some cases in order to preserve the information for possible test failure analysis the clean-up should be starting the test just before the test's setup run

Arranging your tests: **Arrange, Act, Assert** is a common pattern when unit testing. As the name implies, it consists of three main actions:

- _Arrange_ your objects, creating and setting them up as necessary

- _Act_ on an object

- _Assert_ that something is as expected

## Naming conventions

- Roy Osherove's naming strategy for unit tests: `[UnitOfWork_StateUnderTest_ExpectedBehaviour]`
  - E.g. `Divide_PositiveNumbers_ReturnsPositiveQuotient`

## Code Coverage

A high code coverage percentage is often associated with a higher quality of code

Tools:

- [Coverlet](https://github.com/coverlet-coverage/coverlet): Code coverage framework

- [ReportGenerator](https://github.com/danielpalme/ReportGenerator): Report generator

## Test Doubles

A Test Double is an object that can stand-in for a real object in a test. Used instead of External Dependencies

- DB, Web, API, Library, Network etc...
- If tests fail then it must due the unit of code that is being tested not due to its dependencies
- Easy to simulate various scenarios

Types of Test Doubles:

1. **Dummy**: A dummy is the simplest form of a test double. It facilitates linker time substitution by providing a default return value where required
   - It is used as a placeholder when an argument needs to be filled in
   - Objects that the SUT (System Under Test) depends but they are never used
   - Not relevant to the test scope

2. **Stub**: Generates predefined outputs. It provides fake data to the SUT
   - A stub is a controllable replacement for an existing dependency (or collaborator) in the system. By using a stub, you can test your code without dealing with the dependency directly
   - Programmed Stub to return a Success, Failure or Exception
   - A stub adds simplistic logic to a dummy, providing different outputs

3. **Spy**: It records information about how the class is being used

4. **Mock**: Mocks replace external interface
   - A mock object is a fake object in the system that decides whether or not a unit test has passed or failed. A mock starts out as a Fake until it's **asserted** against
   - They have the same signature of the function
   - We can check if the function is being called or not
   - How many times is the function being called?
   - What Parameters are passed when it is called?
   - It defines an expectation of how it will be used. It will cause a failure if the expectation isn't met
   - **Right call, Right Number of times with Right set of Parameter and in the Right order**

5. **Fake**: Almost working implementation. It is an actual implementation of the contract but is unsuitable for production
   - Connect to a local HTTP server
   - Instead of actually going to the internet it connects to a local (limited) implementation
   - Check the behaviour with respect to the actual data it receives from the server
   - A Fake can be a stub or a mock object

## Tools

1. Test Runners:
   - Find tests
   - Run tests
   - Determine whether tests pass or fail
   - Code becomes DRY
   - Test results
   - Predictable
   - CI Integration
   - Auto Run
   - [AVA](https://github.com/avajs/ava)

## References

- [Effective Unit Testing by Eliotte Rusty Harold](https://www.youtube.com/watch?v=fr1E9aVnBxw)
