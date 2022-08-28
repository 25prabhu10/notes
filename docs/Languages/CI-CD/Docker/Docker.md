---
title: Docker
description: Docker is a set of platform as a service (PaaS) products that use OS-level virtualization to deliver software in packages called containers
---

# Docker

Docker is a set of platform as a service (PaaS) products that use OS-level virtualization to deliver software in packages called containers

_Example:_

```bash
# Pull a docker image
docker pull alpine

# Run a new container from the image
docker run -t -d --name [customName] alpine

# Check currently running Docker containers
docker ps

# Connect to a container
docker exec -it [customName] bash

# Stop a container
docker stop [customName]

# Check container stats
docker stats
```

## Dockerfile

### Examples

- Python app:

  ```dockerfile
  # Docker image
  FROM python:latest

  # Set the working directory
  WORKDIR /app

  # Install dependencies
  COPY ./requirements.txt /app
  RUN pip install --no-cache-dir --upgrade -r requirements.txt

  # Copy the scripts to the folder
  COPY . /app

  # Start the app
  CMD ["python main.py"]
  ```

- [ASP.NET Core app](../C-Sharp/ASP_NET/Deployment.md#deploying-with-docker)

## Reference

- Learning Docker by Arthur Ulfeldt
- Docker for .NET Developers with Visual Studio by Lee Brandt
