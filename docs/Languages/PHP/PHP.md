---
title: PHP
description: PHP is a popular general-purpose scripting language that is especially suited to web development
date: 2024-11-27
---

# PHP

[PHP](https://www.php.net/) (recursive acronym for PHP: Hypertext Preprocessor) is a widely-used open source general-purpose scripting language that is especially suited for web development and can be embedded into HTML

PHP is a server-side scripting language that is executed on the server where the PHP code is embedded in HTML and the resulting page is sent to the client

PHP can be used for:

- Server-side scripting
- Command line scripting

## How a HTTP Request is Processed

1. A user requests a PHP page
2. The web server passes the request to the PHP interpreter
3. The PHP interpreter processes the PHP code
4. The PHP interpreter sends the output to the web server

```text
nginx/apache -> PHP FastCGI --> PHP fpms --> PHP Interpreter --> PHP Code --> Web Server
```

## FastCGI Process Manager (FPM)
