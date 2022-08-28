---
title: Web Security
description: The protective measures and protocols that organizations adopt to protect the organization from, cyber criminals and threats that use the web channel.
---

# Web Security

The protective measures and protocols that organizations adopt to protect the organization from, cyber criminals and threats that use the web channel.

Using Defense In Depth approach: By increasing the number of layers, an attacker's chance of success is decreased. For example an applications which contains:

1. Sensitive data is encrypted when stored in the database
2. Application has an extensive input validation
3. Hosts are patched with the latest security patches
4. The internal network is segregated into different zones protected by firewall rules
5. A firewall separates the internal perimeter from the internet
6. Servers are located in a badge-reader protected room
7. Finally, security assessments are performed to check adherence

- Vulnerabilities and Exploits

## Preventing vulnerabilities

1. At the "Data" layer: Access controls, Encryption, Backup and restore procedures
2. At the "Application" layer: Authentication, Authorization, Auditing (otherwise known as AAA). Securing coding, and Hardening.
3. At the "Host" layer: Hardening, Authentication, Patch management, Antivirus
4. On the "Internal network": Network segmentation, IPsec, TLS, NAT
5. At the "Perimeter" layer: Firewall, TLS, Denial of service, prevention
6. And finally, you should consider "Physical Security" including: Guards, Locks, Tracking devices, and Badging systems

### Threat Modelling

Threat Modelling is a way to identify, communicate, and understand security threats and mitigations

Different Threat Modelling

