---
title: JavaScript Testing
description: JavaScript Testing
---

# JavaScript Testing

For more details checkout [Testing](../)

## Unit Testing

Suite: A specific group of related tests.

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

#### Mocking

Faking API calls made using `fetch`:

_Example:_

```javascript
// src/utils/currency.js
async function convert(base, destination) {
  try {
    const result = await fetch(
      `https://api.exchangeratesapi.io/latest?base=${base}`
    );
    const data = await result.json();
    return data.rates[destination];
  } catch (e) {
    return null;
  }
}

export { convert };
```

- Manual mock:

```javascript
// src/utils/currency.test.js
global.fetch = jest.fn(() =>
  Promise.resolve({
    json: () => Promise.resolve({ rates: { CAD: 1.42 } }),
  })
);

beforeEach(() => {
  fetch.mockClear();
});

it("finds exchange", async () => {
  const rate = await convert("USD", "CAD");

  expect(rate).toEqual(1.42);
  expect(fetch).toHaveBeenCalledTimes(1);
});

// Mocks with failure
it("returns null when exception", async () => {
  fetch.mockImplementationOnce(() => Promise.reject("API is down"));

  const rate = await convert("USD", "CAD");

  expect(rate).toEqual(null);
  expect(fetch).toHaveBeenCalledWith(
    "https://api.exchangeratesapi.io/latest?base=USD"
  );
});
```

- React:

```jsx
// src/App.js
import React from "react";
import useSWR from "swr";
import { convert } from "./utils/currency";

export default function App() {
  const [base, dest] = ["USD", "CAD"];
  const { data: rate, error } = useSWR([base, dest], convert);

  if (error) return "Error!";
  if (!rate) return "Loading!";

  return (
    <div>
      {base} to {dest}: {rate}
    </div>
  );
}
```

```javascript
// src/App.test.js
import React from "react";
import { render } from "@testing-library/react";
import App from "./App";

// Mock the currency module (which contains the convert function)
jest.mock("./utils/currency", () => {
  return {
    convert: jest.fn().mockImplementation(() => {
      return 1.42;
    }),
  };
});

test("renders learn react link", async () => {
  const { findByText } = render(<App />);
  const element = await findByText(/USD to CAD: 1.42/i);
  expect(element).toBeInTheDocument();
});
```

### Testing Library

[React Testing Library](https://testing-library.com/docs/react-testing-library/intro/) builds on top of DOM Testing Library by adding APIs for working with React components.

- [Common Testing Mistakes](https://kentcdodds.com/blog/common-mistakes-with-react-testing-library#not-using-screen)
