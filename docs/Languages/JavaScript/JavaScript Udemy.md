# JavaScript

JavaScript is a lightweight, cross-platform, object-oriented computer programming language :).

The 3 core elements for Web are:

1. HTML - The content - Noun
2. CSS - Presentation of the content - Adjectives
3. JavaScript - Interactions of the content - Verb

## Fundamentals

### Variables And Data Types

Variable is like a container that holds a value.

Primitive Data Types in JavaScript:

1. Number: Floating point numbers for both decimals and integers
2. String: Sequence of characters, used for text
3. Boolean: Logical data type that can only be _true_ or _false_
4. Undefined: Data type of a variable that has no value assigned to it
5. Null: Also means 'non-existent'. No value is present.

## Operators

All the basic arithmetic operations can be used along with logical operators.

Check out Operator Precedence.

## Truthy and Falsy

Truthy values: all NOT Falsy values
Falsy values: `undefined`, `null`, 0, '', `NaN`

## Functions

```javascript
var funcName = function (params) {
  console.log("Hello");
};
```

## Objects and Properties

Objects

## Behind The Scenes

JavaScript Engine executes the JavaScript code.

**CODE** --> **Parser** --> _Abstract Syntax Tree_ --> **CONVERSION TO MACHINE CODE** --> _Machine Code_ --> **CODE RUNS**

### Execution Context

A box, a container, or a wrapper which stores variables and in which a piece of code is evaluated and executed.

The default execution context is the _Global Execution Context_.

- Code that is not inside any function will be in _Global Execution Context_.

- Associated with the _Global Object_.

- In the browser, the window object is the _Global Object_.

```javascript
lastName === window.lastName; // true
```

Each execution context has:

1. Variable Object (VO) - variable and function declarations
2. Scope Chain
3. "This" variable

Execution context is created in two phases:

1. Creation Phase

   - Creation of the Variable Object (VO)
   - Creation of the Scope Chain
   - Determine value of the `this` variable

2. Execution Phase

The code of the function that generated the current context is ran line by line.

#### Creation Phase

- The argument object is created, containing all the arguments that were passed into the function.
- Now Hosting happens, the below are the steps of hoisting.
- Code is scanned for function declarations: for each function, a property is created in the variable object, pointing to the function.
- Code is scanned for variable declarations: for each variable, a property is created in the variable object, and set to undefined.

#### Scoping Chain

Scoping defines where a certain variable can be accessed.

- Each new function creates a scope: the space/environment, in which the variables it defines are accessible.
- Lexical scoping: a function that is lexically within another function gets access to the scope of the outer function.
- JavaScript only has function scoping.

```javascript
// GLOBAL SCOPE
var a = "Hello!";
first();

// FIRST FUNCTION'S SCOPE (LOCAL SCOPE)
function first() {
  var b = "Hi!";
  second();

  // SECOND FUNCTION'S SCOPE (LOCAL SCOPE)
  function second() {
    var c = "Hey!";
    console.log(a + b + c);
  }
}
```

#### `this` Variable

- Regular function call: the `this` keyword points at the global object, (the window object, in the browser).
- Method Call: the `this` variable points to the object that is calling the method.
- The `this` keyword is not assigned a value until a function where it is defined is actually called.

```javascript
// WINDOW IS THE DEFAULT "THIS"
console.log(this); // window
// "THIS" INSIDE A FUNCTION THAT IS CALLED WITHIN THE GLOBAL OBJECT
// WILL BE THE window (IN CASE OF BROWSER)
calculateAge(1985);

function calculateAge(year) {
  console.log(2016 - year);
  console.log(this); // window
}

// NOW "THIS" INSIDE AN OBJECT IS THE OBJECT ITSELF
var john = {
  name: "John",
  yearOfBirth: 1990,
  calculateAge: function () {
    console.log(this); // john OBJECT
    console.log(this.yearOfBirth); // 1990
    console.log(this.yearOfBirth); // 1990

    function innerFunction() {
      console.log(this); // "THIS" IS window OBJECT NOW AS innerFunction IS NOT A METHOD RATHER A REGULAR FUNCTION
    }
    innerFunction();
  },
};

john.calculateAge(); // 26

// METHOD BORROWING
var mike = {
  name: "Mike",
  yearOfBirth: 1984,
};

mike.calculateAge = john.calculateAge;
mike.calculateAge(); // 32
```