- [STRIDE](#stride)

#### STRIDE

Developed by Microsoft, STRIDE is considered one of the most comprehensive ways to identify threats.

STRIDE stands for:

- Spoofing: Authentication

  - Spoofing is the impersonation of something or someone else

- Tampering: Integrity
  - Tampering happens when attacker modify data or code
- Repudiation: Non-repudiation
  - Repudiation occurs when someone claims not to have performed an action
- Information disclosure: Confidentiality
  - Information disclosure describes when information is exposed to users who are not authorized to see it
- Denial of service: Availability
  - Denial of service happens when service is denied or degraded
- Elevation of privilege: Authorization
  - Elevation of privilege means users can gain capabilities when they don't have proper authorization

## Security

More complex the application (more ways to interact) more potential bugs: Combinatorial explosion of different ways an API can be used

1. What is Application Security?

   - Security beyond infrastructure
   - Integrating security tooling to DevOps a.k.a DevSecOps
   - Determine security posture for application
   - Understanding technical risks
   - Providing technical recommendations
   - Application security guidelines and standards for Group
   - Knowledge sharing and presentations on security

2. Why is Application Security Important?

   - PCI DSS.
   - APRA Prudential Standard CPS 234 & Practice Guide CPG 234.

Common form of attacks:

- **Spam**: Sent from legitimate IP address, less likely to be blocked
- **Denial of service**: attack competitors, or seek ransom
- Infect visiting users with **malware**: Infect one server, use it to infect hundreds of thousands of clients
- **Data theft**: Steal credentials, credit card numbers, intellectual property

Different Parts of Web Security:

- **Browser security**:

  - _Example_: [Same-Origin Policy](./SameOrigin_Policy.md) - Isolate sites from each other, while running in the same browser

- **Server app security**:

  - Attackers can run arbitrary HTTP clients: can send anything to server

- **Client app security**:

  - Prevent user from being attacked while using web app locally

- **Protect the user**:

  - From social engineering
  - From trackers, private data being leaked

Why is web security hard?

- Social engineering is very effective
- Extremely ambitious goal: Run untrusted code securely
- Different sites interacting in the same tab like ads ("mashups")
- Low-level features: hardware access
- Desire for high performance
- APIs were not designed from first principles: evolved
- Strict backwards compatibility requirements
- **"Don't break the web"**

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

## The Five Stages of Hacking

1. [Reconnaissance](#reconnaissance) - Gathering Information

   - Passive Reconnaissance
   - Active Reconnaissance

2. Scanning and Enumeration
3. Gaining Access - Exploitation, Remote Connection Execution (RCE)
4. Maintaining Access
5. Covering Tracks

### Reconnaissance

1. Passive Reconnaissance:

   - Target Validation: `WHOIS`, `nslookup`, `dnsrecon`
   - Finding Subdomains: Google Fu, `dig`, `Nmap`, `Sublist3r`, `Bluto`, `crt.sh`, etc.
   - Fingerprinting: `Nmap`, `Wappalyze`, `WhatWeb`, `BuiltWith`, `Netcat`
   - Data Breaches: `HaveIBeenPwned` and similar lists

## OWASP Top 10

1. Insecure Direct Object References
2. Missing Function Level Access Control
3. Unvalidated Redirects and Forwards
4. Click Jacking attacks
5. Insufficient Attack Protection
6. Under-protected APIs

### 2021 List

1. Broken Access Control
2. [Cryptographic](./Cryptography.md) Failures (2017 - 3)
3. [Injection](./Injection.md)
4. **Insecure Design**
5. Security Misconfiguration
6. Vulnerable and Outdated Components (2017 - 9)
7. [Identification and Authentication Failures](./Authentication.md) (2017 - 2)
8. **Software and Data Integrity Failures**
9. Security Logging and Monitoring Failures
10. **Server-Side Request Forgery** (SSRF) (2017 - 10)

### 2017 List

1. Injection
2. Broken Authentication
3. Sensitive Data Exposure
4. **XML External Entities**
5. Broken Access Control (2013 - 4 & 7)
6. Security Misconfiguration
7. Cross-Site Scripting (XSS): [Cheat sheet](https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Scripting_Prevention_Cheat_Sheet.html)
8. **Insecure De-serialization**
9. Using Components with Known Vulnerabilities
10. **Insufficient Logging & Monitoring**

### 2013 List

1. Injection
2. Broken Authentication and Session Management
3. Cross-Site Scripting (XSS)
4. Insecure Direct Object References
5. Security Misconfiguration
6. Sensitive Data Exposure
7. Missing Function Level Access Control
8. [Cross-Site Request Forgery (CSFR)](./CrossSite_Resource_Forgery.md)
9. Using Components with Known Vulnerabilities
10. Unvalidated Redirects and Forwards

## Cross-Origin Resource Sharing (CORS)

All cross-origin calls must return with `Access-Control-*` headers to indicate white-listed applications

- `Access-Control-Allow-Origin`: List of origins allowed to connect to this API
- `Access-Control-Allow-Methods`: List of methods allowed for the API

Pre-flight question:

- Browser sends request with `OPTION` method set to receive CORS headers from backend
- After verification, browser sends the actual request

| Attributes           | Simple Request                                                       | Pre-flighted Request                |
| -------------------- | -------------------------------------------------------------------- | ----------------------------------- |
| Methods              | `GET`, `HEAD`, `POST`                                                | `DELETE`, `PUT`, `PATCH`, `CONNECT` |
| Allowed Headers      | `Accept`, `Accept-Language`,`Content-Language`, `Content-Type`, etc. | N/A                                 |
| Non-Standard Headers | Not-allowed, Upgrade to Pre-flighted                                 | N/A                                 |

## Same-Site Policy

Site vs Origin:

- Two URIs are part of the same origin, if they have the same scheme, host and port
- Two URIs are part of the same site, if they have the same domain and suffix

- Same Site:

  ```url
  https://foo.example.org
  https://bar.example.org
  ```

- Cross Site:

  ```url
  https://foo.github.io
  https://bar.github.io
  ```

- Same Site:

  ```url
  https://foo.bar.example.org
  https://bar.example.org
  ```

### SSP Applicable

Which is blocked?

- **Web Forms: applies**

  - Scripts, images, etc. which remain constant:

    ```url
    <script src="https://cross-origin/my.js">
    ```

  - Cross-origin web forms:

    ```url
    <form action="https://cross-origin/getmyval" method="GET">
    ```

- **JavaScript: applies**

  - Content operated via XMLHTTPRequest or Fetch (APIs):

    ```url
    fetch("https://cross-origin/getmyval")
    ```

## Security Headers

Mandatory security headers for apps:

- MIME Sniffing Protection:

  - When content type is:

    - **Set**: Some browsers (IE) try to verify content type with actual content payload
    - **Not Set**: Some browsers guess content type while others block loading of page

  - Block browser MIME sniffing
  - Blocks request if MIME type does not match tag types. E.g. script
  - Preferred Header Settings:

  ```http
  X-Content-Type-Options: nosniff
  ```

- Clickjacking Protection (Legacy):

  - AKA UI redressing
  - Attackers trick users into clicking hidden actionable content

    - CSS is used to create and manipulate layers
    - iframes are used to create hidden content

  - Prevent framing of your site as iframe in another website:

    - Complete deny:

      ```http
      X-Frame-Options: deny
      ```

    - Allow same origin:

      ```http
      X-Frame-Options: sameorigin
      ```

    - Allow from specific origin:

      - Allow from is deprecated in some browsers and should not be relied upon - use in conjunction with CSP

      ```http
      X-Frame-Options: allow-from https://normal-website.com
      ```

  ::: tip NOTE
  Clickjacking attacks are not mitigated by CSRF tokens
  :::

- Cache Headers:

  - Properly configured caching header is to avoid having sensitive information stored in browser or proxy:

    - `Cache-Control`: Header to determine if page should be cached
    - `Expires`: Not relevant in modern browsers but needed to stay consistent
    - `Pragma`: This is older header and replaced by `Cache-Control`

  ```http
  Cache-Control: private, no-cache, no-store, max-age=0, no-transform
  Pragma: no-cache
  Expires: 0
  ```

  ::: tip NOTE
  `no-cache` only works for proxies and `no-store` only works for browsers
  :::

You can cache:

- Static or non-personalised content
- Only `GET` request
- Only cache HTTP 200 OK response

You can't cache:

- Sensitive information/PII
- Set cookies request
- `Cache-Control` header that contains `private` and `no-cache` and `no-store`
- `Pragma` header that contains `private` and `no-cache` and `no-store`

Examples of extensions to cache:

| Web                | Images | Font |
| ------------------ | ------ | ---- |
| css                | jpg    | woff |
| js                 | jpeg   | tff  |
| json (static only) | png    | eot  |
|                    | gif    |      |
|                    | svg    |      |
|                    | jpg    |      |

## Content Security Policy (CSP)

- CSP provides additional layer of protection by enforcing loading of resources (scripts, images, etc.) from trusted locations
- It's very effective against XSS, Clickjacking etc.
- Visibility on attacks on app using CSP reporting directive
- Options to deliver CSP:

  - `Content-Security-Policy` header is preferred technique
  - `<meta>` HTML element with `http-equiv` with attribute set to `Content-Security-Policy`
  - `Content-Security-Policy-Report-Only` header used only for monitoring and not enforcing

Headers that can be used:

- `Content-Security-Policy`: yes
- `Content-Security-Policy-Report-Only`: !
- `X-Content-Security-Policy`: no
- `X-WebKit-CSP`: no

### CSP Directives

CSP - fine grain control set

- **Fetch**: Informs browser of locations to trust and load resources from Eg.: `script-src`, `object-src`
- **Document**: Informs properties of documents to which policies will apply. Eg.: `base-url`, `sandbox`
- **Navigation**: Informs about the location that the document can navigate to. Eg.: `frame-ancestors`
- **Reporting**: Delivers violations to specified location. Eg.: `report-to`, `report-uri`

Special directives:

| Name             | Purpose                                                       |
| ---------------- | ------------------------------------------------------------- |
| `none`           | Strict. No resources allowed.                                 |
| `self`           | Strict. Only resources from same origin.                      |
| `unsafe-inline`  | Weak. Allows scripts in HTML.                                 |
| `unsafe-eval`    | Weak. Allows `eval()` functions in scripts.                   |
| `strict-dynamic` | Strong (if used correctly). Allows trust propagation scripts. |

### Basic CSP Policy

Basic policy with good security has the following requirements:

- All resources are hosted by the same domain of the document
- There are no inlines or evals for scripts and style resources:

  ```http
  Content-Security-Policy: default-src 'self';
  ```

- Stricter: Only allow images, scripts, AJAX and CSS from same origin. (No frame, object, media, etc.)

  ```http
  Content-Security-Policy: default-src 'none'; script-src 'self'; connect-src 'self'; img-src 'self'; style-src 'self';
  ```

Order of priority: `default-src` --> `script-src` --> `script-src-elem` | `script-src-attr`

### Locking Down JS

Hash Method:

- Calculate the hash of the script or script file

- Following changes to application is required:

  - Refactor any markup with inline event handlers (e.g. `onclick`) and JavaScript: URIs
  - Move all scripts (movable) from inline to external JS files
  - Add input validation for any user inputs and encoding before writing into DOM

```html
script-src 'sha2-d24982a62c99c55d38cf05efe943324c95a342b019b6a5bc136dc865'

<!-- Chrome calculates for us -->
<script>
  console.log("this will work");
</script>

<script src="https://...">
```

Nonce:

- Nonce is arbitrary number that can be used just once
- Nonce is composed of `base64` values
- Nonce attributes are added to script tags
- Nonce is verified against the nonce sent in the CSP header

- Following changes to application is required:

  - Add nonce attribute to all trusted `<script>` elements
  - For every page load, generate a new nonce and use that in CSP header

```html
script-src 'nonce-SecureRandomValue'

<script nonce="SecureRandomValue">
  console.log("this will work");
</script>

<script nonce="SecureRandomValue" src="https://...">
```

For dynamic JS:

- Some JS/Framework might add/create scripts dynamically and append to DOM
- If scripts are appended by trusted (nonce) scripts, then allow them

```html
script-src 'nonce-SecureRandomValue' 'strict-dynamic'

<!-- This is allowed -->
<script nonce="SecureRandomValue">
  let s = document.createElement("script");
  s.src = "some.com/some.js";
  document.body.appendChild(s);
</script>

<!-- This is blocked -->
<script src="some.com/some.js">
```

### Preventing Clickjacking

A companion to `X-Frame-Options`:

- Protect page from being framed by other sites
- Prevent all framing of your content:

  ```http
  Content-Security-Policy: frame-ancestors 'none';
  ```

- Allow framing for site itself:

  ```http
  Content-Security-Policy: frame-ancestors 'self';
  ```

- Allow framing for trusted domains:

  ```http
  Content-Security-Policy: frame-ancestors 'trusted.com';
  ```

### Versions

CSP3

### Policy Injection

...

- New directive `script-src-elem` allows you to control just script blocks
- This allows event handlers but blocks script elements:

  ```http
  Content-Security-Policy: script-src-elem 'none'; script-src-attr 'unsafe-inline';
  ```

- CSP bypass is possible provided you have policy injection flaw
- This directive will overwrite existing `script-src` directives

JSONP problem:

- Allowlist an origin/path hosting a JSONP
- JS execution is allowed. Depends on JSONP endpoint
- CDN typically have numerous exposed JSONP endpoint

### Conclusion

- CSP is very effective with Nonce and/or SHA
- Beware of using `strict-dynamic`. Only on trusted scripts/frameworks
- Start with report only CSP header
- Beware of Unvalidated redirects, JSONP endpoints or Header injection
- Not a substitute for XSS protection

## Resources

- CS-241 and CS-253 (Stanford): [YouTube Link](https://www.youtube.com/watch?v=5JJrJGZ_LjM&list=PL1y1iaEtjSYiiSGVlL1cHsXN_kvJOOhu-&index=1)

- [Adopting CSP](https://csp.withgoogle.com/docs/adopting-csp.html)
