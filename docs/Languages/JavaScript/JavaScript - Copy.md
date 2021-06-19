# JavaScript

JavaScript is a:

- High-Level

- Single-Threaded

- Garbage-Collected

- Interpreted or Just In Time Compiled

- Prototype-Based Inheritance: Everything in JavaScript is an object. Each object holds a link to its prototype.

  ```javascript
  const Dog = { barks: true };
  const Pug = Object.create(Dog);
  Pug.baks; //> true
  ```

- Multi-Paradigm: You can use Declarative Functional or Imperative Object-Oriented approach.

- Dynamic Weakly Typed - Data types become known at runtime.

- With a Non-Blocking Event Loop concurrency model

- Scripting Language

## Background

JavaScript was created by Brendan Eich.

### JavaScript Versus ECMAScript

_ECMAScript_ is the official name for JavaScript.

- JavaScript means the programming language.
- ECMAScript is the name used by the language specification. Therefore, whenever referring to versions of the language, people say ECMAScript (ES6).
- JavaScript is a trademark of Oracle Corporation, Mozilla has acquired licence to use JavaScript name.

### ECMAScript

- It was created to standardize JavaScript.
- Browsers use ECMAScript to interpret JavaScript Code.
- ECMAScript provides the rules, details and guidelines that a scripting language must contain to be considered part of ECMAScript.