## DOM Manipulation And Events

DOM (Document Object Model)

- DOM is structured representation of an HTML document.
- The DOM is used to connect web pages to scripts like JavaScript.
- For each HTML element, there is an object in the DOM that can be accessed and interacted with.

## Objects

Everything is an object in JavaScript (well, almost everything).

- Primitive Data Types - numbers, strings, booleans, undefined, and null
- Everything else is an object - arrays, functions, objects, dates, wrappers for numbers, strings, boolean

Constructor or Prototype is similar to Classes in other languages.

### Inheritance

JavaScript is Prototype based language, hence the inheritance is achieved using prototypes.

Prototype Chain:

- Every JavaScript object has a prototype property, which makes inheritance possible.
- The prototype property of an object is where we put methods and properties that we want other objects to inherit.
- The Constructor's prototype property is NOT the prototype of the constructor itself, it's the prototype of ALL instances that are created through it.
- When, a certain method (or property) is called, the search starts in the object itself, and if it cannot be found, the search moves on to the object's prototype. This continues until the method is found: _prototype chain_.

Creating an object prototype:

1. Using the function constructor:

```javascript
// FUNCTION CONSTRUCTOR
var Person = function (name, yearOfBirth, job) {
  this.name = name;
  this.yearOfBirth = yearOfBirth;
  this.job = job;
};

Person.prototype.calculateAge = function () {
  console.log(2016 - this.yearOfBirth);
};

Person.prototype.lastName = "smith";

// CREATE AN OBJECT (INSTANTIATE AN OBJECT)
var john = new Person("John", 1990, "teacher");
console.log(john.calculateAge()); // 26
```

2. Using `Object.create`:

```javascript
// Object.create
var personProto = {
  calculateAge: function () {
    console.log(2016 - this.yearOfBirth);
  },
};

var mike = Object.create(personProto);
mike.name = "Mike";
mike.yearOfBirth = 1898;
mike.job = "jobless";

var jane = Object.create(personProto, {
  name: { value: "Jane" },
  yearOfBirth: { value: 1965 },
  job: { value: "gamer" },
});
```

## Functions

Functions are first class functions in JavaScript.

- A function is an instance of the object type.
- A function behaves like any other object.
- Functions can be stored in variables.
- Functions can be passed as an argument to another function.
- Functions can be returned from another function.

### Immediately Invoked Function (IIFE)

```javascript
(function () {
  var score = Math.random() * 10;
  console.log(score >= 5);
})();
```

## Closures

An inner function has always access to the variables and parameters of its outer function, even after the outer function has returned.

```javascript
function retirement(retirementAge) {
  var a = " years left until retirement.";
  return function (yearOfBirth) {
    var age = 2016 - yearOfBirth;
    console.log(retirementAge - age + a);
  };
}
```

## Bind, Call, And Apply

```javascript
var john = {
  name: "John",
  age: 26,
  job: "teacher",
  presentation: function (style, timeOfDay) {
    if (style === "formal") {
      console.log(
        "I'm " + this.name + " of age " + this.age + ". Good " + timeOfDay
      );
    } else if (style === "casual") {
      console.log(
        "Whats up? " +
          this.name +
          "here, of age " +
          this.age +
          ". Good " +
          timeOfDay
      );
    }
  },
};

john.presentation("formal", "morning");

var emily = {
  name: "Emily",
  age: 35,
  job: "designer",
};

// CALL
john.presentation.call(emily, "casual", "evening");

// APPLY
john.presentation.apply(emily, ["formal", "night"]);

// BIND - PRESET AN ARGUMENT
var johnFormal = john.presentation.bind(john, "formal");

johnFormal("morning");
johnFormal("evening");
```

Example 2:

```javascript
var years = [1990, 1965, 1937, 2005, 1998];

function arrayCalc(arr, fn) {
  var arrRes = [];
  for (var i = 0; i < arr.length; i++) {
    arrRes.push(fn(arr[i]));
  }
  return arrRes;
}

function calculateAge(el) {
  return 2016 - el;
}

function isFullAge(limit, el) {
  return el >= limit;
}

var ages = arrayCalc(years, calculateAge);

var fullJapan = arrayCalc(ages, isFullAge.bind(this, 20));

console.log(ages);
console.log(fullJapan);
```

