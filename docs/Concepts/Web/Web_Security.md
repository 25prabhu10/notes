# Web Security

Vulnerabilities and Exploits

Common form of attacks:

- Spam: Sent from legitimate IP address, less likely to be blocked
- Denial of service: attack competitors, or seek ransom
- Infect visiting users with malware: Infect one server, use it to infect hundreds of thousands of clients
- Data theft: Steal credentials, credit card numbers, intellectual property

Different Parts of Web Security:

- Browser security:

  - _Example_: Same Origin Policy - Isolate sites from each other, while running in the same browser

- Server app security:

  - Attackers can run arbitrary HTTP clients; can send anything to server

- Client app security:

  - Prevent user from being attacked while using web app locally

- Protect the user:
  - From social engineering
  - From trackers, private data being leaked

Why is web security hard?

- Extremely ambitious goal: Run untrusted code securely
- Different sites interacting in the same tab ("mashups")
- Low-level features; hardware access
- Desire for high performance
- APIs were not designed from first principles; evolved
- Strict backwards compatibility requirements
  - "Don't break the web"

> "Modern web applications are built on a tangle of technologies that have been developed over time and then haphazardly pieced together. Every piece of the web application stack, from HTTP requests to browser-side scripts, comes with important yet subtle security consequences. To keep users safe, it is essential for developers to confidently navigate this landscape."
>
> - Tangled Web

The browser has a seemingly impossible task:

- Sites - **even malicious ones** can:
- Download content from **anywhere**
- Spawn worker processes
- Open sockets to a server, or even to another user's browser
- Display media in huge number of formats
- Run custom code on the GPU
- Save/read data from the filesystem

> "It's all too easy to criticize, lament, and create paranoid scenarios about the 'unsound security foundations' of the web. Truth is, all of that criticism is true, and yet the web has proven to be an incredibly robust platform."
>
> - Ilya Grigorik, Google web performance engineer

## Uniform Resource Locators (URLs)

It is divided into different parts: `http://example.com:81/a/b.html?user=Alice&year=2049#heading`

- Scheme: `http://` (Protocol)
- Hostname: `example.com` (Domain name)
- Port Number: `:81`
- Path: `/a/b.html` (Path or API endpoints or dynamically generated)
- Query: `?user=Alice&year=2049`
- Fragment: `#heading`

Ways to specify a URL:

- Full URL: `<a href='http://stanford.edu/news/2019/'>2019 News</a>`
- Relative URL: `<a href='september'>September News</a>`
  - Same as: `http://stanford.edu/news/2019/september`
- Absolute URL: `<a href='/events'>Events</a>`
  - It removes everything till the root and adds `/event` to it unlike relative URL
- Fragment URL: `<a href='#section3'>Jump to Section 3</a>`
  - Scrolls to `<a href='section3' />` within page

Some HTML tags that can include URL:

- `<img>`
- `<video>`, `<audio>`
- `<canvas>`
- `<link>`, `<style>`
- `<script>`

::: tip TRAILING `/`
If you add trailing `/` to the URL?
:::

## Local Storage

- Every site can store **5 MB** data
- You can work around it to store very large amount of data and fill up the users browser and crash it
- Every sub-domain is considered as a separate website by the browser, hence, we can save 5 MB data per subdomain that we create
- Using IFrames we can call any number of sub-domains and keep adding 5 MB of data until the browser or the computer crash
- Checkout [filldisk.com](http://www.filldisk.com/) Website that emulates this behaviour

::: Warning FIXED
This has be fixed in most new versions of the browsers
:::

## Resources

- CS-241 and CS-253 (Stanford): [YouTube Link](https://www.youtube.com/watch?v=5JJrJGZ_LjM&list=PL1y1iaEtjSYiiSGVlL1cHsXN_kvJOOhu-&index=1)
