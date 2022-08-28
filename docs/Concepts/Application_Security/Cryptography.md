---
title: Cryptography
description: Cryptography involves converting sensitive data into a format that is unreadable for an unauthorised user
---

# Cryptography

Cryptography involves converting sensitive data into a format that is unreadable for an unauthorised user

## Encryption

Encryption turns plaintext into ciphertext (and vice-versa):

- Requires an algorithm and a key

- Symmetric algorithms use the same key for both encryption and decryption

- Asymmetric (or public key) algorithms use different keys for encryption (the public key) and decryption (the private key)

1. Encryption At Rest
2. Encryption Transit

### Symmetric Encryption

2 Types:

- Block ciphers encrypt a fixed size of n-bits of data at a time (e.g. DES, 3DES, AES)

- Stream ciphers encrypt 1 byte of data at a time

Block ciphers support different modes of operation:

- Electronic Code Block (ECB):

  - Less secure than others
  - Android uses ECB by default when using AES:

    ```java
    Cipher.getInstance("AES");

    // Use
    Cipher.getInstance("AES/GCM/NOPADDING");
    ```

- Cipher Block Chaining (CBC)

## Hashing

- Hashing is one-way operation that produces a message digest
- Used for message integrity, digital signatures & storing passwords
- Salting is important to protect against offline password attacks (e.g. Rainbow Tables)

## Best Practices

- Never design your own encryption algorithm
- Use established, public algorithms that have been tested by experts (e.g. AES, RSA, SHA256+)

| Attribute             | Encryption | Hashing | Encoding |
| --------------------- | :--------: | :-----: | :------: |
| Decode                |    yes     |    -    |   yes    |
| Secret/Key Needed     |    yes     |    !    |    -     |
| Password Storage      |     -      |   yes   |    -     |
| Data Storage in DB/FS |    yes     |    -    |    -     |
| Web Tokens            |     -      |    -    |   yes    |

Recommended Cryptographic Algorithms:

| Service                                                      |       Approved        |    Not Approved     |
| ------------------------------------------------------------ | :-------------------: | :-----------------: |
| Data Confidentiality (e.g. DBs, Hard Disks, Flat files, ...) |       AES(256+)       | DES, 2DES, Blowfish |
| Data Integrity                                               | HMAC(128+), SHA(256+) |      MD5, SHA1      |

- Use Argon2bi, bycrpt or sycrpt.
- **Strong configuration is required**

## Encryption In Transit

- Transport Layer Security (TLS): for end-to-end encryption (over HTTP)
- Not only protects data from unauthorised disclosure/modification, but also provides trust of the web server to the client
- TLS should be used everywhere

Protecting Data in Transit:

- For iOS 9 and above:

  - Enabled by default
  - Blocks HTTP resource load
  - Uses URL Loading System (NSAppTransportSecurity) which add further transport layer checks
  - Highly recommended to disallow turning off the strict checks

- For Android 9 and above:

  - Enabled by default
  - Blocks HTTP resource load
  - Uses SSLSocketFactory to add further transport layer checks
  - Highly recommended to disallow turning off the strict checks

### TLS

- Combination of symmetric and asymmetric cryptography
- Provides good compromise between performance and security

- Symmetric Cryptography:

  - Secret key used to encrypt and decrypt data
  - Typically 128 bits in length but 256 bit is secure
  - Fast and efficient
  - Sharing the secret key is hard

- Asymmetric Cryptography:

  - Public/Private key pairs that are mathematically related
  - Public key to encrypt data and private key to decrypt data
  - Requires minimum of 1024 bit key but 2048 bit is preferred
  - Too slow for many purposes but great for generating and exchanging session key

TLS Protocols & Cipher Suites:

| Protocol Version | Cipher Suites | Compliance |
| :--------------: | :-----------: | :--------: |
|      SSLv2       |     Weak      |     -      |
|      SSLv3       |     Weak      |     -      |
|     TLSv1.0      |     Weak      |     -      |
|     TLSv1.1      |   Moderate    |     !      |
|     TLSv1.2      |    Strong     |    yes     |
|     TLSv1.3      |    Strong     |    yes     |

