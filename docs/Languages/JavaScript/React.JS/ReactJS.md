---
title: React.js
description: A JavaScript library for building user interfaces.
---

# React.js

A JavaScript library for building user interfaces.

- React works primarily in the View layer.

## Getting Started

For React to work in the browser, we need to include two libraries: React and ReactDOM.

1. **React** is the **library for creating views**.
2. **ReactDOM** is the **library used to render the UI in the browser**.

One more library called **[Babel](#babel)** is required to convert the React [JSX](#javascript-xml-jsx) syntax to JavaScript syntax that most of the browser can interpret.

To integrate React into the project, we can either:

- use CDN links to get the JS files of these two libraries and add them as script tags in `index.html` file.

  ```javascript
  <script src="https://unpkg.com/react/umd/react.development.js"></script>
  <script src="https://unpkg.com/react-dom/umd/react-dom.development.js"></script>
  <script src="https://unpkg.com/babel-standalone/babel.min.js"></script>
  ```

- or use `npm` tool to install these libraries as project dependencies.

  ```bash
  npm install --save react react-dom
  ```

- or use boilerplate generators, such as:

  - [create-react-app](https://create-react-app.dev/) application to generate the boilerplate. It is the recommended by official react guide.

## React Development Workflow

The most basic development workflow should allow:

1. Write JSX and transform it into JavaScript on the fly
2. Write code in a modular pattern
3. Manage dependencies
4. Bundle JavaScript files and use source maps for debugging

Basic project structure:

1. A source folder `src` containing all the user written JavaScript modules.
2. An `index.html` file. This is an empty page that the browser loads and React uses this to render the application's components into.
3. A `package.json` file. The `package.json` is a standard `npm` manifest file that holds various information about the project, such a name, description, information about the author, etc. It lets the developer specify dependencies (that can get automatically downloaded and installed) and define script tasks.
4. A **module packager or build tool**, which will be used for JSX transformation, and module/dependency bundling.

## Babel

Babel is a free and open-source JavaScript transcompiler that is mainly used to convert ECMAScript 2015+ code into a backwards compatible version of JavaScript that can be run by older JavaScript engines.

Babel is required to convert the React [JSX](#javascript-xml-jsx) syntax to JavaScript syntax that most of the browsers can interpret.

Babel looks for the JSX/JavaScript code in the HTML file where the script tag contains `type=text/babel`.

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

Similarly, a simple React application will have all these three thing. Just that instead of the normal JavaScript code React uses an extended version of JavaScript. In the below example inside the script tag with type `text/babel` is the React code.

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

This is because React uses an extended version JavaScript called [JSX](<#javascript-xml-(jsx)>). This new JSX syntax allows us to use HTML like tags inside JavaScript code.

### Virtual DOM

When we use React, you usually don't deal with DOM elements directly. Instead, you create elements for a "virtual DOM".

Virtual DOM is an in-memory, lightweight representation of the DOM.

These elements are really nothing but JSON objects. They represent the underlying DOM structure but don't carry any of the weight of actual DOM elements.

React converts these virtual elements into real DOM elements as necessary. This process of finding the minimum number of changes that must be made in order to make the virtual DOM tree and the actual DOM tree identical is called **reconciliation**.

React uses virtual DOM as direct DOM manipulation is a slow and per-formant task.

### JavaScript XML (JSX)

React uses JSX instead of vanilla to provide a concise syntax for creating complex DOM trees with attributes.

JSX combines JavaScript and XML, to extend JavaScript that allows us to define React elements using a tag-based syntax directly within our JavaScript code. Using HTML inside JavaScript Code.

- JSX allows nested components

  ```html
  <TodoList>
    <Todo />
    <Todo />
    <Todo />
  </TodoList>
  ```

- Since `class` is a reserved word in JavaScript, `className` is used to define the class attribute instead:

  ```html
  <h1 className="aliens">Hello, World!</h1>
  ```

- JavaScript expressions are wrapped in curly braces and indicate where variables will be evaluated and their resulting values returned.

  ```html
  <h1>{title}</h1>
  ```

- JavaScript code can be evaluated inside the curly braces:

  ```html
  <h1>{"Hello, " + title}</h1>
  <h2>{author.toUpperCase().replace}</h2>
  <p>{5 + 10}</p>
  ```

### ReactDOM

The **render()** method takes two arguments:

1. The HTML-like elements (a.k.a. JSX) you want to output.

2. The location in the DOM where React will render the JSX into.

   ```javascript
   ReactDOM.render(<h1>Sherlock Holmes</h1>, document.querySelector("#container");
   ```

### React Element

A React element look similar to the HTML elements and describe how React should render the actual DOM element.

- Create a React element which represents `h1` using `React.createElement`:

```javascript
React.createElement("h1", { id: "recipe-0" }, "Baked Salmon");
```

- This will be converted to actual DOM element by React:

```html
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

In the above pice of code:

- `type`: Which type of HTML or SVG element to create.
- `props`: Represents the data and child elements required to construct a DOM element.
- `children`: Displaying other nested elements or text.

### React Fragments

Let us create a React component:

```javascript
function Welcome({ name }) {
  return <h1>Welcome {name}</h1>;
}

ReactDOM.render(<Welcome name="Mort" />, document.getElementById("root"));
```

If we add another element to the `Welcome()` function, we will get an error, because React expects only one parent element.

```javascript
function Welcome({name}) {
  return (
    <h1>Welcome {name}</h1>
    <p>To the world of React</p>);
}

ReactDOM.render(<Welcome name="Mort" />, document.getElementById("root"));
```

To overcome these errors, we can wrap a `div` around these elements:

```javascript
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

In the above example the `div` tag is unnecessary, to overcome this React provides an inbuilt element called `React.Fragment` which mimics the behavior of a wrapper without actually creating a new tag:

```javascript
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

```javascript
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
<div id="root">
  <h1>Welcome Mort</h1>
  <p>To the world of React</p>
</div>
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

::: danger READ THIS
React Factories
:::

## React Component

React components are reusable chunks of JavaScript that output (via JSX) HTML elements.

Components are the building block of React UI.

At a bare minimum, a React component is simply a JavaScript class with a render method that returns a description of the component's UI:

```javascript
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

  In React 15.5 (April 2017), React started throwing warnings if `createClass` was used. In **React 16 (September 2017), `React.createClass` was officially deprecated** and was moved to its own package, create-react-class.

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

  This syntax may as well be deprecated in near future.

## Props

A key factor to make components reusable and composable is the ability to configure them, and **React provides properties (props)** for doing so. **Props are the mechanism used in React for passing data from parent to child components**.

They **can't be changed from inside the child component**; props are passed and **"owned" by the parent**.

```javascript
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
        {this.props.quantity}× {this.props.name}
      </li>
    );
  }
}

React.render(<GroceryList />, document.getElementById("root"));
```

The content between the opening and closing tags using props.children:

```javascript
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

```javascript
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

::: danger DEPRECATED
Seems to using alternative method.
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

To have mutable data to represent the state of that component React provides a private object called `this.state` whose data can be changed by calling `this.setState()`.

Initial state of a component can be set inside the constructor of the class:

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

Whenever component's internal state changes the component is rendered again, so to avoid this the state changes need to be kept to minimum.

::: danger STATE MUTATION
Do not mutate the state directly as it breaks the React's state management and JavaScript copies objects and arrays by reference, hence causing unexpected behaviours.
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
- Cannot `return false` to prevent default behaviour in React as of in HTML.

```javascript
<a
  href="#"
  onclick="console.log('The link was clicked.'); 
return false"
>
  {" "}
  Click me{" "}
</a>
```

```javascript
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

```javascript
<div style={{ width: 10, height: "100%", fontSize: "2em" }}>Hello, World!</div>
```

React inline styles have the following advantages:

- Scoped styles without selectors
- Avoids specificity conflicts
- Source order independence

It is better to use an external CSS file (or CSS preprocessors such as Sass or Less) for major style definitions and use **inline styling for dynamic, state-based appearance**.

## Forms

Form components in React can be handled in two ways:

- Controlled Components
- Uncontrolled Components

### Controlled Components

A form component with a value or checked prop is called a controlled component.

In a controlled component, the value rendered inside the element will always reflect the value of the prop.

By default the user won't be able to change it.

```javascript
import React, { Component } from "react";
import { render } from "react-dom";

class Search extends Component {
  render() {
    return (
      <div>
        Search Term: <input type="search" value="React" />
      </div>
    );
  }
}
```

In the above code, the user will see an input box with the value "React", but will not be change it. This is because React has declared the value to be "React".

To be able to change this value, it needs to be handled in component state. This way, any changes to the state value will be reflected in the interface.

```javascript
class Search extends Component {
  constructor() {
    super();
    this.state = {
      searchTerm: "React",
    };
  }
  render() {
    return (
      <div>
        Search Term:{" "}
        <input
          type="search"
          value={this.state.searchTerm}
          onChange={(event) =>
            this.setState({ searchTerm: event.target.value })
          }
        />
      </div>
    );
  }
}
```

The in the user input is handled through the `onChange` event handler.

Advantages of this way is:

- The state is kept out of the interface and is entirely managed by the code. This is the React way of handling components.
- This pattern helps to implement intefaces that respond to or validate user interactions.

::: warning TEXTAREA
The `textarea` tag of HTML is slightly different in React as the inner-text of this will be represented by the `value` prop:

```html
// THIS WILL CAUSE AN ERROR
<textarea>This is the description.</textarea>

// THIS IS THE CORRECT USAGE
<textarea value="This is the description." />
```

:::

::: warning SELECT
In HTML, you set the selected option using the “selected” attribute on the option tag. In React, in order to make components easier to manipulate, the following format is adopted instead:

```html
<select value="B">
  <option value="A">Mobile</option>
  <option value="B">Work</option>
  <option value="C">Home</option>
</select>
```

:::

### Uncontrolled Components

Controlled components adhere to React's principles and have their advantages. While uncontrolled components are an anti-pattern for how most other components are constructed in React, sometimes you don't need to oversee the user input field by field.

This is especially true in longer forms, where you want to let the user fill in the fields and then process everything when the user is done.

**Any input that does not supply a value is an uncontrolled component**, and the value of the rendered element will reflect the user's input.

```javascript
handleSubmit(event) {
  event.preventDefault();
  console.log(event.target.name.value + event.target.name.value);
}

render() {
  return (
    <form onSubmit={this.handleSubmit}>
      <div className="formGroup">
        Name: <input name="name" type="text" />
      </div>
      <div className="formGroup">
        E-mail: <input name="email" type="mail" />
      </div>
      <button type="submit">Submit</button>
    </form>
  );
}
```

## Keys

Although React's virtual DOM and differing algorithms are very smart, in order to be fast.

React makes some assumptions and takes a naive approach in some cases. Also, it is very tricky when dealing with any list of repeating items.

React introduced the `key` attribute. Keys are unique identifiers that allow for fast loop-ups between trees for the elements.

::: tip NOTE
Always provide a `key` attribute when creating an list of repeating items.
:::

## Refs

When we use React we directly don't interact with the actual DOM, instead we deal with the virtual DOM created by React.

For us to directly access the actual DOM, React provides a way to reference the elements through `refs`.

```javascript
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

## Component Life Cycle Methods

React life cycle methods are methods that are executed in certain occasions throughout the life cycle of the component.

They are divided as:

- Mounting
- Update
- Unmount

### Mounting Life Cycle Methods

**Mounting** is creating new instance of a component and inserting into the DOM.

1. `componentDidMount`: **Invoked once, immediately after the initial rendering** occurs. At this point, the component has a DOM representation that can be accessed (useful for data fetching).

- API calls are made here.

::: tip NOTE
Components whose single responsibility is to communicate with the remote API, and passing data and callbacks down as props are called **container component**.
:::

::: danger DEPRECATED
These have be deprecated:

1. `componentWillMount`: **Invoked once, immediately before the initial rendering** occurs. **Setting state** here **will not trigger a re-rending**.

:::

### Updating Life Cycle Methods

**Updating** is re-rendering the component.

Based on changes occurring in component props or state.

**Prop Changes**:

1. `shouldComponentUpdate`: **Called before the render function and it gives the opportunity to define if a re-rendering is needed or can be skipped**.

2. `componentDidUpdate`: **Invoked immediately after the component's updates are flushed to the DOM`**.

**State Changes**:

1. `shouldComponentUpdate`

2. `componentDidUpdate`

::: danger DEPRECATED
These have be deprecated:

1. `componentWillReceiveProps`: **Invoked when a component is receiving new props**. Calling `this.setState()` will not trigger re-rendering.

2. `componentWillUpdate`: **Invoked immediately before rending when new props or state being received**. State change via `this.setState` is not allowed as this function should be strictly used to prepare for upcoming update and not trigger an update itself.

:::

### Unmounting Life Cycle Methods

Unmounting is when a component is being removed from the DOM.

1. `componentWillUnmount`: **Invoked once, immediately before a component is unmounted from the DOM**. Used for clean-up operations like removing any event listener's timers defined in mounting life cycle.

## CSS Animations

React provides a basic animation add-on called [react-transition-group](https://github.com/reactjs/react-transition-group/tree/v1-stable).