## Module Pattern

```javascript
var budgetController = (function () {
  var x = 23;
  var add = function (a) {
    return x + a;
  };

  return {
    publicTest: function (b) {
      console.log(add(b));
    },
  };
})();

budgetController.x; // undefined
budgetController.add(); // uncaught TypeError: budgetController.add is not a function

budgetController.publicTest(25); // 49
```

## Event Delegation

### Event Bubbling

- When an element has lots of child elements that we are interested in.
- When we want an event handler attached to an element that is not yet in the DOM when the page is loaded.

## ES6

### `var`, `let`, And `const`

- `var` is function scoped
- `let` and `const` are block scoped

### IIFEs

- Anything inside a curly braces is block and will have block scope.

ES5

```javascript
(function () {
  var a = 1;
  var b = 2;
  console.log(a + b);
})();
```

ES6

```javascript
{
  const a = 10;
  let b = 25;
  console.log(a + b);
}
```

::: tip Note
`var` inside a block scope ca be accessed outside the block as it only has function scope.
:::

### Template Literals

Put strings inside back ticks (tilda) and use `${}` to put the variables, function calls, and expressions.
This is alternative to the old string formating.

ES5

```javascript
let year = 1996;

function calcAge(year) {
  return 2018 - year;
}

console.log(
  "I was born in the year " + year + " and my age is " + calcAge(year)
);
```

ES6

```javascript
console.log(`I was born in the year ${year} and my age is ${calcAge(year)}`);
```

New string functions:

- `startsWith`: Check if the string starts with the string passed as argument.
- `endsWith`: Check if the string ends with the string passed as argument.
- `includes`: Check if the string passed as argument is present.
- `repeat`: Repeat the string _n_ number of times.

### Arrow Functions

#### Lexical `this`

### Destructuring

### Arrays

Converting Node lists to Arrays:

ES5

```javascript
const boxes = document.querySelectorAll(".box");

var boxesArr5 = Array.prototype.slice.call(boxes);
boxesArr5.forEach(function (cur) {
  cur.style.backgroundColor = "dodgerblue";
});
```

ES6

```javascript
Array.from(boxes).forEach((cur) => (cur.style.backgroundColor = "dodgerblue"));
```

### Spread Operator

### Rest Parameters

Rest parameters convert multiple input parameters into a single array containing all the arguments.
It uses the same 3 dot notation as spread operator and dose opposite of spread operator.

ES5

```javascript
function isFullAge5() {
  var argsArr = Array.prototype.slice.call(arguments);

  argsArr.forEach(function (cur) {
    console.log(2016 - cur >= 18);
  });
}
isFullAge5(1990, 1999, 1960);
```

ES6

```javascript
const isFullAge6 = (...years) =>
  years.forEach((el) => console.log(2016 - el >= 18));
isFullAge6(1990, 1999, 1960);
```

### Maps

- Anything can be a key
- Maps are enumerable

```javascript
const question = new Map();

question.set(
  "question",
  "What is the official name of the latest major JavaScript version?"
);
question.set(1, "ES5");
question.set(2, "ES6");
question.set(3, "ES2015");
question.set(4, "ES7");
question.set("correct", 3);
question.set(true, "Correct Answer :D");
question.set(false, "Wrong, please try again!");

console.log(question.get("question"));
console.log(question.size);

question.forEach((value, key) =>
  console.log(`This is ${key}, and it's set to ${value}`)
);

for (let [key, value] of question.entries()) {
  if (typeof key === "number") {
    console.log(`This is ${key}, and it's set to ${value}`);
  }
}

const ans = parseInt(prompt("Write the correct answer"));
console.log(question.get(ans === question.get("correct")));
```

### Classes

ES5

```javascript
var Person5 = function (name, yearOfBirth, job) {
  this.name = name;
  this.yearOfBirth = yearOfBirth;
  this.job = job;
};
Person5.prototype.calcAge = function () {
  var age = new Date().getFullYear() - this.yearOfBirth;
  console.log(age);
};
var john = new Person5("John", 1996, "teacher");
```

ES6

```javascript
class Person6 {
  constructor(name, yearOfBirth, job) {
    this.name = name;
    this.yearOfBirth = yearOfBirth;
    this.job = job;
  }