#### Digital Certificates

- Contains the public key of the web server
- Certificate is digitally signed by the CBA

  - Authenticity of the public key and that the owner controls the domain ("Common Name") being secured by the certificate
  - Allows clients to authenticate the web server
  - Must be a SHA-2 certificate
  - CN (Common Name) is being deprecated and will be replaced by SAN (Subject Alternate Name)

##### Certification Authorities

- Validates that an entity (e.g. person, company) submitting a certificate request for a web site is authorised to do so
- May also validate organisation information ("Extended Validation Certificates")
- CA must be trusted by all participants

  - Internet browsers embed public certificates of recognised certification authorities
  - Organisations can embed their own RootCA as a trusted certificate. Limited to internal network only

##### Public Key Infrastructure (PKI)

- PKI is about how two entities learn to trust each other to exchange messages securely.
- Central idea of PKI is that some trusted keys can delegate their trust to other un-trusted keys.
- Instead of just keys, certificates hold more personal information like domain name, organization, etc
- Primarily made up of:

  - Certificate AUthority
  - Registration Authority
  - Certificate Databases
  - Certificate Stores
  - Key Archival Servers

### Breaking TLS

- Working with rooted devices
- Trusting any CA certificates (system or custom)
- Accepting self-signed certificates
- Setting permissive hostname verifier

## HTTP Strict Transport Security (HSTS)

- It is a HTTP header
- Ensures all communication are through HTTPS
- Automatically redirects HTTP request to HTTPS (HTTP 307)
- HSTS dose not allow a user to override the invalid certificate message
- **Warning**: Once implemented cannot go back to HTTP without breaking application
- HSTS Directives:

  - `max-age`: Time in seconds for browser to remember HSTS
  - `includeSubDomains`: HSTS rule applies to all of the site's subdomains
  - `preload`:

    - Good:

      - Google maintained list
      - Currently supported by all major browsers
      - Defends against first-time SSL strip attacks

    - Bad:

      - Not an official HSTS spec
      - Sending preload directive can have permanent consequences
      - Preload can only be used with adding all subdomains

  ```http
  Strict-Transport-Security: max-age=3153600; includeSubDomains; preload
  ```

## Pinning & Certificate Transparency

> "You should pin anytime you want to be relatively certain of the remote host's identity or when operating in a hostile environment. Since one or both are almost always true, you should probably pin all the time"
>
> - OWASP

What to pin?

- Certificate
- Public Key
- Hash

Where to pin?

- Leaf certificate
- Root certificate
- Intermediate certificate

Mobile Apps:

- Pin against the public key, or more specifically the SubjectPublicKeyInfo (SPKI)
- key storage: Preloading, Trust on first use, **Over the air pin server**
- If bricked, app update can be pushed

Web Apps:

- Pinning happens with HPKP header (deprecated)
- Need second key pinned that's not in current certificate chain. E.g. Backup CSR
- If blocked or compromised, the app is blocked for users till max-age expires or user deletes pinning
- Pinning carries very strong risks of blocking or bricking applications
- Hard to build a pin-set that's guaranteed to work and the risk of hostile pinning
- Very low adoption rate

### Certificate Transparency

How do I trust a CA?

- All CAs must submit certificate activity logs to CT Log services
- CTLogs must be monitored and audited by organisation.
- _A Signed Certificate Timestamp_ (SCT) is generated and returned when a certificate is submitted
- All newly issued certificates must contain SCT and all CAs in Chrome's trusted store should have CT Logs
- Web Server can enforce browsers to check and validate SCT using `Expect-CT` header

  ```http
  Except-CT: max-age=86400, enforce, report-uri="https://example.com/report"
  ```

- Chrome (Full support), Firefox (Implemented but disabled), Safari (Upcoming)
