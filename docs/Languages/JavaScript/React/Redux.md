---
title: Redux
description: A Predictable State Container for JS Apps
---

# Redux

A Predictable State Container for JS Apps

- Redux was inspired by several important qualities of Flux architecture
- A change emitter holding a value
- _Reducers + Flux = Redux_

A complex state management tool, with a single store as CDS (Central Data Store)

- To change state of the app, we call an --> Action Creator --which produces an--> Action --which is fed to--> Dispatch --which forwards the action to--> Reducers --which creates new--> State --emit a change event to all the--> Subscribers --> then, wait until we need to update the state again

Core Concepts and Principles:

- Single source of truth
- State is read-only
- Changes are made with pure reducer functions

Redux Constraints:

- **Single state tree**
- **Actions describe updates**
- **Reducers apply updates**

This type of data flow enables:

- Hot reloading
- Time travel
- Log actions and states (as they are just plain objects)
- Find the bad state easily, check the action, and fix the reducer
- Easy to write tests

> "Redux is just a [dumb] event emitter"

## Flux Architecture

- Build to overcome constraints of MVC

Single direction data flow:

- **Action** --> **Dispatcher** --> **Store** --> **View**

- **View** --> **Action** --> the above cycle

## Store

It is the **Globalized State** of the application

_Example:_

```javascript
import { createStore } from "redux";

export const store = createStore(reducerFn);
```

Simplified version of `createStore`:

```javascript
const createStore = (reducer) => {
  let state;
  let listeners = [];

  const getState = () => state;

  const subscribe = (listener) => {
    listeners.push(listener);

    return function unsubscribe() {
      const index = listeners.indexOf(listener);
      listeners.splice(index, 1);
    };
  };

  const dispatch = (action) {
    state = reducer(state, action);
    listeners.forEach(listener => listener());
  }

  dispatch({});

  return { dispatch, subscribe, getState };
};
```

## Actions

Actions must be a plain JavaScript object

- To use `async` calls use a middleware such as [`redux-thunk`](#redux-thunk) or `redux-saga`

Actions have 2 properties:

- `type`: a **unique identifier** (required), usually written in capital letters
- `payload`: **data** (it is optional)

_Example:_

```javascript
// Action creator
const createAdd = (num) => {
  // Returns an action
  return {
    type: "ADD_ONE",
    payload: {
      addBy: num,
    },
  };
};
```

## Reducers

Manages the State and Returns the newly updated state

- They should be **synchronous functions**
- Must return any value besides `undefined`
- Should **always return new state**
- **Should not mutate the original state**
- **Should be side-effect free**
- Always provide a default state

_Example:_

```javascript
const defaultState = {
  counter: 0,
};

const reducerFn = (state = defaultState, action) => {
  switch (action.type) {
    case "INC":
      return { counter: state.counter + 1 };

    case "DEC":
      return { counter: state.counter - 1 };

    case "ADDBY":
      return { counter: state.counter + action.payload };

    default:
      return state;
  }
};
```

- Combine multiple reducers

```javascript
import { createStore, combineReducers } from "redux";

const allReducers = combineReducers({
  reducerFn,
  // ...
});

const store = createStore(allReducers);
```

## Dispatch

Dispatch is used to send actions to update the data

_Example:_

```javascript
store.dispatch(createAdd(25));
```

- Using Hooks:

```javascript
import { useDispatch } from "react-redux";

const dispatch = useDispatch();

dispatch({ type: "INC" });

dispatch({ type: "DEC" });

dispatch({ type: "ADDBY", payload: 10 });
```

## Using Redux

Simple Redux store used in a simple JavaScript app:

```javascript
import { createStore } from "redux";

// 1. Create a store
const store = createStore(counter);

// 2. Subscribe to store updates
store.subscribe(render);

const valueEl = document.getElementById("value");

// 3. When the subscription callback runs:
const render = () => {
  // 3.1 Get the current store state
  const state = store.getState();

  // 3.2 Extract the data you want
  const newValue = state.toString();

  // 3.3 Update the UI with the new value
  valueEl.innerHTML = newValue;
};

// 4. Display the UI with the initial store state
render();

// 5. Dispatch actions based on UI inputs
document.getElementById("increment").addEventListener("click", () => {
  store.dispatch({ type: "INCREMENT" });
});
```

### `react-redux`

`react-redux` subscribes to the Redux store, checks to see if the data your component wants has changed, and re-renders your component.

- Added Hooks API in v7.1

Integrating Redux in a React App:

- Install Redux and `react-redux`:

  ```bash
  yarn add redux react-redux
  ```

### `redux-toolkit`

Includes packages like:

- Redux
- Immer
- `redux-thunk`

Usage:

1. Install the required packages:

   ```bash
   npm install @reduxjs/toolkit react-redux

   # Or

   yarn add @reduxjs/toolkit react-redux
   ```

2. `createSlice`:

   ```javascript
   import { createSlice } from "@reduxjs/toolkit";

   const initialState = {
     value: 0,
   };

   export const counterSlice = createSlice({
     name: "counter",
     initialState
     reducers: {
       increment:(state) => {
         state.value += 1;
       },

       decrement:(state) => {
         state.value -= 1;
       },

       incrementByAmount:(state, action) => {
         state.value += action.payload;
       },
     },
   });
   ```

3. `configureStore`:

   - Simplified configuration options and good defaults
   - Includes `redux-thunk` middleware
   - Enables Redux DevTools Extension

   ```javascript
   import { configureStore } from "@reduxjs/toolkit";

   export const store = configureStore({
     reducer: {
       counter: counterSlice.reducer,
     },
   });
   ```

4. Export Actions:

   ```javascript
   // returns an action
   //{ type: "UNIQUE KEY"}
   counterSlice.actions.increment;

   // Action creators are generated for each case reducer function
   export const { increment, decrement, incrementByAmount } =
     counterSlice.actions;
   ```

5. Dispatch actions:

   ```javascript
   import { useDispatch, useSelector } from "react-redux";

   const APP = () => {
     const counter = useSelector((state) => state.counter.value);

     const dispatch = useDispatch();

     const incrementHandler = () => {
       dispatch(counterSlice.actions.increment());
     };

     return <h1>Counter: {counter}</h1>;
   };
   ```

## Redux Middleware

Middleware provides a 3rd-party extension point between dispatching an action and the moment it reaches the reducer. (For logging, crash reporting, async tasks, etc.)

### `redux-thunk`

Middleware to help us write async actions

- The word "thunk" is a programming term that means _"a piece of code that does some delayed work"._

- Add `redux-thunk` as middleware:

  ```javascript
  import { applyMiddleware, createStore } from "redux";
  import thunk from "redux-thunk";

  const store = createStore(reducers, applyMiddleware(thunk));
  ```

- Async action creators must return a function, that takes `dispatch` and `getState` (optional) as parameters. This function should manually call `dispatch`

  ```javascript
  export const fetchUser = (id) => async (dispatch) => {
    const res = await jsonPlaceholder.get(`/users/${id}`);

    dispatch({
      type: "FETCH_USER",
      payload: res.data,
    });
  };
  ```

- Rest of the Redux config will be same

## References

- [react-redux history implementation](https://blog.isquaredsoftware.com/2018/11/react-redux-history-implementation/)