  calcAge() {
    let age = new Date().getFullYear() - this.yearOfBirth;
    console.log(age);
  }
}
const emily = new Person6("Emily", 1994, "teacher");
```

Static methods can be also be created. Static methods are those methods that cannot be inherited.

```javascript
class Person6 {
  constructor(name, yearOfBirth, job) {
    this.name = name;
    this.yearOfBirth = yearOfBirth;
    this.job = job;
  }

  calcAge() {
    let age = new Date().getFullYear() - this.yearOfBirth;
    console.log(age);
  }

  static greeting() {
    console.log("Hey There!");
  }
}
const emily = new Person5("Emily", 1994, "teacher");

Person6.greeting();
```

::: warning NOTE
Classes are not hoisted.
:::

#### Inheritance

ES5

```javascript
var Person5 = function (name, yearOfBirth, job) {
  this.name = name;
  this.yearOfBirth = yearOfBirth;
  this.job = job;
};
Person5.prototype.calcAge = function () {
  var age = new Date().getFullYear() - this.yearOfBirth;
  console.log(age);
};

var Athlete5 = function (name, yearOfBirth, job, olympicGames, medals) {
  Person5.call(this, name, yearOfBirth, job);
  this.olympicGames = olympicGames;
  this.medals = medals;
};

Athlete5.prototype = Object.create(Person5.prototype);

Athlete5.prototype.wonMedal = function () {
  this.medals++;
  console.log(this.medals);
};

var johnAthlete5 = new Athlete5("John", 1996, "teacher", 3, 10);
```

ES6

```javascript
class Person6 {
  constructor(name, yearOfBirth, job) {
    this.name = name;
    this.yearOfBirth = yearOfBirth;
    this.job = job;
  }

  calcAge() {
    let age = new Date().getFullYear() - this.yearOfBirth;
    console.log(age);
  }
}

class Athlete6 extends Person6 {
  constructor(name, yearOfBirth, job, olympicGames, medals) {
    super(name, yearOfBirth, job);
    this.olympicGames = olympicGames;
    this.medals = medals;
  }

  wonMedal() {
    this.medals++;
    console.log(this.medals);
  }
}

const emilyAthlete6 = new Athlete6("Emily", 1994, "Runner", 10, 25);
```

## Asynchronous JavaScript: Promises, Async/Await and AJAX

Using `setTimeout()` to cause a delay in function execution:

```javascript
const second = () => {
  setTimeout(() => {
    console.log("Second");
  }, 2000);
};

const first = () => {
  console.log("Hey There");
  second();
  console.log("The End");
};

first();
```

The expected result of the above code is:

```javascript
Hey There

// 2 SECONDS DELAY
Second

The End
```

But the actual output is:

```javascript
Hey There

The End

// 2 SECONDS DELAY
Second
```

This is because the `setTimeout()` function creates a Asynchronous call stack.

Key aspects of Asynchronous functions are:

- Allow asynchronous functions to run in the background.
- Callbacks are passed that run once the function has finished its work.
- Move on immediately: Non-blocking code.

### The Event Loop

WEB API's are part of JavaScript Runtime but leave outside of the JavaScript engine. Like the DOM events, `setTimeout()`, `XMLHttpRequest()` etc.

Event loop monitors the Message Queue and Execution Stack so that the first callback function can be pushed into the Execution Stack if the Execution Stack is empty.

All callback wait in WEB API's till the event happens and then they move to the Message Queue, where they wait for their turn to be pushed into the Execution Stack.

### Asynchronous Function Calls (Old Way)

```javascript
function getRecipe() {
  setTimeout(() => {
    const recipeID = [523, 883, 432, 978];
    console.log(recipeID);

    setTimeout(
      (id) => {
        const recipe = { title: "French Tomato Pasta", publisher: "Jones" };
        console.log(`${id}: ${recipe.title}`);

        setTimeout(
          (publisher) => {
            const recipe2 = { title: "Italian Pizza", publisher: "Jones" };
            console.log(recipe2);
          },
          1500,
          recipe.publisher
        );
      },
      1500,
      recipeID[2]
    );
  }, 1500);
}

