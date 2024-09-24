---
title: Performance Metrics
description: User-Centric Performance Metrics
---

# Performance Metrics

|                   |                                                                  |
| ----------------- | ---------------------------------------------------------------- |
| Is it happening?  | Did the navigation start successfully? Has the server responded? |
| Is it useful?     | Has enough content rendered that users can engage with it?       |
| Is it usable?     | Can users interact with the page, or is it busy?                 |
| Is it delightful? | Are the interactions smooth and natural, free of lag and jank?   |

## Types of Metrics

- **Perceived load speed**: how quickly a page can load and render all of its visual elements to the screen

- **Load responsiveness**: how quickly a page can load and execute any required JavaScript code in order for components to respond quickly to user interaction

- **Runtime responsiveness**: after page load, how quickly can the page respond to user interaction

- **Visual stability**: do elements on the page shift in ways that users don't expect and potentially interfere with their interactions?

- **Smoothness**: do transitions and animations render at a consistent frame rate and flow fluidly from one state to the next?

## Web Vitals

Representation of web vitals:

```text
Time (seconds)
0   1   2   3   4   5   6   7   8   9   10
|---|---|---|---|---|---|---|---|---|---|
|   |   |   |   |   |   |   |   |   |   |
↑   ↑   ↑   ↑       ↑       ↑           ↑
TTFB|   |   |       |       |           |
    FCP |   |       |       |           |
        LCP |       |       |           |
            FID     |       |           |
                    TTI     |           |
                            CLS         INP
    |----------------TBT----------------|

TTFB: Time to First Byte
FCP: First Contentful Paint
LCP: Largest Contentful Paint
FID: First Input Delay
TTI: Time to Interactive
CLS: Cumulative Layout Shift
INP: Interaction to Next Paint
TBT: Total Blocking Time
```

1. **Time-to-First-Byte (TTFB)**: measures the time it takes for the network to respond to a user request with the first byte of a resource

   - This metric helps identify when a web server is too slow to respond to requests
   - **Ideal Value**: Less than 600 milliseconds

2. **First-Contentful-Paint (FCP)**: measures the time from when the page starts loading to when any part of the page's content is rendered on the screen

   - The time when request content (header, article, etc.) becomes visible
   - FCP measures when the user first navigates to the page and when any part of the page's content is rendered on the screen
   - **Ideal Value**: 1.8 seconds or faster

3. **Largest-Contentful-Paint (LCP)**: measures the time from when the page starts loading to when the largest text block or image element is rendered on the screen

   - It represents how quickly the main content of a web page is loaded
   - Specifically, LCP measures the time from when the user initiates loading the page until the largest image or text block is rendered within the viewport
   - **Ideal Value**: 2.5 seconds or faster

4. **First-Input-Delay (FID)**: measures the time from when a user first interacts with your site (i.e. when they click a link, tap a button, or use a custom, JavaScript-powered control) to the time when the browser is actually able to respond to that interaction

   - **Ideal Value**: Less than 100 milliseconds

5. **Cumulative-Layout-Shift (CLS)**: measures the cumulative score of all unexpected layout shifts that occur between when the page starts loading and when its lifecycle state changes to hidden

   - **Ideal Value**: Less than 0.1

6. **Interaction-to-Next-Paint (INP)**: measures the latency of every tap, click, or keyboard interaction made with the page, and-based on the number of interactions-selects the worst interaction latency of the page (or close to the highest) as a single, representative value to describe a page's overall responsiveness

7. **Time-to-Interactive (TTI)**: measures the time from when the page starts loading to when it's visually rendered, its initial scripts (if any) have loaded, and it's capable of reliably responding to user input quickly

8. **Total-Blocking-Time (TBT)**: measures the total amount of time between FCP and TTI where the main thread was blocked for long enough to prevent input responsiveness

   - Calculates how long the main thread is blocked during page load
   - The user cannot interact with a page when the main thread is blocked

Visual Timeline Description:

1. User Initiates Load:

   - User clicks a link or enters a URL

2. Time to First Byte (TTFB):

   - The browser sends a request to the server and starts receiving the first byte of the response

3. First Contentful Paint (FCP):

   - The browser renders the first visible element on the screen

4. Largest Contentful Paint (LCP):

   - The largest element in the viewport is rendered, usually a large image or a significant text block

5. First Input Delay (FID):

   - The user interacts with the page for the first time, and the browser responds to the interaction

6. Cumulative Layout Shift (CLS):

   - Throughout the page load, any unexpected layout shifts are measured and summed up

Other Matrices:

- User Timing API
- Long Tasks API
- Element Timing API
- Navigation Timing API
- Resource Timing API
- Server timing

### Core Web Vitals

A subset of Web Vitals. These are three metrics that tend to have the largest impact on user experience:

1. Largest Contentful Paint (LCP): how fast the main content on a website loads
2. First Input Delay (FID): how quickly can a visitor start interacting with a site
3. Cumulative Layout Shift (CLS): how visually stable is the website layout as content loads

## Real User Monitoring (RUM)

## References

- [Web Vitals](https://web.dev/articles/vitals)

Websites to test web page performance:

- [Google Lighthouse](https://web.dev/measure/) - Run tests on your web page online, you can use Chrome dev tools to run lighthouse locally

- [WEBPAGETEST](https://www.webpagetest.org/) - Run tests on your web page

- [httparchive](https://httparchive.org/) - Test reports of millions of pages
