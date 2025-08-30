---
title: World Wide Web (WWW)
description: A system of interlinked hypertext documents and resources, accessed via the internet
---

# World Wide Web (WWW)

The World Wide Web (WWW) or web is a system of interlinked hypertext documents and resources, accessed via the [internet](./Internet.md)

- It is but one part of the internet, though it's the most visible part

Brief History:

- 1989-91: The idea of the web (Sir Tim Berners-Lee, CERN)
  - He published ["Information Management: A Proposal"](https://info.cern.ch/Proposal.html)
  - He wrote `TCPServer.c` (initial port `2784`) and `WorldWideWen.app` (browser)

- 1991: Line-mode browser (Nicola Pellow, CERN)
- 1992: ViolaWWW web browser (Pei Wei, University of California at Berkeley)
- 1993: NCSA Mosaic web browser (Marc Andreessen, Eric Bina)
- 1993: The `<img>` tag (WWW-Talk mailing list) (Marc Andreessen)
- 1994: [W3C](https://www.w3.org/) organization was founded (MIT/CERN/DARPA/EC)
- 1994: Netscape Navigator 1.0 (Marc Andreessen, James H. Clark)
- 1995: Internet Explorer 1.0 (Microsoft)
- 1995: Personal Home Page (PHP) Tools, 1.0 (Rasmus Lerdorf)
- 1996: JavaScript (Brendan Eich), CSS (Håkon Wium Lie), Microsoft FrontPage, Macromedia Flash
- 1998: Accessibility (Section 508 update, WAI, WCAG)
  - 2008: WCAG 2.0
  - 2018: WCAG 2.1

- 2000-02: ASP.NET 1.0 (Scott Guthrie, Mark Anders)
- 2004: Ruby on Rails (David Heinemeier Hansson (DHH))
- 2005-06: JavaScript ascend - Web 2.0
  - 2005: [AJAX: A new approach to web applications](https://designftw.mit.edu/lectures/apis/ajax_adaptive_path.pdf) by by Jesse James Garrett
  - 2006: jQuery (John Resig)

- 2007: Browser dev tools (Joe Hewitt, Firebug browser extension)
- 2009: Node.js (Ryan Dahl)
- 2010: SPA frameworks
- 2012-15:
  - 2012: TypeScript
  - 2013: Webpack
  - 2014: Kubernetes

- 2017: WebAssembly (Mozilla, Google, Microsoft, Webkit project)

## Rendering Web Page

The process of **page rendering** may include many steps. The broadest definition includes all the steps from the **user opening a site in the browser** (by clicking on the link or typing it manually in the URL address bar) to the **full page shown**

- **[What happens when you browse the web?](./HTTP.md#what-happens-when-you-browse-the-web)**

### Rendering Patterns for Web Apps

Sites have evolved into complex web applications with rich features; a one-size-fits-all approach is no longer sufficient

- Each site or application has different goals, requiring different rendering methods
- While some approaches are more adaptable than others, a universal solution isn't effective in most cases

Determine to whom the application is being made for:

|                | B2B (Profit center)                               | B2C (Profit center)                               | Internal Product (Cost center)                    |
| -------------- | ------------------------------------------------- | ------------------------------------------------- | ------------------------------------------------- |
| Important      | Smooth UI                                         | Fast initial loading                              | Easiness and cost of development and maintainging |
|                |                                                   | SEO                                               |                                                   |
|                |                                                   | Performance on low-power devices                  |                                                   |
|                |                                                   | Smooth UI                                         |                                                   |
| Less Important | Fast intial loading                               | Easiness and cost of development and maintainging | Smooth UI                                         |
|                | Performance on low-power devices                  |                                                   | Fast initial loading                              |
|                | Easiness and cost of development and maintainging |                                                   |                                                   |
| Not Important  | SEO                                               |                                                   | SEO                                               |
|                |                                                   |                                                   | Performance on low-power devices                  |

### Static Website

- Serve static HTML, CSS & JavaScript files
- Upload them into a storage bucket or CDN
- Point Domain name to the storage location
- Static Site Generators (SSG): Hugo, Jekyll, 11ty
- Not useful for dynamic content

### Multi-Page Application (MPA)

- Ruby on rails
- Django
- Larvel
- CMS: Wordpress
- Not app like

### Single-Page Application (SPA)

In a standard React/Angular/Vue application, the browser receives an empty HTML shell from the server along with the JavaScript instructions to construct the UI. This is called client-side rendering because the initial rendering work happens on the user's device

Client Side Rendering (CSR)

- React.js
- Angular
- Vue
- Huge bundle size

### Server-Side Rendering (SSR)

In server-side rendering, the HTML of the page is generated on a server for each request. The generated HTML, JSON data, and JavaScript instructions to make the page interactive are then sent to the client

- On the client, the HTML is used to show a fast non-interactive page, while React uses the JSON data and JavaScript instructions to make components interactive (for example, attaching event handlers to a button). This process is called **hydration**

Applications may be partially pre-rendered on the server, its called SSR with (Re)hydration

Isomorphic, Universal, or SSR (All the same thing!)

- Isomorphic application, runs both server and client. For each request it runs a virtual app, that generates the static pages

MPA + SPA = SSR

- Metaframework: Next.js, Nuxt, Svelte-Kit
- Servers are required

Advantages:

- Improved SEO
- Faster time-to-content (faster load times):
  - Server-rendered HTML doesn't need to wait until all JavaScript has been downloaded and executed to be displayed, so the user will see a fully-rendered page sooner
  - For initial visit, data fetching is done on the server side, which likely has a faster connection to your database than the client
  - Improved Core Web Vitals metrics
  - Better initial User Experience

- Time-to-Interactive is equal to First-Contentful-Paint
  - We do not need to execute the JS code to make the page interactive because the page is fully pre-rendered on the server side

- Additional budget for client-side JavaScript, as there is JS needed to render the page

Disadvantages:

- Slow Time-to-First-Byte: Since the rendering is happening on the server side, the response from the server may be delayed because of:
  - Multiple simultaneous users cause excess load on the server
  - Slow network
  - Server code not optimised

- Full page reloads
- Increased server load
- Development constraints (like browser APIs are unavailable on the server)
- Increased mental overhead and more complex server configuration

#### Streaming SSR

Streaming implies chunks of HTML are streamed from the server to the client as generated

- As the client starts receiving "bytes" of HTML earlier, even for large pages, the **TTFB** is reduced and relatively constant
- All major browsers start parsing and rendering streamed content or the partial response earlier
- As the rendering is progressive, it results in a **fast FCP**

### Static Site Generation (SSG)

In Static Site Generation, the HTML is generated on the server, but unlike server-side rendering, there is no server at runtime. Instead, content is generated once, at build time, when the application is deployed, and the HTML is stored in a CDN and re-used for each request

- Jamstack site

### Incremental Static Regeneration

- Complex to Self-host

### Partial Hydration

- Code Splitting

### Islands

- Astro

### Resumability

- Qwik

## Web Technologies

### Web Standards

Web standards are guidelines and specifications that define best practices for building and maintaining websites and web applications

- They ensure that web content is accessible, usable, and interoperable across different browsers and devices
- Web standards are developed and maintained by organizations such as the World Wide Web Consortium (W3C) and the Internet Engineering Task Force (IETF)

Key Web Standards:

- **HTML (HyperText Markup Language)**: Defines the structure and content of web pages
- **CSS (Cascading Style Sheets)**: Controls the presentation and layout of web pages
- **JavaScript**: Enables interactive and dynamic behavior on web pages
- **HTTP (Hypertext Transfer Protocol)**: Defines how web browsers and servers communicate
- **URL (Uniform Resource Locator)**: Specifies the address of web resources
- **Web APIs (Application Programming Interfaces)**: Provide access to browser functionality and services
- **WebRTC (Real-Time Communication)**: Enables real-time communication between browsers
- **WebAssembly**: A binary instruction format for a stack-based virtual machine that runs in web browsers
- **Web Accessibility**: Ensures that web content is accessible to people with disabilities
- **Web Security**: Protects web applications and users from security threats
- **Web Performance**: Optimizes the speed and efficiency of web applications

## Real-Time Communication (RTC)

Real-time communication (RTC) refers to the transmission of data between two or more endpoints in real-time

- It is the near simultaneous exchange of information over any type of telecommunications service from the sender to the receiver in a connection with negligible latency (e.g., VoIP, instant messaging, video conferencing, online gaming)

### WebRTC

Real-Time Communication for the Web (WebRTC):

- With WebRTC, you can add real-time communication capabilities to your application that works on top of an open standard
- It supports video, voice, and generic data to be sent between peers, allowing developers to build powerful communication solutions
- The technology is available on all modern browsers and platforms

## Web Design

What is web design?

- Web Design:
  - Appearance
  - Forward-facing functionality

  - Web graphic design
  - Interface design
  - Authoring
  - User experience design (UX)
  - SEO

- Web Development:
  - Behind the scenes
  - Code
  - Content Strategy
  - Information architecture
  - Front-end and Back-end development
  - Infrastructure
  - system architecture

- Web design can be taken as whole refereeing to web design and web development

- The goal or purpose of web design is to create **informational user experiences**

Web design process starts from:

1. Per-process
2. Planning Content Strategy
3. Pre-build Testing
4. Content, Design, Development, and Build
5. Post-build Testing
6. Optimization (Content, Design, and Development)
7. Launch and Reset

### Site Map

A site map is a visual or textual model of a website's content that allows users and search engines to navigate the site's structure and find information quickly

_Example:_

```text
Home
├── About Us
│   ├── Our Team
│   └── Our Story
├── Services
│   ├── Web Development
│   ├── Mobile App Development
│   └── SEO Services
├── Blog
│   ├── Latest Posts
│   └── Categories
└── Contact Us
    ├── Contact Form
    └── Location
```

### Wireframe

A wireframe is a visual representation of a website's layout that outlines the structure and content of each page without design elements such as colors, images, or typography

- It helps designers and developers plan the site's layout, navigation, and functionality before adding visual design elements

_Example:_

```text
+------------------------------------------------+
|                    Header                      |
|  Logo      Home  About Us  Services  Contact   |
+------------------------------------------------+
|                  Hero Section                  |
|  Headline                                      |
|  Subheadline                                   |
|  [Call to Action Button]                       |
+------------------------------------------------+
|                About Us Section                |
|  Brief Description                             |
|  [Link to About Us Page]                       |
+------------------------------------------------+
|                Services Section                |
|  Service 1 | Service 2 | Service 3             |
|  Web Dev   | Mobile App | SEO                  |
+------------------------------------------------+
|                  Blog Section                  |
|  Featured Blog Post                            |
|  [Link to Blog Page]                           |
+------------------------------------------------+
|                    Footer                      |
|  Social Media Links | Contact Info | Copyright |
+------------------------------------------------+
```

### SEO

Search Engine Optimization (SEO) is the practice of increasing the quantity and quality of traffic to your website through organic search engine results

- **On-Page SEO**: Refers to the practice of optimizing web pages to improve a website's search engine rankings and earn organic traffic
  - Includes optimizing content, HTML source code, and images
  - Focuses on improving the relevance and quality of the content on the page
  - Page title, meta description, headings, URL structure, alt text for images, internal linking, and keyword optimization

- **Off-Page SEO**: Refers to actions taken outside of your own website to impact your rankings within search engine results pages (SERPs)
- **Technical SEO**: Refers to the process of optimizing your website for the crawling and indexing phase
- **Local SEO**: Refers to the process of optimizing your online presence to attract more business from relevant local searches
- **Mobile SEO**: Refers to the practice of optimizing your website for users on smartphones and tablets

The [`<head>`](#head) element is where you can add metadata that helps search engines understand the content of your page

## Key Metrics

Key metrics for web pages are essential for understanding and improving website performance

- [Performance Metrics](../../Languages/HTML/Performance_Metrics.md) can help in deciding the rendering pattern

Here are some of the most important metrics:

1. **Traffic Metrics**:
   - **Page Views**: The total number of times a page has been viewed
   - **Unique Visitors**: The number of distinct individuals visiting the site during a given period
   - **Sessions**: A group of interactions by a user within a specific timeframe

2. **Engagement Metrics**:
   - **Bounce Rate**: The percentage of visitors who leave the site after viewing only one page
   - **Average Session Duration**: The average time a user spends on the site
   - **Pages per Session**: The average number of pages viewed during a session
   - **Time on Page**: The average time spent on a particular page

3. **Acquisition Metrics**:
   - **Traffic Sources**: Where visitors are coming from (e.g., search engines, direct traffic, social media, referral sites)
   - **New vs. Returning Visitors**: The ratio of first-time visitors to returning visitors

4. **Conversion Metrics**:
   - **Conversion Rate**: The percentage of visitors who complete a desired action (e.g., making a purchase, signing up for a newsletter)
   - **Goal Completions**: The number of times visitors complete a specific goal (e.g., form submissions, downloads)
   - **Sales and Revenue**: Total sales and revenue generated from the website

5. **SEO Metrics**:
   - **Organic Search Traffic**: The number of visitors coming from search engine results
   - **Keyword Rankings**: The position of the website in search engine results for specific keywords
   - **Backlinks**: The number and quality of external links pointing to the website

6. **Technical Performance Metrics**:
   - **Page Load Time**: The time it takes for a page to fully load
   - **Mobile Responsiveness**: How well the website performs on mobile devices
   - **Site Uptime**: The percentage of time the website is operational and accessible

7. **Content Metrics**:
   - **Top Landing Pages**: Pages through which visitors most often enter the site
   - **Top Exit Pages**: Pages from which visitors most often leave the site
   - **Popular Content**: Content that receives the most views and engagement

8. **User Behaviour Metrics**:
   - **Click-Through Rate (CTR)**: The percentage of users who click on a specific link out of the total users who view a page or ad
   - **Scroll Depth**: How far down a page visitors scroll

9. **Customer Satisfaction Metrics**:
   - **Net Promoter Score (NPS)**: A measure of customer loyalty and satisfaction
   - **Customer Reviews and Ratings**: Feedback and ratings left by users

Monitoring these metrics can help website owners and digital marketers optimize their sites for better user experience, higher engagement, and improved conversion rates

## Web Crawlers

Web crawlers, also known as web spiders, web robots, or simply bots, are automated programs that systematically browse the World Wide Web to index and collect information about web pages

- They are essential tools for search engines, such as Google, Bing, and Yahoo, to build and update their indexes, which enable efficient and relevant search results

Common Web Crawlers:

- Googlebot: Used by Google, one of the most well-known and advanced web crawlers
- Bingbot: Microsoft's web crawler for the Bing search engine
- Slurp Bot: Yahoo's web crawler
- DuckDuckBot: The web crawler for the DuckDuckGo search engine

### Functions of Web Crawlers

- Indexing Content: Crawlers scan web pages to index their content, which helps search engines retrieve and display relevant results for users' queries
- Link Discovery: They follow hyperlinks on web pages to discover new content and sites
- Content Updates: Crawlers periodically revisit websites to check for updates or changes, ensuring that the index remains current
- Data Collection: Some crawlers collect data for specific purposes, such as market research, monitoring web compliance, or content aggregation

### How Web Crawlers Work

1. Starting Point: Crawlers begin with a list of URLs, often provided by a seed list
2. Fetching Pages: They fetch the content of the web pages at these URLs
3. Parsing Pages: The content is parsed to extract useful information, such as keywords, links, and metadata
4. Following Links: Crawlers follow the links found on the fetched pages, adding new URLs to their list of pages to visit
5. Storing Data: The extracted data is stored in a database, which search engines use to serve search results

### Ethical and Technical Considerations

- **[Robots.txt](https://metacpan.org/pod/WWW::RobotRules)**: Websites can control the behaviour of web crawlers through the `robots.txt` file, which specifies which parts of the site should not be crawled

- **Crawl Rate**: To prevent overloading servers, well-behaved crawlers limit their request rate

- **Privacy**: Crawlers must respect privacy and ethical guidelines, avoiding sensitive or personal information unless explicitly allowed

- CSR is bad for SEO, as web crawlers didn't execute JS code they are faced with a blank page from which they cannot extract too much SEO related information

- Many modern web crawlers:
  - Can execute JS code
  - Have JS budget. If your JS bundle is too big, they may not execute or complete it. As a result, your web page may not look like you want it to look

- Google revealed some information on Google I/O:
  - The first wave requests source code, crawls and indexes any present HTML and CSS, add any present links to the crawl queue, and downloads page response codes
  - The second wave can occur a few hours to even a few weeks later; Google returns to the page when additional resources are available to render fully and index the JS-generated content