> [FreeCodeCamp Article on JavaScript vs ECMAScript](https://www.freecodecamp.org/news/whats-the-difference-between-javascript-and-ecmascript-cba48c73a2b5/)

## Syntax

Basic syntactic principles of JavaScript.

A few examples of syntax:

```javascript
// Two slashes start single-line comments

var x; // declaring a variable

x = 3 + y; // assigning a value to the variable `x`

foo(x, y); // calling function `foo` with parameters `x` and `y`
obj.bar(3); // calling method `bar` of object `obj`

// A conditional statement
if (x === 0) {
  // Is `x` equal to zero?
  x = 123;
}

// Defining function `baz` with parameters `a` and `b`
function baz(a, b) {
  return a + b;
}
```

### Statements Versus Expressions

JavaScript has two major syntactic categories: **statements** and **expressions**:

**Statements** _“do things.”_ A program is a sequence of statements. Here is an example of a statement, which declares (creates) a variable foo:

```javascript
var foo;
```

**Expressions** _produce values_. They are function arguments, the right side of an assignment, etc. Here’s an example of an expression:

```javascript
3 * 7;
```

The distinction between statements and expressions is best illustrated by the fact that JavaScript has two different ways to do if-then-else—either as a _statement_:

```javascript
var x;
if (y >= 0) {
  x = y;
} else {
  x = -y;
}
```

or as an _expression_:

```javascript
var x = y >= 0 ? y : -y;
```

> Note: You can use the latter as a function argument (but not the former):

```javascript
myFunction(y >= 0 ? y : -y);
```

Finally, wherever JavaScript expects a statement, you can also use an expression; for example:

```javascript
foo(7, 1);
```

The whole line is a statement (a so-called expression statement), but the function call foo(7, 1) is an expression.

### Semicolons

Semicolons are optional in JavaScript. However, I recommend always including them, otherwise JavaScript can guess wrong about the end of a statement.

Semicolons terminate statements, but not blocks. There is one case where you will see a semicolon after a block: a function expression is an expression that ends with a block. If such an expression comes last in a statement, it is followed by a semicolon:

```javascript
// Pattern: var _ = ___;
var x = 3 * 7;
var f = function () {}; // function expr. inside var decl.
```

### `var`, `let`, and `const`

1. `var`:
   - Can be reassigned.
   - Has a function scope
2. `let`:
   - Is similar to `var` in most ways, but it's scope is limited to the block statement.
3. `const`:
   - Cannot be reassigned a value.
   - We need to assign a value during declaration of a `const`.

- The usual variable declaration rules apply here.
- Camel Casing is preferred in JavaScript for variables.

::: danger

If a value is assigned to an undeclared variable, then it will have a global scope even if its done inside an enclosing function. Please avoid this.

```javascript
function app() {
  l = "global";
}
console.log(l); // l has a global scope
```

:::

### [Truthy](https://developer.mozilla.org/en-US/docs/Glossary/Truthy) vs [Falsy](https://developer.mozilla.org/en-US/docs/Glossary/Falsy)

JavaScript will always try to coerce a value into a Boolean when it's encountered inside of a conditional statement. So:

- `true` is obviously Truthy.

- All Objects are Truthy:

  ```javascript
  console.log(!!{}); // true
  console.log(!![]); // true
  ```

- A string is Truthy, but an empty string is a Falsy:

  ```javascript
  console.log(!!""); // false
  console.log(!!"a"); // true
  console.log(!!" "); // true
  ```

- All numbers expect **0** are Truthy i.e. **0** is Falsy:

  ```javascript
  console.log(!!1); // true
  console.log(!!0); // false
  console.log(!!-1); // true
  ```

### Operators

- `!` is a logical NOT operator.
- `&&` is a logical AND operator.
- `||` is a logical OR operator.
- `==` is an abstract comparison operator. It will type cast before comparison.
- `===` is a strict equality operator will check equality on both type and value.
- `var x = truthy ? 1 : 2;` is a ternary operator.

> Avoid using `==` for comparisons.

### Data Types

Primitives and Objects are the two lowest level building blocks in JavaScript.

Primitives are short-lived in most cases in the call stack, while objects are kept as references in the heap.

#### Primitive Data Types

Primitives are immutable.

There are 7 primitive data types in JavaScript:

1. Boolean
2. Null - Empty value assigned by the user.
3. Undefined - Default value of a variable until a value is assigned to it.
4. Number
5. BigInt
6. String
7. Symbol

#### Objects

Objects are mutable. If it is not a Primitive then it is an Object.'

An object is a data structure that associate a collection of key-value pairs, which is similar to a map or hash map in other languages. You can say an object is a collection of properties, where each property associates a key to a value.

```javascript
const obj = {
  Name: "Value", // one property
};
```

- Name (Key) must be a unique name that looks like a string.
- Value can be anything, a primitive, another object or function.

##### Object Creation

1. Object Constructor:

   - Create an object using `new Object()`:

     ```javascript
     const obj = new Object();

     // two ways to set properties
     obj.name = "Clown";
     obj["face"] = "🤡";
     ```

   - Using a constructor function one can customize the way the object is created. By convention the constructor function name is same as the object and is Capitalized. This function is similar to a class in other object-oriented programming languages. New object is created using the `new` keyword before the constructor function.

     ```javascript
     // constructor function
     function Zombie(name) {
       this.name = name;
       this.reAnimated = Date.now();

       this.eatBrain = function () {
         return `${this.name} is hungry for 🧠`;
       };
     }

     const obj = new Zombie("🧟‍♂️ Jeff");

     console.log(obj.eatBrain()); // 🧟‍♂️ Jef is hungry for 🧠
     ```

     > In newer JavaScript version, **class** keyword can be used instead of the constructor function.

1. Object Literal:

   ```javascript
   const obj = {
     name: "Clown",
     face: "🤡",
     hello: function () {
       console.log(`hello ${this.name}`);
     },
   };

   console.log(obj.name); // Clown
   console.log(obj["face"]); // 🤡
   ```

   - We can add variables into the object directly:

     ```javascript
     const spider = "🕷";
     const legs = 8;

     // old way
     const obj = {
       spider: spider,
       legs: legs,
     };

     // new way (shorthand syntax)
     const obj = {
       spider,
       legs,
     };
     ```

   - We can destructure the object into variable:

     ```javascript
     const { spider, legs } = obj;

     // new variable names
     const { spider: mySpider, legs: hasLegs } = obj;
     ```

   - If there are multiple properties with same name (key), then the right most value will be assigned to the name (key):

     ```javascript
     const obj = {
       spider,
       legs,
       legs: 10,
       legs: 25,
     };

     console.log(obj.legs); // 25
     ```

   - Dynamically add property names by wrapping them in brackets `[]` and place an expression inside and it will compute that value when the object is created.

     ```javascript
     const spider = "🕷";
     const random = () => Math.random().toString(36).slice(-5);

     // shorthand syntax
     const obj = {
       spider,
       [random()]: true, // this name (key) is generated during object creation
     };

     console.log(obj); // { spider: '🕷', da9dl: true }
     ```

   - When a function lives on an object it's called a method. We can use getters and setters.

     ```javascript
     const obj = {
       spider,
       makeWeb: function () {
         console.log("Web Created");
       },
     };

     // shorthand syntax
     const obj = {
       spider,
       makeWeb() {
         console.log("Web Created");
       },
     };
     ```

   - `this` inside an object method refers to that object. But if the object method uses arrow function, then `this` refers to the global `this` context.

   - Chaining methods, `return this` in the method you want to chain. This will keep a reference to the same object.

     ```javascript
     const obj = {
       web: "",
       makeWeb() {
         this.web += "🕸🕸🕸";
         return this;
       },
     };

     obj.makeWeb().makeWeb().makeWeb();

     console.log(obj.web); // 🕸🕸🕸🕸🕸🕸🕸🕸🕸
     ```

1. `create()` static method on object class:

   - Not used for empty object.

   - It used to inherit properties of existing objects. i.e. Use existing object as a prototype to create a Prototype Chain.

   - If we console log `obj`, we will get an empty object `{}`. But if we console log `obj.dna` we get a result.

   - Here `dna` is like an invisible property on the new object `obj`.

   - This is because `dna` property exists on `obj` objects prototype.

     ```javascript
     const organism = {
       dna: Math.random(),
     };

     const obj = Object.create(organism);

     console.log(obj); // {}
     console.log(obj.dna); // 0.18536405128609768

     // get all the properties on prototype
     console.log(Object.getPrototypeOf(obj)); // { dna: 0.18536405128609768 }
     ```

   - We can add a property to the object using Object Define property. Using this method we can add setters, getters and other advanced options.

     ```javascript
     const obj = Object.create({});

     Object.defineProperty(obj, "unicorn", {
       get: () => "🦄",
       enumerable: false,
     });

     console.log(obj); // {}
     console.log(obj.unicorn); // 🦄
     ```

##### Object References (Object Copying)

- Copying value from one primitive to another, will create a new primitive variable. Thus changing the value of the first variable will not effect the second variable .

  ```javascript
  let a = "a";
  let b = a;

  console.log(a, b); // a a

  a = "b";

  console.log(a, b); // b a
  ```

- If an object is copied into another object, the second object will simply make a reference to the first object. Thus changing the value of the first object will effect the second object as well.

  ```javascript
  let a = { boo: "a" };
  let b = a;

  console.log(a, b); // { boo: 'a' } { boo: 'a' }

  a.boo = "bb";

  console.log(a, b); // { boo: 'bb' } { boo: 'bb' }
  ```

- To copy an object without effecting the original object use `Object.assign({}, obj)`. Using this we can only use internal and enumerable properties of the first object i.e. any properties that the first object has inherited higher up in the prototype will not be copied .

  - To check which properties will be copied use `Object.getOwnPropertyNames(obj)`.
  - If the first object were to reference other objects in its properties then those nested objects will be copied as a reference.

  ```javascript
  const hal = {
    name: "Halloween",
  };

  let a = Object.create(hal);

  a.boo = "🎃";
  a.trick = {
    treat: "copied as reference!",
  };

  let b = Object.assign({}, a);

  console.log(a); // { boo: '🎃', trick: { treat: 'copied as reference!' } }
  console.log(b); // { boo: '🎃', trick: { treat: 'copied as reference!' } }

  a.boo = "a";
  a.trick["treat"] = "only reference!";

  console.log(a); // { boo: 'a', trick: { treat: 'only reference!' } }
  console.log(b); // { boo: '🎃', trick: { treat: 'only reference!' } }

  console.log(Object.getOwnPropertyNames(a)); // [ 'boo', 'trick' ]
  ```

- Alternative way to copy objects is by using the `...` Spread Syntax, it's more cleaner. It is slightly different from `Object.assign({}, obj)`.

  ```javascript
  a.trick = {
    treat: "copied as reference!",
  };

  let b = { ...a };
  ```

##### Looping Through Objects

1. Using **For-In** loop, it loops over all of the enumerable properties and the prototypes of the object.

   ```javascript
   const obj = {
     comet: "☄",
     trex: "🦖",
   };

   for (k in obj) {
     console.log(k); // comet, trex
   }
   ```

2. Get the keys or values as an array, then loop through this array using **For** or **For-Each**.

   ```javascript
   const obj = {
     comet: "☄",
     trex: "🦖",
   };

   // loop through keys
   for (k of Object.keys(obj)) {
     console.log(k); // comet, trex
   }

   // loop through values
   for (v of Object.values(obj)) {
     console.log(v); // ☄, 🦖
   }

   // loop thorugh both keys and values at a time
   for (const [k, v] of Object.entries(obj)) {
     console.log(k, v); // comet ☄, trex 🦖
   }
   ```

> - You can mutate the key-value of an object even if it's defined as a constant variable.
> - Literal syntax is mostly used for object creation.

### Hoisting

When JavaScript processes in execution context, it will put all the variables at the top i.e. hoist them to the top of the context.

## Functions

Functions are first class objects in JavaScript.

### Function Declaration And Expression

#### Function Declaration

```javascript
// named function declaration or definition or statement
function makeBread(qty) {
  // qty is the parameter
  const bread = "🍞".repeat(qty);

  // task or side-effect
  console.log(bread);

  // return value
  return bread;
}

// function call
const loaves = makeBread(7); // 7 is the argument passed
```

Anonymous functions are functions with no name:

```javascript
(function () {
  // content
})();

// OR

const temp = function () {
  // anonymous function
  console.log("temp");
};
```

#### Function Expression

Using function as a value:

```javascript
// function expression
const makeBeer = function (qty) {
  return "🍺".repeat(qty);
};

const beers = makeBeer(7);
console.log(beers); // 🍺🍺🍺🍺🍺🍺🍺
```

Function declaration is hoisted while the function expression is not.

We can use a function before its declaration, but when we have an expression the function is created only when the code is reached in the script.

```javascript
// function declaration
const bread = makeBread(7);

function makeBread(qty) {
  return "🍞".repeat(qty);
}

// function expression
const beers = makeBeer(7); // makeBeer is not defined

const makeBeer = function (qty) {
  return "🍺".repeat(qty);
};
```

::: tip

Use function expressions as a best practice, because they are not hoisted and this makes it easier to understand where they belong in the context of an application. Also they are less likely to pollute the global namespace.

:::

#### Immediately Invoked Function Expression (IIFE)

By wrapping an anonymous function in parentheses, we can then call it immediately by adding parentheses afterwards.

```javascript
// IIFE
(function () {
  const x = 23;
})(); // goofy

(function () {
  const x = 23;
})(); // groovy!
```

### Parameters And Arguments

There are different ways to get Parameters:

1. Positional Parameters - All the arguments must be passed and in the right order:

   ```javascript
   // positional parameters
   function makeBreakfast(main, side, drink) {
     console.log(arguments);
     return `Breakfast includes ${main}, ${side}, ${drink}.`;
   }

   const breakfast = makeBreakfast("🥞", "🥓", "🥛");
   ```

2. Named Parameters - Here the argument is a single object that can contain multiple values. We can destructure the object or use it directly inside the function body. Order of the arguments dose not matter.

   ```javascript
   // named parameters
   function makeBreakfast(opts) {
     const { main, side, drink } = opts;
     console.log(arguments);
     return `Breakfast includes ${main}, ${side}, ${drink}.`;
   }

   const breakfast = makeBreakfast({ main: "🥞", side: "🥓", drink: "🥛" });
   ```

3. Rest Parameters - A single parameter is preceded by three dots `...args`. This allows us to use multiple positioned arguments and then access them as an array inside the function body.

   ```javascript
   // rest parameters
   function makeBreakfast(...args) {
     return `Breakfast includes the following items: ${args.join(" ")}.`;
   }

   const breakfast = makeBreakfast("🥞", "🥓", "🥛");
   ```

> `arguments` is a key word.

#### Parameters vs Arguments

Parameters are the variable inputs that are used in the function definition.

While Arguments are the actual value or expressions used when calling the function.

JavaScript supports [HOF](#Higher%20Order%20functions).

```javascript
const app() = (input) => output;

function cool(app) {
    app();
}

cool(() => console.log('sweet'));
```

### Arrow Functions

New Arrow function syntax:

```javascript
function app(input) {
  return output;
}

// above function as an arrow function
const app = (input) => output;

const makeWine = (qty) => "🍷".replace(qty);

const makeWine = (qty) => {
  return "🍷".replace(qty);
};
```

Array functions are function expressions.

They don't have their own `this` object.

```javascript
// ES5 Arrow 'this' example
function Dog() {
  var self = this;
  this.breed = "Wolf 🐺";

  setTimeout(function () {
    console.log(this.breed); // undefined
    console.log(self.breed); // Wolf 🐺
  }, 0);
}

// With Arrow Function
function Dog() {
  this.breed = "Wolf 🐺";

  setTimeout(() => {
    console.log(this.breed);
  }, 0);
}

const dog = new Dog();
```

::: tip

- If a function dose not have a return statement, it will return undefined.
- Use Arrow functions often.

:::

### Pure Functions

Pure functions are those functions that depend only on their input parameters and only mutate variables that are within its local scope and it should also not produce any side effects.

Pure functions always produce the same output given the same input.

- They are easier to test.
- Easier to understand in general.
- They help in composing your applications as a collection of Higher Order Functions.

```javascript
let x = 0;

// impure function
const impure = () => {
  x++;
  return x ** 2;
};

// pure functions
const pure = (x) => x ** 2;
```

### Higher Order Functions

JavaScript supports first-class functions, i.e. functions can be passed as arguments to other functions or use functions as the return value from a function.

```javascript
let haveFun = () => console.log("fun!");

// setTimeOut takes a function as a parameter
setTimeout(haveFun, 50);
setTimeout(() => console.log("fun!"), 50);
```

#### Closures

Closure is just a function within a function where inner function references a variable that was declared in the scope of the outer function and returns the inner function.

Whenever we define a function it will create a lexical environment. Anything inside of curly braces is it's own lexical environment:

```javascript
// lexical env a
const outer = () => {
  // lexical env b
  const inner = () => {
    // lexical env c
  };
};
```

Example of Closures:

```javascript
function useCat() {
  let name = "baby kitten";

  return [() => `Meow ${name}`, (newName) => (name = newName)];
}

const [meow, setName] = useCat();

console.log(meow()); // Meow baby kitten
setName("frank");
console.log(meow()); // Meow frank
```

```javascript
function outer() {
  const fish = "🐠";
  let count = 0;

  function inner() {
    count++;
    return `${count} ${fish}`;
  }

  return inner;
}

const fun = outer();

console.log(fun()); // 1 🐠
console.log(fun()); // 2 🐠
console.log(fun()); // 3 🐠
```

Closure is similar to a class from a conceptual standpoint:

```typescript
class Outer {
  constructor(public fish = "🐠", public count = 0) {}

  inner() {
    this.count++;
    return `${this.count} ${this.fish}`;
  }
}

const instance = new Outer();

console.log(instance.inner()); // 1 🐠
console.log(instance.inner()); // 2 🐠
console.log(instance.inner()); // 3 🐠
```

### Recursive Functions

Functions that call themselves inside their function body. A stopping condition is required otherwise it will go into infinite loop and reach stack overflow.

```javascript
// node.js traversing filesystem
const fs = require("fs");
const { join } = require("path");

const traverse = (dir) => {
  const subFolders = fs.statSync(dir).isDirectory() && fs.readdirSync(dir);

  if (subFolders) {
    console.log("👟👟👟 Traversing ", dir);

    subFolders.forEach((path) => {
      const fullPath = join(dir, path);

      traverse(fullPath); // recursive function call
    });
  }
};

traverse(process.cwd());
```

> Recursive algorithms tend to be very efficient when traversing tree like data structures.

## New Features in 2020

1. Dynamic Imports - Lazily import modules during runtime.

   ```javascript
   async function loadHugeLibrary() {
     const lib = await import("huge");
   }

   // lazy load on button click
   btn.onclick = loadHugeLibrary;
   ```

2. Optional Chaining - Calling a deeply nested object property without throwing any error if parent property is undefined. By using an Elvis operator `?`. It is similar to the **lodash** `_.get()` function.

   ```javascript
   const user = {};

   // no errors! even though these props don't exist
   user?.shopping?.list?.["🍉"];
   ```

3. Nullish Coalescing - Setting a default value for a property when its undefined. The old way is to use a logical or `||`, but this will set the default value if the variable is a 0, empty string, null, or undefined. This might be problematic. The new `??` way, will assign default value if it's null or undefined.

   ```javascript
   const duration = 0;

   // old way to set default value as 400
   const animationTime = duration || 400;

   // new and better way to set default value
   const animationTime = duration ?? 400;
   ```

4. BIGINT - New primitive data type. This will represent numbers beyond **9007199254740991** (`console.log(Number.MAX_SAFE_INTEGER)`) which is 64 bits. To create a BIGINT postfix a regular integer with `n` or use the `BigInt(number)` constructor.

   ```javascript
   const largestNum = BigInt(Number.MAX_SAFE_INTEGER);

   console.log(Number.MAX_SAFE_INTEGER); // 9007199254740991

   const utterlyMassiveInt = largestNum ** 23n;

   console.log(utterlyMassiveInt); // ... 155009387199006145641646091
   ```

5. Lazy Loading Images built-in browser.

   ```html
   <img loading="lazy" />
   ```

## To Read

1. Symbols data type
2. Primitive Wrapper Objects
3. Hoisting
4. Closures
5. `this`
6. Parameters vs Arguments
7. Higher Order Functions
8. Map, Filter, ForEach (They are less performant)
9. getter and setter
10. Web Components
11. Web AuthN
12. Worker Threads
13. Nest JS
14. Graph QL
15. `cypress`, `Gatsby,js`, `Xstate`.

## DOM (Document Object Model)

- `domcument` - Contains the whole HTML

## Bits

- JavaScript did not have exception handling until ECMAScript 3, which explains why the language so often automatically converts values and so often fails silently: it initially couldn’t throw exceptions.

- JavaScript was written in 10 days.

- > "There are two hard things in computer science: cache invalidation, naming things, and off-by-one errors." - Jeff Atwood (@codinghorror)

## References

- Documentation [Link](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
- For more details visit [Speaking JavaScript](http://speakingjs.com/es5/ch01.html)
