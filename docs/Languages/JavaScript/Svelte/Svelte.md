---
title: Svelte
description: Cybernetically enhanced web apps
date: 2023-07-30
lastmod: 2023-07-30
---

# Svelte

## React vs. Svelte

[React](../React/React.md) is front-end UI library.

- State:

```jsx
import { useState } from 'react'

function Counter() {
  const [count, setCount] = useState(0)

  return (
    <button onClick={() => setCount((c) => c + 1)}>Count is {count}</button>
  )
}
```

```svelte
<script>
  let count = 0
</script>

<button on:click={() => count++}>Count is {count}</button>
```

- Props:
  - Props as same as in React
  - In Svelte component cannot be passed as props

```jsx
function ColouredBox({ colour }) {
  return <p>You picked: {colour}</p>
}

function Parent() {
  const colour = 'blue'
  return <ColouredBox colour={colour} />
}
```

```svelte
<script>
  <!-- export make a variable prop -->
  export let colour
</script>

You picked: {colour}

<!-- Parent Component -->
const colour = 'blue';
<ColouredBox {colour} />
```

- Children:

```jsx
function Navbar(props) {
  return <nav>{props.chidren}</nav>
}

// Usage
function Parent() {
  return (
    <Navbar>
      <a href="/">Hi Mon!</a>
      <a href="/heaven">Hello, world</a>
    </Navbar>
  )
}
```

```svelte
<slot name="header" />
<slot />
<slot name="footer" />
```

- Life-Cycle

```jsx
function Navbar() {
  useEffect(() => {
    const fun = async () => {
      // handle promise
    }
    fun()
  }, [])
}
```

```svelte
<script>
  onMount(async () => {
    // handle promise
  })
</script>
```

- Side-Effects:

```jsx
function Counter() {
  const [count, setCount] = useState(0)

  useEffect(() => {
    document.title = `count is ${count}`
  }, [count])
}
```

```svelte
<script>
  let count

  $: document.title = `count is ${count}`
</script>
```

- Computed States:

```jsx
function Counter() {
  const [count, setCount] = useState(0)

  const doubled = useMemo(() => count * 2, [count])

  useEffect(() => {
    document.title = `count is ${count}`
  }, [])
}
```

```svelte
<script>
  let count

  $: doubled = count * 2
  $: document.title = `count is ${count}`
</script>
```

- Conditional

```jsx
function Counter() {
  const [count, setCount] = useState(0)

  return <>{count > 100 ? <p>big</p> : <p>small</p>}</>
}
```

```svelte
<script>
  let count = 0
</script>

{#if count > 100}
  <p>big</p>
{:else if count > 50}
  <p>medium</p>
{:else}
  <p>small</p>
{/if}
```

- Loops

```jsx
function Counter() {
  const items = [
    { id: 1, name: 'foo' },
    { id: 2, name: 'bar' },
    { id: 3, name: 'baz' },
  ]

  return (
    <>
      {items.map((item) => (
        <div key={item.id}>{item.name}</div>
      ))}
    </>
  )
}
```

```svelte
<script>
  const items = [
    { id: 1, name: 'foo' },
    { id: 2, name: 'bar' },
    { id: 3, name: 'baz' },
  ]
</script>

{#each items as item (item.id)}
  <p>{item.name}</p>
{/each}
```

- Shared State

```jsx
import { atom } from 'jotai'

export const countAtom = atom(0)

import { useAtom } from 'jotai'
import { countAtom } from './atom'

function Counter() {
  const [count, setCount] = useAtom(countAtom)

  return (
    <button onClick={() => setCount((c) => c + 1)}>Count is {count}</button>
  )
}
```

```svelte
<!-- store.js -->
import { writable } from 'svelte/store'
export const countStore = writable(0)

<script>
  import { countStore } from './store'
</script>

<button on:click={() => countStore.update(c => c + 1)}>Count is {$countStore}</button>
```

- Promises

```jsx
function componentWithAsyncData() {
  const number = use(Promise.resolve(69))

  return <p>{number}</p>
}

function App() {
  return (
    <ErrorBoundary fallback={<ErrorPage />}>
      <Suspense fallback={<LoadingSpinner />}>
        <componentWithAsyncData />
      </Suspense>
    </ErrorBoundary>
  )
}
```

```svelte
<script>
  import { LoadingSpinner, ErrorPage } from 'svelte'

  const promise = Promise.resolve(69)
</script>

{#await promis}
  <LoadingSpinner />
{:then number}
  <p>{number}</p>
{:catch error}
  <ErrorPage {error} />
{/await}
```

## SvelteKit
