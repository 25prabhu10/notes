---
title: Next.js
description: Web development framework
---

# Next.js

Web development framework enabling React-based web applications with server-side rendering and generating static websites

```bash
npx create-next-app@latest --typescript
# or
yarn create next-app
# or
pnpm create next-app
```

3 types of rendering methods are available:

1. [Server-Side Rendering](#server-side-rendering-ssr)
2. [Static Site Generation](#static-site-generation-ssg)
3. [Client-Side Rendering](#client-side-rendering)

Server-Side Rendering and Static Site Generation are also referred to as **Pre-Rendering** because the fetching of external data and transformation of React components into HTML happens before the result is sent to the client

## Server-Side Rendering (SSR)

[Server-Side Rendering (SSR)](../../../Concepts/Web/Web.md#server-side-rendering-ssr) with Hydration can be done using Next.js

- Use `getServerSideProps` for SSR in Next.js

## Static Site Generation (SSG)

[Static Site Generation (SSG)](../../../Concepts/Web/Web.md#static-site-generation-ssg) can be done with Next.js

To statically generate pages use `getStaticProps`

## Client-Side Rendering

In a standard React application, the browser receives an empty HTML shell from the server along with the JavaScript instructions to construct the UI. This is called client-side rendering because the initial rendering work happens on the user's device

## Incremental Static Regeneration (ISR)

You can use **Incremental Static Regeneration** to create or update static pages after you've built your site. This means you do not have to rebuild your entire site if your data changes
