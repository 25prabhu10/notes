---
title: HTTP Security
description: HTTP Security
---

# HTTP Security

Checkout notes about HTTP here: [HTTP Notes Link](./../Web/HTTP.md)

## DNS Hijacking

- Attacker changes DNS records of target to point to own IP address
- All site visitors are directed to attacker's web server
- Motivation

  - Phishing
  - Revenue through ads, cryptocurrency mining, etc.

### How do they do it?

- Malware changes user's local DNS settings: like the `hosts` file
- Hacked recursive DNS resolver
- Hacked router
- Hacked DNS Nameserver
- Compromised user at DNS provider
- TLS verification can be completed using [Let's Encrypt](https://letsencrypt.org/) that says this server is legit

### DNS Privacy

- Queries are in plaintext
- ISPs have been known to sell this data

- **DNS-over-HTTPS**

::: tip DNS SETTING
Consider switching your DNS settings to Cloudflare (**`1.1.1.1`**) or another provider with a good privacy policy
:::
