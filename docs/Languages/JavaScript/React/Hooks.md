---
title: Hooks
description: Custom Hooks
---

# Hooks

Collection of custom hooks

## Toggle Hook

```javascript
[color, toggle] = useReducer((prev) => !prev, false);
```

Typescript:

```typescript
import { useCallback, useState } from "react";

const App = () => {
  // Call the hook which returns, current value and the toggler function
  const [isTextChanged, setIsTextChanged] = useToggle();

  return (
    <button onClick={setIsTextChanged}>
      {isTextChanged ? "Toggled" : "Click to Toggle"}
    </button>
  );
};

// Hook
// Parameter is the boolean, with default "false" value
const useToggle = (initialState: boolean = false): [boolean, any] => {
  // Initialize the state
  const [state, setState] = useState<boolean>(initialState);

  // Define and memorize toggler function in case we pass down the component,
  // This function change the boolean value to it's opposite value
  const toggle = useCallback((): void => setState((state) => !state), []);

  return [state, toggle];
};
```

### Dark Mode

```javascript
export const useDarkMode = () => {
  const preferDarkQuery = "(prefers-color-scheme: dark)";

  const [mode, setMode] = useState(
    () =>
      window.localStorage.getItem("colorMode") ||
      (window.matchMedia(preferDarkQuery).matches ? "dark" : "light")
  );

  useEffect(() => {
    const mediaQuery = window.matchMedia(preferDarkQuery);

    const handleChange = () => setMode(mediaQuery.matches ? "dark" : "light");

    mediaQuery.addEventListener("change", handleChange);

    return () => mediaQuery.removeEventListener(handleChange);
  }, [preferDarkQuery]);

  useEffect(() => {
    window.localStorage.setItem("colorMode", mode);
  }, [mode]);

  return [mode, setMode];
};

const styles = {
  dark: {
    color: "white",
    backgroundColor: "black",
  },
  light: {
    color: "black",
    backgroundColor: "white",
  },
};
```

- Export a button to toggle modes:

```jsx
export const Button = () => {
  const [mode, setMode] = useDarkMode();

  return (
    <button
      style={styles[mode]}
      onClick={() => setMode(mode === "dark" ? "light" : "dark")}>
      {mode}
    </button>
  );
};
```

## Counter Hook

```javascript
[count, increment] = useReducer((prev) => prev + 1, 0);
```

## One-Way Boolean State

```javascript
const [isEnabled, enable] = useReducer(() => true, false);
```

## HTTP Request

_Example 1:_

```javascript
import { useCallback, useEffect, useState } from "react";

export const useHttp = (url = "", options) => {
  const [isLoading, setIsLoading] = useState(false);
  const [apiData, setApiData] = useState(null);
  const [error, setError] = useState(null);

  const sendRequest = useCallback(async (url, options) => {
    try {
      setIsLoading(true);

      const response = await fetch(url, options);

      if (!response.ok) throw new Error("Something went wrong");

      const data = await response.json();

      setApiData(data);
      setError(null);
    } catch (error) {
      setError(error);
      setApiData(null);
    } finally {
      setIsLoading(false);
    }
  }, []);

  useEffect(() => {
    if (!url) return;

    const controller = new AbortController();

    sendRequest(url, {
      ...options,
      signal: controller.signal,
    });

    return () => {
      controller.abort();
    };
  }, [url, options, sendRequest]);

  return { isLoading, error, apiData };
};
```

_Example 2:_

```jsx
// https://api.github.com/users/25prabhu10
import { useState, useEffect } from "react";

const GitHub = ({ login }) => {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  useEffect(() => {
    if (!login) return;

    setLoading(true);

    fetch(`https://api.github.com/users/${login}`)
      .then((res) => res.json())
      .then(setData)
      .then(() => setLoading(false))
      .catch(setError);
  }, [login]);

  if (loading) return <h1>Loading...</h1>;

  if (error) return <pre>{JSON.stringify(error, null, 2)}</pre>;

  if (!data) return null;

  return (
    <div>
      <h1>{data.name}</h1>
      <p>{data.location}</p>
      <img src={data.avatar_url} alt={data.login} />
    </div>
  );
};

export default GitHub;
```

### Using Axios