getRecipe();
```

This way of calling Asynchronous Functions where each asynchronous function is inside another asynchronous function causing a Call Back Hell.

### Promise

Promise is:

- An object that keeps track about whether a certain event has happened already or not.
- Determines what happens after the event has happened.
- Implements the concept of a future value that is expected.

Promise States:

1. Before the event has happened the Promise is in **Pending** state.
2. After the event has happened,the Promise is now either in **Settled or Resolved** state.
3. If the Promise was successful then it is in **Fulfilled** state.
4. If it failed then it is in **Rejected** state.

```javascript
const getIDs = new Promise((resolve, reject) => {
  setTimeout(() => {
    resolve([145, 365, 394, 987]);
  }, 1500);
});

const getRecipe = (recID) => {
  return new Promise((resolve, reject) => {
    setTimeout(
      (ID) => {
        const recipe = { title: "French Tomato Pasta", publisher: "Jones" };
        resolve(`${ID}: ${recipe.title}`);
      },
      1500,
      recID
    );
  });
};

const getRelated = (publisher) => {
  return new Promise((resolve, reject) => {
    setTimeout(
      (pub) => {
        const recipe2 = { title: "Italian Pizza", publisher: "Jones" };
        resolve(`${pub}: ${recipe2.title}`);
      },
      1500,
      publisher
    );
  });
};

getIDs
  .then((IDs) => {
    console.log(IDs);
    return getRecipe(IDs[2]);
  })
  .then((recipe) => {
    console.log(recipe);
    return getRelated("Jonas");
  })
  .then((pub) => console.log(pub))
  .catch((error) => console.log(error));
```

### Async/Await

Its new feature provided by ES8.

```javascript
const getIDs = new Promise((resolve, reject) => {
  setTimeout(() => {
    resolve([145, 365, 394, 987]);
  }, 1500);
});

const getRecipe = (recID) => {
  return new Promise((resolve, reject) => {
    setTimeout(
      (ID) => {
        const recipe = { title: "French Tomato Pasta", publisher: "Jones" };
        resolve(`${ID}: ${recipe.title}`);
      },
      1500,
      recID
    );
  });
};

const getRelated = (publisher) => {
  return new Promise((resolve, reject) => {
    setTimeout(
      (pub) => {
        const recipe2 = { title: "Italian Pizza", publisher: "Jones" };
        resolve(`${pub}: ${recipe2.title}`);
      },
      1500,
      publisher
    );
  });
};

async function getRecipeAW() {
  const IDs = await getIDs;
  console.log(IDs);
  const recipe = await getRecipe(IDs[2]);
  console.log(recipe);
  const related = await getRelated("Jonas");
  console.log(related);
}

getRecipeAW();
```

## AJAX (Asynchronous JavaScript And XML)

We can use any of the Web APIs to perform AJAX calls.

### XMLHttpRequest

```javascript
const getData = () => {
  const xhr = new XMLHttpRequest();

  // CREATE A REQUEST
  xhr.open("GET", "https://forkify-api.herokuapp.com/api/search?q=pizza");

  // PARSE JSON TO JavaScript OBJECT
  xhr.responseType = "json";

  // SAVE THE RESPONSE
  xhr.onload = () => {
    console.log(xhr.response);
  };

  // SEND THE REQUEST
  xhr.send();
};
```

### Fetch API

```javascript
async function getTodo(id) {
  try {
    const response = await fetch(
      `https://jsonplaceholder.typicode.com/todos/${id}`
    );
    const data = await response.json();
    console.log(data);
  } catch (error) {
    console.log(error);
  }
}

getTodo(1);
getTodo(5);
```

Using Async and Await:

```javascript
async function getTodo(id) {
  try {
    const response = await fetch(
      `https://jsonplaceholder.typicode.com/todos/${id}`
    );
    const data = await response.json();
    console.log(data);
  } catch (error) {
    console.log(error);
  }
}

getTodo(1);
getTodo(5);
```

## ES6 Modules

## Local Storage

**localstorage** API stores information as a key-value pair inside the browser. This data persists even after the page is reloaded.

You can set, retrieve, and delete an item:

```javascript
// SET ITEM
localStorage.setItem("id", "123");

// GET ITEM
localStorage.getItem("id");

// REMOVE ITEM
localStorage.removeItem("id");

// SHOW ALL ITEMS
console.log(localStorage);

// NUMBER OF ITEMS
console.log(localStorage.length);
```

::: tip NOTE

_localStorage_ can only store strings and numbers, so always convert arrays and objects to JSON string.

:::

## Project Structure

1. Node JS
2. NPM
3. Webpack
4. MVC
