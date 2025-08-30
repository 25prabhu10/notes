---
title: Nginx
description: Open source web and application server
date: 2023-07-29
---

# Nginx

[nginx](https://www.nginx.com/) ("engine x") is a free, open-source HTTP web server that can also be used as:

- Reverse proxy
- Content cache
- Load balancer
- TCP/UDP proxy server
- Mail proxy

[Nginx Unit Docs](https://unit.nginx.org/)

## Architecture

nginx has one master process and several worker processes

- **Master process**: Reads and evaluates [configuration](#configuration), maintains worker processes
- **Worker processes**: Do the actual processing of requests

nginx uses an event-based model and OS-dependent mechanisms to efficiently distribute requests among worker processes

## Setup

Start, stop, restart, reload, and check the status of the Nginx service:

```bash
sudo systemctl start nginx
sudo systemctl stop nginx
sudo systemctl restart nginx
sudo systemctl reload nginx
sudo systemctl status nginx
```

Using command line arguments:

```bash
nginx -s <signal>

# signal can be:
# stop: fast shutdown
# quit: graceful shutdown
# reopen: reloading the configuration file
# reload: reopening the log files

# Example:
nginx -s start

# signal can also be sent using the kill command
kill -s QUIT <pid>
```

## Configuration

The default configuration file is named `nginx.conf` and is located in the `/usr/local/nginx/conf`, `/etc/nginx`, or `/usr/local/etc/nginx` directory

nginx consists of modules that are controlled by directives specified in the configuration file

Directives are divided into simple directives and block directives

- A simple directive consists of the name and parameters separated by spaces and ends with a semicolon (`;`)
- A block directive has the same structure as a simple directive, but instead of the semicolon, it ends with a set of additional directives enclosed in braces (`{}`)

If a directive is placed outside of any block, it is considered a part of the `main` context

- `#` (hash) is used for comments

### Serving Static Content

The `http` block is the main context and is used to configure how nginx handles HTTP requests

- `server` block is used to define the settings for a virtual server (there can be multiple `server` blocks, distinguished by ports and server names)
- `location` block is used to define how nginx should handle requests for different URIs
  - `/` is used to match any request, `/path` is used to match requests for a specific path, and `~` is used for case-sensitive regular expression matching

- `root` directive is used to define the root directory where nginx should look for files to serve
  - `/var/www/html` can be used as the root directory for serving static content or `/data/www` for a custom directory

```nginx
http {
    server {
        listen 80; # listen on port 80

        location / {
            root /var/www/html;
        }

        location /images/ {
            root /data/www;
        }
    }
}
```

### Proxy Server

The `proxy_pass` directive is used to define the URL of the proxied server

```nginx
http {
    server {
        location / {
            proxy_pass http://localhost:8080/;
        }

        location ~ \.(gif|jpg|png)$ {
            root /data/images;
        }
    }
}
```

```nginx
user www-data;
worker_processes auto;
pid /run/nginx.pid;

events {
    worker_connections 768;
}

http {
    include /etc/nginx/mime.types;
    default_type application/octet-stream;
    sendfile on;
    tcp_nopush on;
    tcp_nodelay on;
    keepalive_timeout 65;
    types_hash_max_size 2048;

    include /etc/nginx/conf.d/*.conf;
    include /etc/nginx/sites-enabled/*;
}
```

Logging and debugging:

```nginx
error_log <file> <loglevel>
    error_log logs/error.log;
    error_log logs/debug.log debug;
    error_log logs/error.log notice;
```

Basic listening ports:

```nginx
listen <port> <options>
        listen 80;
        listen 443 ssl http2;
        listen 443 http3 reuseport; (this is experimental!)
```

Header modifications:

```nginx
add_header <header> <values>
        add_header Alt-svc '$http3=":<port>"; ma=<value>'; (this is experimental!)
ssl_certificate / ssl_certificate_key
        ssl_certificate cert.pem;
        ssl_certificate_key cert.key;
server_name <domains>
    server_name domain1.com *.domain1.com
root <folder>
    root /var/www/html/domain1;
index <file>
    index index.php;
location <url> {
}
    location / {
        root index.html;
        index index.html index.htm;
    }
    location / {
        try_files $uri $uri/ /index.php$is_args$args;
    }
    location ~ \\.php$ {
        fastcgi_pass 127.0.0.1:9000;
        fastcgi_index index.php;
        fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;
        include fastcgi_params;
    }
    location ~ /\\.ht {
        deny all;
    }
    location = /favicon.ico {
        log_not_found off;
        access_log off;
    }
    location = /robots.txt {
        log_not_found off;
        access_log off;
        allow all;
    }
    location ~* .(css|gif|ico|jpeg|jpg|js|png)$ {
        expires max;
        log_not_found off;
}
```

## Reverse Proxy

### Show Client's real IP

```nginx
server {
    server_name example.com;
    location / {
        proxy_pass http://localhost:4000;

        # Show clients real IP behind a proxy
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
```
