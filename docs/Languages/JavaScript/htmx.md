---
title: htmx
description: A frontend JavaScript library
date: 2024-08-23
lastmod: 2024-08-23
---

# htmx

`htmx` is a library that allows you to access modern browser features directly from HTML, rather than using JavaScript

To understand `htmx`, first lets take a look at an anchor tag:

```html
<a href="/blog">Blog</a>
```

This anchor tag tells a browser:

> "When a user clicks on this link, issue an HTTP GET request to '/blog' and load the response content into the browser window"

With that in mind, consider the following bit of HTML:

```html
<button
  hx-post="/clicked"  <!-- send post request to `/clicked`-->
  hx-trigger="click"  <!-- send request on click event -->
  hx-target="#parent-div" <!-- where to place the response -->
  hx-swap="outerHTML" <!-- determine how to place the response -->
>
  Click Me!
</button>

<!--you can use the `data-` prefix when using `htmx`:-->
<a data-hx-post="/click">Click Me!</a>
```

This tells `htmx`:

> "When a user clicks on this button, issue an HTTP POST request to '/clicked' and use the content from the response to replace the element with the id `parent-div` in the DOM"

`htmx` extends and generalizes the core idea of HTML as a hypertext, opening up many more possibilities directly within the language:

- Now any element, not just anchors and forms, can issue an HTTP request
- Now any event, not just clicks or form submissions, can trigger requests
- Now any [HTTP verb](), not just GET and POST, can be used
- Now any element, not just the entire window, can be the target for update by the request

Functionalities:

- Confirm and prompt
- Polling
- Web sockets
- Server side events
- Lazy loading on reveal
- Intersection observer for infinite scroll
- `htmx:on` lightweight in-line scripting
- Extensions for smarter morphing swaps and more
- Boosting (it allows you to turn regular links and forms into AJAX requests, updating only parts of the page instead of triggering a full page reload)
- Animations and CSS transitions
- URL history API integration

## `htmx` vs. SPA

| Feature             | HTMX                                          | SPA                                                                  |
| ------------------- | --------------------------------------------- | -------------------------------------------------------------------- |
| Architecture        | Server-centric                                | Client-centric                                                       |
| Routing             | Server-side with optional history API         | Client-side routing                                                  |
| Data Management     | Relies on server for data and state           | Complex client-side state management                                 |
| Performance         | Generally better (initial load)               | Can be slower (initial load), but better for subsequent interactions |
| SEO                 | Generally better                              | Can be challenging without proper SEO strategies                     |
| Backend Integration | Tightly integrated with server-side rendering | Often requires separate API development                              |
| Ideal Use Cases     | Traditional web apps, content-heavy sites     | Complex, highly interactive applications                             |
| Bundle Size         | Small `~10KB` gzipped (better with caching)   | Generally larger, can be several hundred KB                          |

## `htmx` Attributes

- `hx-get`, `hx-post`, `hx-put`, `hx-patch`, `hx-delete`: These attributes specify the HTTP method and URL for AJAX requests

  ```html
  <button hx-post="/submit">Submit</button>
  ```

- `hx-trigger`: Defines what event triggers the AJAX request. By default, it's the natural event for the element (e.g., click for buttons)

  ```html
  <input hx-get="/search" hx-trigger="keyup changed delay:500ms" />
  ```

- `hx-target`: Specifies which element should be updated with the response. It can use CSS selectors

  ```html
  <button hx-get="/info" hx-target="#result">Get Info</button>
  ```

- `hx-swap`: Determines how the response should be swapped in. Options include "innerHTML", "outerHTML", "beforebegin", "afterbegin", "beforeend", "afterend"

  ```html
  <div hx-get="/content" hx-swap="outerHTML">Loading...</div>
  ```

- `hx-push-url`: Pushes a new URL into the history stack, allowing for updating the URL without a page reload

  ```html
  <a hx-get="/page2" hx-push-url="true">Go to Page 2</a>
  ```

- `hx-boost`: Progressively enhances links and forms to use AJAX instead of full page loads

  ```html
  <a href="/page" hx-boost="true">Enhanced Link</a>
  ```

- `hx-vals`: Adds extra values to the AJAX request

  ```html
  <button hx-post="/submit" hx-vals='{"name":"Joe"}'>Submit</button>
  ```

- `hx-confirm`: Shows a confirmation dialog before sending a request

  ```html
  <button hx-delete="/item/1" hx-confirm="Are you sure?">Delete</button>
  ```

- `hx-indicator`: Specifies an element to show while the request is in flight, useful for loading indicators

  ```html
  <button hx-get="/slow-request" hx-indicator="#spinner">Load Data</button>
  <span id="spinner" class="htmx-indicator">Loading...</span>
  ```
