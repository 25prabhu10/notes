---
title: Functional programming in JavaScript
description: An open source JavaScript task runner (build system).
---

# Functional programming in JavaScript

Functional programming is a programming paradigm:

- Composed of **Pure functions**
- **Avoiding shared state**
- **Avoiding state/data mutation**
- **Avoiding side-effects**

JavaScript supports higher-order functions and functions are **first-class citizens**.

A function is considered a first-class citizen when it can be **declared as a variable**, sent to functions **as arguments**, and **returned from functions**. This means that functions can do the same things that variables can do.

Functions can be declared with `var`, `let`, or `const` keywords the same way variables are declared.

## Imperative vs Declarative

Functional programming is a part of a larger programming paradigm: **declarative programming**.

Declarative programming is a style of programming where applications are structured in a way that prioritizes describing **what should happen** over defining **how it should happen**.

## Functional Concepts

### Immutability

In a functional program, data is immutable.

In JavaScript, function arguments are references to the actual data. So, if the function changes or mutates the value of the argument, then the original data will also be mutated. This is not functional programming.

#### Objects

```javascript
function rateColor(color, rating) {
  color.rating = rating;
  return color;
}

console.log(rateColor(color_lawn, 5).rating); // 5
console.log(color_lawn.rating); // 5
```

In the above example, the value of the rating of the original `color_lawn` gets mutated.

```javascript
const rateColor = function (color, rating) {
  return Object.assign({}, color, { rating: rating });
};

console.log(rateColor(color_lawn, 5).rating); // 5
console.log(color_lawn.rating); // 0
```

In the above example, the value of the rating of the original `color_lawn` remains unaffected and we get a new object with the updated contents.

This is done with the help of `Object.assign`, which creates a new copy of the original object with all the new changes. Thus, keeping the original data unchanged.

#### Arrays

Arrays behave similarly to objects when passed as an argument to a function. Hence, changing the argument values directly should be avoided.

JavaScript provides functional Array methods that help in keep the original data unchanged.

- `Array.push` is not an immutable function. Instead we can use `Array.concat`:

  ```javascript
  const addColor = function (colorName, colors) {
    colors.push(colorName);
    return colors;
  };

  console.log(addColor("Glam Green", list).length); // 4
  console.log(list.length); // 4
  ```

  ```javascript
  const addColor = (title, array) => array.concat({ title });

  console.log(addColor("Glam Green", list).length); // 4
  console.log(list.length); // 3
  ```

### Pure Functions

A pure function is a function that returns a value that's computed based on its arguments. Pure functions take at least one argument and always return a value or another function. They do not cause side effects, set global variables, or change anything about application state. They treat their arguments as immutable data.

Example:

```javascript
const frederick = {
  name: "Frederick Douglass",
  canRead: false,
  canWrite: false,
};

function selfEducate() {
  frederick.canRead = true;
  frederick.canWrite = true;
  return frederick;
}

selfEducate();
console.log(frederick);

// {name: "Frederick Douglass", canRead: true, canWrite: true}
```

In the above example, `selfEducate` function is not a pure function, as it dose not take any arguments, it dose not return a value or a function, and it also changes the variable outside of its scope.

```javascript
const frederick = {
  name: "Frederick Douglass",
  canRead: false,
  canWrite: false,
};

const selfEducate = (person) => ({
  ...person,
  canRead: true,
  canWrite: true,
});

console.log(selfEducate(frederick));
console.log(frederick);

// {name: "Frederick Douglass", canRead: true, canWrite: true}
// {name: "Frederick Douglass", canRead: false, canWrite: false}
```

In the above example, `selfEducate` function is a pure function, as it takes an argument, returns a new object using the new _spread operator_ (`...`) without chaining the original data.

::: tip NOTE
Pure functions are easy to test as they always produce the same result for a given input.
:::

### Data Transformations

In functional programming even though data is immutable, data can be transformed from one to another, by producing transformed copies of the original data.

### Higher-Order Functions

They can take functions in as arguments or return functions or both.

**Curring** - A function that will return a new function until it receives all it's arguments.

```javascript
const userLogs = (userName) => (message) =>
  console.log(`${userName} -> ${message}`);

const log = userLogs("grandpa23");

log("attempted to load 20 fake members");
getFakeMembers(20).then(
  (members) => log(`successfully loaded ${members.length} members`),
  (error) => log("encountered an error loading members")
);

// grandpa23 -> attempted to load 20 fake members
// grandpa23 -> successfully loaded 20 members

// grandpa23 -> attempted to load 20 fake members
// grandpa23 -> encountered an error loading members
```

### Recursion

Recursion is a technique that involves creating functions that recall themselves.

```javascript
const countdown = (value, fn) => {
  fn(value);
  return value > 0 ? countdown(value - 1, fn) : value;
};

countdown(10, value => console.log(value));
```

### Composition

Composition is putting two or more different things together, and getting the same "kind" of thing — a combination of the inputs — as a result.

```javascript
const both = compose(
  civilianHours,
  appendAMPM
);

both(new Date());

const compose = (...fns) => arg =>
  fns.reduce((composed, f) => f(composed), arg);
```

## Closures

A closure is the combination of a function bundled together (enclosed) with references to its surrounding state (the lexical environment).

You have a closure when a function accesses variables defined outside of it.

For example, this code snippet contains a closure:

```javascript
let users = ['Alice', 'Dan', 'Jessica'];
let query = 'A';
let user = users.filter(user => user.startsWith(query));
```

Notice how `user => user.startsWith(query)` is itself a function. It uses the query variable. But the query variable is defined outside of that function. That's a closure.

> Please check [Closure](https://whatthefuck.is/closure) for more info.

- Structural sharing.


