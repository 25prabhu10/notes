---
title: React.js
description: A JavaScript library for building user interfaces.
---

# React.js

A JavaScript library for building user interfaces.

- React works primarily in the View layer
- React applications run faster than applications written in plain JavaScript
- Reusable (and clearer) Web Components

## Getting Started

Before we start, lets create a React project which can be used as a playground to learn React.

To create a basic React project we need the `React` library and also `ReactDOM` library because _React_ only creates views, to render these views we need a library that will handle DOM manipulations. _ReactDOM_ library dose this for us.

- **React** is the **library for creating views**
- **ReactDOM** is the **library used to render the UI in the browser**

We write React code using [JSX](#javascript-xml-jsx) which is a syntax extension of JavaScript.

- As browsers can only parse JavaScript syntax, we need a tool or a library which will transform our JSX code into JavaScript
- [Babel](#babel) is the library which we will use to do the transformation of JSX to JavaScript

To integrate React into the project, we can either:

1. Use CDN links to get the JS files of these two libraries and add them as script tags in `index.html` file. Add your react code inside a script tag with type attribute set to `text/babel`:

   ```html
   <script src="https://unpkg.com/react/umd/react.development.js"></script>
   <script src="https://unpkg.com/react-dom/umd/react-dom.development.js"></script>
   <script src="https://unpkg.com/babel-standalone/babel.min.js"></script>

   <script type="text/babel">
     // JSX code here. Or link to separate JavaScript file that contains JSX.
   </script>
   ```

2. Or create a local development environment and manage project dependencies. Follow steps mentioned in [React Project Setup From Scratch](#react-project-setup-from-scratch)

3. Or use boilerplate generators, such as:

   - [create-react-app](https://create-react-app.dev/) application to generate the boilerplate. It is the recommended by official react guide.

   ```bash
   npx create-react-app my-app
   cd my-app
   npm start
   ```

### React Project Setup From Scratch

The most basic development workflow should allow us to:

1. Write _JSX_ and transform it into JavaScript on the fly
2. Write code in a modular pattern
3. Manage dependencies
4. Bundle JavaScript files and use source maps for debugging
5. Use _Sass_, _less_ or _CSS-in-JS_

Steps to create a base React project without using any boilerplate tools:

1. Make sure [Node.js](https://nodejs.org/en/) is installed, if not then install it. It will by default install node package manager - [npm](https://www.npmjs.com/), if not installed then install it. If you prefer [Yarn](https://classic.yarnpkg.com/lang/en/) use that.

   Run the below commands to make sure `Node.js` and `npm` or `yarn` are installed:

   ```bash
   node -v
   npm -v
   yarn -v
   ```

2. Create an empty directory and give it the project name like `my-app`. Move inside this newly create project directory: `cd my-app`

3. Initialize your project with `npm init` or `yarn init` and also initialize git as well with `git init`

4. A `package.json` file will be created after you complete _step-3_. The `package.json` is a standard `npm` manifest file that records important metadata about a project, such a name, description, information about the author, etc. It lets the developer specify dependencies (that should be downloaded and installed) and define script tasks. `Yarn` also uses the same file

5. Create `.gitignore` file at the root of the project to exclude all the files and directories that should not be committed, such as `/node_modules`, `/dist` directory

6. Create a `public` directory which will handle any static assets, such as the main `index.html` file, images, `manifest.json`, `robots.txt` and other static files

7. Create an `index.html` file inside the `public` directory. This is an empty HTML page that the browser loads, which react will utilize to render your app. An example of HTML markup of `index.html` is show below:

   ```html
   <!-- sourced from https://raw.githubusercontent.com/reactjs/reactjs.org/master/static/html/single-file-example.html -->
   <!DOCTYPE html>
   <html>
     <head>
       <meta charset="UTF-8" />
       <meta
         name="viewport"
         content="width=device-width, initial-scale=1, shrink-to-fit=no"
       />
       <title>React Starter</title>
     </head>

     <body>
       <div id="root"></div>
       <noscript> You need to enable JavaScript to run this app. </noscript>
       <script src="../dist/bundle.js"></script>
     </body>
   </html>
   ```

8. Create a source directory called `src`, which will containing all the user written content such as JavaScript modules, CSS files, Templates etc.

9. Now you need a **module packager or build tool**, which will orchestrate JSX transformation, file minification and concatenation, module/dependency bundling or any other tasks. Tools such as [Grunt](https://gruntjs.com/), [gulp.js](https://gulpjs.com/), [webpack](https://webpack.js.org/), [PARCEL](https://parceljs.org/), [rollup.js](https://rollupjs.org/), [Snowpack](https://www.snowpack.dev/) can be used

10. We will use webpack (v5) and for more info on how webpack works check out this [Link](../Tools/Webpack/Webpack.html).

    - Install it as project development dependency:

    ```bash
    npm install webpack webpack-cli --save-dev
    ```

    - Now create webpack config file at the root of the project called `webpack.config.js`

11. Install `babel` and its dependencies as dev dependency:

    ```bash
    npm install --save-dev babel-loader @babel/core @babel/preset-env @babel/preset-react
    ```

    - Add the below settings inside `webpack.config.js` file:

    ```javascript
    {
      module: {
        rules: [
          {
            test: /\.m?js$/,
            exclude: /node_modules/,
            use: {
              loader: "babel-loader",
              options: {
                presets: ["@babel/preset-env"],
              },
            },
          },
        ];
      }
    }
    ```

    - Create `babel.config.json` or `.babelrc` configuration file and add:

    ```json
    {
      "presets": ["@babel/preset-env", "@babel/preset-react"]
    }
    ```

12. Install `react` and `react-dom` as regular dependencies:

    ```bash
    npm install --save react react-dom
    ```

13. Now all the basic setup is done and you can proceed with working on the project.

::: tip NOTE
If you are using a boilerplate generator such as create-react-app, you don't need to worry about the initial setup. You can just start working on the project which has been scaffolded.
:::

### Babel

Babel is a free and open-source JavaScript transpiler that is mainly used to convert ECMAScript 2015+ code into a backwards compatible version of JavaScript that can be run by older JavaScript engines.

- Babel is required to convert the React [JSX](#javascript-xml-jsx) syntax to JavaScript syntax that most of the browsers can interpret.

- Babel looks for the JSX/JavaScript code in the HTML file where the script tag contains `type=text/babel`.

```html
<!-- React Library & React DOM -->
<script src="https://unpkg.com/react/umd/react.development.js"></script>
<script src="https://unpkg.com/react-dom/umd/react-dom.development.js"></script>
<script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>

<script type="text/babel">
  // JSX code here. Or link to separate JavaScript file that contains JSX.
</script>
```

## Introduction

A simple web page will consist of an HTML file like `index.html`, this file will contain references to stylesheets or inline-styles and references to JavaScript file files or in-line JavaScript code.

Similarly, a simple React application will have all these three thing. Just that instead of the normal JavaScript code React uses an extended version of JavaScript called [JSX](#javascript-xml-jsx). In the below example inside the script tag with type `text/babel` is the React code.

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>Hello, World!</title>
  </head>
  <body>
    <div id="root"></div>

    <!-- React Library & React DOM -->
    <script src="https://unpkg.com/react/umd/react.development.js"></script>
    <script src="https://unpkg.com/react-dom/umd/react-dom.development.js"></script>
    <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>

    <script type="text/babel">
      // JSX code here. Or link to separate JavaScript file that contains JSX.

      // REACT COMPONENT
      function Welcome() {
        return <h1>Hello, World!</h1>;
      }

      // RENDER THE REACT COMPONENT
      ReactDOM.render(<Welcome />, document.getElementById("root"));
    </script>
  </body>
</html>
```

In the above example we have used HTML like element `<h1>` inside a JavaScript function which should cause an error, but you will not get any errors in the browser and the we will see the result in the browser.

This is because React uses an extended version JavaScript called [JSX](#javascript-xml-jsx). This new JSX syntax allows us to use HTML like tags inside JavaScript code.

### Virtual DOM

When we use React, you usually don't deal with DOM elements directly. Instead, you create elements for a **"Virtual DOM"**.

Virtual DOM is an **in-memory**, **lightweight representation of the DOM**.

- These elements are really nothing but JSON objects. They represent the underlying DOM structure but don't carry any of the weight of actual DOM elements.

- React converts these virtual elements into real DOM elements as necessary. This process of finding the minimum number of changes that must be made in order to make the virtual DOM tree and the actual DOM tree identical is called **reconciliation**.

- React uses Virtual DOM as direct DOM manipulation is a slow and performant task.

### JavaScript XML (JSX)

**React uses JSX** instead of vanilla to provide a concise syntax for creating complex DOM trees with attributes.

JSX combines JavaScript and XML, to extend JavaScript that allows us to define React elements using a tag-based syntax directly within our JavaScript code. Using HTML inside JavaScript Code.

- JSX allows nested components

  ```jsx
  <TodoList>
    <Todo />
    <Todo />
    <Todo />
  </TodoList>
  ```

- Since `class` is a reserved word in JavaScript, `className` is used to define the class attribute instead:

  ```jsx
  <h1 className="aliens">Hello, World!</h1>
  ```

- JavaScript expressions are wrapped in curly braces and indicate where variables will be evaluated and their resulting values returned.

  ```jsx
  <h1>{title}</h1>
  ```

- JavaScript code is evaluated inside the curly braces:

  ```jsx
  <h1>{"Hello, " + title}</h1>
  <h2>{author.toUpperCase()}</h2>
  <p>{5 + 10}</p>
  ```

### ReactDOM

The `ReactDOM.render()` method takes two arguments:

1. The HTML-like elements (a.k.a. **JSX**) you want to output.

2. The **location in the DOM** where React will render the JSX into.

   ```jsx
   ReactDOM.render(<h1>Sherlock Holmes</h1>, document.querySelector("#container");
   ```

### React Element

A React element look similar to the HTML elements and describe how React should render the actual DOM element.

- Create a React element which represents `h1` using `React.createElement`:

```jsx
React.createElement("h1", { id: "recipe-0" }, "Baked Salmon");
```

- This will be converted to actual DOM element by React:

```jsx
<h1 id="recipe-0">Baked Salmon</h1>
```

- This React element has similar properties applied to new DOM elements.

```javascript
{
  $$typeof: Symbol(React.element),
  "type": "h1",
  "key": null,
  "ref": null,
  "props": {id: "recipe-0", children: "Baked Salmon"},
  "_owner": null,
  "_store": {}
}
```

In the above piece of code:

- `type`: Which type of HTML or SVG element to create.
- `props`: Represents the data and child elements required to construct a DOM element.
- `children`: Displaying other nested elements or text.

### React Fragments

Let us create a React component:

```jsx
function Welcome({ name }) {
  return <h1>Welcome {name}</h1>;
}

ReactDOM.render(<Welcome name="Mort" />, document.getElementById("root"));
```

If we add an adjacent element to `h1` inside the `Welcome()` function (as shown below), we will get an error, because React expects component to return only one parent element.

```jsx
function Welcome({name}) {
  return (
    <h1>Welcome {name}</h1>
    <p>To the world of React</p>);
}

ReactDOM.render(<Welcome name="Mort" />, document.getElementById("root"));
```

To overcome these errors, we should wrap the two elements with a parent element such as a `div`:

```jsx
function Welcome({ name }) {
  return (
    <div>
      <h1>Welcome {name}</h1>
      <p>To the world of React</p>
    </div>
  );
}

ReactDOM.render(<Welcome name="Mort" />, document.getElementById("root"));
```

In cases where parent element such as `div` tag are unnecessary, React (16.2>) provides an inbuilt element called `React.Fragment` which mimics the behavior of a wrapper without actually creating a new tag:

```jsx
function Welcome({ name }) {
  return (
    <React.Fragment>
      <h1>Welcome {name}</h1>
      <p>To the world of React</p>
    </React.Fragment>
  );
}
```

An alternate syntax:

```jsx
function Welcome({ name }) {
  return (
    <>
      <h1>Welcome {name}</h1>
      <p>To the world of React</p>
    </>
  );
}
```

In the DOM, the fragment is not visible in the resulting tree:

```html
<h1>Welcome Mort</h1>
<p>To the world of React</p>
```

### React Factory

`React.createFactory` is just a helper that binds your component class to `React.createElement` so you can make your own factories.

`React.DOM` gives a bunch of factories for HTML elements.

```javascript
Greeting = React.createFactory(GreetingClass);

React.render(
  React.DOM.div({id: "greeting-container", className: "container"},
    Greeting({name: "World"})
  ),
  document.getElementById("root"))
);
```

::: danger DEPRECATED
React components can no longer be called directly like this. Instead use JSX. See [React Factories](https://reactjs.org/warnings/legacy-factories.html).
:::

## React Component

React components are reusable chunks of JavaScript that output (via JSX) HTML elements.

- Components are the building block of React UI.

- At a bare minimum, a React component is simply a JavaScript class with a render method that returns a description of the component's UI:

```jsx
class Hello extends React.Component {
  render() {
    return <h1>Hello, World!</>;
  }
}
```

Ways to create a React component:

- When React was first made open source in 2013, there was one way to create a component: `createClass`. The use of `React.createClass` to create a component looks like this:

  ```javascript
  const IngredientsList = React.createClass({
    displayName: "IngredientsList",
    render() {
      return React.createElement(
        "ul",
        { className: "ingredients" },
        this.props.items.map((ingredient, i) =>
          React.createElement("li", { key: i }, ingredient)
        )
      );
    },
  });
  ```

  Components that used `createClass` would have a `render()` method that described the React element(s) that should be returned and rendered. The idea of the component was the same: we'd describe a reusable bit of UI to render.

::: danger DEPRECATED
In React 15.5 (April 2017), React started throwing warnings if `createClass` was used. In **React 16 (September 2017), `React.createClass` was officially deprecated** and was moved to its own package, `create-react-class`.
:::

- Using class syntax added to JavaScript with ES2015. React added `React.Component` API that allowed the use of class syntax to create a new component:

  ```javascript
  class IngredientsList extends React.Component {
    render() {
      return React.createElement(
        "ul",
        { className: "ingredients" },
        this.props.items.map((ingredient, i) =>
          React.createElement("li", { key: i }, ingredient)
        )
      );
    }
  }
  ```

::: tip HEADS-UP
This syntax may as well be deprecated in near future.
:::

## Props

A key factor to make components reusable and composable is the **ability to configure** them, and **React provides properties (props)** for doing so.

**Props are the mechanism used in React for passing data from parent to child components**.

- They **can't be changed from inside the child component** (immutable); props are **passed and "owned" by the parent**.

```jsx
import React, { Component } from "react";

// Parent Component
class GroceryList extends Component {
  render() {
    return (
      <ul>
        <ListItem quantity="1" name="Bread" />
        <ListItem quantity="6" name="Eggs" />
        <ListItem quantity="2" name="Milk" />
      </ul>
    );
  }
}

// Child Component
class ListItem extends Component {
  render() {
    return (
      <li>
        {this.props.quantity} × {this.props.name}
      </li>
    );
  }
}

React.render(<GroceryList />, document.getElementById("root"));
```

The content between the opening and closing tags using `props.children`:

```jsx
import React, { Component } from "react";

// Parent Component
class GroceryList extends Component {
  render() {
    return (
      <ul>
        <ListItem quantity="1">Bread</ListItem>
        <ListItem quantity="6">Eggs</ListItem>
        <ListItem quantity="2">Milk</ListItem>
      </ul>
    );
  }
}

// Child Component
class ListItem extends Component {
  render() {
    return (
      <li>
        {this.props.quantity} × {this.props.children}
      </li>
    );
  }
}

React.render(<GroceryList />, document.getElementById("root"));
```

### Prop Validation

When creating components, it is good practice to specify which props can be used, which ones are required, and which types of values they accept.

This can be done by declaring `propTypes`.

| Type      | Validator                |
| --------- | ------------------------ |
| Arrays    | `React.PropTypes.array`  |
| Boolean   | `React.PropTypes.bool`   |
| Functions | `React.PropTypes.func`   |
| Numbers   | `React.PropTypes.number` |
| Objects   | `React.PropTypes.object` |
| Strings   | `React.PropTypes.string` |

```jsx
import React, { Component, PropTypes } from "react";
import { render } from "react-dom";

class Greeter extends Component {
  render() {
    return <h1>{this.props.salutation}</h1>;
  }
}

Greeter.propTypes = {
  salutation: PropTypes.string.isRequired,
};

render(<Greeter salutation="Hello World" />, document.getElementById("root"));
```

You can combine multiple `propTypes`:

| Validator              | Description                                                                                            |
| ---------------------- | ------------------------------------------------------------------------------------------------------ |
| `PropTypes.oneOfType`  | Any one of the type: `PropTypes.oneOfType([PropTypes.string, PropTypes.number])`                       |
| `PropTypes.arrayOf`    | Array of certain type: `PropTypes.arrayOf(PropTypes.string)`                                           |
| `PropTypes.objectOf`   | Object with property values of certain type                                                            |
| `PropTypes.shape`      | Object with particular shape `PropTypes.shape({color: PropTypes.string, fontSize: PropTypes.number});` |
| `PropTypes.node`       | Any value                                                                                              |
| `PropTypes.element`    | React element                                                                                          |
| `PropTypes.instanceOf` | Instance of a given class                                                                              |
| `PropTypes.oneOf`      | One of the options in an enum: `PropTypes.oneOf(['News', 'Photos'])`                                   |

::: tip NOTE

PropTypes and TypeScript can be used together as type checkers.

- PropTypes: Runtime Type Check
- TypeScript: Static Type Check

:::

### Default Props

We can provide default values for props.

Using the same example from prop validation, remove `isRequired`, and add the default value:

```javascript
Greeter.propTypes = {
  salutation: PropTypes.string.isRequired,
};

Greeter.defaultProps = {
  salutation: "Hello, World!",
};
```

## State

In React **`props` are immutable**. This leads to static components.

To have mutable data to represent the state of that component, React provides a private object called `this.state` whose data can be changed by calling `this.setState()`.

- The state object needs to be initialized inside the constructor function else it **will have `null` value**

```javascript
class Card extends Component {
  constructor() {
    super();
    this.state = {
      showDetails: false,
    };
  }

  render() {
    return (...);
  }
}
```

- To update the state we should always use the React provided function called `this.setState({})`. It takes the new values of the state
- This is because React uses `this.setState({})` method to track the changes happening to the state of the component.
- Whenever **component's internal state changes** the **component is rendered again**, so to avoid this the state changes need to be kept to minimum.
- `this.setState({})` will only update the state values that are passed as the parameter and the rest remain unchanged

- You can **access previous state** while setting new state by passing a callback function instead of new object inside `this.setState()`:

```javascript
this.setState((prevState) => {
  return { count: prevState.count + 1 };
});
```

- You can access props inside `this.setState()` by using the second parameter of the callback function:

```javascript
this.setState((prevState, props) => {
  return { count: prevState.count + 1 };
});
```

::: tip NOTE

If you want to access `this.props` inside the constructor, you need to pass props to `constructor()` and `super()`. And if you just need `props` inside the constructor, you need to pass props to `constructor()`:

1. Not passing props:

   ```javascript
   constructor() {
     super();
     console.log(this.props) // undefined
   }

   // OR

   constructor(props) {
     super();
     console.log(this.props) // undefined
     console.log(props) // props object
   }
   ```

2. Passing props will require us to pass props to constructor as well:

   ```javascript
   constructor(props) {
     super(props);
     console.log(this.props) // props object
     console.log(props) // props object
   }
   ```

:::

::: danger STATE MUTATION

- Do not mutate the state directly as it breaks the React's state management and JavaScript copies objects and arrays by reference, hence causing unexpected behaviors.

- If the state is directly mutate React will not know about the state change and hence it will not render the component with the latest state change.

:::

**React immutability helper**: React provides an add-on to help in changing objects in immutable way.

```bash
npm install --save react-addons-update
```

Usage:

```javascript
let student = { name: "John Caster", grades: ["A", "C", "B"] };

let newStudent = update(student, { grades: { $push: ["A"] } });
```

## Events

React implements a **synthetic event system**.

JSX makes use of HTML like event handling API, with some small changes in the naming scheme. Like the event names (`onclick`) are in camel case (`onClick`).

- Use camel-case for event names.
- Cannot `return false` to prevent default behavior in React as of in HTML.

```jsx
<a
  href="#"
  onclick="console.log('The link was clicked.'); 
return false"
>
  {" "}
  Click me{" "}
</a>
```

```jsx
function ActionLink() {
  function handleClick(e) {
    e.preventDefault();
    console.log("The link was clicked.");
  }
  return (
    <a href="#" onClick={handleClick}>
      {" "}
      Click me{" "}
    </a>
  );
}
```

::: danger XSS
React provides the `dangerouslySetInnerHTML` property to skip XSS protection and render anything directly.

Add a layer of security with [DOMPurify](https://github.com/cure53/DOMPurify).

To convert Markdown to HTML use [markedjs/marked](https://github.com/markedjs/marked).
:::

## Styling

React supports both inline styling and external CSS.

React's component inline styles are specified as a JavaScript object with style names in camel case:

```jsx
<div style={{ width: 10, height: "100%", fontSize: "2em" }}>Hello, World!</div>
```

React inline styles have the following advantages:

- Scoped styles without selectors
- Avoids specificity conflicts
- Source order independence

It is better to use an external CSS file (or CSS preprocessor such as Sass or Less) for major style definitions and use **inline styling for dynamic, state-based appearance**.

## Keys

Although React's virtual DOM and differing algorithms are very smart, in order to be fast.

React makes some assumptions and takes a naive approach in some cases. Also, it is very tricky when dealing with any list of repeating items.

React introduced the `key` attribute. Keys are unique identifiers that allow for fast loop-ups between trees for the elements.

::: tip NOTE
Always provide a `key` attribute when creating an list of repeating items.
:::

## Refs

When we use React we directly don't interact with the actual DOM, instead we deal with the virtual DOM created by React.

Refs provide a way to access DOM nodes or React elements created in the render method.

When to Use Refs:

- Managing focus, text selection, or media playback.
- Triggering imperative animations.
- Integrating with third-party DOM libraries.

Avoid using refs for anything that can be done declaratively.

For example, instead of exposing `open()` and `close()` methods on a `Dialog` component, pass an `isOpen` prop to it.

::: tip NOTE
`ref` updates happen before `componentDidMount` or `componentDidUpdate` lifecycle methods.
:::

### Creating Refs

1. We create a class property which will hold the element/component ref using `React.createRef()` (React 16.3) and attach it to the React element via the `ref` attribute. Refs are commonly assigned to an instance property when a component is constructed so they can be referenced throughout the component.

   ```jsx
   class MyComponent extends React.Component {
     constructor(props) {
       super(props);
       this.myRef = React.createRef();
     }
     render() {
       return <div ref={this.myRef} />;
     }
   }
   ```

2. Using **"callback refs"**, which gives more fine-grain control over when refs are set and unset.

   - Instead of passing a s`ref` attribute created by `createRef()`, you can pass a function.
   - The function receives the React component instance or HTML DOM element as its argument, which can be stored and accessed elsewhere.

   ```jsx
   class CustomTextInput extends React.Component {
     constructor(props) {
       super(props);

       this.textInput = null;

       this.setTextInputRef = (element) => {
         // element will be a DOM element or a React component when the component mounts
         // element will be null when the component unmounts
         this.textInput = element;
       };

       this.focusTextInput = () => {
         // Focus the text input using the raw DOM API
         if (this.textInput) this.textInput.focus();
       };
     }

     componentDidMount() {
       // autofocus the input on mount
       this.focusTextInput();
     }

     render() {
       // Use the `ref` callback to store a reference to the text input DOM
       // element in an instance field (for example, this.textInput).
       return (
         <div>
           <input type="text" ref={this.setTextInputRef} />
           <input
             type="button"
             value="Focus the text input"
             onClick={this.focusTextInput}
           />
         </div>
       );
     }
   }
   ```

::: warning CAVEATS WITH CALLBACK REFS
If the `ref` callback is defined as an inline function, it will get called twice during updates, first with `null` and then again with the DOM element. This is because a new instance of the function is created with each render, so React needs to clear the old ref and set up the new one. You can avoid this by defining the `ref` callback as a bound method on the class, but note that it shouldn't matter in most cases.
:::

3. _Legacy API_: String Refs

   - The `ref` attribute is a string, like `myTextInput`, and the DOM node is accessed as `this.refs.textInput`

   ```jsx
   class FocusText extends Component {
     handleClick() {
       // Explicitly focus the text input using the raw DOM API
       this.refs.myTextInput.focus();
     }

     render() {
       return (
         <div>
           <input type="text" ref="myTextInput" />
           <input
             type="button"
             value="Focus the text input"
             onClick={this.handleClick.bind(this)}
           />
         </div>
       );
     }
   }
   ```

::: danger WILL BE DEPRECATED
Don't use this way of creating refs, they have [some issues](https://github.com/facebook/react/pull/8333#issuecomment-271648615), will be deprecated in the future.
:::

### Accessing Refs

When a ref is passed to an element in `render`, a reference to the node becomes accessible at the `current` attribute of the ref.

```javascript
const node = this.myRef.current;
```

The value of the ref differs depending on the type of the node:

- When the `ref` attribute is used on an HTML element, the `ref` created in the constructor with `React.createRef()` receives the underlying DOM element as its `current` property.
- When the `ref` attribute is used on a custom class component, the `ref` object receives the mounted instance of the component as its `current`.
- **You may not use the ref attribute on function components** because they don't have instances.

_Example_: Adding a ref to a DOM element

```jsx
class CustomTextInput extends React.Component {
  constructor(props) {
    super(props);
    // create a ref to store the textInput DOM element
    this.textInput = React.createRef();
    this.focusTextInput = this.focusTextInput.bind(this);
  }

  focusTextInput() {
    // Explicitly focus the text input using the raw DOM API
    // Note: we're accessing "current" to get the DOM node
    this.textInput.current.focus();
  }

  render() {
    // tell React that we want to associate the <input> ref
    // with the `textInput` that we created in the constructor
    return (
      <div>
        <input type="text" ref={this.textInput} />
        <input
          type="button"
          value="Focus the text input"
          onClick={this.focusTextInput}
        />
      </div>
    );
  }
}
```

_Example_: Adding a Ref to a Class Component

- If we wanted to wrap the `CustomTextInput` above to simulate it being clicked immediately after mounting, we could use a ref to get access to the custom input and call its `focusTextInput` method manually:

```jsx
class AutoFocusTextInput extends React.Component {
  constructor(props) {
    super(props);
    this.textInput = React.createRef();
  }

  componentDidMount() {
    this.textInput.current.focusTextInput();
  }

  render() {
    return <CustomTextInput ref={this.textInput} />;
  }
}
```

_Example_: Refs and Function Components

- By default, **you may not use the ref attribute on function components** because they don't have instances:

_The below code will not work_:

```jsx
function MyFunctionComponent() {
  return <input />;
}

class Parent extends React.Component {
  constructor(props) {
    super(props);
    this.textInput = React.createRef();
  }
  render() {
    // This will *not* work! the ref this.textInput will be null
    return <MyFunctionComponent ref={this.textInput} />;
  }
}
```

- You can, however, **use the ref attribute inside a function component** as long as you refer to a DOM element or a class component:

```jsx
function CustomTextInput(props) {
  // textInput must be declared here so the ref can refer to it
  const textInput = useRef(null);

  function handleClick() {
    textInput.current.focus();
  }

  return (
    <div>
      <input type="text" ref={textInput} />
      <input type="button" value="Focus the text input" onClick={handleClick} />
    </div>
  );
}
```

### Forwarding Refs

In some cases we need to expose DOM refs to Parent Components. There are few ways to achive this. It is recommended to use **ref forwarding** in React 16.3 or higher,

::: danger ADD NOTES HERE
Check this [Link](https://reactjs.org/docs/forwarding-refs.html).
:::

Ref forwarding is a technique for automatically passing a ref through a component to one of its children. Ref forwarding lets components opt into exposing any child component's ref as their own.

For React 16.2 and earlier doesn't yet support ref forwarding. We can use the below technique:

- Expose a special prop on the child.
- This prop can be named anything other than `ref` (e.g. `inputRef`).
- The child component can then forward the prop to the DOM node as a ref attribute.
- This lets the parent pass its ref to the child's DOM node through the component in the middle.
- This pattern is that it works several components deep.
- Check out [DOM ref forwarding alternatives](https://gist.github.com/gaearon/1a018a023347fe1c2476073330cc5509)

_Example_:

```jsx
function CustomTextInput(props) {
  return (
    <div>
      <input ref={props.inputRef} />
    </div>
  );
}

class Parent extends React.Component {
  constructor(props) {
    super(props);
    this.inputElement = React.createRef();
  }
  render() {
    return <CustomTextInput inputRef={this.inputElement} />;
  }
}
```

::: warning DON'TS
Don't Overuse Refs
:::

## Component Life Cycle Methods

React life cycle methods are methods that are executed in certain occasions throughout the life cycle of the component.

They are divided as:

- Mounting
- Update
- Unmount

They are **available only in Class based components** and not present in functional components.

### Mounting Life Cycle Methods

**Mounting** is creating new instance of a component and inserting into the DOM.

1. `constructor`: The first thing that gets called is your component constructor, if your component is a class component. This does not apply to functional components.

   - `super()` must be called at the start inside the constructor

   - Setting up [state](#state)
   - Creating [refs](#refs)
   - Method binding: `this.handleClick = this.handleClick.bind(this)`

   ```javascript
   class MyComponent extends Component {
     constructor(props) {
       super(props);
       this.state = {
         counter: 0,
       };
     }
   }
   ```

   - Writing a constructor is optional, and you can initialize your state like so if your babel setup has support for **class fields**:

   ```javascript
   class MyComponent extends Component {
     state = {
       counter: 0,
     };
   }
   ```

   - _Constructor_ is required to call `createRef` or method binding

2. `componentDidMount`: **Invoked once, immediately after the initial rendering** occurs. At this point, the component has a DOM representation that can be accessed (useful for data fetching). This is not invoked during component re-rendering after the component has been mounted.

   - API calls are made here
   - Add event listeners

::: tip NOTE
Components whose single responsibility is to communicate with the remote API, and passing data and callbacks down as props are called **container component**.
:::

::: danger DEPRECATED
These have be deprecated:

`componentWillMount`: Invoked once, immediately before the initial rendering occurs. Setting state here will not trigger a re-rending.
:::

### Updating Life Cycle Methods

**Updating** is re-rendering the component. Based on changes occurring in component props or state.

**Prop Changes** and **State Changes**:

1. `shouldComponentUpdate`: **Called before the render function** and it gives the opportunity to **define if a re-rendering is needed or can be skipped**.

   ```javascript
   shouldComponentUpdate(nextProps, nextState) {
     // return true if render is called on props or state change
     // return false if render is not required
   }
   ```

2. `componentDidUpdate`: **Invoked immediately after the component's updates are flushed to the DOM**. This method is not called for the initial render.

   ```javascript
   componentDidUpdate(prevProps) {
     // Typical usage (don't forget to compare props):
   }
   ```

3. `getSnapshotBeforeUpdate` (NEW): Invoked right before the most recently rendered output is committed to e.g. the DOM. It enables your component to capture some information from the DOM (e.g. scroll position) before it is potentially changed. Any value returned by this lifecycle method will be passed as a parameter to `componentDidUpdate()`

   - A snapshot value (or `null`) should be returned
   - Use case is not common

   ```javascript
   getSnapshotBeforeUpdate(prevProps, prevState) {
       return null;
     }

   componentDidUpdate(prevProps, prevState, snapshot) {
     }
   ```

::: danger DEPRECATED

These have be deprecated:

1. `componentWillReceiveProps`: Invoked when a component is receiving new props. Calling `this.setState()` will not trigger re-rendering.

2. `componentWillUpdate`: Invoked immediately before rending when new props or state being received. State change via `this.setState` is not allowed as this function should be strictly used to prepare for upcoming update and not trigger an update itself.

:::

### Unmounting Life Cycle Methods

Unmounting is when a component is being removed from the DOM.

1. `componentWillUnmount`: **Invoked once, immediately before a component is unmounted from the DOM**. Used for clean-up operations like removing any event listener's timers defined in mounting life cycle.

   - Tear down or clean up tasks or code that will otherwise clutter the app before the component disappears
   - Remove event listeners

   ```javascript
   componentWillUnmount() {
       // tear down or cleanup
     }
   ```

### Other Life Cycle Methods

Life cycle methods that are triggered during Mount and Updating:

1. `render()`: Invoked before the component is mounted and then whenever the [State](#state) or [Props](#props) changes. It should always return React element.

2. `getDerivedStateFromProps` (NEW): Invoked right before calling the render method, both on the initial mount and on subsequent updates. It should return an object to update the state, or null to update nothing.

   - resetting a video or audio element when the source changes
   - refreshing a UI element with updates from the server
   - closing an accordion element when the contents change

   ```javascript
   static getDerivedStateFromProps(props, state) {
     if (state.blocks.length > 0) {
       return {};
     }
     return { blocks: createBlocks(props.numberOfBlocks) };
   }
   ```

- Checkout this link which suggests to use this method only in rare cases [You probably don't need derived state](https://reactjs.org/blog/2018/06/07/you-probably-dont-need-derived-state.html)

## Forms

Handling forms in react is a bit different from how they are in plain HTML:

- In HTML, form elements such as `<input>`, `<textarea>`, and `<select>` typically maintain their own state and update it based on user input. Form data is usually handled by the DOM

- In React, we can **use state property of the component to maintain form data and be the "single source of truth"**. This way the component that renders a form also controls what happens in that form on subsequent user input.

React form elements share the same HTML semantic element name and its attributes as props, with some exceptions such as:

- Instead of `for=` use `htmlFor=`
- The `textarea` tag of HTML is slightly different in React as the inner-text of this will be represented by the `value` prop:

  ```html
  // THIS WILL CAUSE AN ERROR
  <textarea>This is the description.</textarea>

  // THIS IS THE CORRECT USAGE
  <textarea value="This is the description." />
  ```

- In HTML, you set the selected option using the `selected` attribute on the option tag. In React, in order to make components easier to manipulate, the following format is adopted instead:

  ```html
  <select value="B">
    <option value="A">Mobile</option>
    <option value="B">Work</option>
    <option value="C">Home</option>
  </select>
  ```

### Controlled Components

An input form element whose value is controlled by React is called a "controlled input or Controlled Component".

- The form data is stored in component's state property
- As state is immutable, user won't be able to provide any input from the form's user interface
- To enable user input, we need to implement `handleChange` method to update the state based on user input
- As state will contain all the form's data, on submit this can be passed on to an API call or for further processing

Lets create a simple input form which takes users first-name. Please find the code below:

_Example_:

```jsx
class UserForm extends Component {
  render() {
    return (
      <form>
        <label htmlFor="firstName">First Name</label>
        <input id="firstName" type="text" />
        <button type="submit">Submit</button>
      </form>
    );
  }
}
```

- Here we have an input element whose value is **not tracked by the React. Hence, it is an [Uncontrolled Component](#uncontrolled-component)**
- To make it a controlled component, we need to track the input value through the component's state. So we will add a key `firstName` to the state object:

```jsx
class UserForm extends Component {
  state = {
    firstName: "",
  };

  render() {
    return (
      <form>
        <label htmlFor="firstName">First Name</label>
        <input id="firstName" type="text" />
        <button type="submit">Submit</button>
      </form>
    );
  }
}
```

- Now the state needs to change based on user input. For that we need to implement `handleChange` method and attach it to `onChange` event of the input element:

```jsx
class UserForm extends Component {
  constructor(props) {
    super(props);
    state = {
      firstName: "",
    };
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(event) {
    this.setState({
      firstName: event.target.value,
    });
  }

  render() {
    return (
      <form>
        <label htmlFor="firstName">First Name</label>
        <input id="firstName" type="text" onChange={this.handleChange} />
        <button type="submit">Submit</button>
      </form>
    );
  }
}
```

- The input element's value is now tracked by React. But, this is still not a controlled component. Because, due to some business logic the `this.state.firstName` is changed outside of the form's interface (in code without any user action), this will not be reflected in the user interface. As, the input element's value is independent of the state, currently it only updates the state.
- To correct this the input element's value should be bound to the state. This can be done by assigning the state to the input value, such as:

```jsx
class UserForm extends Component {
  constructor(props) {
    super(props);
    state = {
      firstName: "",
    };
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    this.setState({
      firstName: event.target.value,
    });
  }

  handleSubmit(event) {
    alert("First name was submitted: " + this.state.firstName);
    event.preventDefault();
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label htmlFor="firstName">First Name</label>
        <input
          id="firstName"
          type="text"
          onChange={this.handleChange}
          value={this.state.firstName}
        />
        <button type="submit">Submit</button>
      </form>
    );
  }
}
```

- This form is driven by the state and user actions update the state. `handleSubmit` method is used to handle the form submit event.

_Example_:

- If there are multiple input elements, there is not need to write separate `handleChange` method. We can modify the code shown in the previous example as:

```jsx
class UserForm extends Component {
  constructor(props) {
    super(props);
    state = {
      firstName: "",
      emailId: ""
    };
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(event) {
    const { name } = event.target;
    const value = event.target.type === "checkbox" ? event.target.checked : event.target.value;

    this.setState({
        [name]: value
    });
  }

  render() {
    return (
        <input name="firstName" type="text" onChange={this.handleChange} value={this.state.firstName} />
        <input name="emailId" type="email" onChange={this.handleChange} value={this.state.firstName} />
    );
  }
}
```

- There only few updates:

  - All form elements will require to have the name prop to be set same as the key name used in the state object to track that particular element.
  - Ternary operator is used to determine the value as all elements have user data in their value props except checkboxes which have boolean data in the checked prop.
  - Using the ES6 computed property name syntax the state key can be updated using the corresponding input name.

Good to know:

- If you hard code the value of any input element such as `<input type="text" value="Panda" />`.
- In the interface the user will see input box with value "Panda". But the input field will not be editable.
- This is because React has declared the value to be "Panda". It will override any value user inputs and makes it "Panda".

Advantages of this way is:

- The form data is kept out of the interface and is entirely managed by the code. This is the React way of handling components.
- This pattern helps to implement interfaces that respond to or validate user interactions.

::: warning NOTE

- You can pass an array into the `value` prop, allowing you to select multiple options in a `select` tag: `<select multiple={true} value={['B', 'C']}>`
- The **file input** tag's value is read-only, and hence it is an **uncontrolled** component in React.

:::

### Uncontrolled Components

In a [controlled component](#controlled-component), form data is handled by a React component. The alternative is **uncontrolled components, where form data is handled by the DOM itself**.

Controlled components adhere to React's principles and have their advantages. In most cases, controlled components are recommended.

While uncontrolled components are an anti-pattern for how most other components are constructed in React, sometimes you don't need to oversee the user input field by field like in simple forms.

- To write an uncontrolled component, instead of writing an event handler for every state update, you can use a `ref` to get form values from the DOM:

```jsx
class UserForm extends Component {
  constructor(props) {
    super(props);
    this.handleChange = this.handleChange.bind(this);
    this.input = React.createRef();
  }

  handleSubmit(event) {
    alert("First name was submitted: " + this.input.current.value);
    event.preventDefault();
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label htmlFor="firstName">First Name</label>
        <input name="name" type="text" />
        <button type="submit">Submit</button>
      </form>
    );
  }
}
```

- **Default Values**: In the React rendering lifecycle, the `value` attribute on form elements will override the value in the DOM. With an uncontrolled component, you often want React to specify the initial value, but leave subsequent updates uncontrolled. To handle this case, you can specify a `defaultValue` attribute instead of `value`.

- Likewise, `<input type="checkbox">` and `<input type="radio">` support `defaultChecked`, and `<select>` and `<textarea>` supports `defaultValue`

```jsx
render() {
  return (
    <form onSubmit={this.handleSubmit}>
      <label>
        Name:
        <input
          defaultValue="Bob"
          type="text"
          ref={this.input} />
      </label>
      <input type="submit" value="Submit" />
    </form>
  );
}
```

#### File Input Tag

- In HTML, an `<input type="file">` lets the user choose one or more files from their device storage to be uploaded to a server or manipulated by JavaScript via the File API.

- n React, an file input element is always an uncontrolled component because its value can only be set by a user, and not programmatically.

- We need to use the File API to interact with the files.

_Example_: Using ref to the DOM node to access file(s) in submit handle:

```jsx
class FileInput extends React.Component {
  constructor(props) {
    super(props);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.fileInput = React.createRef();
  }
  handleSubmit(event) {
    event.preventDefault();
    alert(`Selected file - ${this.fileInput.current.files[0].name}`);
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>
          Upload file:
          <input type="file" ref={this.fileInput} />
        </label>
        <br />
        <button type="submit">Submit</button>
      </form>
    );
  }
}
```

Checkout [Formik](./Formik)

## CSS Animations

React provides a basic animation add-on called [react-transition-group](https://github.com/reactjs/react-transition-group/tree/v1-stable).
